# Oturum — Genel klasör yapısı

- Tarih: 2026-11-06
- İlgili prompt: [Kullanıcı talebi](../../prompts/development/2026-11-06-001-klasor-yapilandirmasi.md)

## Yapılanlar

- Kök README ve AGENTS.md ile çalışma alanı ve asistan kuralları tanımlandı.
- `project/` altında proje sınırları, durum, iş akışı ve kayıt şablonları oluşturuldu.
- `prompts/` altında geliştirme, runtime ve deney alanları ayrıldı; bu talebin özgün metni kaydedildi.
- `apps/mobile`, `apps/admin`, `services/backend`, `contracts`, `infrastructure`, `scripts`, `tests`, `assets` ve `archive` alanları README dosyalarıyla oluşturuldu.
- Yerel ortam, secret ve üretilen dosyalar için başlangıç `.gitignore` dosyası eklendi.

## Doğrulama ve sınırlamalar

Dosya yapısı ve 26 yeni Markdown dosyasının yerel bağlantıları kontrol edildi; kırık bağlantı bulunmadı. Mevcut 25 `docs/` dosyasının işlem öncesi ve sonrası SHA-256 özetleri aynı kaldı. Uygulama kodu bulunmadığı için uygulama testi çalıştırılmadı. Prompt kayıt düzeni tanımlandı; otomatik sohbet kaydı kurulmadı.

## Kararlar ve açık kalanlar

Bu çalışma klasör organizasyonudur; yeni teknoloji veya MVP kapsamı onaylanmadı. Belgelerdeki kapsam ve teknoloji durumu farkları `../STATUS.md` içinde görünür kılındı.

## Sonraki adım

MVP kapsamını ve teknik başlangıç kararlarını netleştirerek ilk geliştirme görevini açmak.
