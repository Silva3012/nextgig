import 'package:flutter/material.dart';
import 'package:nextgig/core/theme/app_theme.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final List<Map<String, String>> _items = [
    {
      'title': 'Junior Flutter Developer',
      'company': 'NextGig',
      'location': 'Remote',
      'description':
          'Build delightful mobile experiences with Flutter and Dart.'
    },
    {
      'title': 'Mentorship: Mobile UI/UX',
      'company': 'Design Guild',
      'location': 'Cape Town',
      'description': 'Learn practical design systems and responsive layouts.'
    },
    {
      'title': 'Backend Intern (Node.js)',
      'company': 'CloudWorks',
      'location': 'Hybrid',
      'description': 'APIs, databases, and devops basics for scalable apps.'
    },
  ];

  int _current = 0;

  void _onAccept() {
    if (_current < _items.length - 1) {
      setState(() => _current++);
    }
  }

  void _onReject() {
    if (_current < _items.length - 1) {
      setState(() => _current++);
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = _items[_current];
    return Scaffold(
      appBar: AppBar(title: const Text('Discover')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.business,
                              size: 18, color: AppColors.textSecondary),
                          const SizedBox(width: 6),
                          Text(item['company']!,
                              style: const TextStyle(
                                  color: AppColors.textSecondary)),
                          const SizedBox(width: 16),
                          const Icon(Icons.place,
                              size: 18, color: AppColors.textSecondary),
                          const SizedBox(width: 6),
                          Text(item['location']!,
                              style: const TextStyle(
                                  color: AppColors.textSecondary)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(item['description']!),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: _onReject,
                              icon: const Icon(Icons.close),
                              label: const Text('Reject'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _onAccept,
                              icon: const Icon(Icons.favorite),
                              label: const Text('Accept'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_items.length, (i) {
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
