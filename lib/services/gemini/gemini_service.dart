import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
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
}
