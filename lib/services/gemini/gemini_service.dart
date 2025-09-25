import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nextgig/domain/posts/post_models.dart';

class GeminiService {
  static final String _envKey =
      (const String.fromEnvironment('GEMINI_API_KEY', defaultValue: ''))
              .isNotEmpty
          ? const String.fromEnvironment('GEMINI_API_KEY')
          : (dotenv.maybeGet('GEMINI_API_KEY') ?? '');

  GeminiService() {
    print('DEBUG: Gemini API Key is: $_envKey');
  }

  Future<PostSuggestion> generatePostSuggestion({
    required String title,
    String? freeText,
    String? type,
    String? location,
    bool? isRemote,
  }) async {
    if (_envKey.isEmpty) {
      throw Exception(
          'GEMINI_API_KEY not set. Provide via --dart-define or .env');
    }

    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: _envKey,
      generationConfig: GenerationConfig(
        temperature: 0.3,
        maxOutputTokens: 512,
      ),
    );
    final prompt = _buildPrompt(
        title: title,
        freeText: freeText,
        type: type,
        location: location,
        isRemote: isRemote);
    try {
      final response = await model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';
      final jsonStr = _extractJson(text);
      final Map<String, dynamic> json =
          jsonDecode(jsonStr) as Map<String, dynamic>;
      return PostSuggestion.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  String _buildPrompt({
    required String title,
    String? freeText,
    String? type,
    String? location,
    bool? isRemote,
  }) {
    return '''You are an expert job recruiter for a youth marketplace. Your goal is to take a short, simple request and turn it into a full, professional opportunity post. Be creative and professional in your response. Ensure the description is detailed and well-written. Return ONLY a compact JSON object in a markdown code fence. Ensure all keys and string values are enclosed in double quotes.

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

  String _extractJson(String text) {
    final fenced = RegExp(r"```(?:json)?\n([\s\S]*?)\n```", multiLine: true)
        .firstMatch(text);
    if (fenced != null) {
      return fenced.group(1)!.trim();
    }
    final brace = RegExp(r"\{[\s\S]*\}");
    final m = brace.firstMatch(text);
    if (m != null) {
      return m.group(0)!.trim();
    }
    return text.trim();
  }
}
