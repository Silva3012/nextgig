import 'package:nextgig/data/models/user_model.dart';

final List<UserModel> mockHirersSet4 = [
  // h031
  UserModel(
    id: "h031",
    firstName: "Thabiso",
    lastName: "Khoza",
    idNumber: "7506235880082",
    idVerified: true,
    location: "Mahikeng, North West",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Khoza Electrical",
      sector: "Construction",
      description: "Residential and commercial electrical installations",
      services: ["Wiring", "Lighting installation", "Repairs"],
    ),
    portfolioLinks: [],
    languages: ["English", "Tswana"],
    skills: ["Electrical work", "Maintenance"],
    learningInterests: ["Solar systems"],
    educationHistory: [],
    reputationScore: 4.5,
    reviews: [
      Review(
        reviewerId: "u301",
        comment: "Fast and reliable electrician.",
        rating: 5.0,
        date: DateTime(2025, 7, 22),
      )
    ],
    createdAt: DateTime(2025, 3, 20),
    updatedAt: DateTime(2025, 9, 12),
  ),

// h032
  UserModel(
    id: "h032",
    firstName: "Nokuthula",
    lastName: "Dlamini",
    idNumber: "7204125854087",
    idVerified: true,
    location: "KwaMashu, KwaZulu-Natal",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Dlamini Tutoring",
      sector: "Education",
      description: "Private tutoring for high school learners",
      services: ["Math tutoring", "Science tutoring", "English tutoring"],
    ),
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Tutoring", "Curriculum support"],
    learningInterests: ["EdTech"],
    educationHistory: [
      Education(
        qualification: "BEd",
        institution: "UKZN",
      )
    ],
    reputationScore: 4.7,
    reviews: [
      Review(
        reviewerId: "u302",
        comment: "Excellent tutor, patient and professional.",
        rating: 5.0,
        date: DateTime(2025, 6, 30),
      )
    ],
    createdAt: DateTime(2025, 4, 1),
    updatedAt: DateTime(2025, 9, 15),
  ),

// h033
  UserModel(
    id: "h033",
    firstName: "Pieter",
    lastName: "de Villiers",
    idNumber: "6703115843081",
    idVerified: true,
    location: "Paarl, Western Cape",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "de Villiers Music Studio",
      sector: "Music Production",
      description: "Recording and mixing studio for local artists",
      services: ["Recording", "Mixing", "Mastering"],
    ),
    portfolioLinks: ["https://soundcloud.com/devilliersstudio"],
    languages: ["Afrikaans", "English"],
    skills: ["Music production", "Sound engineering"],
    learningInterests: ["Live sound", "DJing"],
    educationHistory: [],
    reputationScore: 4.8,
    reviews: [
      Review(
        reviewerId: "u303",
        comment: "Professional and creative sound quality.",
        rating: 5.0,
        date: DateTime(2025, 7, 12),
      )
    ],
    createdAt: DateTime(2025, 2, 18),
    updatedAt: DateTime(2025, 9, 20),
  ),

// h034
  UserModel(
    id: "h034",
    firstName: "Annelize",
    lastName: "Botha",
    idNumber: "6908090242087",
    idVerified: true,
    location: "Knysna, Western Cape",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: ["https://linkedin.com/in/annelizebotha"],
    languages: ["Afrikaans", "English"],
    skills: ["Graphic design", "Illustration"],
    learningInterests: ["UI/UX", "Animation"],
    educationHistory: [
      Education(
        qualification: "Diploma Visual Communication",
        institution: "NMMU",
      )
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 4, 5),
    updatedAt: DateTime(2025, 9, 12),
  ),

// h035
  UserModel(
    id: "h035",
    firstName: "Siyabonga",
    lastName: "Nkosi",
    idNumber: "7106235880082",
    idVerified: false,
    location: "Emalahleni, Mpumalanga",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Nkosi Welding",
      sector: "Construction",
      description: "Metal fabrication and repairs",
      services: ["Welding", "Metalwork", "Repair jobs"],
    ),
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Welding", "Metal fabrication"],
    learningInterests: ["Advanced welding techniques"],
    educationHistory: [],
    reputationScore: 4.2,
    reviews: [
      Review(
        reviewerId: "u305",
        comment: "Great quality work.",
        rating: 4.5,
        date: DateTime(2025, 6, 25),
      )
    ],
    createdAt: DateTime(2025, 3, 12),
    updatedAt: DateTime(2025, 9, 18),
  ),

// h036
  UserModel(
    id: "h036",
    firstName: "Fiona",
    lastName: "Mabaso",
    idNumber: "7205195880082",
    idVerified: true,
    location: "Katlehong, Gauteng",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["English", "Zulu"],
    skills: ["Hairdressing", "Makeup"],
    learningInterests: ["Nail art", "Skin care"],
    educationHistory: [],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 4, 10),
    updatedAt: DateTime(2025, 9, 15),
  ),

// h037
  UserModel(
    id: "h037",
    firstName: "Riaan",
    lastName: "Kruger",
    idNumber: "6507025804081",
    idVerified: true,
    location: "Upington, Northern Cape",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Kruger IT Solutions",
      sector: "Technology",
      description: "IT consultancy and software development",
      services: ["Web development", "App development", "IT support"],
    ),
    portfolioLinks: ["https://github.com/riankruger"],
    languages: ["English", "Afrikaans"],
    skills: ["Coding", "IT consulting"],
    learningInterests: ["AI integration", "Cloud solutions"],
    educationHistory: [
      Education(
        qualification: "BSc Computer Science",
        institution: "NWU",
      )
    ],
    reputationScore: 4.9,
    reviews: [
      Review(
        reviewerId: "u320",
        comment: "Excellent IT services.",
        rating: 5.0,
        date: DateTime(2025, 7, 10),
      )
    ],
    createdAt: DateTime(2025, 2, 15),
    updatedAt: DateTime(2025, 9, 20),
  ),

// h038
  UserModel(
    id: "h038",
    firstName: "Zinhle",
    lastName: "Mthembu",
    idNumber: "7103195890082",
    idVerified: true,
    location: "Ngcobo, Eastern Cape",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Mthembu Sewing Studio",
      sector: "Textiles",
      description: "Custom clothing and alterations",
      services: ["Sewing", "Pattern making", "Tailoring"],
    ),
    portfolioLinks: ["https://instagram.com/mthembustudio"],
    languages: ["Xhosa", "English"],
    skills: ["Sewing", "Fashion design"],
    learningInterests: ["Pattern making"],
    educationHistory: [],
    reputationScore: 4.7,
    reviews: [
      Review(
        reviewerId: "u340",
        comment: "Beautiful craftsmanship.",
        rating: 5.0,
        date: DateTime(2025, 6, 20),
      )
    ],
    createdAt: DateTime(2025, 2, 20),
    updatedAt: DateTime(2025, 9, 18),
  ),

// h039
  UserModel(
    id: "h039",
    firstName: "Thandeka",
    lastName: "Zulu",
    idNumber: "7108025880082",
    idVerified: false,
    location: "Katlehong, Gauteng",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Tutoring", "Math support"],
    learningInterests: ["Science curriculum"],
    educationHistory: [],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 5, 5),
    updatedAt: DateTime(2025, 9, 15),
  ),

// h040
  UserModel(
    id: "h040",
    firstName: "Fanie",
    lastName: "Joubert",
    idNumber: "6502175854081",
    idVerified: true,
    location: "Knysna, Western Cape",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Joubert Carpentry",
      sector: "Construction",
      description: "Furniture and home repairs",
      services: ["Tables", "Cabinets", "Home repairs"],
    ),
    portfolioLinks: [],
    languages: ["Afrikaans", "English"],
    skills: ["Carpentry", "Woodworking"],
    learningInterests: ["CNC woodworking"],
    educationHistory: [],
    reputationScore: 4.6,
    reviews: [
      Review(
        reviewerId: "u345",
        comment: "High quality work, reliable.",
        rating: 5.0,
        date: DateTime(2025, 6, 15),
      )
    ],
    createdAt: DateTime(2025, 2, 12),
    updatedAt: DateTime(2025, 9, 18),
  ),
];
