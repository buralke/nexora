# ADR-0003 — Sıvı cam ağırlıklı görsel yön

- Tarih: 2026-11-08
- Tür: Ürün
- Durum: Onaylandı (sıvı cam yönü); renk değerleri uygulanan tasarım yorumu
- İlgili görev/prompt: [TASK-0004](../tasks/TASK-0004-sivi-cam.md), [kullanıcı talebi](../../prompts/development/2026-11-08-002-sivi-cam.md)
- Onaylayan ve dayanak talimat: Kullanıcı sıvı camın ağırlıklı kullanılmasını ve renk uyumunun geliştirilmesini istedi.

## Problem ve bağlam

İlk demo koyu mor dolu kartlar ve altın vurgu kullanıyordu. Kullanıcı daha belirgin cam malzeme ve bütünlüklü renk ilişkisi istedi.

## Seçenekler ve gerekçeleri

Yalnızca opak kartların rengini değiştirmek yerine gerçek arka plan bulanıklığı, geçirgen katmanlar ve kontrollü kenar ışığı uygulandı. Flutter SDK yeterli olduğundan ek cam/shader paketi gerekmedi.

## Seçilen yaklaşım

Lacivert taban, inci lila ana vurgu, sis yeşili ikincil vurgu ve küçük şampanya detayları. GlassPanel içinde ClipRRect + BackdropFilter ve okunabilirliği destekleyen renkli yüzey. Ortak kartlar ve yüzen alt gezinme cam panel kullanır. Kodla çizilmiş statik arka plan ışımaları ve ana sayfada dekoratif yörünge mührü.

## Sonuçlar, maliyetler ve sınırlamalar

Gerçek blur GPU maliyeti getirir; alanı panel sınırında tutulur. Statik arka plan ve dekoratif çizimlerde yeniden boyama sınırlanır. Tam fiziksel kırılma veya platforma özgü Apple Liquid Glass API'si kullanılmaz. Kullanıcının talebi görsel yönü onaylar; nihai marka renkleri ve gerçek cihaz performansı henüz onaylanmış değildir.

## Güncellenecek belgeler ve yerine geçtiği karar

UX rehberine güncel uygulama paleti ve cam kuralları eklenir. STATUS ve oturum güncellenir. ADR-0002 gezinmesi korunur; önceki mor/altın uygulama paleti bu prototipte yenilenir.
