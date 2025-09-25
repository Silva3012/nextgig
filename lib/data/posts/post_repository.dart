import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:nextgig/domain/posts/post_models.dart';

abstract class PostRepository {
  Future<void> savePost(Post post);
  Future<List<Post>> getPosts();
  Future<Post?> getPostById(String id);
}

class SharedPrefsPostRepository implements PostRepository {
  static const String _key = 'posts_v1';

  Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  @override
  Future<void> savePost(Post post) async {
    final prefs = await _prefs;
    final List<Post> current = await getPosts();
    final int existingIdx = current.indexWhere((p) => p.id == post.id);
    if (existingIdx >= 0) {
      current[existingIdx] = post;
    } else {
      current.insert(0, post); // latest first
    }
    final list = current.map((p) => p.toJson()).toList();
    await prefs.setString(_key, jsonEncode(list));
  }

  @override
  Future<List<Post>> getPosts() async {
    final prefs = await _prefs;
    final raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) return [];
    try {
      final decoded = jsonDecode(raw) as List;
      return decoded
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  @override
  Future<Post?> getPostById(String id) async {
    final list = await getPosts();
    try {
      return list.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
}
