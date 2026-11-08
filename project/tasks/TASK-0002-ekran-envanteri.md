# TASK-0002 — Tüm ürünün ekran envanteri

- Durum: Devam ediyor
- Tarih: 2026-11-08
- Kaynak prompt: [Devam talebi](../../prompts/development/2026-11-08-001-ilerleme-haritasi.md)
- İlgili gereksinim/karar: [ADR-0001](../decisions/ADR-0001-once-urun-tasarimi.md), [USER_FLOWS §18](../../docs/USER_FLOWS.md#18-tüm-ürün-için-ekran-envanteri--inceleme-taslağı)

## Amaç

Tüm ürünün mevcut akış ve rollerini, tasarımda izlenecek ekran kimliklerine eşlemek.

## Kapsam ve kapsam dışı

Kullanıcı, falcı, topluluk ve operasyon ekranları; erişim, veri, işlem, geçiş, durum ve açık kararlar kapsamda. Görsel ekran üretimi, navigasyon onayı, MVP seçimi ve yeni servis kurulumu kapsam dışında.

## Bağımlılıklar ve açık konular

K1–K8 açık kararları USER_FLOWS §18.3'te. Envanter kullanıcı incelemesi bekliyor. Önceki plandaki UX belgesine ekleme yerine, geçişlerin mevcut kaynağı USER_FLOWS'a hedefli ekleme yapıldı; kullanıcıya ait UX değişikliği korundu.

## Kabul kriterleri

- [x] Mevcut ana akışlar ve roller ekranlarla eşlendi.
- [x] Kimlik, amaç, aktör, veri/işlem, giriş/çıkış ve kaynaklar tanımlandı.
- [x] Ortak/özel durumlar, veri görünürlüğü ve açık kararlar belirtildi.
- [ ] Kullanıcı kapsamı inceledi; düzeltmeler işlendi.

## Doğrulama planı ve sonucu

Kimlik benzersizliği, geçiş referansları, yerel bağlantılar ve whitespace kontrolü uygulanır. Kod değişmediğinden uygulama testi çalıştırılmaz. Kullanıcı incelemesi tamamlanma yerine geçmez.

## Değişen dosyalar ve oturum kaydı

USER_FLOWS, PROGRESS_MAP, STATUS, mevcut prompt, bu görev ve [oturum](../sessions/2026-11-08-002-ekran-envanteri.md).
