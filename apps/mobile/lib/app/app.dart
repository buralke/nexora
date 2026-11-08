import 'package:flutter/material.dart';
import '../features/home/home_page.dart';
import '../features/fortune/fortune_page.dart';
import '../features/discover/discover_page.dart';
import '../features/social/social_page.dart';
import '../features/profile/profile_page.dart';
import '../shared/widgets.dart';
import 'theme.dart';

class NexoraApp extends StatelessWidget {
  const NexoraApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Nexora · Arayüz demosu',
    debugShowCheckedModeBanner: false,
    theme: buildTheme(),
    home: const AppShell(),
  );
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int selected = 0;
  static const labels = ['Ana Sayfa', 'Fal', 'Keşfet', 'Sosyal', 'Profil'];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.auto_awesome, color: Palette.gold, size: 22),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              selected == 0 ? 'nexora' : labels[selected],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          tooltip: 'Mesajlar',
          icon: const Icon(Icons.chat_bubble_outline),
          onPressed: () => openPage(
            context,
            'Mesajlar',
            const EmptyPage(
              icon: Icons.forum_outlined,
              title: 'Sohbetlerin burada buluşacak',
              message:
                  'Henüz bir konuşman yok. Bu demoda gerçek mesaj gönderilmez.',
            ),
          ),
        ),
        IconButton(
          tooltip: 'Bildirimler',
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () => openPage(
            context,
            'Bildirimler',
            const EmptyPage(
              icon: Icons.notifications_none,
              title: 'Şimdilik her şey sakin',
              message: 'Fal ve etkileşim bildirimlerin burada görünecek.',
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    ),
    body: SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Palette.gold.withValues(alpha: .08),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: const Text(
              'Arayüz demosu · Örnek veriler',
              textAlign: TextAlign.center,
              style: TextStyle(color: Palette.gold, fontSize: 12),
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selected,
              children: [
                HomePage(
                  onSelectTab: (index) => setState(() => selected = index),
                ),
                const FortunePage(),
                const DiscoverPage(),
                const SocialPage(),
                const ProfilePage(),
              ],
            ),
          ),
        ],
      ),
    ),
    bottomNavigationBar: NavigationBar(
      selectedIndex: selected,
      onDestinationSelected: (index) => setState(() => selected = index),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Ana Sayfa',
        ),
        NavigationDestination(
          icon: Icon(Icons.auto_awesome_outlined),
          selectedIcon: Icon(Icons.auto_awesome),
          label: 'Fal',
        ),
        NavigationDestination(
          icon: Icon(Icons.explore_outlined),
          selectedIcon: Icon(Icons.explore),
          label: 'Keşfet',
        ),
        NavigationDestination(
          icon: Icon(Icons.people_outline),
          selectedIcon: Icon(Icons.people),
          label: 'Sosyal',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    ),
  );
}
