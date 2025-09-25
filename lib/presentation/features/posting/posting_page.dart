import 'package:flutter/material.dart';
import 'package:nextgig/presentation/features/profile/profile_page.dart';
import 'package:nextgig/domain/posts/post_models.dart';
import 'package:nextgig/data/posts/post_repository.dart';
import 'package:nextgig/data/profile/profile_repository.dart';
import 'package:nextgig/services/gemini/gemini_service.dart';

class PostingPage extends StatefulWidget {
  const PostingPage({super.key});

  @override
  State<PostingPage> createState() => _PostingPageState();
}

class _PostingPageState extends State<PostingPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  bool _isRemote = false;
  PostType _type = PostType.job;

  bool _loading = false;
  PostSuggestion? _preview;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _generatePreview() async {
    setState(() => _loading = true);
    try {
      final service = GeminiService();
      final suggestion = await service.generatePostSuggestion(
        title: _titleController.text,
        freeText: _descriptionController.text,
        type: _type.name,
        location: _locationController.text,
        isRemote: _isRemote,
      );
      setState(() => _preview = suggestion);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not generate suggestion.')),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _savePost() async {
    const profileRepo = MockProfileRepository();
    final postRepo = SharedPrefsPostRepository();
    final user = await profileRepo.getCurrentUser();
    final now = DateTime.now();
    final id = 'p_${now.microsecondsSinceEpoch}';
    final suggestion = _preview;
    final post = Post(
      id: id,
      authorId: user.id,
      title: (suggestion?.title.isNotEmpty ?? false)
          ? suggestion!.title
          : _titleController.text,
      description: (suggestion?.description.isNotEmpty ?? false)
          ? suggestion!.description
          : _descriptionController.text,
      category: suggestion?.category,
      tags: suggestion?.keywords ?? const [],
      type: _type,
      location:
          _locationController.text.isEmpty ? null : _locationController.text,
      isRemote: _isRemote,
      aiSummary: suggestion?.description,
      aiKeywords: suggestion?.keywords ?? const [],
      createdAt: now,
      updatedAt: now,
    );
    await postRepo.savePost(post);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Post saved. View it in Discover.')),
    );
    setState(() {
      _preview = null;
      _titleController.clear();
      _descriptionController.clear();
      _locationController.clear();
      _isRemote = false;
      _type = PostType.job;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Opportunity'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ProfilePage()),
            ),
            tooltip: 'Profile',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _descriptionController,
                    minLines: 4,
                    maxLines: 8,
                    decoration: const InputDecoration(labelText: 'Description'),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<PostType>(
                          value: _type,
                          items: PostType.values
                              .map((t) => DropdownMenuItem(
                                  value: t, child: Text(t.name)))
                              .toList(),
                          onChanged: (v) =>
                              setState(() => _type = v ?? PostType.job),
                          decoration: const InputDecoration(labelText: 'Type'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          controller: _locationController,
                          decoration: const InputDecoration(
                              labelText: 'Location (optional)'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile(
                    value: _isRemote,
                    onChanged: (v) => setState(() => _isRemote = v),
                    title: const Text('Remote friendly'),
                    contentPadding: EdgeInsets.zero,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _loading ? null : _generatePreview,
                      child: _loading
                          ? const SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(strokeWidth: 2))
                          : const Text('Generate with AI'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            if (_preview != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Preview',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      Text(_preview!.title,
                          style: const TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 8),
                      Text(_preview!.description),
                      const SizedBox(height: 8),
                      if (_preview!.category != null)
                        Chip(label: Text(_preview!.category!)),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _preview!.keywords
                            .map((k) => Chip(label: Text(k)))
                            .toList(),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _savePost,
                          icon: const Icon(Icons.save),
                          label: const Text('Save Post'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
