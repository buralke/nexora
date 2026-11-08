import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../shared/widgets.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});
  @override
  Widget build(BuildContext context) => PageBody(
    children: [
      const SectionTitle(
        'Aynı merakta buluşalım.',
        subtitle: 'Yeni hikâyeler, ortak ilgi alanları ve farklı bakışlar.',
      ),
      SurfaceCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.groups_outlined, color: Palette.violet, size: 36),
            const SectionTitle(
              'Topluluklar',
              subtitle: 'Bir fincan kahvenin etrafında başlayan sohbetler.',
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final name in [
                  'Kahve Molası',
                  'Rüya Günlüğü',
                  'Tarot Sohbetleri',
                ])
                  ActionChip(
                    label: Text(name),
                    onPressed: () => openPage(
                      context,
                      name,
                      EmptyPage(
                        icon: Icons.groups_outlined,
                        title: name,
                        message:
                            'Bu örnek toplulukta henüz bir konu yok. Üyelik ve konu oluşturma sonraki arayüz diliminde eklenecek.',
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      SurfaceCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.stars_outlined, color: Palette.gold, size: 36),
            const SectionTitle(
              'Falcılar Ligi',
              subtitle: 'İnsan yorumcuların dünyasını keşfet.',
            ),
            OutlinedButton(
              onPressed: () => openPage(
                context,
                'Falcılar Ligi',
                const EmptyPage(
                  icon: Icons.stars_outlined,
                  title: 'Yorumcularla tanışma alanı',
                  message:
                      'Bu demoda yorumcu veya satış bulunmuyor. Hizmet ve sipariş ekranları sonraki adımlarda hazırlanacak.',
                ),
              ),
              child: const Text('Falcılar Ligi’ne göz at'),
            ),
          ],
        ),
      ),
      SurfaceCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.favorite_outline, color: Palette.violet, size: 36),
            const SectionTitle(
              'Yeni bağlara açık mısın?',
              subtitle:
                  'Eşleşme tamamen senin seçimin. Varsayılan olarak kapalı.',
            ),
            OutlinedButton(
              onPressed: () => openPage(
                context,
                'Eşleşme hakkında',
                const EmptyPage(
                  icon: Icons.favorite_outline,
                  title: 'Katılım senin kontrolünde',
                  message:
                      'Yaş uygunluğu, veri izinleri ve katılım akışı netleştirildikten sonra bu alan açılacak. Bu demoda eşleşme profili oluşturulmaz.',
                ),
              ),
              child: const Text('Nasıl çalışacağını keşfet'),
            ),
          ],
        ),
      ),
    ],
  );
}
