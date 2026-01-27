// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/gradient_button.dart';
import '../widgets/skill_chip.dart';
import '../models/project_model.dart';
import 'project_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Portfolio'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section with Floating Decorative Background
            Stack(
              children: [
                Positioned(
                  top: -100,
                  right: -100,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.15),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: -50,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(
                        context,
                      ).colorScheme.tertiary.withOpacity(0.1),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 48,
                  ),
                  child: Column(
                    children: [
                      // Profile Avatar with Ring
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primary.withOpacity(0.2),
                                width: 2,
                              ),
                            ),
                          ),
                          Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primary.withOpacity(0.2),
                                  blurRadius: 30,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Hero(
                                tag: 'avatar',
                                child: Image.asset(
                                  'assets/images/profile.jpg',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                              Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                            ],
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.person,
                                          size: 70,
                                          color: Colors.white,
                                        ),
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [Colors.white, Colors.white.withOpacity(0.8)],
                        ).createShader(bounds),
                        child: Text(
                          'M Zahid Talib',
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.w900,
                                letterSpacing: -1,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Full Stack Flutter Developer',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Building intelligent, beautiful, and performant mobile experiences with the latest Flutter ecosystems.',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: Colors.white70, height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: GradientButton(
                              text: 'Explore Work',
                              icon: Icons.rocket_launch_rounded,
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton.icon(
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
                              icon: const Icon(Icons.description_outlined),
                              label: const Text('Resume'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.05),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: Colors.white.withOpacity(0.1),
                                  ),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Stats Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      context,
                      '${ProjectData.projects.length}+',
                      'Projects',
                      Icons.code,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      context,
                      '3+',
                      'Years Exp',
                      Icons.timeline,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      context,
                      '50+',
                      'Clients',
                      Icons.people,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Skills Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Core Skills',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: const [
                      SkillChip(label: 'Flutter', icon: Icons.flutter_dash),
                      SkillChip(label: 'Dart', icon: Icons.code),
                      SkillChip(label: 'Firebase', icon: Icons.cloud),
                      SkillChip(label: 'REST API', icon: Icons.api),
                      SkillChip(label: 'Git', icon: Icons.source),
                      SkillChip(label: 'UI/UX', icon: Icons.design_services),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Featured Work Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured Work',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('See All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ...ProjectData.projects
                      .take(3)
                      .map(
                        (project) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _buildFeaturedProjectCard(context, project),
                        ),
                      ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String value,
    String label,
    IconData icon,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedProjectCard(BuildContext context, Project project) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                ],
              ),
            ),
            child: project.imageAsset.isNotEmpty
                ? Image.asset(
                    project.imageAsset,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.rocket_launch_rounded),
                  )
                : const Icon(Icons.rocket_launch_rounded),
          ),
        ),
        title: Text(
          project.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          project.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectDetailScreen(project: project),
            ),
          );
        },
      ),
    );
  }
}
