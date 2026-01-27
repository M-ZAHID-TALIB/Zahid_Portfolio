// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AppBar(
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              letterSpacing: -0.5,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xFF0F172A).withOpacity(0.7),
          automaticallyImplyLeading: showBackButton,
          actions: actions,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(color: Colors.white.withOpacity(0.05), height: 1),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
