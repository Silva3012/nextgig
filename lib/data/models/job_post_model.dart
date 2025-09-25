// The core model for a job/gig post on NextGig
class GigPostModel {
  // --- Core Identification & Trust ---
  final String id; // System-generated UID for the gig post
  final String posterId; // The ID of the UserModel who created the post

  // --- Gig Details ---
  final String
      title; // Short, punchy title (e.g., "Install a shelf," "Maths Tutor")
  final String description; // Detailed description of the task/job required
  final List<String>
      requiredSkills; // e.g., ["Welding", "Babysitting", "Flutter"]
  final List<String> requiredLanguages; // e.g., ["English", "Zulu"]

  // --- Scope & Location ---
  final GigType gigType; // e.g., PieceJob, Apprenticeship, Mentorship
  final bool isRemote; // Can the work be done remotely/online?
  final String location; // Physical location (city, township, or 'Remote')

  // --- Compensation & Period ---
  final CompensationType? compensationType; // e.g., Hourly, FixedPrice
  final double rateOrPrice; // The rand amount (e.g., 150.00)
  final String
      compensationUnit; // e.g., "per hour," "total for job," or "per week"

  final String?
      periodEstimate; // How long is the work? e.g., "2 hours," "3 days," "1 year"

  // --- Employer/Poster Information ---
  // Stored for display, but main user data is in UserModel
  final String employerName; // The poster's name (or business name)
  final String?
      employerBusinessSector; // Optional: Helps with data insights (e.g., "Plumbing", "Tutoring")

  // --- Metadata & Status ---
  final bool isActive; // Is the job still open?
  final DateTime? createdAt;
  final DateTime? expiresAt; // For automatic expiry of posts

  GigPostModel({
    required this.id,
    required this.posterId,
    required this.title,
    required this.description,
    required this.requiredSkills,
    this.requiredLanguages = const [],
    required this.gigType,
    required this.isRemote,
    required this.location,
    this.compensationType,
    required this.rateOrPrice,
    required this.compensationUnit,
    this.periodEstimate,
    required this.employerName,
    this.employerBusinessSector,
    this.isActive = true,
    this.createdAt,
    this.expiresAt,
  });
}

// Defines the nature of the opportunity for better filtering and data insights.
enum GigType {
  piece('PieceJob'), // Short-term, fixed task
  apprentice(
      'Apprenticeship'), // Longer-term learning/training with practical work
  mentor('Mentorship');

  const GigType(this.type);
  final String type;

  // Guidance/coaching only
}

// Defines how the worker will be compensated.
enum CompensationType {
  hourly('Hourly'),
  fixedPrice('FixedPrice'),
  volunteer('Volunteer'); // For mentorship or non-paid apprenticeship

  const CompensationType(this.type);
  final String type;
}
