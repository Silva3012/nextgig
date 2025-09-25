import 'package:nextgig/data/models/user_model.dart';

final List<UserModel> mockJobSeekers = [
  // j001
  UserModel(
    id: "j001",
    firstName: "Sibongile",
    lastName: "Mthethwa",
    idNumber: "0804125880081",
    idVerified: true,
    location: "Durban, KwaZulu-Natal",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Customer service", "Cash handling"],
    learningInterests: [],
    educationHistory: [
      Education(qualification: 'High School Diploma', institution: ''),
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 4, 1),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // j002
  UserModel(
    id: "j002",
    firstName: "Thabo",
    lastName: "Mokoena",
    idNumber: "0812145880082",
    idVerified: true,
    location: "Tembisa, Gauteng",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: ["https://linkedin.com/in/thabomokoena"],
    languages: ["English", "Tswana"],
    skills: ["Carpentry", "Woodworking"],
    learningInterests: [],
    educationHistory: [
      Education(qualification: 'Trade Certificate', institution: '')
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 3, 15),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // j003
  UserModel(
    id: "j003",
    firstName: "Lerato",
    lastName: "Dlamini",
    idNumber: "0712085880081",
    idVerified: true,
    location: "Soweto, Gauteng",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["English", "Zulu"],
    skills: ["Coding", "Web development"],
    learningInterests: ["App development", "UI/UX"],
    educationHistory: [
      Education(qualification: 'Online Bootcamp', institution: '')
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 4, 10),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // j004
  UserModel(
    id: "j004",
    firstName: "Neo",
    lastName: "Khumalo",
    idNumber: "0803145880081",
    idVerified: true,
    location: "Katlehong, Gauteng",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Gardening", "Landscaping"],
    learningInterests: [],
    educationHistory: [
      Education(qualification: 'High School Diploma', institution: '')
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 5, 5),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // j005
  UserModel(
    id: "j005",
    firstName: "Zanele",
    lastName: "Nkosi",
    idNumber: "0709085880081",
    idVerified: true,
    location: "Empangeni, KwaZulu-Natal",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Cooking", "Baking"],
    learningInterests: [],
    educationHistory: [
      Education(qualification: 'High School Diploma', institution: '')
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 4, 12),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // j006
  UserModel(
    id: "j006",
    firstName: "Sipho",
    lastName: "Mkhize",
    idNumber: "0705125804082",
    idVerified: true,
    location: "Durban, KwaZulu-Natal",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Mechanics", "Car maintenance"],
    learningInterests: [],
    educationHistory: [
      Education(qualification: 'Trade Certificate', institution: '')
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 4, 15),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // j007
  UserModel(
    id: "j007",
    firstName: "Leandri",
    lastName: "van der Walt",
    idNumber: "6808170242087",
    idVerified: true,
    location: "Potchefstroom, North West",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: ["https://linkedin.com/in/leandrivdwalt"],
    languages: ["Afrikaans", "English"],
    skills: ["Web development", "Graphic design"],
    learningInterests: [],
    educationHistory: [
      Education(qualification: 'Diploma in Design', institution: '')
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 3, 12),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // j008
  UserModel(
    id: "j008",
    firstName: "Fikile",
    lastName: "Hadebe",
    idNumber: "0712125854087",
    idVerified: true,
    location: "Pietermaritzburg, KwaZulu-Natal",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Cooking", "Event catering"],
    learningInterests: [],
    educationHistory: [
      Education(qualification: 'High School Diploma', institution: '')
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 4, 5),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // j009
  UserModel(
    id: "j009",
    firstName: "Thandeka",
    lastName: "Nkosi",
    idNumber: "0712085880082",
    idVerified: true,
    location: "Empangeni, KwaZulu-Natal",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Fitness training", "Personal training"],
    learningInterests: [],
    educationHistory: [
      Education(qualification: 'High School Diploma', institution: '')
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 4, 12),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // j010
  UserModel(
    id: "j010",
    firstName: "Anele",
    lastName: "Dube",
    idNumber: "0702155880082",
    idVerified: true,
    location: "Mbombela, Mpumalanga",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Photography", "Videography"],
    learningInterests: [],
    educationHistory: [
      Education(qualification: 'High School Diploma', institution: '')
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 5, 2),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // j011–j050: continue similar pattern with diverse locations (all provinces), skills (formal/informal), remote/on-site mix, genders, ages 18–50
  // Example: coding, sewing, gardening, music, welding, tutoring, driving, admin, barista, retail, etc.
];
