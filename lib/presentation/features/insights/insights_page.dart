import 'package:flutter/material.dart';
import 'package:nextgig/core/theme/app_theme.dart';
import 'package:nextgig/data/models/insights_model.dart';
import 'package:nextgig/presentation/features/insights/widgets/location_filter.dart';
import 'package:nextgig/services/gemini/gemini_service.dart';

class InsightsPage extends StatefulWidget {
  const InsightsPage({super.key});

  @override
  State<InsightsPage> createState() => _InsightsPageState();
}

class _InsightsPageState extends State<InsightsPage> {
  final service = GeminiService();
  String? selectedLocation;
  bool isLoading = false;
  String? errorMessage;

  List<SkillDemand> skillDemand = [];

  @override
  void initState() {
    super.initState();
    // You may fetch for a default location if needed
  }

  Future<void> handleLocationChange(String? newLocation) async {
    if (newLocation == null) return;
    setState(() {
      selectedLocation = newLocation;
      isLoading = true;
      errorMessage = null;
      skillDemand = [];
    });

    //print('Fetching skills for $newLocation');
    try {
      final skillList =
          await service.getTopSkillsByLocation(location: newLocation);
      //print('Result: $skillList');
      setState(() {
        skillDemand = skillList;
        isLoading = false;
      });
    } catch (e) {
      //print('Error fetching skills for $newLocation: $e');
      setState(() {
        errorMessage = 'Error retrieving skill data for $newLocation: $e';
        skillDemand = [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String cardTitle = selectedLocation == null
        ? 'Skill demand near you'
        : 'Sought after skills in $selectedLocation';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Insights'),
      ),
      body: Column(
        children: [
          LocationDropdown(
            onLocationChanged: handleLocationChange,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardTitle,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 12),
                        if (isLoading)
                          const Center(child: CircularProgressIndicator())
                        else if (errorMessage != null)
                          Text(
                            errorMessage!,
                            style: const TextStyle(color: Colors.red),
                          )
                        else if (skillDemand.isEmpty)
                          const Text('No skill data found for this location.')
                        else
                          ...skillDemand.map((row) {
                            final skill = row.skill;
                            final score = row.count;
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 96,
                                    child: Text(
                                      skill,
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
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        FractionallySizedBox(
                                          widthFactor: score / 100,
                                          child: Container(
                                            height: 10,
                                            decoration: BoxDecoration(
                                              color: AppColors.accentOrange,
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
