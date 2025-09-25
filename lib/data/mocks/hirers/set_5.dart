import 'package:nextgig/data/models/user_model.dart';

final List<UserModel> mockHirersSet5 = [
  // h041
  UserModel(
    id: "h041",
    firstName: "Sipho",
    lastName: "Mkhize",
    idNumber: "6905125804082",
    idVerified: true,
    location: "Durban, KwaZulu-Natal",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Mkhize Mechanics",
      sector: "Automotive",
      description: "Car repair and maintenance",
      services: ["Engine repair", "Brake servicing", "Oil changes"],
    ),
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Mechanics", "Car maintenance"],
    learningInterests: ["Electric vehicles"],
    educationHistory: [],
    reputationScore: 4.8,
    reviews: [
      Review(
        reviewerId: "u401",
        comment: "Reliable and skilled mechanic.",
        rating: 5.0,
        date: DateTime(2025, 7, 12),
      )
    ],
    createdAt: DateTime(2025, 3, 15),
    updatedAt: DateTime(2025, 9, 18),
  ),

// h042
  UserModel(
    id: "h042",
    firstName: "Anel",
    lastName: "Botha",
    idNumber: "6806110242087",
    idVerified: true,
    location: "Stellenbosch, Western Cape",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: ["https://anelbotha.design"],
    languages: ["Afrikaans", "English"],
    skills: ["Graphic design", "UI/UX"],
    learningInterests: ["Animation", "Illustration"],
    educationHistory: [
      Education(
        qualification: "Diploma Visual Communication",
        institution: "Stellenbosch University",
      )
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 4, 1),
    updatedAt: DateTime(2025, 9, 12),
  ),

// h043
  UserModel(
    id: "h043",
    firstName: "Thando",
    lastName: "Zondo",
    idNumber: "7301015880082",
    idVerified: true,
    location: "Pietermaritzburg, KwaZulu-Natal",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Zondo Fitness",
      sector: "Health & Fitness",
      description: "Personal training and wellness coaching",
      services: ["PT sessions", "Group fitness", "Nutrition guidance"],
    ),
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Personal training", "Nutrition"],
    learningInterests: ["Yoga", "Pilates"],
    educationHistory: [],
    reputationScore: 4.6,
    reviews: [
      Review(
        reviewerId: "u403",
        comment: "Motivating and professional trainer.",
        rating: 5.0,
        date: DateTime(2025, 6, 25),
      )
    ],
    createdAt: DateTime(2025, 2, 20),
    updatedAt: DateTime(2025, 9, 15),
  ),

// h044
  UserModel(
    id: "h044",
    firstName: "Carmen",
    lastName: "van der Merwe",
    idNumber: "6708090242081",
    idVerified: true,
    location: "Cape Town, Western Cape",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "van der Merwe Photography",
      sector: "Creative Arts",
      description: "Professional photography and event coverage",
      services: ["Event photography", "Portraits", "Commercial shoots"],
    ),
    portfolioLinks: ["https://carmenphoto.com"],
    languages: ["Afrikaans", "English"],
    skills: ["Photography", "Photo editing"],
    learningInterests: ["Videography", "Lighting techniques"],
    educationHistory: [],
    reputationScore: 4.7,
    reviews: [
      Review(
        reviewerId: "u404",
        comment: "Stunning photography, very professional.",
        rating: 5.0,
        date: DateTime(2025, 7, 5),
      )
    ],
    createdAt: DateTime(2025, 3, 10),
    updatedAt: DateTime(2025, 9, 18),
  ),

// h045
  UserModel(
    id: "h045",
    firstName: "Vusi",
    lastName: "Dlamini",
    idNumber: "7107025880082",
    idVerified: false,
    location: "Soweto, Gauteng",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Tutoring", "Math assistance"],
    learningInterests: ["Science tutoring", "Programming basics"],
    educationHistory: [],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 5, 1),
    updatedAt: DateTime(2025, 9, 12),
  ),

// h046
  UserModel(
    id: "h046",
    firstName: "Marlene",
    lastName: "Botha",
    idNumber: "6903110242083",
    idVerified: true,
    location: "George, Western Cape",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Botha Baking",
      sector: "Food Services",
      description: "Artisan bakery specializing in bread and pastries",
      services: ["Bread", "Cakes", "Pastries"],
    ),
    portfolioLinks: [],
    languages: ["Afrikaans", "English"],
    skills: ["Baking", "Cooking"],
    learningInterests: ["Cake decorating", "Pastry arts"],
    educationHistory: [],
    reputationScore: 4.8,
    reviews: [
      Review(
        reviewerId: "u406",
        comment: "Delicious and high-quality baked goods.",
        rating: 5.0,
        date: DateTime(2025, 6, 30),
      )
    ],
    createdAt: DateTime(2025, 2, 18),
    updatedAt: DateTime(2025, 9, 18),
  ),

// h047
  UserModel(
    id: "h047",
    firstName: "Andile",
    lastName: "Ngcobo",
    idNumber: "7206235840081",
    idVerified: true,
    location: "Durban, KwaZulu-Natal",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Ngcobo Gardening",
      sector: "Gardening",
      description: "Landscaping and garden maintenance",
      services: ["Lawn care", "Planting", "Irrigation setup"],
    ),
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Gardening", "Landscaping"],
    learningInterests: ["Urban farming"],
    educationHistory: [],
    reputationScore: 4.5,
    reviews: [
      Review(
        reviewerId: "u407",
        comment: "Professional and reliable gardener.",
        rating: 4.5,
        date: DateTime(2025, 6, 15),
      )
    ],
    createdAt: DateTime(2025, 3, 12),
    updatedAt: DateTime(2025, 9, 18),
  ),

// h048
  UserModel(
    id: "h048",
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
    skills: ["Web development", "UI/UX"],
    learningInterests: ["App development", "AI"],
    educationHistory: [
      Education(
        qualification: "BSc IT",
        institution: "NWU",
      )
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 4, 5),
    updatedAt: DateTime(2025, 9, 12),
  ),

// h049
  UserModel(
    id: "h049",
    firstName: "Thobile",
    lastName: "Dube",
    idNumber: "7102155880082",
    idVerified: true,
    location: "Mbombela, Mpumalanga",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Dube Catering",
      sector: "Food Services",
      description: "Event catering and home catering",
      services: ["Buffets", "Platters", "Custom orders"],
    ),
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Cooking", "Event catering"],
    learningInterests: ["Nutrition", "Menu planning"],
    educationHistory: [],
    reputationScore: 4.6,
    reviews: [
      Review(
        reviewerId: "u409",
        comment: "Amazing food and service!",
        rating: 5.0,
        date: DateTime(2025, 6, 20),
      )
    ],
    createdAt: DateTime(2025, 2, 20),
    updatedAt: DateTime(2025, 9, 18),
  ),

// h050
  UserModel(
    id: "h050",
    firstName: "Francois",
    lastName: "de Klerk",
    idNumber: "6503115820081",
    idVerified: true,
    location: "Kimberley, Northern Cape",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "de Klerk Carpentry",
      sector: "Construction",
      description: "Custom furniture and home repairs",
      services: ["Cabinets", "Tables", "Repairs"],
    ),
    portfolioLinks: [],
    languages: ["Afrikaans", "English"],
    skills: ["Carpentry", "Woodworking"],
    learningInterests: ["CNC woodworking"],
    educationHistory: [],
    reputationScore: 4.7,
    reviews: [
      Review(
        reviewerId: "u410",
        comment: "Excellent quality work and reliable.",
        rating: 5.0,
        date: DateTime(2025, 7, 10),
      )
    ],
    createdAt: DateTime(2025, 2, 12),
    updatedAt: DateTime(2025, 9, 18),
  ),
];
