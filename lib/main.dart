
import 'package:flutter/material.dart';

void main() {
  runApp(const StoriqApp());
}

class StoriqApp extends StatelessWidget {
  const StoriqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'STORIQ',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F7FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
        ),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  static const blue = Color(0xFF2563EB);
  static const dark = Color(0xFF14213D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: const [
            DashboardScreen(),
            FilesScreen(),
            AnalysisScreen(),
            SettingsScreen(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE5EDFF),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.folder_rounded),
            label: 'Files',
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics_rounded),
            label: 'Analysis',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const blue = Color(0xFF2563EB);
  static const dark = Color(0xFF14213D);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.folder_special_rounded,
                color: Colors.white,
                size: 27,
              ),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STORIQ',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: dark,
                    letterSpacing: 1.5,
                  ),
                ),
                Text(
                  'Storage Manager',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.notifications_none, color: dark),
            ),
          ],
        ),
        const SizedBox(height: 28),
        const Text(
          'Hello there 👋',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: dark,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Manage your phone storage easily.',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(23),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2563EB), Color(0xFF123A9D)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.phone_android, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Internal Storage',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.more_horiz, color: Colors.white),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Storage information',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const SizedBox(height: 8),
              const Text(
                'Not available yet',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const LinearProgressIndicator(
                  value: 0,
                  minHeight: 9,
                  backgroundColor: Colors.white30,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Storage data will appear when connected.',
                style: TextStyle(color: Colors.white70, fontSize: 11),
              ),
            ],
          ),
        ),
        const SizedBox(height: 27),
        const Text(
          'File Categories',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: dark,
          ),
        ),
        const SizedBox(height: 14),
        const Row(
          children: [
            Expanded(
              child: CategoryCard(
                icon: Icons.image_rounded,
                title: 'Images',
                color: Color(0xFFEC4899),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: CategoryCard(
                icon: Icons.video_library_rounded,
                title: 'Videos',
                color: Color(0xFF8B5CF6),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Row(
          children: [
            Expanded(
              child: CategoryCard(
                icon: Icons.description_rounded,
                title: 'Documents',
                color: Color(0xFF0EA5E9),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: CategoryCard(
                icon: Icons.folder_rounded,
                title: 'Other Files',
                color: Color(0xFFF59E0B),
              ),
            ),
          ],
        ),
        const SizedBox(height: 27),
        const Text(
          'Quick Tools',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: dark,
          ),
        ),
        const SizedBox(height: 14),
        const ToolCard(
          icon: Icons.cleaning_services_rounded,
          title: 'Storage Cleaner',
          subtitle: 'Find unnecessary files',
        ),
        const SizedBox(height: 10),
        const ToolCard(
          icon: Icons.search_rounded,
          title: 'Large Files',
          subtitle: 'Find files using more space',
        ),
        const SizedBox(height: 10),
        const ToolCard(
          icon: Icons.copy_rounded,
          title: 'Duplicate Finder',
          subtitle: 'Find duplicate files',
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Explore files',
            style: TextStyle(color: Colors.grey, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

class ToolCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ToolCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF2563EB), size: 27),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 15),
        ],
      ),
    );
  }
}

class FilesScreen extends StatelessWidget {
  const FilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleScreen(
      icon: Icons.folder_open_rounded,
      title: 'My Files',
      subtitle: 'Your files will appear here.',
    );
  }
}

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleScreen(
      icon: Icons.analytics_rounded,
      title: 'Storage Analysis',
      subtitle: 'Storage analysis will be available soon.',
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleScreen(
      icon: Icons.settings_rounded,
      title: 'Settings',
      subtitle: 'Customize your STORIQ experience.',
    );
  }
}

class SimpleScreen extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SimpleScreen({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: const Color(0xFF2563EB),
              size: 65,
            ),
            const SizedBox(height: 18),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 9),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
