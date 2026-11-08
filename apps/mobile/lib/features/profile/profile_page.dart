import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../shared/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => PageBody(
    children: [
      const SurfaceCard(
        child: Column(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: Palette.violet,
              child: Icon(
                Icons.person_outline,
                size: 40,
                color: Palette.background,
              ),
            ),
            SizedBox(height: 16),
            Text('Senin keşif alanın', style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text(
              'Demo profili · Gerçek hesap oluşturulmadı',
              textAlign: TextAlign.center,
              style: TextStyle(color: Palette.muted),
            ),
          ],
        ),
      ),
      for (final item in const [
        (
          Icons.history,
          'Fal geçmişim',
          'Henüz kaydedilmiş fal yok.',
          'Fal sonuçları backend bağlantısı eklendiğinde burada listelenecek.',
        ),
        (
          Icons.bookmark_border,
          'Kaydedilenler',
          'Sana ilham verenleri biriktir.',
          'Kaydettiğin içerikler burada görünecek. Demo içeriği kalıcı olarak saklanmaz.',
        ),
        (
          Icons.shield_outlined,
          'Gizlilik',
          'Kontrol sende.',
          'Özel falların varsayılan olarak gizli; eşleşme kapalı. Gerçek tercih yönetimi henüz bağlı değil.',
        ),
        (
          Icons.settings_outlined,
          'Ayarlar',
          'Kendine göre bir deneyim.',
          'Hesap, bildirim ve güvenlik ayarları sonraki arayüz diliminde hazırlanacak.',
        ),
      ])
        SurfaceCard(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(item.$1, color: Palette.violet),
            title: Text(item.$2),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => openPage(
              context,
              item.$2,
              EmptyPage(icon: item.$1, title: item.$3, message: item.$4),
            ),
          ),
        ),
    ],
  );
}
