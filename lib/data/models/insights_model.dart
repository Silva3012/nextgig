// lib/domain/posts/post_models.dart or a new file like insights_model.dart
class SkillDemand {
  final String skill;
  final int count;

  SkillDemand({required this.skill, required this.count});

  factory SkillDemand.fromJson(Map<String, dynamic> json) {
    return SkillDemand(
      skill: json['skill'] as String,
      count: json['count'] as int,
    );
  }
}
