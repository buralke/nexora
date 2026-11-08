import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../shared/widgets.dart';
import '../../shared/glass.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onSelectTab});
  final ValueChanged<int> onSelectTab;

  @override
  Widget build(BuildContext context) => PageBody(
    children: [
      const Padding(
        padding: EdgeInsets.only(top: 8, bottom: 14),
        child: Row(
          children: [
            Icon(Icons.wb_twilight_outlined, size: 18, color: Palette.mint),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'KENDİNE DÖNDÜĞÜN YER',
                style: TextStyle(
                  color: Palette.mint,
                  fontSize: 10,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
      Text(
        'Bir fincan merak,\nbir dünya keşif.',
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.w600,
          height: 1.12,
          letterSpacing: -1.2,
        ),
      ),
      const SizedBox(height: 12),
      const Text(
        'Küçük bir mola. Yeni bir bakış.\nBelki de güzel bir başlangıç.',
        style: TextStyle(color: Palette.muted, height: 1.6, fontSize: 14),
      ),
      const SizedBox(height: 26),
      GlassPanel(
        radius: 32,
        tint: const Color(0xA82B3350),
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Palette.mint,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'BİR FİNCANLIK KEŞİF',
                    style: TextStyle(
                      color: Palette.mint,
                      fontSize: 10,
                      letterSpacing: 1.4,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.north_east, size: 18, color: Palette.muted),
              ],
            ),
            const Center(child: OrbitalSeal()),
            Text(
              'Hikâyen nerede\nbaşlasın?',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                height: 1.1,
                letterSpacing: -.8,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Fincanındaki sembollere farklı bir gözle bak.',
              style: TextStyle(color: Palette.muted, height: 1.6),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => onSelectTab(1),
                icon: const Icon(Icons.auto_awesome, size: 18),
                label: const Text('Fal deneyimlerini keşfet'),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 22),
      const SectionTitle(
        'Merakın seni nereye götürsün?',
        subtitle: 'Aynı gökyüzünün altında, farklı hikâyeler.',
      ),
      SurfaceCard(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const _GlassIcon(Icons.explore_outlined, Palette.mint),
          title: const Text('Birlikte keşfet'),
          subtitle: const Text('Topluluklar ve yeni bağlar'),
          trailing: const Icon(
            Icons.north_east,
            size: 18,
            color: Palette.muted,
          ),
          onTap: () => onSelectTab(2),
        ),
      ),
      SurfaceCard(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const _GlassIcon(Icons.people_outline, Palette.violet),
          title: const Text('Hikâyelere katıl'),
          subtitle: const Text('Sohbete küçük bir mola ver'),
          trailing: const Icon(
            Icons.north_east,
            size: 18,
            color: Palette.muted,
          ),
          onTap: () => onSelectTab(3),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 12),
        child: Text(
          'Fal yorumları eğlence ve kişisel keşif amaçlıdır.',
          style: TextStyle(color: Palette.muted, fontSize: 12, height: 1.5),
        ),
      ),
    ],
  );
}

class _GlassIcon extends StatelessWidget {
  const _GlassIcon(this.icon, this.color);
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) => Container(
    width: 46,
    height: 46,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: color.withValues(alpha: .1),
      border: Border.all(color: color.withValues(alpha: .2)),
    ),
    child: Icon(icon, color: color, size: 23),
  );
}
