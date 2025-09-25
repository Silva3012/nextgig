import 'package:flutter/material.dart';
import 'package:nextgig/core/theme/app_theme.dart';
import 'package:nextgig/presentation/features/profile/profile_page.dart';
import 'package:nextgig/domain/posts/post_models.dart';
import 'package:nextgig/data/posts/post_repository.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<Post> _posts = [];
  int _current = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _loadPosts();
    _pageController = PageController(viewportFraction: 0.92);
  }

  Future<void> _loadPosts() async {
    final repo = SharedPrefsPostRepository();
    final posts = await repo.getPosts();
    if (!mounted) return;
    setState(() {
      _posts = posts;
      _current = 0;
    });
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  void _onShowInterest() {
    if (_current < _posts.length - 1) {
      _pageController?.animateToPage(
        _current + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }

  // void _onReject() {
  //   if (_current < _posts.length - 1) {
  //     _pageController?.animateToPage(
  //       _current + 1,
  //       duration: const Duration(milliseconds: 250),
  //       curve: Curves.easeOut,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final bool hasData = _posts.isNotEmpty;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: !hasData
            ? const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.inbox_outlined,
                        size: 36, color: AppColors.textSecondary),
                    SizedBox(height: 8),
                    Text('No posts yet. Create one from the Post tab.'),
                  ],
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (i) => setState(() => _current = i),
                      itemCount: _posts.length,
                      itemBuilder: (context, index) {
                        final post = _posts[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post.title,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Icon(Icons.category,
                                          size: 18,
                                          color: AppColors.textSecondary),
                                      const SizedBox(width: 6),
                                      Text(post.category ?? 'General',
                                          style: const TextStyle(
                                              color: AppColors.textSecondary)),
                                      const SizedBox(width: 16),
                                      const Icon(Icons.place,
                                          size: 18,
                                          color: AppColors.textSecondary),
                                      const SizedBox(width: 6),
                                      Text(post.location ?? 'Unspecified',
                                          style: const TextStyle(
                                              color: AppColors.textSecondary)),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Text(post.description),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton.icon(
                                          onPressed: _onShowInterest,
                                          icon: const Icon(Icons.thumb_up),
                                          label: const Text('show interest'),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_posts.length, (i) {
                      final active = i == _current;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: active ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: active
                              ? AppColors.primaryGreen
                              : AppColors.textSecondary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  )
                ],
              ),
      ),
    );
  }
}
