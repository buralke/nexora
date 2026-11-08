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

Son çalışma: [Gelir PDF incelemesi](sessions/2026-11-08-017-gelir-pdf.md). Repo: [buralke/nexora](https://github.com/buralke/nexora). Çalışma başında ve push öncesinde [repo kontrolü](REPOSITORY.md) uygulanır.

İlk arayüz dilimi sıvı cam yönünde yenilendi: [ADR-0003](decisions/ADR-0003-sivi-cam.md). Ortak cam paneller, yüzen gezinme ve lacivert/lila/sis yeşili paleti uygulandı. Sıradaki adım: Çalışan ekranları kullanıcıyla incelemek; ardından onboarding/giriş, profil düzenleme ve fal geçmişi görünümlerini kodlamak. Gerçek servisler ve MVP kapsamı açık. `docs/UI_UX_GUIDELINES.md` içindeki kullanıcıya ait ek `2` korundu. Kullanıcının tüm dosyaları pushlama talebiyle rehberin tamamı sıvı cam notlarıyla birlikte Git teslimine alındı.

## Ürün tartışması

[Fikir havuzunda](IDEA_BACKLOG.md) Faldan sohbete, Küçük ritüeller, Fal arkadaşı ve Kafede check-in ile etkileşim birlikte saklandı. Dört fikrin bağlantıları ve örnek ortak yolculuk yazıldı; uygulama/MVP kararı yok. Kafe alanı, yakınlık, etkileşim izinleri, Premium devam hakkı ve özel geçmiş kuralları [ADR-0004](decisions/ADR-0004-kafe-check-in-kurallari.md) ile kaydedildi. Yeni kullanıcı talimatıyla Premium kurtarma süresi 2 saat oldu; önceki 24 saat kuralı değişti. Sohbet erişimi hemen kilitlenir, iki saatlik kurtarma süresinde okuma/yazma kapalı kalır; üyelik bitişinde sonradan Premium ile erişim açılır. Karşı taraf Premium olsa bile üyeliği biten kullanıcı devam edemez; kendi üyeliğini yenilemelidir. Premium yenilenince sohbet açılır; oyunların kurtarma süresindeki durumu açık. Şikâyete mesaj eklenebilir. 50 metre önerisi henüz onaylanmadı. Harita sağlayıcısı ve sürüm kapsamı açık. [Oturum kaydı](sessions/2026-11-08-012-sohbet-kilidi.md). Teknik sıradaki işler bu tartışmayla onaylanmış veya değiştirilmiş sayılmaz.

IDEA-005–007, kahve falı akışına ücretsiz ve Premium deneyim önerileri olarak eklendi. IDEA-006 için üç ekranlı prototip ve hesap başına günde bir ücretsiz ikinci bakış seçildi. Tarzlar aynı sembolleri tutarlı yorumlar; aylık özet yalnızca kullanıcı notlarına dayanır: [ADR-0005](decisions/ADR-0005-gunluk-ikinci-bakis.md). Günlük sıfırlama ve hak tükenince teklif akışı açık. Yayın kapsamı açık. [Oturum kaydı](sessions/2026-11-08-016-gunluk-ikinci-bakis.md).

## Repoda yön bulma

Yeni gelenler için [repo rehberi](../REPO_GUIDE.md) hazır: amaca göre belge bağlantıları, klasör sorumlulukları ve mobil kod haritası içerir. Önceden yerelde bekleyen kafe kararları ve oturum kayıtları kullanıcının tümünü pushlama talebi kapsamında teslim edilir.

## Gelir modeli referansı

Kullanıcının gelir modeli PDF'si [docs/references](../docs/references/README.md) altında içerik değiştirilmeden saklandı. Fiyat/kota/reklam önerileri bu yerleşimle onaylanmadı; ikinci bakış için ADR-0005 geçerlidir.
