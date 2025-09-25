import 'package:flutter/material.dart';
import 'package:nextgig/core/theme/app_theme.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'title': 'Flutter Foundations',
        'resources': [
          'Dart language tour',
          'Flutter widgets 101',
          'Build your first app',
        ],
      },
      {
        'title': 'Backend Essentials',
        'resources': [
          'REST API basics',
          'Authentication & JWT',
          'SQL vs NoSQL overview',
        ],
      },
      {
        'title': 'Career & Soft Skills',
        'resources': [
          'CV writing tips',
          'Interview preparation',
          'Networking strategies',
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Learning Path Guide')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category['title'] as String,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  ...List<Widget>.from(
                    (category['resources'] as List<String>).map(
                      (r) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            Icon(Icons.check_circle,
                                color: AppColors.primaryGreen, size: 18),
                            SizedBox(width: 8),
                            // Text added below in separate widget
                          ],
                        ),
                      ),
                    ),
                  ).asMap().entries.map((entry) {
                    final resource =
                        (category['resources'] as List<String>)[entry.key];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle,
                              color: AppColors.primaryGreen, size: 18),
                          const SizedBox(width: 8),
                          Expanded(child: Text(resource)),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
