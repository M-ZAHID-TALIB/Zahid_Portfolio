// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/gradient_button.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Get In Touch'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let\'s build something legendary.',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Available for freelance and full-time opportunities.',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.white60),
              ),
              const SizedBox(height: 32),

              // Contact Cards Grid
              Row(
                children: [
                  Expanded(
                    child: _buildContactTile(
                      context,
                      Icons.email_rounded,
                      'Email',
                      'mz112078@gmail.com',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildContactTile(
                      context,
                      Icons.phone_rounded,
                      'Phone',
                      '+92 3071228891',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Glass Contact Form
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Colors.white10),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildModernField('Name', Icons.person_outline),
                      const SizedBox(height: 20),
                      _buildModernField('Email', Icons.email_outlined),
                      const SizedBox(height: 20),
                      _buildModernField(
                        'Message',
                        Icons.message_outlined,
                        maxLines: 4,
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: GradientButton(
                          text: 'Send Message',
                          icon: Icons.send_rounded,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Message Sent Successfully!'),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100), // Spacing for nav bar
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactTile(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        ),
      ),
      child: Column(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.white54),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildModernField(String label, IconData icon, {int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20),
        filled: true,
        fillColor: Colors.black12,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter $label';
        return null;
      },
    );
  }
}
