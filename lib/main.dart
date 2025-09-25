import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nextgig/core/theme/app_theme.dart';
import 'package:nextgig/presentation/shell/main_shell.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
  } catch (_) {}
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
