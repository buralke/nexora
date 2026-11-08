# Mobil uygulama

Flutter arayüz demosu. Beş sekme: Ana Sayfa, Fal, Keşfet, Sosyal ve Profil. Mesaj/bildirim girişleri üst çubuktadır. Tasarım başlangıcı koyu mor/altın paletidir; nihai marka değildir.

## Çalıştırma

```powershell
cd apps/mobile
flutter pub get
flutter run -d chrome
```

Android için bağlı cihaz/emülatörle `flutter run` kullanılabilir. iOS derleme macOS ve Xcode gerektirir. Web hedefi yalnızca aynı Flutter arayüzünü kolay incelemek içindir; ayrı web ürünü kararı değildir. Platform kimlikleri geliştirme varsayılanlarıdır; mağaza yayınına hazır değildir.

## Bu dilimde çalışanlar

- Ana gezinme; sekme değişiminde sosyal taslağın korunması.
- Fal türü seçimi, örnek kahve girdisi, rüya için metin doğrulaması, kısa bekleme ve sabit örnek sonuç; geri dönüş.
- Sosyal gönderi doğrulama, demo akışına ekleme ve beğeni açma/kapatma.
- Keşif kartları; topluluk/pazaryeri/eşleşme bilgilendirme görünümleri.
- Profil, geçmiş, gizlilik, ayarlar, mesaj ve bildirim girişleri için boş/bilgilendirme durumları.

Backend, kimlik doğrulama, gerçek AI, dosya yükleme, kalıcı kayıt, ödeme, gerçek mesajlaşma ve eşleşme yoktur. Tüm içerik sentetiktir. Demo metinleri canlı ürün öncesinde kaldırılacak, gerçek durumlarla değiştirilecektir.

## Yapı ve kontrol

`lib/app/` tema ve gezinme, `lib/features/` kullanılan özellikler, `lib/shared/` ortak bileşenler. Yalnızca Flutter SDK kullanılır; Riverpod/GoRouter/Dio seçimleri açık. Şimdiki yerel UI durumu StatefulWidget ve Navigator ile yönetilir.

```powershell
flutter analyze
flutter test
flutter build web
```

Testler uygulamanın `test/` klasöründedir. Ayrıntılı sonuçlar proje oturum kaydında tutulur.
