import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:nextgig/data/mocks/jobs/jobs.dart';
import 'package:nextgig/data/models/insights_model.dart';
import 'package:nextgig/domain/posts/post_models.dart';

class GeminiService {
  static const String _envKey =
      String.fromEnvironment('GEMINI_API_KEY', defaultValue: '');

  Future<PostSuggestion> generatePostSuggestion({
    required String title,
    String? freeText,
    String? type,
    String? location,
    bool? isRemote,
  }) async {
    if (_envKey.isEmpty) {
      // Fallback heuristic suggestion
      return PostSuggestion(
        title: title.trim().isEmpty ? 'Untitled Opportunity' : title.trim(),
        description: (freeText ?? 'Opportunity details to be added.').trim(),
        category: type ?? 'General',
        keywords: const ['opportunity', 'nextgig'],
      );
    }

    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: _envKey);

    final prompt = _buildPrompt(
        title: title,
        freeText: freeText,
        type: type,
        location: location,
        isRemote: isRemote);
    final response = await model.generateContent([Content.text(prompt)]);
    final text = response.text ?? '';
    // Expect JSON in response
    try {
      final Map<String, dynamic> json =
          jsonDecode(text) as Map<String, dynamic>;
      return PostSuggestion.fromJson(json);
    } catch (_) {
      // fallback if model returns prose
      return PostSuggestion(
        title: title,
        description: text.isNotEmpty ? text : (freeText ?? ''),
        category: type,
        keywords: const [],
      );
    }
  }

  String _buildPrompt({
    required String title,
    String? freeText,
    String? type,
    String? location,
    bool? isRemote,
  }) {
    return '''You are helping structure a short, clear opportunity post (job/apprenticeship/mentorship) for a youth marketplace.
Return ONLY compact JSON with keys: title, description, category, keywords (array of 3-6 tokens).
Context:
- title: ${title.trim()}
- notes: ${freeText?.trim() ?? ''}
- type: ${type ?? 'unspecified'}
- location: ${location ?? 'unspecified'}
- remote: ${isRemote == true ? 'yes' : 'no'}

Example JSON:
{"title":"Junior Flutter Developer","description":"...","category":"Software","keywords":["flutter","dart","mobile"]}
''';
  }

  // ------------------------------------------------------------------
  // NEW METHOD: Insight Generation (Top Skills per Location)
  // ------------------------------------------------------------------

  /// Analyzes the mock data to determine the most demanded skills for a given location.
  Future<List<SkillDemand>> getTopSkillsByLocation({
    required String location,
    int limit = 10,
  }) async {
    if (_envKey.isEmpty) {
      // Fallback heuristic for the hackathon when API key is missing
      if (location.toLowerCase().contains('cape town') ||
          location.toLowerCase().contains('khayelitsha')) {
        return [
          SkillDemand(skill: 'Childcare', count: 12),
          SkillDemand(skill: 'Plumbing', count: 9),
          SkillDemand(skill: 'Flutter', count: 4),
        ];
      }
      return [
        SkillDemand(skill: 'General Labour', count: 15),
        SkillDemand(skill: 'Retail Sales', count: 10),
        SkillDemand(skill: 'Gardening', count: 7),
      ];
    }

    // 1. Prepare the Mock Data as a string for the AI
    final dataString = jsonEncode(mockGigPosts
        .map((gig) => {
              'location': gig.location,
              'skills': gig.requiredSkills,
            })
        .toList());

    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: _envKey);

    final prompt = _buildSkillsInsightPrompt(
      data: dataString,
      location: location,
      limit: limit,
    );

    final response = await model.generateContent([Content.text(prompt)]);
    final text = response.text?.trim() ?? '';

    // The model should return an array of JSON objects
    try {
      final List<dynamic> jsonArray = jsonDecode(text) as List<dynamic>;
      return jsonArray
          .map((json) => SkillDemand.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Gemini API Error or JSON Parse Failure: $e');
      // Return empty list on failure
      return [];
    }
  }

  /// Builds the prompt specifically for skills demand analysis.
  String _buildSkillsInsightPrompt({
    required String data,
    required String location,
    required int limit,
  }) {
    // Note: The prompt uses a "filter, count, and format" instruction chain.
    return '''
You are a data analyst for a South African labour platform. Your task is to extract job market insights from the provided JSON data.

1. FILTER the list of jobs to include only those where the 'location' field contains the term "$location".
2. COUNT the total occurrences of each 'skill' within the filtered jobs.
3. RANK the skills by count in descending order.
4. RETURN ONLY a compact JSON array containing the top $limit skills.

The provided data is a JSON string of job snippets:
$data

Output Format (MUST BE ONLY A JSON ARRAY):
[
  {"skill": "Skill Name 1", "count": 25},
  {"skill": "Skill Name 2", "count": 18},
  ...
]
''';
  }
}
