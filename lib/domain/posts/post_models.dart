import 'package:flutter/foundation.dart';

enum PostType { job, apprenticeship, mentorship }

@immutable
class PostSuggestion {
  final String title;
  final String description;
  final String? category;
  final List<String> keywords;

  const PostSuggestion({
    required this.title,
    required this.description,
    this.category,
    this.keywords = const [],
  });

  factory PostSuggestion.fromJson(Map<String, dynamic> json) => PostSuggestion(
        title: json['title'] as String? ?? '',
        description: json['description'] as String? ?? '',
        category: json['category'] as String?,
        keywords: (json['keywords'] as List?)?.cast<String>() ?? const [],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'category': category,
        'keywords': keywords,
      };
}

@immutable
class Post {
  final String id;
  final String authorId;
  final String title;
  final String description;
  final String? category;
  final List<String> tags;
  final PostType type;
  final String? location;
  final bool isRemote;
  final double? compensation;
  final String? aiSummary;
  final List<String> aiKeywords;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Post({
    required this.id,
    required this.authorId,
    required this.title,
    required this.description,
    this.category,
    this.tags = const [],
    required this.type,
    this.location,
    required this.isRemote,
    this.compensation,
    this.aiSummary,
    this.aiKeywords = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  Post copyWith({
    String? id,
    String? authorId,
    String? title,
    String? description,
    String? category,
    List<String>? tags,
    PostType? type,
    String? location,
    bool? isRemote,
    double? compensation,
    String? aiSummary,
    List<String>? aiKeywords,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Post(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        tags: tags ?? this.tags,
        type: type ?? this.type,
        location: location ?? this.location,
        isRemote: isRemote ?? this.isRemote,
        compensation: compensation ?? this.compensation,
        aiSummary: aiSummary ?? this.aiSummary,
        aiKeywords: aiKeywords ?? this.aiKeywords,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['id'] as String,
        authorId: json['authorId'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        category: json['category'] as String?,
        tags: (json['tags'] as List?)?.cast<String>() ?? const [],
        type: PostType.values.firstWhere(
          // ignore: deprecated_member_use
          (t) => describeEnum(t) == (json['type'] as String? ?? 'job'),
          orElse: () => PostType.job,
        ),
        location: json['location'] as String?,
        isRemote: json['isRemote'] as bool? ?? false,
        compensation: (json['compensation'] as num?)?.toDouble(),
        aiSummary: json['aiSummary'] as String?,
        aiKeywords: (json['aiKeywords'] as List?)?.cast<String>() ?? const [],
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'authorId': authorId,
        'title': title,
        'description': description,
        'category': category,
        'tags': tags,
        // ignore: deprecated_member_use
        'type': describeEnum(type),
        'location': location,
        'isRemote': isRemote,
        'compensation': compensation,
        'aiSummary': aiSummary,
        'aiKeywords': aiKeywords,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}
