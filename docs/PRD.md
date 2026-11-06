# PRD.md
# Product Requirements Document
# Ürün Gereksinimleri Dokümanı

**Proje:** Fal ve Sosyal Etkileşim Platformu  
**Doküman:** PRD.md  
**Sürüm:** 1.0  
**Durum:** İlk Taslak  
**Uygulama Adı:** TBD  
**Platform:** Mobil uygulama (Flutter planlanıyor)

---

## 1. Ürün Tanımı

Geliştirilecek ürün; geleneksel fal deneyimini yapay zekâ, sosyal etkileşim, arkadaşlık ve profesyonel fal hizmetleriyle birleştiren çok modüllü bir dijital platformdur.

Kullanıcılar platform üzerinden:
- Farklı türlerde fal baktırabilir.
- Yapay zekâ tarafından oluşturulan yorumları inceleyebilir.
- Profesyonel falcılardan hizmet alabilir.
- Kendi fal sonuçlarını paylaşabilir.
- Diğer kullanıcılarla etkileşime girebilir.
- Fal ve ilgi alanları üzerinden yeni insanlarla tanışabilir.
- Topluluklar oluşturabilir ve tartışmalara katılabilir.

Platformun temel yaklaşımı, fal deneyimini tek seferlik bir hizmet olmaktan çıkarıp sürekli sosyal etkileşim oluşturabilen bir ekosisteme dönüştürmektir.

## 2. Ürün Vizyonu

İnsanların merak, eğlence ve gelecek hakkında konuşma isteğini bir sosyal deneyime dönüştürmek.

Platform yalnızca fal yorumlayan bir uygulama olmayacaktır. Fal, kullanıcıların platforma giriş yapmasını sağlayan temel deneyimlerden biri olacak; sosyal ağ, topluluklar ve tanışma özellikleri ise kullanıcıların platformda daha uzun süre etkileşim kurmasını sağlayacaktır.

## 3. Problem Tanımı

Mevcut fal uygulamalarında çoğunlukla aşağıdaki sorunlar görülür:

1. Fal deneyimi genellikle tek yönlüdür.
2. Kullanıcılar aldıkları yorumları sosyal olarak değerlendirebilecekleri alanlara sahip değildir.
3. İnsan falcılarla yapay zekâ destekli yorumlama çoğu zaman birbirinden kopuktur.
4. Kullanıcıların ortak ilgi alanları üzerinden tanışabileceği bir yapı bulunmayabilir.
5. Fal yorumları, tartışmalar ve deneyimler için sürdürülebilir topluluk ortamı sınırlıdır.
6. Profesyonel falcıların hizmet sunabileceği ve gelir elde edebileceği merkezi bir pazar yeri ihtiyacı vardır.

## 4. Hedef Kullanıcılar

### 4.1. Fal deneyimi arayan kullanıcılar

- Farklı fal türlerini deneyimlemek isteyenler.
- Hızlı ve erişilebilir AI yorumları arayanlar.
- Fal geçmişini saklamak isteyenler.

### 4.2. Sosyal etkileşim arayan kullanıcılar

- Paylaşım yapmak isteyenler.
- Benzer ilgi alanlarına sahip insanlarla tanışmak isteyenler.
- Topluluklara katılmak isteyenler.

### 4.3. Tanışma ve eşleşme arayan kullanıcılar

- Ortak ilgi alanları üzerinden insanlarla tanışmak isteyenler.
- Fal sonuçlarından doğan temalar üzerinden sohbet etmek isteyenler.
- İsteğe bağlı eşleşme sistemini kullanmak isteyenler.

### 4.4. Profesyonel falcılar

- Dijital ortamda hizmet sunmak isteyenler.
- Yeni müşterilere ulaşmak isteyenler.
- Hizmetlerini fiyatlandırmak ve gelir elde etmek isteyenler.

### 4.5. Topluluk yöneticileri

- Belirli konular etrafında topluluk oluşturmak isteyenler.
- Tartışmaları yönetmek isteyenler.
- Kullanıcı etkileşimini artırmak isteyenler.

## 5. Ürün Kapsamı

Ürün aşağıdaki ana modüllerden oluşacaktır:

| Modül | Açıklama | Öncelik |
|---|---|---|
| Hesap ve profil | Kayıt, giriş, profil ve ayarlar | P0 |
| AI Fal Merkezi | Yapay zekâ destekli fal deneyimi | P0 |
| Fal geçmişi | Önceki yorumların yönetimi | P0 |
| Falcılar Ligi | Profesyonel falcı pazaryeri | P1 |
| Sosyal akış | Gönderi ve etkileşim sistemi | P1 |
| Topluluklar | Forum ve tartışma sistemi | P1 |
| Mesajlaşma | Kullanıcılar arası iletişim | P1 |
| Bildirimler | Etkinlik ve işlem bildirimleri | P1 |
| Eşleşme | İsteğe bağlı tanışma sistemi | P2 |
| Moderasyon | Güvenlik ve içerik denetimi | P0 |
| Yönetim paneli | Platform operasyonları | P0 |

**Öncelik açıklamaları:**

- `P0`: İlk çalışan ürün için zorunlu.
- `P1`: İlk ürünün ardından veya ilk sürümle birlikte geliştirilmesi planlanan önemli özellik.
- `P2`: Temel ürün doğrulandıktan sonra geliştirilecek özellik.
- `P3`: İleri aşama veya opsiyonel özellik.

Bu öncelikler ilk ürün planıdır; geliştirme maliyeti ve kullanıcı testleri sonucunda değişebilir.

## 6. Fonksiyonel Gereksinimler

### 6.1. Hesap ve profil yönetimi

**FR-001:** Sistem kullanıcıların hesap oluşturmasına izin vermelidir.

**FR-002:** Kullanıcılar desteklenen kimlik doğrulama yöntemleriyle giriş yapabilmelidir.

**FR-003:** Kullanıcılar profil bilgilerini düzenleyebilmelidir.

**FR-004:** Kullanıcılar hesaplarını devre dışı bırakabilmeli veya silme talebi oluşturabilmelidir.

**FR-005:** Kullanıcılar gizlilik ve bildirim tercihlerini yönetebilmelidir.

**Kabul kriterleri:**
- Aynı benzersiz e-posta veya kullanıcı adıyla çakışan hesap oluşturulamamalıdır.
- Kimlik doğrulaması yapılmadan korumalı özelliklere erişilememelidir.
- Profil değişiklikleri kalıcı olarak saklanmalıdır.

### 6.2. AI Fal Merkezi

**FR-006:** Sistem birden fazla fal türünü destekleyebilecek şekilde tasarlanmalıdır.

**FR-007:** Kullanıcı seçtiği fal türüne uygun veri veya görsel gönderebilmelidir.

**FR-008:** Sistem fal girdilerini doğrulamalıdır.

**FR-009:** AI servisi kullanıcının girdisine göre yorum oluşturmalıdır.

**FR-010:** Oluşturulan yorum kullanıcıya sunulmalıdır.

**FR-011:** Kullanıcı yorumunu kaydedebilmeli veya silebilmelidir.

**FR-012:** Kullanıcı fal sonucunu isteğe bağlı olarak paylaşabilmelidir.

**FR-013:** AI servisi başarısız olduğunda sistem uygun hata yönetimi uygulamalıdır.

**Kabul kriterleri:**
- Desteklenen fal türleri arayüzde listelenmelidir.
- Her fal türü kendi girdi gereksinimlerine sahip olmalıdır.
- Başarılı yorumlama sonucunda kullanıcıya sonuç ekranı gösterilmelidir.
- Başarısız istekler kayıp veya bozuk kayıt oluşturmamalıdır.
- AI çıktıları eğlence ve kişisel keşif amacı taşıdığını açıkça belirtmelidir.

### 6.3. Fal geçmişi

**FR-014:** Kullanıcı önceki fal kayıtlarını görüntüleyebilmelidir.

**FR-015:** Kullanıcı fal kayıtlarını türüne ve tarihine göre filtreleyebilmelidir.

**FR-016:** Kullanıcı istediği fal kaydını silebilmelidir.

**FR-017:** Kullanıcı geçmiş fal sonuçlarını yeniden paylaşabilmelidir.

### 6.4. Falcılar Ligi

**FR-018:** Kullanıcı profesyonel falcıları listeleyebilmelidir.

**FR-019:** Falcılar uzmanlık alanı ve diğer uygun kriterlere göre filtrelenebilmelidir.

**FR-020:** Falcı profillerinde hizmet ve fiyat bilgileri gösterilmelidir.

**FR-021:** Kullanıcı bir falcıdan hizmet satın alabilmelidir.

**FR-022:** Ödeme işlemi güvenli bir ödeme sağlayıcısı üzerinden yürütülmelidir.

**FR-023:** Falcı gelen talepleri görüntüleyebilmeli ve yönetebilmelidir.

**FR-024:** Falcı hizmet sonucunu kullanıcıya teslim edebilmelidir.

**FR-025:** Kullanıcı tamamlanan hizmeti değerlendirebilmelidir.

**FR-026:** Sistem falcı kazançlarını ve platform komisyonlarını hesaplayabilmelidir.

**Kabul kriterleri:**
- Onaylanmamış falcılar hizmet yayınlayamamalıdır.
- Kullanıcı sipariş durumunu takip edebilmelidir.
- Ödeme başarısızsa sipariş tamamlanmış kabul edilmemelidir.
- Aynı sipariş için mükerrer ödeme veya teslimat oluşması engellenmelidir.
- İade ve iptal süreçleri tanımlı iş kurallarına göre yürütülmelidir.

### 6.5. Sosyal akış

**FR-027:** Kullanıcı gönderi oluşturabilmelidir.

**FR-028:** Kullanıcı gönderiye metin ve desteklenen medya türlerini ekleyebilmelidir.

**FR-029:** Kullanıcı gönderileri görüntüleyebilmelidir.

**FR-030:** Kullanıcı gönderileri beğenebilmeli ve yorum yapabilmelidir.

**FR-031:** Kullanıcı başka kullanıcıları takip edebilmelidir.

**FR-032:** Kullanıcı gönderileri kaydedebilmelidir.

**FR-033:** Kullanıcı gönderileri şikâyet edebilmelidir.

**FR-034:** Kullanıcı kendi gönderilerini düzenleyebilmeli ve silebilmelidir.

### 6.6. Topluluklar

**FR-035:** Kullanıcı topluluk oluşturabilmelidir.

**FR-036:** Topluluk sahibi topluluk bilgilerini düzenleyebilmelidir.

**FR-037:** Kullanıcı topluluklara katılabilmelidir.

**FR-038:** Kullanıcı topluluk içerisinde konu oluşturabilmelidir.

**FR-039:** Kullanıcı konulara yorum yapabilmelidir.

**FR-040:** Topluluk sahibi moderatör atayabilmelidir.

**FR-041:** Yetkili moderatörler topluluk içeriklerini denetleyebilmelidir.

### 6.7. Eşleşme

**FR-042:** Kullanıcı eşleşme özelliğini isteğe bağlı olarak etkinleştirebilmelidir.

**FR-043:** Kullanıcı eşleşme profili oluşturabilmelidir.

**FR-044:** Sistem uygun eşleşme önerileri oluşturabilmelidir.

**FR-045:** Kullanıcı önerileri kabul edebilmeli veya reddedebilmelidir.

**FR-046:** Karşılıklı kabul durumunda eşleşme oluşturulmalıdır.

**FR-047:** Kullanıcı eşleşmeyi kaldırabilmeli ve diğer kullanıcıları engelleyebilmelidir.

**FR-048:** Kullanıcı eşleşme profilini istediği zaman devre dışı bırakabilmelidir.

### 6.8. Mesajlaşma ve bildirimler

**FR-049:** Yetkili kullanıcılar arasında konuşma oluşturulabilmelidir.

**FR-050:** Kullanıcılar mesaj gönderip alabilmelidir.

**FR-051:** Kullanıcılar konuşmaları engelleyebilmeli veya şikâyet edebilmelidir.

**FR-052:** Sistem önemli olaylar için bildirim oluşturmalıdır.

**FR-053:** Kullanıcılar bildirim tercihlerini yönetebilmelidir.

### 6.9. Moderasyon ve yönetim

**FR-054:** Kullanıcılar uygunsuz içerikleri şikâyet edebilmelidir.

**FR-055:** Moderatörler yetkileri kapsamında içeriklere müdahale edebilmelidir.

**FR-056:** Sistem yöneticileri kullanıcı rollerini yönetebilmelidir.

**FR-057:** Yönetici işlemleri denetim kayıtlarına yazılmalıdır.

**FR-058:** Kullanıcı hesapları gerekli durumlarda geçici veya kalıcı olarak kısıtlanabilmelidir.

## 7. Fonksiyonel Olmayan Gereksinimler

### 7.1. Performans

- Ana sayfa mümkün olduğunca hızlı açılmalıdır.
- Uzun süren AI işlemlerinde kullanıcıya işlem durumu gösterilmelidir.
- Liste ekranlarında sayfalama veya kademeli yükleme kullanılmalıdır.
- Görseller uygun boyutlarda saklanmalı ve sunulmalıdır.
- Yoğun kullanımda sistem ölçeklenebilir olmalıdır.

Kesin performans hedefleri yük testleriyle belirlenecektir.

### 7.2. Güvenlik

- Kimlik doğrulama ve yetkilendirme sunucu tarafında yapılmalıdır.
- Hassas veriler aktarım sırasında korunmalıdır.
- Parolalar güvenli parola özetleme yöntemleriyle saklanmalıdır.
- Kullanıcılar yalnızca izin verilen verilere erişebilmelidir.
- Kritik işlemler kayıt altına alınmalıdır.
- Ödeme işlemleri güvenilir sağlayıcılarla yürütülmelidir.

### 7.3. Gizlilik

- Kullanıcı verileri yalnızca gerekli amaçlarla işlenmelidir.
- Kullanıcı özel fal sonuçlarını gizli tutabilmelidir.
- Eşleşme için gerekli olmayan özel veriler kullanılmamalıdır.
- Kullanıcı kendi görünürlük tercihlerini yönetebilmelidir.
- Hesap silme ve veri talepleri desteklenmelidir.

### 7.4. Kullanılabilirlik

- Arayüz mobil kullanım önceliğiyle tasarlanmalıdır.
- Ana özelliklere kolay erişim sağlanmalıdır.
- Hata mesajları anlaşılır olmalıdır.
- Temel kullanıcı akışlarında gereksiz adımlar bulunmamalıdır.
- Erişilebilirlik ilkeleri dikkate alınmalıdır.

### 7.5. Ölçeklenebilirlik

Sistem, ileride aşağıdaki ihtiyaçları destekleyebilecek şekilde tasarlanmalıdır:

- Artan kullanıcı sayısı.
- Artan AI istekleri.
- Daha fazla fal türü.
- Daha fazla profesyonel falcı.
- Büyük sosyal içerik hacmi.
- Yeni topluluklar.
- Yeni ödeme ve bildirim servisleri.

## 8. AI Gereksinimleri

AI sistemi yalnızca metin üretmekle sınırlı kalmamalıdır.

### 8.1. Fal yorumlama

- Fal türüne özel prompt yapısı bulunmalıdır.
- Girdi doğrulaması yapılmalıdır.
- Sonuçlar belirli bir çıktı formatında üretilmelidir.
- Kullanıcıya göre kişiselleştirme yalnızca izin verilen verilerle yapılmalıdır.
- Yorumlar tutarlı ve anlaşılır olmalıdır.

### 8.2. AI güvenlik kuralları

- AI geleceği kesin olarak bildiğini iddia etmemelidir.
- Kullanıcıyı korkutacak kesin felaket tahminleri üretmemelidir.
- Sağlık, hukuk ve finans konularında fal yorumları profesyonel tavsiye yerine geçmemelidir.
- Kullanıcıya ait özel veriler başka kullanıcılara aktarılmamalıdır.
- AI çıktıları uygun güvenlik kontrollerinden geçirilmelidir.

### 8.3. İleri AI özellikleri

İlerleyen aşamalarda:
- Kullanıcının fal geçmişi üzerinden tematik devamlılık.
- Rüya yorumlama.
- Fal türleri arasında bağlantılı yorumlar.
- Topluluklar için AI destekli içerik önerileri.
- Kullanıcı ilgi alanlarına göre öneri sistemi.

Bu özellikler ilk sürüm için zorunlu değildir.

## 9. İş Kuralları

1. Her kullanıcı benzersiz bir hesap kimliğine sahip olmalıdır.
2. Her fal kaydı bir kullanıcıyla ilişkilendirilmelidir.
3. Kullanıcı falını paylaşmadıkça özel kabul edilmelidir.
4. Falcılık hizmeti sunmak için onaylı falcı rolü gereklidir.
5. Satın alınan hizmet bir sipariş kaydıyla takip edilmelidir.
6. Sipariş ve ödeme durumları birbirinden ayrı tutulmalıdır.
7. Her topluluğun bir sahibi bulunmalıdır.
8. Moderatör yetkileri görevli olunan toplulukla sınırlandırılmalıdır.
9. Eşleşme özelliği kullanıcı tercihine bağlı olmalıdır.
10. Engellenen kullanıcılar arasındaki etkileşim sınırlandırılmalıdır.
11. Kullanıcılar kendi içeriklerini yönetebilmelidir.
12. Yönetici işlemleri kayıt altına alınmalıdır.

## 10. İlk Sürüm (MVP) Kapsamı

İlk sürümün amacı, platformun temel değer önerisini gerçek kullanıcılarla doğrulamaktır.

Önerilen MVP kapsamı:

| Özellik | MVP |
|---|---|
| Kayıt ve giriş | Dahil |
| Profil yönetimi | Dahil |
| En az bir AI fal türü | Dahil |
| Fal sonucu ve geçmişi | Dahil |
| Fal paylaşımı | Temel sürüm |
| Falcılar Ligi | Sonraki aşama |
| Sosyal akış | Sonraki aşama |
| Topluluklar | Sonraki aşama |
| Eşleşme | Sonraki aşama |
| Mesajlaşma | Sonraki aşama |
| Bildirimler | Temel sistem |
| Moderasyon | Temel güvenlik araçları |
| Yönetim paneli | Temel operasyon araçları |

MVP kapsamı, geliştirme kapasitesi ve kullanıcı doğrulama sonuçlarına göre değiştirilebilir.

## 11. Başarı Metrikleri (KPI)

Ürünün başarısı yalnızca indirme sayısıyla ölçülmemelidir.

### Kullanıcı edinimi
- Günlük yeni kayıt sayısı.
- Haftalık yeni kayıt sayısı.
- Kayıttan ilk fal işlemine dönüşüm oranı.

### Kullanıcı etkileşimi
- Günlük aktif kullanıcı.
- Aylık aktif kullanıcı.
- Kullanıcı başına fal sayısı.
- Sosyal paylaşım ve yorum sayısı.
- Topluluk etkileşim oranı.

### AI performansı
- Başarılı fal yorumlama oranı.
- Ortalama yorumlama süresi.
- Kullanıcı memnuniyet puanı.
- Başarısız istek oranı.
- Kullanıcı başına AI maliyeti.

### Falcılar Ligi
- Aktif falcı sayısı.
- Tamamlanan sipariş sayısı.
- Sipariş iptal oranı.
- Ortalama hizmet değerlendirmesi.
- Platform gelirleri.

### Eşleşme
- Eşleşmeye katılım oranı.
- Karşılıklı eşleşme oranı.
- Eşleşme sonrası etkileşim oranı.

Başlangıç hedefleri kullanıcı testleri ve maliyet analizinden sonra belirlenecektir.

## 12. Bağımlılıklar

Ürünün geliştirilmesi sırasında aşağıdaki teknik bileşenlere ihtiyaç duyulacaktır:

- Mobil uygulama altyapısı.
- Backend servisleri.
- Veritabanı.
- Kimlik doğrulama sistemi.
- Görsel ve dosya depolama.
- AI servis sağlayıcısı.
- Ödeme altyapısı.
- Bildirim servisi.
- Analitik ve hata takip sistemi.
- Moderasyon araçları.

Kullanılacak teknoloji ve sağlayıcılar `SYSTEM_ARCHITECTURE.md` içerisinde netleştirilecektir.

## 13. Riskler ve Önlemler

| Risk | Etki | Önerilen önlem |
|---|---|---|
| AI yorumlarının tutarsızlığı | Kullanıcı memnuniyeti düşer | Prompt ve çıktı kalite kontrolü |
| AI maliyetlerinin artması | İşletme maliyeti yükselir | Kullanım limitleri ve maliyet takibi |
| Sahte falcı profilleri | Güven kaybı | Başvuru ve doğrulama süreci |
| Uygunsuz sosyal içerik | Kullanıcı güvenliği | Moderasyon ve raporlama |
| Ödeme anlaşmazlıkları | Finansal kayıp | Sipariş ve iade mekanizması |
| Düşük kullanıcı etkileşimi | Ürün büyümesi yavaşlar | Topluluk ve sosyal deneyim |
| Kişisel veri ihlali | Hukuki ve itibar riski | Veri minimizasyonu ve erişim kontrolü |
| Eşleşme güvenliği | Kullanıcı zararı | Engelleme, raporlama ve gizlilik araçları |

## 14. Açık Ürün Kararları

Geliştirmeden önce netleştirilmesi gereken konular:

- Ana uygulama adı ve marka kimliği.
- İlk sürümde bulunacak fal türleri.
- AI kullanımının ücretsiz ve ücretli sınırları.
- Falcı hizmet komisyon oranı.
- Falcı başvuru ve doğrulama koşulları.
- İptal ve iade politikası.
- Eşleşme sisteminin yaş sınırı.
- Sosyal akışın görünürlük ve sıralama mantığı.
- Toplulukların herkese açık veya özel olabilmesi.
- Mesajlaşma erişim kuralları.
- İlk sürümde desteklenecek diller.
- Backend, veritabanı ve AI sağlayıcı seçimi.

## 15. Kabul ve Tamamlanma Kriterleri

Bir özellik tamamlandı kabul edilmeden önce:

- Gereksinimleri karşılamalıdır.
- Yetkilendirme kontrolleri çalışmalıdır.
- Hata senaryoları test edilmelidir.
- Kullanıcı arayüzü tasarım kurallarına uygun olmalıdır.
- Gerekli veriler doğru şekilde saklanmalıdır.
- Kritik güvenlik açıkları bulunmamalıdır.
- İlgili kabul kriterleri karşılanmalıdır.
- Gerekli dokümantasyon güncellenmelidir.

## 16. Sonuç

Bu PRD, platformun ürün gereksinimlerini ve geliştirme kapsamını tanımlayan temel dokümandır.

Geliştirme sırasında yeni özellikler ortaya çıktığında bu doküman güncellenmeli ve kapsam değişiklikleri takip edilmelidir.

**Doküman durumu:** İlk taslak tamamlandı.

**Bağlantılı dokümanlar:**
- `PROJECT_OVERVIEW.md`
- `APP_FEATURES.md`
- `USER_ROLES.md`
- `USER_FLOWS.md`
- `UI_UX_GUIDELINES.md`
- `SYSTEM_ARCHITECTURE.md`
- `DATABASE_SCHEMA.md`
- `API_DOCUMENTATION.md`
- `AI_PROMPTS.md`
- `DEVELOPMENT_ROADMAP.md`