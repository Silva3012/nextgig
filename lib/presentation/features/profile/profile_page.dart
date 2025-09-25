import 'package:flutter/material.dart';
import 'package:nextgig/core/theme/app_theme.dart';
import 'package:nextgig/domain/profile/user_models.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  UserModel get _mock => UserModel(
        id: "h001",
        firstName: "Thabo",
        lastName: "Mokoena",
        idNumber: "7805125809083",
        idVerified: true,
        location: "Soweto, Gauteng",
        locationVerified: true,
        isRemote: false,
        isBusinessOwner: true,
        businessDetails: const BusinessDetails(
          name: "Thabo’s Construction",
          sector: "Construction",
          description: "Small building contractor offering home repairs",
          services: ["Bricklaying", "Roof repairs", "Painting"],
        ),
        portfolioLinks: const [],
        languages: const ["English", "Zulu", "Sotho"],
        skills: const ["Project management", "Construction"],
        learningInterests: const ["Green building"],
        educationHistory: [
          Education(
            qualification: "National Diploma in Civil Engineering",
            institution: "UJ",
            startDate: DateTime(2008, 1, 1),
            endDate: DateTime(2011, 12, 31),
          ),
        ],
        reputationScore: 4.6,
        reviews: [
          Review(
            reviewerId: "a022",
            comment: "Reliable and paid on time",
            rating: 5,
            date: DateTime(2025, 8, 12),
          )
        ],
        createdAt: DateTime(2025, 1, 10),
        updatedAt: DateTime(2025, 9, 20),
      );

  String _fullName(UserModel u) => "${u.firstName} ${u.lastName}";

  @override
  Widget build(BuildContext context) {
    final u = _mock;
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(radius: 28, child: Icon(Icons.person)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_fullName(u),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.place,
                            size: 16, color: AppColors.textSecondary),
                        const SizedBox(width: 4),
                        Flexible(child: Text(u.location)),
                        const SizedBox(width: 8),
                        if (u.locationVerified)
                          const Icon(Icons.verified,
                              color: AppColors.primaryGreen, size: 16),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.badge_outlined,
                            size: 16, color: AppColors.textSecondary),
                        const SizedBox(width: 4),
                        Text("ID: ${u.idNumber.substring(0, 6)}•••••••"),
                        const SizedBox(width: 8),
                        if (u.idVerified)
                          const Icon(Icons.verified,
                              color: AppColors.primaryGreen, size: 16),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.star, color: AppColors.accentOrange),
                  const SizedBox(width: 8),
                  Text(
                      "Reputation score: ${u.reputationScore.toStringAsFixed(1)}"),
                ],
              ),
            ),
          ),
          if (u.isBusinessOwner && u.businessDetails != null) ...[
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Business',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    Text(u.businessDetails!.name),
                    Text(u.businessDetails!.sector,
                        style: const TextStyle(color: AppColors.textSecondary)),
                    const SizedBox(height: 8),
                    Text(u.businessDetails!.description),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: u.businessDetails!.services
                          .map((s) => Chip(label: Text(s)))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Languages',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        u.languages.map((l) => Chip(label: Text(l))).toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Skills',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        u.skills.map((s) => Chip(label: Text(s))).toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Learning interests',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: u.learningInterests
                        .map((i) => Chip(label: Text(i)))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Education',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  ...u.educationHistory.map((e) => ListTile(
                        leading: const Icon(Icons.school),
                        title: Text(e.qualification),
                        subtitle: Text('${e.institution} • '
                            '${e.startDate.year}-${e.startDate.month.toString().padLeft(2, '0')}'
                            ' to '
                            '${e.endDate.year}-${e.endDate.month.toString().padLeft(2, '0')}'),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Reviews',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  ...u.reviews.map((r) => ListTile(
                        leading: const Icon(Icons.person_outline),
                        title: Text(r.comment),
                        subtitle: Text(
                            'Rating: ${r.rating} • ${r.date.year}-${r.date.month.toString().padLeft(2, '0')}-${r.date.day.toString().padLeft(2, '0')}'),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
