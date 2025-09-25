// --- Mock Data List ---

import 'package:nextgig/data/models/job_post_model.dart';

final List<GigPostModel> mockGigPosts = [
  // --- Start of Mock Jobs (Total: 200) ---
  // --- TECH & DIGITAL JOBS (Higher Pay, Remote/City focus) ---
  GigPostModel(
    id: 'gig001',
    posterId: 'user101',
    title: 'Flutter Widget Debugger - 2 Days',
    description:
        'Need an experienced Flutter dev to debug a state management issue on a payment page. Must be familiar with Provider/Riverpod.',
    requiredSkills: ['Flutter', 'Dart', 'Mobile Development', 'Debugging'],
    requiredLanguages: ['English'],
    gigType: GigType.piece,
    isRemote: true,
    location: 'Remote/Cape Town',
    compensationType: CompensationType.fixedPrice,
    rateOrPrice: 4500.00,
    compensationUnit: 'for the project',
    periodEstimate: '2 Days',
    employerName: 'Digital Bridge Solutions',
    employerBusinessSector: 'Software Development',
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
    expiresAt: DateTime.now().add(const Duration(days: 4)),
  ),
  GigPostModel(
    id: 'gig002',
    posterId: 'user102',
    title: 'Data Entry & Cleaning Specialist',
    description:
        'Clean and format 500 lines of retail sales data in Excel. Attention to detail is critical. Work can be done from home.',
    requiredSkills: ['Excel', 'Data Entry', 'Attention to Detail'],
    requiredLanguages: ['English'],
    gigType: GigType.piece,
    isRemote: true,
    location: 'Remote',
    compensationType: CompensationType.hourly,
    rateOrPrice: 120.00,
    compensationUnit: 'per hour',
    periodEstimate: '20 Hours Total',
    employerName: 'Market Insights Co.',
    employerBusinessSector: 'Data Analysis',
    createdAt: DateTime.now().subtract(const Duration(hours: 10)),
    expiresAt: DateTime.now().add(const Duration(days: 10)),
  ),
  GigPostModel(
    id: 'gig003',
    posterId: 'user103',
    title: 'Junior Web Dev apprentice (PHP)',
    description:
        '6-month paid apprentice to work on backend systems. Must know basic PHP and SQL. Training provided.',
    requiredSkills: ['PHP', 'SQL', 'HTML/CSS'],
    requiredLanguages: ['English', 'Afrikaans'],
    gigType: GigType.apprentice,
    isRemote: false,
    location: 'Pretoria',
    compensationType: CompensationType.hourly,
    rateOrPrice: 85.00,
    compensationUnit: 'per hour (Stipend)',
    periodEstimate: '6 Months',
    employerName: 'Tshwane Tech Hub',
    employerBusinessSector: 'Technology',
    createdAt: DateTime.now().subtract(const Duration(days: 14)),
    expiresAt: DateTime.now().add(const Duration(days: 30)),
  ),
  GigPostModel(
    id: 'gig004',
    posterId: 'user104',
    title: 'Social Media Content Creator',
    description:
        'Generate 10 engaging posts per week for a local Durban tourism business. Need creative graphic design skills.',
    requiredSkills: ['Graphic Design', 'Social Media Marketing', 'Copywriting'],
    requiredLanguages: ['English'],
    gigType: GigType.piece,
    isRemote: true,
    location: 'Remote/Durban',
    compensationType: CompensationType.fixedPrice,
    rateOrPrice: 2800.00,
    compensationUnit: 'per week',
    periodEstimate: 'Ongoing (4 Weeks min)',
    employerName: 'KZN Adventure Tours',
    employerBusinessSector: 'Tourism & Marketing',
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
    expiresAt: DateTime.now().add(const Duration(days: 7)),
  ),

  // --- ARTISAN & CONSTRUCTION JOBS (Physical, Localized, Fixed/hourly Pay) ---
  GigPostModel(
    id: 'gig005',
    posterId: 'user201',
    title: 'Urgent Geyser Repair in Soweto',
    description:
        'Leaking geyser at a home in Orlando East. Needs immediate assessment and repair/replacement.',
    requiredSkills: ['Plumbing', 'Geyser Installation', 'Emergency Repair'],
    requiredLanguages: ['Zulu', 'Sotho'],
    gigType: GigType.piece,
    isRemote: false,
    location: 'Soweto (Orlando East)',
    compensationType: CompensationType.fixedPrice,
    rateOrPrice: 1500.00,
    compensationUnit: 'for the job (Excl. Parts)',
    periodEstimate: 'Same Day',
    employerName: 'Mandla Dlamini',
    employerBusinessSector: 'Homeowner/Private',
    createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    expiresAt: DateTime.now().add(const Duration(hours: 48)),
  ),
  GigPostModel(
    id: 'gig006',
    posterId: 'user202',
    title: 'Welding Apprentice Needed - Steel Works',
    description:
        'Long-term apprentice at a fabrication workshop. Learn MIG/TIG welding. Must be physically fit and willing to learn.',
    requiredSkills: ['Welding', 'Metal Fabrication', 'Safety Training'],
    requiredLanguages: ['English', 'Afrikaans'],
    gigType: GigType.apprentice,
    isRemote: false,
    location: 'Port Elizabeth (Ibhayi)',
    compensationType: CompensationType.hourly,
    rateOrPrice: 65.00,
    compensationUnit: 'per hour (Stipend)',
    periodEstimate: '1 Year',
    employerName: 'Eastern Cape Fabricators',
    employerBusinessSector: 'Manufacturing',
    createdAt: DateTime.now().subtract(const Duration(days: 5)),
    expiresAt: DateTime.now().add(const Duration(days: 20)),
  ),
  GigPostModel(
    id: 'gig007',
    posterId: 'user203',
    title: 'Install 4 Ceiling Fans in Khayelitsha',
    description:
        'Electrician needed to install 4 pre-purchased ceiling fans. All wiring is in place, just need final installation.',
    requiredSkills: [
      'Electrical Wiring',
      'Fan Installation',
      'Safety Conscious'
    ],
    requiredLanguages: ['Xhosa', 'English'],
    gigType: GigType.piece,
    isRemote: false,
    location: 'Khayelitsha (Harare)',
    compensationType: CompensationType.fixedPrice,
    rateOrPrice: 800.00,
    compensationUnit: 'for the job',
    periodEstimate: '1 Day',
    employerName: 'Nomonde Family Trust',
    employerBusinessSector: 'Homeowner/Private',
    createdAt: DateTime.now().subtract(const Duration(hours: 15)),
    expiresAt: DateTime.now().add(const Duration(days: 2)),
  ),

  // --- SERVICES & CASUAL GIGS (Everyday Tasks, High Volume) ---
  GigPostModel(
    id: 'gig008',
    posterId: 'user301',
    title: 'Babysitter for Saturday Evening (Mitchells Plain)',
    description:
        'Need a trusted sitter for two children (ages 4 & 7) from 6 PM to 11 PM this Saturday. Must have verified ID and references.',
    requiredSkills: ['Childcare', 'First Aid (Bonus)', 'Patience'],
    requiredLanguages: ['Afrikaans', 'English'],
    gigType: GigType.piece,
    isRemote: false,
    location: 'Mitchells Plain (Rocklands)',
    compensationType: CompensationType.hourly,
    rateOrPrice: 90.00,
    compensationUnit: 'per hour',
    periodEstimate: '5 Hours',
    employerName: 'Mrs. L. Smith',
    employerBusinessSector: 'Homeowner/Private',
    createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    expiresAt: DateTime.now().add(const Duration(days: 1)),
  ),
  GigPostModel(
    id: 'gig009',
    posterId: 'user302',
    title: 'Academic Mentor for Grade 10 Maths',
    description:
        'volunteer or low-cost mentor needed for a Grade 10 learner in Limpopo, focusing on Algebra. Sessions can be online.',
    requiredSkills: ['High School Mathematics', 'Tutoring', 'Patience'],
    requiredLanguages: ['Sepedi', 'English'],
    gigType: GigType.mentor,
    isRemote: true,
    location: 'Polokwane/Remote',
    compensationType: CompensationType.volunteer,
    rateOrPrice: 0.00,
    compensationUnit: 'monthly',
    periodEstimate: '3 Months (Weekly sessions)',
    employerName: 'Seshego High School Outreach',
    employerBusinessSector: 'Education',
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
    expiresAt: DateTime.now().add(const Duration(days: 14)),
  ),
  GigPostModel(
    id: 'gig010',
    posterId: 'user303',
    title: 'General Garden Clean-up - Bloemfontein',
    description:
        'Hedge trimming, weeding, and lawn mowing for a large yard. Need your own basic tools (mower/trimmer).',
    requiredSkills: ['Gardening', 'Lawn Maintenance', 'Outdoor Work'],
    requiredLanguages: ['Sotho', 'English'],
    gigType: GigType.piece,
    isRemote: false,
    location: 'Bloemfontein (Botshabelo)',
    compensationType: CompensationType.fixedPrice,
    rateOrPrice: 650.00,
    compensationUnit: 'for the job',
    periodEstimate: '1 Full Day',
    employerName: 'P. Moloi',
    employerBusinessSector: 'Homeowner/Private',
    createdAt: DateTime.now().subtract(const Duration(hours: 8)),
    expiresAt: DateTime.now().add(const Duration(days: 3)),
  ),

  // --- GENERATE REMAINING 190 JOBS WITH VARIETY ---
  ...List.generate(190, (index) {
    final i = index + 11;
    final locations = [
      'Johannesburg (Alexandra)',
      'Durban (Umlazi)',
      'Cape Town (Delft)',
      'Pretoria (Mamelodi)',
      'East London (Mdantsane)',
      'Welkom (Thabong)',
      'Kimberley (Galeshewe)',
      'George',
      'Stellenbosch',
      'Nelspruit (Mbombela)',
      'Rustenburg',
      'Port Alfred',
      'Thohoyandou',
      'Midrand',
      'Paarl',
      'Remote',
      'Soweto (Diepsloot)',
      'Bloemfontein (Botshabelo)',
      'Knysna',
      'Mahikeng'
    ];
    final skills = [
      'Carpentry',
      'Graphic Design',
      'Basic Accounting',
      'Photography',
      'Driving (Code 10)',
      'House Cleaning',
      'Catering',
      'Wordpress',
      'Customer Service',
      'Welding',
      'Plumbing',
      'Tiling',
      'Electrician',
      'English Tutoring',
      'Excel',
      'Social Media',
      'Sales',
      'Data Entry',
      'Childcare',
      'Home Security Installation'
    ];
    final jobTitles = [
      'Help install a new front door',
      'Design a logo for a startup',
      'Bookkeeping for a small business',
      'Product Photography Shoot',
      'Delivery Driver for 3 days',
      'Deep Clean 3-bedroom house',
      'Catering Assistant for a wedding',
      'Fix Wordpress Site Theme',
      'Call Centre Agent (Night Shift)',
      'Weld Steel Gates',
      'Fix burst pipe',
      'Re-tile bathroom floor',
      'Install new light switches',
      'English homework help',
      'Organise spreadsheet data',
      'Run marketing campaign',
      'Retail Sales Support',
      'Input customer forms',
      'After-school babysitting',
      'Install CCTV Camera'
    ];
    final sectors = [
      'Construction',
      'Design',
      'Finance',
      'Creative Arts',
      'Logistics',
      'Services',
      'Hospitality',
      'Technology',
      'BPO',
      'Manufacturing',
      'Retail',
      'Education',
      'Private'
    ];
    const gigTypes = GigType.values;
    const compTypes = CompensationType.values;
    final languages = [
      'English',
      'Zulu',
      'Afrikaans',
      'Xhosa',
      'Sotho',
      'Tsonga'
    ];

    // Random selection logic
    final randomLocation = locations[i % locations.length];
    final randomSkills =
        List.generate(1 + i % 3, (j) => skills[(i + j) % skills.length]);
    final randomGigType = gigTypes[i % gigTypes.length];
    final randomCompType = compTypes[i % compTypes.length];
    final randomTitle = jobTitles[i % jobTitles.length];
    final randomSector = sectors[i % sectors.length];
    final isRemote = randomLocation.contains('Remote') || i % 4 == 0;

    // Pay and Period Variation
    double rateOrPrice;
    String unit;
    String period;

    if (randomCompType == CompensationType.hourly) {
      rateOrPrice = 60.00 + (i % 25) * 5.0; // R60 to R180/hr
      unit = 'per hour';
      period = '${(i % 5) + 4} hours';
    } else if (randomCompType == CompensationType.fixedPrice) {
      rateOrPrice = 500.00 + (i % 50) * 100.0; // R500 to R5400 fixed
      unit = 'for the job';
      period = '${(i % 4) + 1} days';
    } else {
      // volunteer
      rateOrPrice = 0.0;
      unit = 'monthly';
      period = '${(i % 3) + 1} months';
    }

    // Description variety
    String descriptionBase =
        'Looking for someone skilled in ${randomSkills.join(', ')} to help with a task. Must be reliable and have a good rating.';
    if (randomGigType == GigType.apprentice) {
      descriptionBase =
          'Seeking a keen learner for a 6-month apprentice. Focus on practical, hands-on experience in $randomSector.';
      period = '6 Months';
    } else if (randomGigType == GigType.mentor) {
      descriptionBase =
          'Offering remote mentor in $randomSkills[0] to youth in $randomLocation. Give back to the community.';
    }

    return GigPostModel(
      id: 'gig${i.toString().padLeft(3, '0')}',
      posterId: 'user${(i % 50) + 100}', // Cycle through 50 mock users
      title: randomTitle,
      description: descriptionBase,
      requiredSkills: randomSkills,
      requiredLanguages: [languages[i % languages.length]],
      gigType: randomGigType,
      isRemote: isRemote,
      location: randomLocation,
      compensationType: randomCompType,
      rateOrPrice: double.parse(rateOrPrice.toStringAsFixed(2)),
      compensationUnit: unit,
      periodEstimate: period,
      employerName: '${randomSector.split(' ')[0]} Co. $i',
      employerBusinessSector: randomSector,
      createdAt: DateTime.now().subtract(Duration(hours: i)),
      expiresAt: DateTime.now().add(Duration(days: (i % 30) + 1)),
    );
  }),
  // --- End of Mock Jobs ---
];
