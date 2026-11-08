# ADR-0002 — Ana gezinme ve Flutter arayüz demosuna geçiş

- Tarih: 2026-11-08
- Tür: Ürün / Mimari
- Durum: Onaylandı (gezinme ve kodlamaya geçiş); uygulama ayrıntıları aşağıda
- İlgili görev/prompt: [TASK-0003](../tasks/TASK-0003-mobil-arayuz.md), [kullanıcı devamı](../../prompts/development/2026-11-08-001-ilerleme-haritasi.md)
- Onaylayan ve dayanak talimat: Kullanıcı, önerilen gezinme için “uygundur arayüzleri kodlamaya başlayabiliriz”.

## Problem ve bağlam

68 ekranlık envanter taslağı çıkarıldı. Önce tüm tasarım belgelerini bitirme sırasına karşı kullanıcı artık arayüzlerin kodlanarak ilerlemesini istedi.

## Seçenekler ve gerekçeleri

Fal odaklı ana sayfa ve beş sekme önerildi; doğrudan sosyal akışla açılma alternatifi sunuldu. Kullanıcı öneriyi uygun buldu.

## Seçilen yaklaşım

Ana Sayfa, Fal, Keşfet, Sosyal, Profil alt gezinmesi; mesaj ve bildirim üst alanda; eşleşme Keşfet içinde. Eşleşme girişi otomatik katılım sağlamaz. Kodlanmış arayüz üzerinden tasarım geliştirmesi başlar. Envanterdeki açık iş kuralları topluca onaylanmış sayılmaz.

İlk dilim, belgelerde belirlenmiş Flutter/Dart ile SDK bileşenlerinden oluşturulur. Yerel ekran durumu için StatefulWidget ve geçişler için Navigator kullanımı bu demoya ait geri alınabilir uygulama tercihidir; kalıcı state/routing standardı seçimi değildir. Web hedefi yerel inceleme kolaylığı sağlar. Ücretli servis veya ek uygulama bağımlılığı kurulmaz.

## Sonuçlar, maliyetler ve sınırlamalar

Kullanıcı örnek verilerle gezinmeyi değerlendirebilir. Hesap/AI/ödeme/mesaj işlevleri bağlı değildir. Tasarım paleti başlangıç önerisidir, marka kararı değildir. Android/iOS mağaza kimlikleri ve yayın ayarları kesinleşmedi.

## Güncellenecek belgeler ve yerine geçtiği karar

USER_FLOWS, PROGRESS_MAP, STATUS ve mobil README güncellenir. ADR-0001'in tasarım odağı sürer; tüm ekran tasarımı bitmeden kodlamama sırası kullanıcının yeni talimatıyla değiştirilir.
