# Adım adım ilerleme haritası

- Güncelleme: 2026-11-08
- Güncel adım: 1 — Ürün ve ekran envanteri
- Onaylanan yön: Önce tüm ürünün ekranlarını ve kullanıcı akışlarını tasarlamak.
- Karar: [ADR-0001](decisions/ADR-0001-once-urun-tasarimi.md)
- Takip: [TASK-0001](tasks/TASK-0001-ilerleme-haritasi.md)

Bu dosya birlikte ilerleme sıramızı ve aşama çıkışlarını izler. Gereksinimler [PRD](../docs/PRD.md), akışlar [USER_FLOWS](../docs/USER_FLOWS.md), görsel kurallar [UI_UX_GUIDELINES](../docs/UI_UX_GUIDELINES.md) içinde tutulur. Ayrıntılı teknik geliştirme taslağı [DEVELOPMENT_ROADMAP](../docs/DEVELOPMENT_ROADMAP.md) referanstır; oradaki sprint süreleri ve teknoloji önerileri bu planla onaylanmış olmaz.

## Birlikte çalışma biçimi

Her adımda önce somut bir taslak hazırlanır, kullanıcı geri bildirimi alınır ve sonuç ilgili belgeye işlenir. Onaylanan kapsam veya mimari seçimler karar kaydına bağlanır. Açık tercihler açık olarak işaretlenir. Tamamlanan işler görev ve oturum kaydında doğrulanır; ilgili değişiklikler GitHub güncellik kontrolünden sonra commit ve push edilir.

## Sıralı adımlar

| Adım | Yapılacak iş | Somut çıktı ve bitiş koşulu | Durum |
|---|---|---|---|
| 1 | Tüm ürünü roller, modüller ve ekranlar açısından haritalamak | Her ekranın amacı, aktörü, giriş/çıkış noktası ve kaynak gereksinimi belli; eksikler ve açık sorular listelenmiş | Sıradaki |
| 2 | Bilgi mimarisi ve ana navigasyonu belirlemek | Ana sayfa, sekmeler, profil, bildirim ve rol bazlı yönetim girişleri kullanıcıyla netleşmiş; her ekran erişilebilir | Bekliyor |
| 3 | Uçtan uca kullanıcı akışlarını detaylandırmak | Başarılı, iptal, geri dönüş, izin reddi, boş, yükleniyor ve hata durumları ilgili akışlara işlenmiş | Bekliyor |
| 4 | Tüm ekranların düşük detaylı taslaklarını çizmek | Adım 1 envanterindeki her ekran ve kritik durum için yerleşim taslağı var; akışlarla tutarlı | Bekliyor |
| 5 | Görsel dil ve ortak bileşenleri netleştirmek | Renk, tipografi, boşluk, kart, form, buton, durum ve erişilebilirlik kuralları örnek ekranlar üzerinde değerlendirilmiş | Bekliyor |
| 6 | Ayrıntılı ekran tasarımları ve gezilebilir prototip hazırlamak | Kullanıcı, falcı ve operasyon akışları örnek verilerle gezilebiliyor; ekran envanteri kapsanıyor | Bekliyor |
| 7 | Tasarımı senaryolarla gözden geçirmek | Kritik akışlar denenmiş; sorunlar önceliklendirilmiş ve geliştirmeyi engelleyen tasarım soruları çözülmüş | Bekliyor |
| 8 | İlk geliştirilecek sürümün sınırını belirlemek | Tasarlanan ekranlar ilk sürüm/sonraki sürüm olarak etiketlenmiş; MVP kararı ve ilgili belgeler tutarlı | Bekliyor |
| 9 | Teknik kararları ve uygulama görevlerini hazırlamak | Mobil/backend, veri, kimlik, AI ve gerekli servis seçimleri gerekçeli; ilk akışın sözleşmesi ve kabul kriterleri hazır | Bekliyor |
| 10 | Çalışan ilk akışı uçtan uca geliştirmek | Seçilen sürüme ait gerçek bir kullanıcı akışı mobil, backend ve veri katmanında çalışıyor; hata ve yetki kontrolleri doğrulanmış | Bekliyor |
| 11 | İlk sürüm kapsamını tamamlayıp kapalı betaya hazırlamak | Seçilen kapsamın kabul kriterleri, güvenlik, gizlilik, maliyet ve operasyon kontrolleri tamam; beta bulguları kayıtlı | Bekliyor |
| 12 | Beta verisine göre yayın ve genişleme kararı almak | Yayın ölçütleri değerlendirilmiş; kalan modüller kullanıcı değeri ve bağımlılıklarına göre sıralanmış | Bekliyor |

Adımlar bağımlılık sırasını gösterir. Tasarım gözden geçirmelerinde önceki adımlara dönülebilir. Çalışma kapasitesi ve kapsam belli olmadan tarih veya sprint süresi taahhüt edilmez.

## Tasarım kapsamı kontrolü

Aşağıdaki alanlar mevcut belgelerden alınan tasarım inceleme başlıklarıdır. Bunların tümünü tasarlamak, tümünü ilk sürümde geliştirme kararı değildir.

| Alan | İncelenecek ekran ve akış aileleri | Ana kaynak |
|---|---|---|
| Hesap ve profil | Karşılama, kayıt/giriş, doğrulama, parola kurtarma, profil, ayarlar, izinler, hesap silme | USER_FLOWS §3–4, §14 |
| Ana deneyim | Ana sayfa, modüllere erişim, arama/keşif gereksinimi ve rol geçişleri | UI_UX_GUIDELINES §6–7 |
| AI Fal Merkezi | Tür seçimi, girdi, yükleme, işlem durumu, sonuç, geçmiş, silme ve kontrollü paylaşım | USER_FLOWS §5; PRD §6.2–6.3 |
| Kullanım ve satın alma | Kullanım hakkı, limit, paketler, ödeme sonucu ve işlem geçmişi; ticari model açık | DEVELOPMENT_ROADMAP §12, §17 |
| Sosyal akış | Akış, gönderi oluşturma/detay/düzenleme, yorum, takip, kaydetme, engelleme ve şikâyet | USER_FLOWS §8, §13 |
| Topluluklar | Keşif, üyelik, konu/yanıt, oluşturma, kurallar ve topluluk yönetimi | USER_FLOWS §10; USER_ROLES §3.3–3.4 |
| Falcılar Ligi — müşteri | Liste/filtre, falcı/hizmet detayı, sipariş, ödeme, takip, teslim, değerlendirme, iptal/itiraz | USER_FLOWS §6 |
| Falcılar Ligi — falcı | Başvuru, durum takibi, hizmet yönetimi, sipariş kabul/teslim, kazanç ve değerlendirmeler | USER_FLOWS §7 |
| Eşleşme | Bilgilendirme, uygunluk, açık katılım, profil/tercihler, öneriler, eşleşme ve kapatma | USER_FLOWS §9 |
| Mesaj ve bildirim | Konuşma listesi, sohbet, gönderim/bağlantı durumları, bildirim merkezi ve tercihler | USER_FLOWS §11–12 |
| Operasyon ve destek | Şikâyet inceleme, yaptırım, başvuru onayı, destek ve yetkiye bağlı yönetim ekranları | USER_FLOWS §13; USER_ROLES §3.5–3.7 |

Kaynakların tamamı `docs/` altındadır. Ayrıntılı ekran envanteri ilk adımda mevcut UX belgesine hedefli olarak eklenecek; ayrı bir rakip gereksinim listesi oluşturulmayacaktır.

## Her ekran için kayıt alanları

Ekran kimliği ve adı; amacı; aktör/erişim koşulu; kaynak gereksinim; gösterilen veri ve görünürlüğü; ana/ikincil işlemler; önceki/sonraki ekran; boş/yükleniyor/hata/başarı durumları; açık ürün kararları; tasarım inceleme durumu. İlk sürüm etiketi 8. adımda kesinleşir.

## Açık kararlar

- Ana navigasyon, ilk açılış deneyimi ve misafir erişimi.
- Fal türleri, kullanım limitleri, gelir modeli ve satın alma deneyimi.
- Marka ve görsel dil; tasarım/prototip aracı ve çıktı biçimi.
- Yaş uygunluğu, mesaj başlatma koşulları, görünürlük ve eşleşme izinleri.
- Falcı doğrulama, teslim, iptal/itiraz ve kazanç iş kuralları.
- İlk yayın dili/platformu, MVP sınırı, çalışma kapasitesi ve bütçe.
- Teknoloji ve sağlayıcı seçimleri; ihtiyaç doğrulanmadan ücretli servis kurulmaz.

## İlk ortak çalışma

1. Mevcut akışlar ve roller üzerinden ekran envanteri taslağını çıkarmak.
2. Eksik ekranları ve erişim koşullarını birlikte incelemek.
3. Ana sayfa ile navigasyon için seçenekler hazırlamak; seçimden sonra akışları detaylandırmak.

Henüz ekran tasarımı veya prototip üretilmedi. Bu oturumun çıktısı ilerleme planı ve tasarımla başlama kararıdır.
