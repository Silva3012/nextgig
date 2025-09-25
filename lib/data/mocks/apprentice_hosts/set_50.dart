import 'package:nextgig/data/models/user_model.dart';

final List<UserModel> mockApprenticeHosts = [
  // h001
  UserModel(
    id: "h001",
    firstName: "Sipho",
    lastName: "Mkhize",
    idNumber: "0705125804082",
    idVerified: true,
    location: "Durban, KwaZulu-Natal",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Mechanics", "Car maintenance"],
    learningInterests: [],
    educationHistory: [
      Education(
        qualification: 'Trade Certificate',
        institution: '',
      )
    ],
    reputationScore: 4.7,
    reviews: [],
    createdAt: DateTime(2025, 3, 15),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // h002
  UserModel(
    id: "h002",
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
      Education(
        qualification: 'Diploma inn Design',
        institution: '',
      )
    ],
    reputationScore: 4.5,
    reviews: [],
    createdAt: DateTime(2025, 3, 12),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // h003
  UserModel(
    id: "h003",
    firstName: "Thandeka",
    lastName: "Nkosi",
    idNumber: "0712085880082",
    idVerified: true,
    location: "Soweto, Gauteng",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Hairdressing", "Makeup artistry"],
    learningInterests: [],
    educationHistory: [
      Education(
        qualification: 'Diploma inn Design',
        institution: '',
      )
    ],
    reputationScore: 4.8,
    reviews: [],
    createdAt: DateTime(2025, 4, 5),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // h004
  UserModel(
    id: "h004",
    firstName: "Thabo",
    lastName: "Mokoena",
    idNumber: "0802145880082",
    idVerified: true,
    location: "Tembisa, Gauteng",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["English", "Tswana"],
    skills: ["Carpentry", "Woodworking"],
    learningInterests: [],
    educationHistory: [
      Education(
        qualification: 'Trade Certificate',
        institution: '',
      )
    ],
    reputationScore: 4.6,
    reviews: [],
    createdAt: DateTime(2025, 4, 1),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // h005
  UserModel(
    id: "h005",
    firstName: "Nomvula",
    lastName: "Dlamini",
    idNumber: "0711015880081",
    idVerified: true,
    location: "KwaMashu, KwaZulu-Natal",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Tutoring", "Science & Math"],
    learningInterests: [],
    educationHistory: [
      Education(
        qualification: 'Bachelors in Education',
        institution: '',
      )
    ],
    reputationScore: 4.9,
    reviews: [],
    createdAt: DateTime(2025, 4, 5),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // h006
  UserModel(
    id: "h006",
    firstName: "Neo",
    lastName: "Mokoena",
    idNumber: "0803145880081",
    idVerified: true,
    location: "Soweto, Gauteng",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["English", "Zulu"],
    skills: ["Music production", "DJing"],
    learningInterests: [],
    educationHistory: [
      Education(
        qualification: 'Diploma in Music Production',
        institution: '',
      )
    ],
    reputationScore: 4.7,
    reviews: [],
    createdAt: DateTime(2025, 5, 10),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // h007
  UserModel(
    id: "h007",
    firstName: "Zanele",
    lastName: "Mokoena",
    idNumber: "0710125880081",
    idVerified: true,
    location: "Tembisa, Gauteng",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["English", "Tswana"],
    skills: ["Coding", "Web development"],
    learningInterests: [],
    educationHistory: [
      Education(
        qualification: 'BSc Computer Science',
        institution: '',
      )
    ],
    reputationScore: 4.8,
    reviews: [],
    createdAt: DateTime(2025, 4, 12),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // h008
  UserModel(
    id: "h008",
    firstName: "Fikile",
    lastName: "Hadebe",
    idNumber: "0712125854087",
    idVerified: true,
    location: "Pietermaritzburg, KwaZulu-Natal",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Cooking", "Baking"],
    learningInterests: [],
    educationHistory: [
      Education(qualification: 'Culinary Diploma', institution: '')
    ],
    reputationScore: 4.7,
    reviews: [],
    createdAt: DateTime(2025, 4, 5),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // h009
  UserModel(
    id: "h009",
    firstName: "Anele",
    lastName: "Dube",
    idNumber: "0702155880082",
    idVerified: true,
    location: "Mbombela, Mpumalanga",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Event catering", "Cooking"],
    learningInterests: [],
    educationHistory: [Education(institution: '', qualification: '')],
    reputationScore: 4.6,
    reviews: [],
    createdAt: DateTime(2025, 5, 2),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // h010
  UserModel(
    id: "h010",
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
      Education(
          qualification: 'Fitness Instructor Certification', institution: '')
    ],
    reputationScore: 4.7,
    reviews: [],
    createdAt: DateTime(2025, 4, 12),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // h011–h050: continue pattern with diverse provinces, skills, genders, remote/on-site mix, businesses vs individuals
  // Example skills: Welding, Sewing, Carpentry, Gardening, Coding, Tutoring, Music, Driving, Admin, Retail, Barista
];
