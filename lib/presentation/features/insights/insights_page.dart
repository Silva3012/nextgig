import 'package:flutter/material.dart';
import 'package:nextgig/core/theme/app_theme.dart';
import 'package:nextgig/presentation/features/profile/profile_page.dart';

class InsightsPage extends StatelessWidget {
  const InsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data
    final Map<String, String> kpis = {
      'Matches this week': '12',
      'Profile views': '248',
      'Applications': '7',
      'Acceptance rate': '43%'
    };

    final List<Map<String, dynamic>> skillDemand = [
      {'skill': 'Flutter', 'score': 92},
      {'skill': 'Dart', 'score': 85},
      {'skill': 'UI/UX', 'score': 74},
      {'skill': 'Node.js', 'score': 66},
      {'skill': 'SQL', 'score': 58},
    ];

    final List<int> weeklyTrend = [4, 6, 3, 8, 7, 9, 5];

    final List<Map<String, String>> recentActivity = [
      {'title': 'Accepted by NextGig', 'subtitle': 'Flutter Junior • 2h ago'},
      {'title': 'Application sent', 'subtitle': 'CloudWorks • 6h ago'},
      {'title': 'Profile viewed', 'subtitle': 'Design Guild • 1d ago'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Insights'),
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
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          // KPI Cards (responsive grid, avoids overflow on small screens)
          LayoutBuilder(
            builder: (context, constraints) {
              final double width = constraints.maxWidth;
              final int crossAxisCount = width < 360 ? 1 : 2;
              final double aspectRatio = width < 360 ? 2.6 : 1.8;
              return GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: aspectRatio,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: kpis.entries.map((e) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            e.value,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            e.key,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                const TextStyle(color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),

          // Weekly Trend (simple sparkline)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Weekly engagement trend',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 64,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: weeklyTrend.map((v) {
                        final height = 10.0 + (v.toDouble() * 5);
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Container(
                              height: height,
                              decoration: BoxDecoration(
                                color: AppColors.primaryGreen,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Skill demand (bars)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Skill demand near you',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  ...skillDemand.map((row) {
                    final score = row['score'] as int;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 96,
                            child: Text(
                              row['skill'] as String,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: AppColors.textSecondary
                                        .withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                FractionallySizedBox(
                                  widthFactor: score / 100,
                                  child: Container(
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: AppColors.accentOrange,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('$score'),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          // Recent activity
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Recent activity',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ...recentActivity.map((a) => ListTile(
                        leading: const Icon(Icons.insights,
                            color: AppColors.primaryGreen),
                        title: Text(a['title']!),
                        subtitle: Text(a['subtitle']!),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
