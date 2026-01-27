// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Experience & Education'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.05),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Professional Journey',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tracking my growth in tech and academia',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.white60),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(context, 'Experience', Icons.work_rounded),
                  const SizedBox(height: 20),
                  _buildExperienceCard(
                    context,
                    'Senior Flutter Developer',
                    'Tech Solutions Inc.',
                    '2022 - Present',
                    'Leading mobile app development team, architecting scalable Flutter applications, and mentoring junior developers.',
                    Icons.business,
                  ),
                  const SizedBox(height: 16),
                  _buildExperienceCard(
                    context,
                    'Flutter Developer',
                    'Digital Innovations Ltd.',
                    '2020 - 2022',
                    'Developed and maintained multiple cross-platform mobile applications using Flutter and Firebase.',
                    Icons.business_center,
                  ),
                  const SizedBox(height: 32),
                  _buildSectionTitle(
                    context,
                    'Education',
                    Icons.school_rounded,
                  ),
                  const SizedBox(height: 20),
                  _buildEducationCard(
                    context,
                    'Bachelor of Computer Science',
                    'University of Technology',
                    '2015 - 2019',
                    'Specialized in Mobile Application Development and Software Engineering',
                    Icons.school,
                  ),
                  const SizedBox(height: 32),
                  _buildSectionTitle(
                    context,
                    'Certifications',
                    Icons.verified_rounded,
                  ),
                  const SizedBox(height: 20),
                  _buildCertificationCard(
                    context,
                    'Firebase Certified Developer',
                    'Google',
                    '2021',
                  ),
                  const SizedBox(height: 12),
                  _buildCertificationCard(
                    context,
                    'AWS Mobile Development',
                    'Amazon Web Services',
                    '2022',
                  ),
                  const SizedBox(height: 100), // Padding for the floating bar
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildExperienceCard(
    BuildContext context,
    String position,
    String company,
    String duration,
    String description,
    IconData icon,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primary.withOpacity(0.1),
                  child: Icon(
                    icon,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        position,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        company,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.calendar_today_rounded,
                    size: 12,
                    color: Colors.white60,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    duration,
                    style: const TextStyle(fontSize: 12, color: Colors.white60),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(height: 1.5, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationCard(
    BuildContext context,
    String degree,
    String institution,
    String duration,
    String description,
    IconData icon,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.tertiary.withOpacity(0.1),
                  child: Icon(
                    icon,
                    color: Theme.of(context).colorScheme.tertiary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        degree,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        institution,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              duration,
              style: const TextStyle(fontSize: 14, color: Colors.white60),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(height: 1.5, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificationCard(
    BuildContext context,
    String title,
    String issuer,
    String year,
  ) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Icon(
          Icons.verified_rounded,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
        subtitle: Text(
          '$issuer • $year',
          style: const TextStyle(color: Colors.white60),
        ),
      ),
    );
  }
}
