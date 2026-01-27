// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/experience_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M Zahid Talib - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1), // Indigo primary
          primary: const Color(0xFF6366F1),
          secondary: const Color(0xFFA855F7), // Purple secondary
          tertiary: const Color(0xFFEC4899), // Pink accent
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(
          0xFF0F172A,
        ), // Deep slate background
        cardTheme: CardThemeData(
          color: const Color(0xFF1E293B),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: Colors.white10),
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.transparent,
          indicatorColor: const Color(0xFF6366F1).withOpacity(0.2),
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ProjectsScreen(),
    ExperienceScreen(),
    ProfileScreen(),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Content flows behind navigation bar
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        height: 75,
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B).withOpacity(0.95),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            elevation: 0,
            backgroundColor: Colors.transparent,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home, color: Color(0xFF6366F1)),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.work_outline),
                selectedIcon: Icon(Icons.work, color: Color(0xFF6366F1)),
                label: 'Projects',
              ),
              NavigationDestination(
                icon: Icon(Icons.timeline_outlined),
                selectedIcon: Icon(Icons.timeline, color: Color(0xFF6366F1)),
                label: 'Experience',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person, color: Color(0xFF6366F1)),
                label: 'Profile',
              ),
              NavigationDestination(
                icon: Icon(Icons.contact_mail_outlined),
                selectedIcon: Icon(
                  Icons.contact_mail,
                  color: Color(0xFF6366F1),
                ),
                label: 'Contact',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
