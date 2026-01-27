// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/project_card.dart';
import '../models/project_model.dart';
import 'project_detail_screen.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = ProjectData.projects;

    return Scaffold(
      appBar: const CustomAppBar(title: 'My Projects'),
      body: CustomScrollView(
        slivers: [
          // Header Section
          SliverToBoxAdapter(
            child: Container(
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
                    'Portfolio Showcase',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'A collection of my recent architectural & technical work',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.white60),
                  ),
                ],
              ),
            ),
          ),

          // Projects Grid
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              24,
              8,
              24,
              100,
            ), // Extra bottom padding for nav bar
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 0.95,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final project = projects[index];
                return ProjectCard(
                  title: project.title,
                  description: project.description,
                  imageUrl: project.imageAsset,
                  technologies: project.technologies,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProjectDetailScreen(project: project),
                      ),
                    );
                  },
                );
              }, childCount: projects.length),
            ),
          ),
        ],
      ),
    );
  }
}
