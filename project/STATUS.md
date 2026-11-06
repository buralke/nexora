# Güncel proje durumu

Son güncelleme: 2026-11-06

## Mevcut durum

- 25 mevcut taslak ürün/teknik dokümanı `docs/` altında korunuyor.
- Genel klasör düzeni, çalışma kuralları, prompt ve karar kayıt şablonları oluşturuldu.
- Uygulama kodu, kurulu servis, bağımlılık, migration veya otomatik test altyapısı henüz yok.
- Nihai uygulama adı onaylanmadı; Nexora çalışma alanı adıdır.

## Teknik yönelim ve karar durumu

| Alan | Belgelerdeki yönelim | Durum |
|---|---|---|
| Mobil | Flutter / Dart | Mobil mimari belgesinde belirlendi; proje henüz kurulmadı |
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

Son çalışma: [GitHub bağlantısı ve senkronizasyon düzeni](sessions/2026-11-06-002-github-senkronizasyonu.md). Repo: [buralke/nexora](https://github.com/buralke/nexora). Çalışma başında ve push öncesinde [repo kontrolü](REPOSITORY.md) uygulanır.

Önerilen sonraki adım: MVP kapsamını ve ilk teknik kurulumu birlikte netleştirip görev kaydı açmak. Bu adım henüz başlatılmadı.
