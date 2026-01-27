class Project {
  final String title;
  final String description;
  final String imageAsset;
  final List<String> technologies;
  final List<String> highlights;
  final List<String> screenshots;

  const Project({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.technologies,
    required this.highlights,
    this.screenshots = const [],
  });
}

class ProjectData {
  static const List<Project> projects = [
    Project(
      title: 'Online Appointment System',
      description:
          'A robust platform for booking appointments online, managing schedules, and improving patient-doctor interaction.',
      imageAsset: 'assets/images/online_appointment/appointment_thumb.jpg',
      technologies: ['Flutter', 'Firebase', 'Cloud Functions', 'Provider'],
      highlights: [
        'Instant booking confirmation',
        'Doctor schedule management',
        'Push notification reminders',
        'Secure patient records',
      ],
      screenshots: [
        'assets/images/online_appointment/appointment_thumb.jpg',
        'assets/images/online_appointment/app_h1.jpg',
        'assets/images/online_appointment/app_h2.jpg',
        'assets/images/online_appointment/app_h3.jpg',
      ],
    ),
    Project(
      title: 'Quizify - Quiz App',
      description:
          'Interactive quiz platform with real-time leaderboards, category-based challenges, and performance tracking.',
      imageAsset: 'assets/images/quizify/quizify_thumb.jpg',
      technologies: ['Flutter', 'Firebase', 'REST API', 'Animation Controller'],
      highlights: [
        'Dynamic quiz generation',
        'Global competitive leaderboard',
        'Instant scoring & feedback',
        'Categorized question sets',
      ],
      screenshots: [
        'assets/images/quizify/quizify_thumb.jpg',
        'assets/images/quizify/q1.jpg',
        'assets/images/quizify/q2.jpg',
        'assets/images/quizify/q3.jpg',
        'assets/images/quizify/q4.jpg',
      ],
    ),
    Project(
      title: 'Smart BMI Calculator',
      description:
          'User-friendly health tool for calculating Body Mass Index with personalized health advice and history tracking.',
      imageAsset: 'assets/images/smart_bmi/bmi_thumb.jpg',
      technologies: ['Flutter', 'Custom UI', 'Local Storage', 'Math Packages'],
      highlights: [
        'Accurate BMI calculation',
        'Personalized health tips',
        'Visual health progress',
        'Clean minimalist design',
      ],
      screenshots: [
        'assets/images/smart_bmi/bmi_thumb.jpg',
        'assets/images/smart_bmi/b1.jpg',
        'assets/images/smart_bmi/b2.jpg',
        'assets/images/smart_bmi/b3.jpg',
        'assets/images/smart_bmi/b4.jpg',
      ],
    ),
    Project(
      title: 'Admin Dashboard',
      description:
          'Comprehensive administrative portal for business analytics, user management, and real-time monitoring.',
      imageAsset:
          'assets/images/dashboard_app/Screenshot 2025-11-17 121122.png',
      technologies: [
        'Flutter',
        'Firebase',
        'Syncfusion Charts',
        'Cloud Functions',
      ],
      highlights: [
        'Real-time data visualization',
        'User role management',
        'Automated reporting',
        'Cross-platform support',
      ],
      screenshots: [
        'assets/images/dashboard_app/Screenshot 2025-11-17 121122.png',
        'assets/images/dashboard_app/Screenshot 2025-11-24 130753.png',
        'assets/images/dashboard_app/Screenshot 2025-11-24 130853.png',
      ],
    ),
    Project(
      title: 'Business Analytics Dashboard',
      description:
          'Advanced data visualization platform for monitoring sales, user engagement, and operational efficiency.',
      imageAsset:
          'assets/images/dashboard_app/Screenshot 2025-11-24 130753.png',
      technologies: ['Flutter', 'REST API', 'Charts', 'Provider'],
      highlights: [
        'Sales performance tracking',
        'User behavior analytics',
        'Exportable PDF reports',
        'Dark/Light mode support',
      ],
      screenshots: [
        'assets/images/dashboard_app/Screenshot 2025-11-24 130753.png',
        'assets/images/dashboard_app/Screenshot 2025-11-24 130853.png',
        'assets/images/dashboard_app/Screenshot 2025-11-17 121122.png',
      ],
    ),
    Project(
      title: 'POS Inventory System',
      description:
          'Efficient Point of Sale system with inventory tracking, invoice generation, and sales analytics.',
      imageAsset: 'assets/images/pos/Screenshot 2025-07-15 115353.png',
      technologies: ['Flutter', 'SQLite', 'PDF Generation', 'Thermal Printing'],
      highlights: [
        'Fast checkout process',
        'Dynamic inventory management',
        'Offline capability',
        'Detailed sales reports',
      ],
      screenshots: [
        'assets/images/pos/Screenshot 2025-07-15 115353.png',
        'assets/images/pos/Screenshot 2025-07-15 115409.png',
        'assets/images/pos/Screenshot 2025-07-15 115419.png',
        'assets/images/pos/Screenshot 2025-07-15 115429.png',
        'assets/images/pos/Screenshot 2025-07-15 115437.png',
        'assets/images/pos/Screenshot 2025-07-15 115447.png',
        'assets/images/pos/Screenshot 2025-07-15 115455.png',
        'assets/images/pos/Screenshot 2025-07-15 115504.png',
        'assets/images/pos/Screenshot 2025-07-15 115512.png',
        'assets/images/pos/Screenshot 2025-07-15 115523.png',
        'assets/images/pos/Screenshot 2025-07-15 115533.png',
        'assets/images/pos/Screenshot 2025-07-15 115545.png',
        'assets/images/pos/Screenshot 2025-07-15 115556.png',
        'assets/images/pos/Screenshot 2025-07-15 115605.png',
        'assets/images/pos/Screenshot 2025-07-15 115615.png',
        'assets/images/pos/Screenshot 2025-07-15 115624.png',
        'assets/images/pos/Screenshot 2025-07-15 115632.png',
        'assets/images/pos/Screenshot 2025-07-15 115641.png',
        'assets/images/pos/Screenshot 2025-07-15 115651.png',
        'assets/images/pos/Screenshot 2025-07-15 115658.png',
      ],
    ),
  ];
}
