# TASK-0004 — Sıvı cam ve renk uyumu

- Durum: Tamamlandı
- Tarih: 2026-11-08
- Kaynak prompt: [Kullanıcı talebi](../../prompts/development/2026-11-08-002-sivi-cam.md)
- İlgili gereksinim/karar: [ADR-0003](../decisions/ADR-0003-sivi-cam.md), docs/UI_UX_GUIDELINES.md

## Amaç

Mevcut mobil demoyu sıvı cam ağırlıklı, tutarlı bir görsel sisteme taşımak.

## Kapsam ve kapsam dışı

Ortak tema, cam kartlar, aurora zemin, yüzen gezinme, form/buton/chip stilleri ve ana sayfa. Yeni ürün modülü veya backend yok.

## Bağımlılıklar ve açık konular

Yalnızca Flutter SDK. Gerçek cihaz GPU performansı ve nihai marka renkleri açık.

## Kabul kriterleri

- [x] Gerçek kırpılmış backdrop blur ve ortak cam bileşeni.
- [x] Beş sekmede uyumlu renk, yüzey ve gezinme.
- [x] Ana sayfada özel görsel hiyerarşi ve yerel çizim.
- [x] Analiz, mevcut akış testleri, küçük ekran ve görsel inceleme tamamlandı.

## Doğrulama planı ve sonucu

Flutter analyze, mevcut üç widget testi, web derleme ve beş ana ekran render incelemesi. Statik analiz hatasız, üç kalıcı test başarılı, web derleme başarılı. Beş sekme render ile incelendi. Gerçek cihaz performansı ölçülmedi.

## Değişen dosyalar ve oturum kaydı

apps/mobile/lib/app, shared, features/home; UX rehberi, mobil README ve proje kayıtları. [Oturum](../sessions/2026-11-08-004-sivi-cam.md).

## Teslim notu

UX rehberi yerelde güncellendi ancak kısmi staging otomatik incelemede reddedildiğinden commit dışında. Kod ve diğer kayıtlar teslim edilir; UX belgesinin Git teslimi açık.
