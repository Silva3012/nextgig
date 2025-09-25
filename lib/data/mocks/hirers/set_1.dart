import 'package:nextgig/data/models/user_model.dart';

final List<UserModel> mockHirersSet1 = [
  // h001
  UserModel(
    id: "h001",
    firstName: "Thabo",
    lastName: "Mokoena",
    idNumber: "7805125809083",
    idVerified: true,
    location: "Soweto, Gauteng",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Thabo’s Construction",
      sector: "Construction",
      description: "Small building contractor offering home repairs",
      services: ["Bricklaying", "Roof repairs", "Painting"],
    ),
    portfolioLinks: [],
    languages: ["English", "Zulu", "Sotho"],
    skills: ["Project management", "Construction"],
    learningInterests: ["Green building"],
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
  ),

  // h002
  UserModel(
    id: "h002",
    firstName: "Naledi",
    lastName: "Kgosi",
    idNumber: "8307190456082",
    idVerified: true,
    location: "Polokwane, Limpopo",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: ["https://linkedin.com/in/naledi-kgosi"],
    languages: ["English", "Sepedi"],
    skills: ["Event planning"],
    learningInterests: ["Digital marketing"],
    educationHistory: [
      Education(
        qualification: "BA Communications",
        institution: "University of Limpopo",
        startDate: DateTime(2002, 2, 1),
        endDate: DateTime(2005, 11, 30),
      )
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 3, 5),
    updatedAt: DateTime(2025, 9, 15),
  ),

  // h003
  UserModel(
    id: "h003",
    firstName: "Sipho",
    lastName: "Dlamini",
    idNumber: "6908115423087",
    idVerified: false,
    location: "Umlazi, KwaZulu-Natal",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Sipho’s Auto Repairs",
      sector: "Automotive",
      description: "Affordable mechanics specialising in taxis",
      services: ["Engine repairs", "Panel beating", "Tyre replacement"],
    ),
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Mechanical repairs"],
    learningInterests: ["Electric vehicles"],
    educationHistory: [],
    reputationScore: 4.2,
    reviews: [
      Review(
        reviewerId: "u144",
        comment: "Fixed our Toyota Quantum fast!",
        rating: 4.0,
        date: DateTime(2025, 7, 1),
      ),
    ],
    createdAt: DateTime(2025, 2, 12),
    updatedAt: DateTime(2025, 8, 20),
  ),

  // h004
  UserModel(
    id: "h004",
    firstName: "Karen",
    lastName: "Botha",
    idNumber: "7603050422081",
    idVerified: true,
    location: "Durban North, KwaZulu-Natal",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: ["https://karenbotha.com"],
    languages: ["English", "Afrikaans"],
    skills: ["Content writing", "Project management"],
    learningInterests: ["AI tools for small business"],
    educationHistory: [
      Education(
        qualification: "BCom Marketing",
        institution: "UKZN",
        startDate: DateTime(1997, 2, 1),
        endDate: DateTime(2000, 12, 31),
      )
    ],
    reputationScore: 3.9,
    reviews: [],
    createdAt: DateTime(2025, 4, 2),
    updatedAt: DateTime(2025, 9, 10),
  ),

  // h005
  UserModel(
    id: "h005",
    firstName: "Pieter",
    lastName: "van der Merwe",
    idNumber: "6509205729082",
    idVerified: true,
    location: "Stellenbosch, Western Cape",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Pieter’s Vineyard",
      sector: "Agriculture",
      description: "Small boutique vineyard with wine tours",
      services: ["Wine tasting", "Tours", "Sales"],
    ),
    portfolioLinks: [],
    languages: ["Afrikaans", "English"],
    skills: ["Viticulture", "Sales"],
    learningInterests: ["Marketing automation"],
    educationHistory: [
      Education(
        qualification: "Diploma in Agriculture",
        institution: "Stellenbosch University",
        startDate: DateTime(1983, 1, 1),
        endDate: DateTime(1986, 12, 31),
      )
    ],
    reputationScore: 4.8,
    reviews: [
      Review(
        reviewerId: "a033",
        comment: "Professional and friendly",
        rating: 5.0,
        date: DateTime(2025, 6, 15),
      )
    ],
    createdAt: DateTime(2025, 5, 20),
    updatedAt: DateTime(2025, 9, 1),
  ),

  // h006
  UserModel(
    id: "h006",
    firstName: "Ayesha",
    lastName: "Naidoo",
    idNumber: "8904120846087",
    idVerified: false,
    location: "Chatsworth, KwaZulu-Natal",
    locationVerified: false,
    isRemote: false,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: ["https://ayeshanaidoo.com"],
    languages: ["English", "Hindi"],
    skills: ["Graphic design", "Photography"],
    learningInterests: ["Video editing", "Animation"],
    educationHistory: [
      Education(
        qualification: "Diploma in Visual Arts",
        institution: "Durban University of Technology",
      )
    ],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 6, 1),
    updatedAt: DateTime(2025, 9, 22),
  ),

  // h007
  UserModel(
    id: "h007",
    firstName: "Lungile",
    lastName: "Zuma",
    idNumber: "7207155739082",
    idVerified: true,
    location: "Mthatha, Eastern Cape",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Zuma Catering",
      sector: "Food Services",
      description: "Local catering for events and weddings",
      services: ["Buffets", "Baking", "Event planning"],
    ),
    portfolioLinks: [],
    languages: ["English", "Xhosa"],
    skills: ["Cooking", "Event management"],
    learningInterests: ["Nutrition", "Marketing"],
    educationHistory: [],
    reputationScore: 4.1,
    reviews: [
      Review(
        reviewerId: "u066",
        comment: "Food was amazing!",
        rating: 4.5,
        date: DateTime(2025, 7, 20),
      )
    ],
    createdAt: DateTime(2025, 3, 15),
    updatedAt: DateTime(2025, 8, 30),
  ),

  // h008
  UserModel(
    id: "h008",
    firstName: "Dawid",
    lastName: "de Klerk",
    idNumber: "6702036023089",
    idVerified: true,
    location: "Bloemfontein, Free State",
    locationVerified: true,
    isRemote: true,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Afrikaans", "English"],
    skills: ["Accounting", "Bookkeeping"],
    learningInterests: ["Tax advisory"],
    educationHistory: [
      Education(
        qualification: "BCom Accounting",
        institution: "University of the Free State",
      )
    ],
    reputationScore: 3.8,
    reviews: [],
    createdAt: DateTime(2025, 1, 28),
    updatedAt: DateTime(2025, 9, 12),
  ),

  // h009
  UserModel(
    id: "h009",
    firstName: "Sihle",
    lastName: "Mthembu",
    idNumber: "8109145923084",
    idVerified: false,
    location: "Inanda, KwaZulu-Natal",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: false,
    businessDetails: null,
    portfolioLinks: [],
    languages: ["Zulu", "English"],
    skills: ["Gardening", "Landscaping"],
    learningInterests: ["Urban farming"],
    educationHistory: [],
    reputationScore: 0.0,
    reviews: [],
    createdAt: DateTime(2025, 4, 10),
    updatedAt: DateTime(2025, 9, 18),
  ),

  // h010
  UserModel(
    id: "h010",
    firstName: "Fatima",
    lastName: "Essop",
    idNumber: "7306115890082",
    idVerified: true,
    location: "Mitchells Plain, Western Cape",
    locationVerified: true,
    isRemote: false,
    isBusinessOwner: true,
    businessDetails: BusinessDetails(
      name: "Essop Sewing Studio",
      sector: "Textiles",
      description: "Tailoring and alterations for community",
      services: ["Sewing", "Custom designs", "Alterations"],
    ),
    portfolioLinks: ["https://instagram.com/essopstudio"],
    languages: ["English", "Afrikaans"],
    skills: ["Sewing", "Fashion design"],
    learningInterests: ["Pattern making"],
    educationHistory: [],
    reputationScore: 4.7,
    reviews: [
      Review(
        reviewerId: "u099",
        comment: "Beautiful custom dresses, highly recommended!",
        rating: 5,
        date: DateTime(2025, 8, 5),
      )
    ],
    createdAt: DateTime(2025, 2, 18),
    updatedAt: DateTime(2025, 9, 19),
  ),
];
