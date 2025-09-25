import 'package:flutter/material.dart';
import 'package:nextgig/core/theme/app_theme.dart';
import 'package:nextgig/presentation/features/discover/discover_page.dart';
import 'package:nextgig/presentation/features/insights/insights_page.dart';
import 'package:nextgig/presentation/features/posting/posting_page.dart';
import 'package:nextgig/presentation/features/wallet/rep_wallet_page.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DiscoverPage(),
    const PostingPage(),
    const InsightsPage(),
    RepWalletPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.primaryGreen.withOpacity(0.15),
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Discover',
          ),
          NavigationDestination(
            icon: Icon(Icons.post_add_outlined),
            selectedIcon: Icon(Icons.post_add),
            label: 'Post',
          ),
          NavigationDestination(
            icon: Icon(Icons.data_array_outlined),
            selectedIcon: Icon(Icons.data_array),
            label: 'Insights',
          ),
          NavigationDestination(
            icon: Icon(Icons.wallet_outlined),
            selectedIcon: Icon(Icons.wallet),
            label: 'Rep Wallet',
          ),
        ],
      ),
    );
  }
}
