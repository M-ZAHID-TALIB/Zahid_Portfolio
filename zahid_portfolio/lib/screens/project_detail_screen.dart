// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../widgets/gradient_button.dart';
import '../widgets/skill_chip.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            stretch: true,
            backgroundColor: const Color(0xFF0F172A),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
              ],
              title: Text(
                project.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  letterSpacing: -0.5,
                  shadows: [Shadow(blurRadius: 15, color: Colors.black)],
                ),
              ),
              background: Hero(
                tag: 'project_${project.title}',
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    project.imageAsset.isNotEmpty
                        ? Image.asset(
                            project.imageAsset,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                _buildGradientPlaceholder(context),
                          )
                        : _buildGradientPlaceholder(context),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Color(0xFF0F172A), Colors.transparent],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.7,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Stack',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: project.technologies
                        .map((tech) => SkillChip(label: tech))
                        .toList(),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Key Features',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...project.highlights.map(
                    (highlight) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check_rounded,
                              color: Theme.of(context).colorScheme.primary,
                              size: 16,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              highlight,
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (project.screenshots.isNotEmpty) ...[
                    const SizedBox(height: 40),
                    Text(
                      'App Gallery',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 400,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: project.screenshots.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.asset(
                                project.screenshots[index],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    _buildGradientPlaceholder(context),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                  const SizedBox(height: 48),
                  GradientButton(
                    text: 'Live Demo',
                    icon: Icons.open_in_new_rounded,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 80), // Space for floating bottom bar
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientPlaceholder(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Icon(Icons.code, size: 100, color: Colors.white.withOpacity(0.2)),
    );
  }
}
