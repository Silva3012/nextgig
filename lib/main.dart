import 'package:flutter/material.dart';
import 'package:nextgig/core/theme/app_theme.dart';
import 'package:nextgig/presentation/shell/main_shell.dart';

void main() {
  runApp(const NextGig());
}

class NextGig extends StatelessWidget {
  const NextGig({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NextGig',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const MainShell(),
    );
  }
}
