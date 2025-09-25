import 'package:nextgig/data/models/user_model.dart';

final List<UserModel> mockHirersSet2 = [
  // h011
  UserModel(
    id: "h011",
    firstName: "Jabulani",
    lastName: "Nkosi",
    idNumber: "7203056034081",
    idVerified: true,
    location: "Alexandra, Gauteng",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Nkosi Tutoring",
      sector: "Education",
      description: "Private tuition for high school learners",
      services: ["Math tutoring", "Science tutoring"],
    ),
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Teaching", "Curriculum development"],
    learningInterests: ["EdTech tools"],
    educationHistory: [
      Education(
        qualification: "BSc Education",
        institution: "University of Johannesburg",
      )
    ],
    reputationScore: 4.5,
    reviews: [
      Review(
        reviewerId: "u200",
        comment: "Very patient and effective tutor.",
        rating: 5,
        date: DateTime(2025, 7, 12),
      )
    ],
    createdAt: DateTime(2025, 3, 1),
    updatedAt: DateTime(2025, 9, 5),
  ),

// h012
  UserModel(
    id: "h012",
    firstName: "Elsabe",
    lastName: "van Wyk",
    idNumber: "6902110242083",
    idVerified: true,
    location: "George, Western Cape",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: ["https://linkedin.com/in/elsabevw"],
    languages: ["Afrikaans", "English"],
    skills: ["Graphic design", "Illustration"],
    learningInterests: ["UI/UX design"],
    educationHistory: [
      Education(
        qualification: "Diploma in Visual Communication",
        institution: "Nelson Mandela University",
      )
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 4, 10),
    updatedAt: DateTime(2025, 9, 10),
  ),

// h013
  UserModel(
    id: "h013",
    firstName: "Ahmed",
    lastName: "Mahomed",
    idNumber: "6008245890084",
    idVerified: false,
    location: "Mitchells Plain, Western Cape",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Mahomed Music Studio",
      sector: "Music Production",
      description: "Recording and production services for local artists",
      services: ["Recording", "Mixing", "Mastering"],
    ),
    portfolioLinks: ["https://soundcloud.com/mahomedstudio"],
    languages: ["English"],
    skills: ["Music production", "Sound engineering"],
    learningInterests: ["Live sound"],
    educationHistory: [],
    reputationScore: 4.3,
    reviews: [
      Review(
        reviewerId: "u101",
        comment: "Great quality recordings!",
        rating: 4.5,
        date: DateTime(2025, 6, 20),
      )
    ],
    createdAt: DateTime(2025, 2, 18),
    updatedAt: DateTime(2025, 9, 15),
  ),

// h014
  UserModel(
    id: "h014",
    firstName: "Marlene",
    lastName: "Pretorius",
    idNumber: "7506080041086",
    idVerified: true,
    location: "Bloemhof, North West",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Afrikaans", "English"],
    skills: ["Accounting", "Bookkeeping"],
    learningInterests: ["Financial consulting"],
    educationHistory: [
      Education(
        qualification: "Diploma in Accounting",
        institution: "North West University",
      )
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 5, 2),
    updatedAt: DateTime(2025, 9, 12),
  ),

// h015
  UserModel(
    id: "h015",
    firstName: "Siphelele",
    lastName: "Ngcobo",
    idNumber: "8107025443087",
    idVerified: true,
    location: "Pietermaritzburg, KwaZulu-Natal",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Ngcobo Carpentry",
      sector: "Construction",
      description: "Custom furniture and woodwork",
      services: ["Cabinets", "Tables", "Repairs"],
    ),
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Carpentry", "Woodworking"],
    learningInterests: ["CNC woodworking"],
    educationHistory: [],
    reputationScore: 4.7,
    reviews: [
      Review(
        reviewerId: "u155",
        comment: "Excellent craftsmanship.",
        rating: 5.0,
        date: DateTime(2025, 7, 5),
      )
    ],
    createdAt: DateTime(2025, 3, 12),
    updatedAt: DateTime(2025, 9, 2),
  ),

// h016
  UserModel(
    id: "h016",
    firstName: "Anika",
    lastName: "Meyer",
    idNumber: "6703110245087",
    idVerified: true,
    location: "Windhoek, Namibia",
    locationVerified: false, // intentionally unverified for demo
    isRemote: true,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: ["https://anika-meyer.com"],
    languages: ["English", "Afrikaans"],
    skills: ["Web design", "Digital marketing"],
    learningInterests: ["SEO", "Analytics"],
    educationHistory: [
      Education(
        qualification: "BCom IT",
        institution: "UNISA",
      )
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 6, 5),
    updatedAt: DateTime(2025, 9, 10),
  ),

// h017
  UserModel(
    id: "h017",
    firstName: "Mpho",
    lastName: "Seape",
    idNumber: "6408015640082",
    idVerified: true,
    location: "Mmabatho, North West",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Seape Landscaping",
      sector: "Gardening",
      description: "Residential and commercial landscaping services",
      services: ["Garden maintenance", "Tree planting", "Irrigation setup"],
    ),
    portfolioLinks: [],
    languages: ["English", "Tswana"],
    skills: ["Landscaping", "Gardening"],
    learningInterests: ["Urban farming"],
    educationHistory: [],
    reputationScore: 4.2,
    reviews: [
      Review(
        reviewerId: "u180",
        comment: "Reliable and professional.",
        rating: 4.0,
        date: DateTime(2025, 6, 30),
      )
    ],
    createdAt: DateTime(2025, 2, 20),
    updatedAt: DateTime(2025, 9, 15),
  ),

// h018
  UserModel(
    id: "h018",
    firstName: "Fiona",
    lastName: "Mabaso",
    idNumber: "7209156083083",
    idVerified: false,
    location: "Katlehong, Gauteng",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["English", "Zulu"],
    skills: ["Hairdressing", "Makeup artistry"],
    learningInterests: ["Nail art"],
    educationHistory: [],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 4, 15),
    updatedAt: DateTime(2025, 9, 18),
  ),

// h019
  UserModel(
    id: "h019",
    firstName: "Riaan",
    lastName: "van Heerden",
    idNumber: "6501035042081",
    idVerified: true,
    location: "Potchefstroom, North West",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "van Heerden IT Solutions",
      sector: "Technology",
      description: "Small IT consultancy and software development",
      services: ["Web development", "App development", "IT support"],
    ),
    portfolioLinks: ["https://github.com/riianvh"],
    languages: ["English", "Afrikaans"],
    skills: ["Coding", "IT consulting"],
    learningInterests: ["AI integration", "Cloud computing"],
    educationHistory: [
      Education(
        qualification: "BSc Computer Science",
        institution: "NWU",
      )
    ],
    reputationScore: 4.9,
    reviews: [
      Review(
        reviewerId: "u220",
        comment: "Professional and knowledgeable.",
        rating: 5.0,
        date: DateTime(2025, 7, 25),
      )
    ],
    createdAt: DateTime(2025, 1, 15),
    updatedAt: DateTime(2025, 9, 20),
  ),

// h020
  UserModel(
    id: "h020",
    firstName: "Zinhle",
    lastName: "Dube",
    idNumber: "7104095890082",
    idVerified: true,
    location: "Emalahleni, Mpumalanga",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Dube Catering",
      sector: "Food Services",
      description: "Home-style catering for community events",
      services: ["Buffets", "Platters", "Baking"],
    ),
    portfolioLinks: [],
    languages: ["English", "Zulu"],
    skills: ["Cooking", "Event management"],
    learningInterests: ["Nutrition", "Menu planning"],
    educationHistory: [],
    reputationScore: 4.3,
    reviews: [
      Review(
        reviewerId: "u199",
        comment: "Great food and service.",
        rating: 4.5,
        date: DateTime(2025, 6, 10),
      )
    ],
    createdAt: DateTime(2025, 2, 25),
    updatedAt: DateTime(2025, 9, 18),
  ),
];
