import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nextgig/core/theme/app_theme.dart';
import 'package:nextgig/presentation/features/profile/profile_page.dart';
import 'package:file_picker/file_picker.dart';

class RepWalletPage extends StatefulWidget {
  const RepWalletPage({super.key});

  @override
  State<RepWalletPage> createState() => _RepWalletPageState();
}

class _RepWalletPageState extends State<RepWalletPage> {
  void _openProfile(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ProfilePage()),
    );
  }

  File? selectedFile;

  void _onTapUpload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    } else {
      setState(() {
        selectedFile = null;
      });
    }
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
                    onPressed: () {
                      _onTapUpload();
                    },
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
            const SizedBox(height: 20),
            selectedFile != null
                ? Column(
                    children: [
                      Image.file(selectedFile!, width: 150, height: 150),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.badge_outlined),
                        label: const Text('Submit'),
                      ),
                    ],
                  )
                : const Text('No image selected'),
          ],
        ),
      ),
    );
  }
}
