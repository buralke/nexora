import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../shared/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onSelectTab});
  final ValueChanged<int> onSelectTab;

  @override
  Widget build(BuildContext context) => PageBody(
    children: [
      const SectionTitle(
        'Bir fincan merak,\nbir dünya keşif.',
        subtitle:
            'Kendine küçük bir mola ver. Sembolleri keşfet, hikâyeni paylaş.',
      ),
      Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF443257), Palette.surface],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Palette.gold.withValues(alpha: .3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.coffee_outlined, size: 64, color: Palette.gold),
            const SizedBox(height: 24),
            const Text(
              'KENDİNE BİR AN AYIR',
              style: TextStyle(
                color: Palette.gold,
                fontSize: 11,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Bugünün hikâyesi\nfincanında saklı.',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(height: 1.15),
            ),
            const SizedBox(height: 12),
            const Text(
              'Kahve falıyla eğlenceli bir keşfe çık.',
              style: TextStyle(color: Palette.muted),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => onSelectTab(1),
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Fal deneyimlerini keşfet'),
            ),
          ],
        ),
      ),
      const SizedBox(height: 24),
      const SectionTitle(
        'Merakının peşinden git',
        subtitle: 'Her keşif yeni bir sohbetin başlangıcı.',
      ),
      SurfaceCard(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.explore_outlined, color: Palette.violet),
          title: const Text('Birlikte keşfet'),
          subtitle: const Text('Topluluklar, yorumcular ve yeni bağlar'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => onSelectTab(2),
        ),
      ),
      SurfaceCard(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.people_outline, color: Palette.gold),
          title: const Text('Hikâyelere katıl'),
          subtitle: const Text('Sosyal akışta bir mola ver'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => onSelectTab(3),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          'Fal yorumları eğlence ve kişisel keşif amaçlıdır.',
          style: TextStyle(color: Palette.muted, fontSize: 12),
        ),
      ),
    ],
  );
}
