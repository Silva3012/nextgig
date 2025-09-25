import 'package:flutter/material.dart';
import 'package:nextgig/core/theme/app_theme.dart';
import 'package:nextgig/presentation/features/profile/profile_page.dart';

class RepWalletPage extends StatelessWidget {
  const RepWalletPage({super.key});

  void _openProfile(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reputation Wallet'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () => _openProfile(context),
            tooltip: 'Profile',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Verified Identity & Credentials',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            const Text(
              'Coming soon: Upload your ID and CV to build verifiable reputation.',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.badge_outlined),
                    label: const Text('Upload ID'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.description_outlined),
                    label: const Text('Upload CV'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
