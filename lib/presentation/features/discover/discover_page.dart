import 'package:flutter/material.dart';
import 'package:nextgig/core/theme/app_theme.dart';
import 'package:nextgig/data/mocks/hirers/set_1.dart';
import 'package:nextgig/data/mocks/jobs/jobs.dart';
import 'package:nextgig/presentation/features/profile/profile_page.dart';
import 'package:nextgig/data/models/job_post_model.dart';
import 'package:nextgig/data/models/user_model.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<GigPostModel> _posts = [];
  int _current = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    // Load mock data directly
    _posts = mockGigPosts;
    _pageController = PageController(viewportFraction: 0.92);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  /// Displays a confirmation modal to the user.
  void _showConfirmationModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: AppColors.primaryGreen,
                  size: 60,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Interest Shown!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'A notification has been sent to the author of this post. We will let you know when they respond.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('OK'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Displays a modal with the AI-generated fair pay range.
  void _showPayRangeModal(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.monetization_on_outlined,
                  color: AppColors.accentBlue,
                  size: 60,
                ),
                const SizedBox(height: 16),
                const Text(
                  'AI-Generated Pay Range',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('OK'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Handles the "Show Interest" action by showing a confirmation and then advancing the page.
  void _onShowInterest() {
    if (_current < _posts.length) {
      _showConfirmationModal(context);
      _pageController?.animateToPage(
        _current + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }

  // /// Fetches and displays a fair pay range using the Gemini Service.
  // Future<void> _onGetPayRange(GigPostModel gigPost) async {
  //   // Show a loading indicator
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text('Generating pay range...'),
  //       duration: Duration(seconds: 1),
  //     ),
  //   );

  //   try {
  //     final payRange = await GeminiService().getFairPayRange(gigPost);
  //     _showPayRangeModal(context, payRange);
  //   } catch (e) {
  //     _showPayRangeModal(
  //         context, 'Failed to generate pay range. Please try again later.');
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
                        final gigPost = _posts[index];
                        final user = mockHirersSet1.firstWhere(
                          (user) => user.id == gigPost.posterId,
                          // Default to a placeholder user if not found.
                          orElse: () => UserModel(
                            id: '',
                            firstName: 'Unknown',
                            lastName: 'Author',
                            idNumber: '',
                            idVerified: false,
                            location: '',
                            locationVerified: false,
                            isRemote: false,
                            isBusinessOwner: false,
                            portfolioLinks: [],
                            languages: [],
                            skills: [],
                            learningInterests: [],
                            educationHistory: [],
                            createdAt: DateTime.now(),
                            updatedAt: DateTime.now(),
                          ),
                        );
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
                                    gigPost.title,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'By ${user.firstName}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColors.textSecondary),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    gigPost.employerName,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColors.textSecondary),
                                  ),
                                  const SizedBox(height: 8),
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      Chip(
                                        label: Text(gigPost.gigType.name,
                                            style: const TextStyle(
                                                color: AppColors.textPrimary)),
                                        backgroundColor: AppColors.primaryGreen
                                            .withOpacity(
                                                0.2), // Light green background
                                      ),
                                      if (gigPost.isRemote)
                                        Chip(
                                          label: const Text('Remote',
                                              style: TextStyle(
                                                  color:
                                                      AppColors.textPrimary)),
                                          backgroundColor: AppColors.accentBlue
                                              .withOpacity(
                                                  0.2), // Light blue background
                                        ),
                                      Chip(
                                        label: Text(
                                          '${gigPost.location}',
                                          style: const TextStyle(
                                              color: AppColors.textSecondary),
                                        ),
                                        backgroundColor: AppColors.textSecondary
                                            .withOpacity(0.2),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    '${gigPost.rateOrPrice == 0 ? 'Volunteer' : 'R ${gigPost.rateOrPrice}'} ${gigPost.compensationUnit}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryGreen),
                                  ),
                                  const SizedBox(height: 12),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Text(gigPost.description),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: gigPost.requiredSkills
                                        .map((k) => Chip(label: Text(k)))
                                        .toList(),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton.icon(
                                          onPressed: _onShowInterest,
                                          icon: const Icon(Icons.favorite),
                                          label: const Text('show interest'),
                                        ),
                                      ),
                                      // const SizedBox(width: 8),
                                      // Expanded(
                                      //   child: OutlinedButton.icon(
                                      //     onPressed: () =>
                                      //         _onGetPayRange(gigPost),
                                      //     icon: const Icon(Icons.percent),
                                      //     label: const Text('Get Pay Range'),
                                      //   ),
                                      // ),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
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
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
