# Güncel proje durumu

Son güncelleme: 2026-11-08

## Mevcut durum

- 25 mevcut taslak ürün/teknik dokümanı `docs/` altında korunuyor.
- Genel klasör düzeni, çalışma kuralları, prompt ve karar kayıt şablonları oluşturuldu.
- Flutter mobil arayüz demosu `apps/mobile/` altında kodlandı: beş sekme, örnek fal akışı ve sosyal etkileşim. Backend, gerçek AI/ödeme/kimlik servisleri ve migration henüz yok.
- Nihai uygulama adı onaylanmadı; Nexora çalışma alanı adıdır.
- Kullanıcı önce tüm ürünün ekranlarını ve kullanıcı akışlarını tasarlamayı seçti: [ADR-0001](decisions/ADR-0001-once-urun-tasarimi.md).
- [İlerleme haritası](PROGRESS_MAP.md) ve 68 ekranlık envanter mevcut. Kullanıcı navigasyonu onayladı ve kodlamaya geçilmesini istedi: [ADR-0002](decisions/ADR-0002-navigasyon-ve-arayuz.md). İlk çalışan UI dilimi hazır; tüm ekranlar ve MVP tamamlanmış değil.

## Teknik yönelim ve karar durumu

| Alan | Belgelerdeki yönelim | Durum |
|---|---|---|
| Mobil | Flutter / Dart | Flutter projesi kuruldu; SDK bileşenleriyle ilk UI dilimi hazır |
| Mobil yardımcıları | Riverpod, GoRouter, Dio | Öneri |
| Backend | Python / FastAPI, modüler monolit | Öneri |
| Veri | PostgreSQL, SQLAlchemy, Alembic | Öneri |
| Arka plan | Redis / Celery | Öneri |
| Depolama | S3 uyumlu servis | Sağlayıcı açık |
| AI, kimlik, ödeme, hosting | Çeşitli taslaklar | Seçim açık |

## Netleştirilecek konular

1. MVP sınırı: genel vizyon ilk aşamaya temel sosyal ağı da dahil ediyor; ayrıntılı yol haritası sosyal genişlemeyi sonraya bırakıyor.
2. İlk fal türleri ve ücretsiz kullanım/ücretlendirme modeli.
3. Backend ve altyapı önerilerinin hangilerinin onaylanacağı.
4. Yaş uygunluğu, eşleşme ve mesajlaşma erişim kuralları.
5. Marka, tasarım ve ilk yayın kapsamı.

Genel mimaride TBD görünen bazı tercihler ayrıntılı belgelerde öneri olarak yer alıyor. Önerilerin bulunması onaylandıkları anlamına gelmez.

## Son çalışma ve sonraki adım

Son çalışma: [Sıvı cam tasarımı](sessions/2026-11-08-004-sivi-cam.md). Repo: [buralke/nexora](https://github.com/buralke/nexora). Çalışma başında ve push öncesinde [repo kontrolü](REPOSITORY.md) uygulanır.

İlk arayüz dilimi sıvı cam yönünde yenilendi: [ADR-0003](decisions/ADR-0003-sivi-cam.md). Ortak cam paneller, yüzen gezinme ve lacivert/lila/sis yeşili paleti uygulandı. Sıradaki adım: Çalışan ekranları kullanıcıyla incelemek; ardından onboarding/giriş, profil düzenleme ve fal geçmişi görünümlerini kodlamak. Gerçek servisler ve MVP kapsamı açık. `docs/UI_UX_GUIDELINES.md` sonundaki kullanıcıya ait ek `2` korunuyor ve commit dışında.
