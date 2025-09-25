import 'package:nextgig/domain/profile/user_models.dart';

abstract class ProfileRepository {
  Future<UserModel> getCurrentUser();
}

class MockProfileRepository implements ProfileRepository {
  const MockProfileRepository();

  @override
  Future<UserModel> getCurrentUser() async {
    // Mirror the mock used in ProfilePage
    return UserModel(
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
  }
}
