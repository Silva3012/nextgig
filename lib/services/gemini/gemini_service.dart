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

  // /// Generates a fair pay range for a gig post using the Gemini API.
  // Future<String> getFairPayRange(GigPostModel gigPost) async {
  //   if (_envKey.isEmpty) {
  //     throw Exception(
  //         'GEMINI_API_KEY not set. Provide via --dart-define or .env');
  //   }

  //   // Use a different model for the pay range task.
  //   final model = GenerativeModel(
  //     model: 'gemini-2.5-flash-preview-05-20',
  //     apiKey: _envKey,
  //     generationConfig: GenerationConfig(
  //       temperature: 0.3,
  //       maxOutputTokens: 100, // Keep the response short
  //     ),
  //   );
  //   final prompt = _buildPromptForPayRange(gigPost);

  //   try {
  //     final response = await model.generateContent([Content.text(prompt)]);
  //     return response.text ?? 'Could not generate a pay range.';
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // /// Builds a detailed prompt for the LLM to get a fair pay range.
  // String _buildPromptForPayRange(GigPostModel gigPost) {
  //   return '''
  //     Based on the following job details, what is a fair and realistic pay range in South African Rands (ZAR)?
  //     The response must be in a concise, single-sentence format, for example: "A fair pay range for this job is RXXX - RYYY per hour."

  //     ---
  //     Job Title: ${gigPost.title}
  //     Description: ${gigPost.description}
  //     Type: ${gigPost.gigType.name}
  //     Location: ${gigPost.location}
  //     Is Remote: ${gigPost.isRemote}
  //     Required Skills: ${gigPost.requiredSkills.join(', ')}
  //     Period Estimate: ${gigPost.periodEstimate}
  //     ---
  //   '''
  //       .trim();
  // }

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
