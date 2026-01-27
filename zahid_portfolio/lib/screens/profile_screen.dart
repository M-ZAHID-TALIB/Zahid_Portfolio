// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/skill_chip.dart';
import '../widgets/gradient_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'About Me'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Glass Header Section
            Stack(
              children: [
                Positioned(
                  top: -50,
                  right: -50,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withOpacity(0.05),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Hero(
                          tag: 'avatar',
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white12,
                            backgroundImage: const AssetImage(
                              'assets/images/profile.jpg',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Passion for Excellence',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'I am a dedicated Flutter developer with a focus on creating highly interactive and performant mobile experiences. I believe in clean code, robust architecture, and pixel-perfect design.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.6,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: 200,
                        child: GradientButton(
                          text: 'View Resume',
                          icon: Icons.description_outlined,
                          onPressed: () async {
                            final Uri url = Uri.parse(
                              'assets/resume/M-Zahid-Talib.pdf',
                            );
                            if (!await launchUrl(url)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Could not open resume'),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader(
                    context,
                    'Technical Arsenal',
                    Icons.bolt_rounded,
                  ),
                  const SizedBox(height: 16),
                  _buildSkillCategory(context, 'Engineering', [
                    'Flutter',
                    'Dart',
                    'Firebase',
                    'State Management',
                    'Clean Architecture',
                    'REST APIs',
                    'Supabase',
                  ]),
                  const SizedBox(height: 12),
                  _buildSkillCategory(context, 'Tools & Core', [
                    'Git',
                    'Docker',
                    'CI/CD',
                    'UI/UX Design',
                    'Agile',
                    'Jira',
                    'Postman',
                  ]),
                  const SizedBox(height: 32),

                  _buildSectionHeader(
                    context,
                    'Core Values',
                    Icons.auto_awesome_rounded,
                  ),
                  const SizedBox(height: 16),
                  _buildGlassInfoCard(
                    context,
                    'Quality First',
                    'I never compromise on code quality and performance.',
                    Icons.diamond_outlined,
                  ),
                  const SizedBox(height: 12),
                  _buildGlassInfoCard(
                    context,
                    'Continuous Learning',
                    'The tech world moves fast, and I move faster with it.',
                    Icons.trending_up_rounded,
                  ),
                  const SizedBox(height: 100), // Padding for nav bar
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20),
        const SizedBox(width: 12),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String category,
    List<String> skills,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills.map((skill) => SkillChip(label: skill)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlassInfoCard(
    BuildContext context,
    String title,
    String desc,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.tertiary, size: 28),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(color: Colors.white60, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
