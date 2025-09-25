class UserModel {
  final String id; // system-generated UID (Firebase/Auth)
  final String firstName;
  final String lastName;
  final String idNumber; // stored securely, never public
  final bool idVerified; // true if verified by Vision API / SA ID check

  final String location; // e.g., city, township, GPS-coords
  final bool locationVerified;

  final bool isRemote; // can work online/remotely
  final bool isBusinessOwner;
  final BusinessDetails? businessDetails;

  final List<String> portfolioLinks; // LinkedIn, CV, GitHub, etc.
  final List<String> languages; // spoken/written

  final List<String> skills; // e.g., welding, babysitting
  final List<String> learningInterests; // skills being upskilled

  final List<Education> educationHistory;

  // Trust & reputation
  final double reputationScore; // aggregated rating
  final List<Review> reviews; // feedback from completed gigs

  // Metadata
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.idNumber,
    required this.idVerified,
    required this.location,
    required this.locationVerified,
    required this.isRemote,
    required this.isBusinessOwner,
    this.businessDetails,
    required this.portfolioLinks,
    required this.languages,
    required this.skills,
    required this.learningInterests,
    required this.educationHistory,
    this.reputationScore = 0.0,
    this.reviews = const [],
    required this.createdAt,
    required this.updatedAt,
  });
}

class BusinessDetails {
  final String name;
  final String sector; // e.g., retail, plumbing, tutoring
  final String description; // short pitch
  final List<String> services; // optional, list of offered services

  BusinessDetails({
    required this.name,
    required this.sector,
    required this.description,
    this.services = const [],
  });
}

class Education {
  final String qualification; // e.g., "BSc Computer Science"
  final String institution;
  final DateTime? startDate;
  final DateTime? endDate;

  Education({
    required this.qualification,
    required this.institution,
    this.startDate,
    this.endDate,
  });
}

class Review {
  final String reviewerId;
  final String comment;
  final double rating; // 1–5 stars
  final DateTime date;

  Review({
    required this.reviewerId,
    required this.comment,
    required this.rating,
    required this.date,
  });
}
