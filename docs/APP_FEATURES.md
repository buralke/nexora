# APP_FEATURES.md

# Uygulama Özellikleri ve Modül Tanımları

**Proje:** AI Destekli Fal ve Sosyal Etkileşim Platformu  
**Dosya:** `APP_FEATURES.md`  
**Sürüm:** 1.0.0  
**Durum:** Ürün gereksinimleri taslağı

---

## 1. Genel Bakış

Platform, fal deneyimini merkezine alan ancak yalnızca fal bakılan bir uygulamayla sınırlı kalmayan sosyal bir ekosistem olarak tasarlanacaktır.

Kullanıcılar fal baktırabilecek, AI yorumlarından yararlanabilecek, profesyonel fal yorumcularından hizmet alabilecek, topluluklara katılabilecek, içerik paylaşabilecek ve isteğe bağlı olarak diğer kullanıcılarla eşleşebilecektir.

Platformun temel modülleri birbirleriyle entegre çalışacak ancak bağımsız olarak da kullanılabilecektir.

## 2. Ana Modüller

| Modül | Açıklama | Öncelik |
|---|---|---|
| AI Fal Merkezi | Yapay zekâ ile fal yorumlama | P0 |
| Falcılar Ligi | İnsan fal yorumcularından hizmet alma | P1 |
| Sosyal Akış | Fal ve diğer içerikleri paylaşma | P1 |
| Topluluklar | Reddit benzeri konu ve tartışma alanları | P1 |
| Flört ve Eşleşme | Fal sonuçlarına dayalı isteğe bağlı eşleşme | P2 |
| Mesajlaşma | Kullanıcılar arası özel iletişim | P1 |
| Profil Sistemi | Kullanıcı kimliği ve kişiselleştirme | P0 |
| Bildirim Sistemi | Etkileşim ve işlem bildirimleri | P1 |
| Yönetim Paneli | Platform operasyonları ve moderasyon | P0 |

Öncelikler geliştirme planına göre değiştirilebilir.

---

## 3. Kullanıcı Hesabı ve Profil

### 3.1. Temel özellikler

- E-posta veya desteklenen yöntemlerle kayıt.
- Giriş ve çıkış.
- Parola sıfırlama.
- Profil oluşturma ve düzenleme.
- Profil fotoğrafı ekleme.
- Kullanıcı adı belirleme.
- Biyografi ekleme.
- Hesap gizlilik ayarları.
- Bildirim tercihleri.
- Hesap silme talebi.

### 3.2. Profil alanları

- Kullanıcı adı
- Profil fotoğrafı
- Biyografi
- Katılım tarihi
- Paylaşılan içerikler
- Takipçi ve takip edilen bilgileri
- Topluluk üyelikleri
- Kullanıcının izin verdiği ölçüde fal ve sosyal etkinlikleri

Özel fal sonuçları ve özel mesajlar herkese açık profilde gösterilmez.

---

## 4. AI Fal Merkezi

Platformun temel giriş noktalarından biridir.

### 4.1. Fal türleri

İlk aşamada aşağıdaki fal türleri desteklenebilir:

- Kahve falı
- Tarot falı
- Rüya yorumu
- El falı
- Genel fal
- İlerleyen aşamalarda yeni fal türleri

### 4.2. Fal oluşturma akışı

1. Kullanıcı fal türünü seçer.
2. Gerekli görsel veya metni ekler.
3. Sistem giriş verilerini doğrular.
4. Kullanıcının kredi veya kullanım hakkı kontrol edilir.
5. AI yorumlama servisi çalıştırılır.
6. Sonuç doğrulanır ve kullanıcıya sunulur.
7. Fal geçmişine kaydedilir.
8. Kullanıcı isterse sonucu paylaşabilir.

### 4.3. Fal sonuçları

Fal sonuçları aşağıdaki bölümlere ayrılabilir:

- Genel yorum
- Aşk ve ilişkiler
- Kariyer ve hedefler
- Sosyal hayat
- Yakın dönem temaları
- Dikkat çekici semboller
- Genel değerlendirme

Yorumlar eğlence ve kişisel keşif amacı taşır. Kesin gelecek bilgisi olarak sunulmaz.

### 4.4. Fal geçmişi

- Önceki falları görüntüleme.
- Fal türüne göre filtreleme.
- Tarihe göre sıralama.
- Fal sonucunu silme.
- Sonucu yeniden görüntüleme.
- İzin verilirse paylaşım oluşturma.

---

## 5. Falcılar Ligi

Falcılar Ligi, profesyonel veya deneyimli fal yorumcularının kullanıcılarla buluştuğu hizmet pazaryeridir.

### 5.1. Kullanıcı özellikleri

- Fal yorumcularını listeleme.
- Kategoriye göre filtreleme.
- Profil ve hizmet detaylarını görüntüleme.
- Yorumcu puanlarını inceleme.
- Hizmet satın alma.
- Sipariş durumunu takip etme.
- Teslim edilen yorumu görüntüleme.
- Değerlendirme ve yorum bırakma.

### 5.2. Fal yorumcusu özellikleri

- Başvuru oluşturma.
- Profil düzenleme.
- Hizmet türlerini belirleme.
- Fiyatlandırma.
- Siparişleri görüntüleme.
- Sipariş kabul veya ret işlemleri.
- Fal yorumunu teslim etme.
- Kazanç ve işlem geçmişini görüntüleme.

### 5.3. Yorumcu profili

- Profil fotoğrafı
- Tanıtım metni
- Uzmanlık alanları
- Hizmet seçenekleri
- Fiyatlar
- Ortalama değerlendirme
- Tamamlanan sipariş sayısı
- Kullanıcı yorumları

### 5.4. Sipariş yönetimi

Sipariş durumları:

- PENDING
- ACCEPTED
- IN_PROGRESS
- COMPLETED
- CANCELLED
- REFUNDED
- DISPUTED

### 5.5. Gelir modeli

Platform tamamlanan siparişlerden belirlenen oranda komisyon alabilir.

Komisyon, ödeme ve satıcı kazançları `PAYMENT_AND_MONETIZATION.md` dosyasındaki kurallara göre yönetilir.

---

## 6. Sosyal Akış

Kullanıcıların fal sonuçlarını ve diğer içeriklerini paylaşabildiği sosyal ağ modülüdür.

### 6.1. Gönderi özellikleri

- Metin gönderisi oluşturma.
- Görsel ekleme.
- Fal sonucunu paylaşma.
- Gönderi düzenleme.
- Gönderi silme.
- Beğenme.
- Yorum yapma.
- Gönderiyi kaydetme.
- Kullanıcı takip etme.
- Gönderi raporlama.

### 6.2. Gönderi görünürlüğü

- Public
- Followers
- Community
- Private

Görünürlük seçenekleri kullanıcıya açık şekilde gösterilmelidir.

### 6.3. Akış algoritması

Akış sıralamasında aşağıdaki faktörler değerlendirilebilir:

- Güncellik
- Kullanıcının takip ettiği kişiler
- İlgi alanları
- Topluluk üyelikleri
- Etkileşim düzeyi
- Kullanıcının gizlediği veya engellediği içerikler

Kişiselleştirme için gereksiz hassas veri kullanılmamalıdır.

---

## 7. Topluluklar ve Forum

Kullanıcıların ortak ilgi alanlarında bir araya geldiği tartışma alanıdır.

### 7.1. Topluluk özellikleri

- Topluluk oluşturma.
- Topluluğa katılma.
- Topluluktan ayrılma.
- Topluluk açıklaması düzenleme.
- Topluluk kuralları belirleme.
- Moderatör atama.
- Topluluk gönderilerini listeleme.

### 7.2. Konu sistemi

- Yeni konu oluşturma.
- Konuya cevap verme.
- Cevaplara yanıt verme.
- Konuyu beğenme.
- Konuyu kaydetme.
- Konuyu raporlama.
- Konuyu sabitleme.

### 7.3. Örnek topluluklar

- Kahve Falı
- Tarot
- Rüya Yorumları
- Astroloji
- İlişkiler
- Kişisel Gelişim
- Günlük Sohbet
- Falcılar ve Deneyimler

### 7.4. Moderasyon

Topluluk sahibi ve moderatörler yalnızca yetkili oldukları toplulukta işlem yapabilir.

Platform genelindeki içerik denetimi ayrı yetki mekanizmasına bağlıdır.

---

## 8. Flört ve Eşleşme Sistemi

Bu modül platformun isteğe bağlı sosyal tanışma alanıdır.

Kullanıcıların fal sonuçları ve açıkça belirttikleri tercihler üzerinden uyumlu kişilerle tanışmasını amaçlar.

### 8.1. Katılım

- Kullanıcı modülü kendisi etkinleştirir.
- Katılmayan kullanıcılar eşleştirme havuzuna alınmaz.
- Kullanıcı istediği zaman görünürlüğünü kapatabilir.
- Profil bilgileri için ayrı görünürlük ayarları bulunur.

### 8.2. Eşleşme kriterleri

- Kullanıcının belirlediği tercihler
- Ortak ilgi alanları
- Fal sonuçlarından elde edilen uygun ve izinli eşleşme sinyalleri
- Kullanıcıların karşılıklı uyum tercihleri
- Etkileşim ve keşif tercihleri

Hassas kişisel veriler açık izin ve uygun hukuki dayanak olmadan eşleştirme amacıyla kullanılmaz.

### 8.3. Eşleşme özellikleri

- Önerilen profilleri görüntüleme.
- Beğenme veya geçme.
- Karşılıklı beğeni ile eşleşme.
- Eşleşme sonrası mesajlaşma.
- Eşleşmeyi kaldırma.
- Kullanıcıyı engelleme.
- Kullanıcıyı raporlama.

### 8.4. Bağımsız kullanım

Flört modülü kapalı olsa bile kullanıcı sosyal akışı, fal merkezini ve toplulukları kullanmaya devam edebilir.

---

## 9. Mesajlaşma

Kullanıcıların özel iletişim kurmasını sağlar.

### Özellikler

- Birebir mesajlaşma.
- Eşleşme sonrası sohbet.
- Mesaj gönderme.
- Görsel gönderme.
- Mesaj silme.
- Okundu bilgisi.
- Yazıyor göstergesi.
- Kullanıcı engelleme.
- Konuşmayı raporlama.

İlerleyen aşamalarda grup sohbetleri değerlendirilebilir.

---

## 10. Bildirim Sistemi

Bildirimler kullanıcıların önemli gelişmelerden haberdar olmasını sağlar.

### Bildirim türleri

- Yeni takipçi
- Beğeni
- Yorum
- Mesaj
- Yeni eşleşme
- Fal sonucu hazır
- Sipariş güncellemesi
- Ödeme durumu
- Topluluk etkinliği
- Sistem duyurusu

Kullanıcı bildirim türlerini ayarlardan yönetebilmelidir.

---

## 11. Arama ve Keşfet

Platformdaki kullanıcıların, içeriklerin ve toplulukların bulunmasını sağlar.

### Arama kategorileri

- Kullanıcılar
- Gönderiler
- Topluluklar
- Konular
- Fal yorumcuları
- Hizmetler

Arama sonuçları kullanıcının erişim yetkilerine ve görünürlük tercihlerine göre filtrelenmelidir.

---

## 12. Yönetim Paneli

Platform operasyonlarının yürütüleceği yönetim arayüzüdür.

### Yönetim özellikleri

- Kullanıcı yönetimi.
- Rol ve yetki yönetimi.
- Fal yorumcusu başvurularını inceleme.
- İçerik moderasyonu.
- Şikâyetleri yönetme.
- Topluluk denetimi.
- Sipariş takibi.
- Ödeme ve iade takibi.
- Sistem duyuruları.
- Temel analitik verileri görüntüleme.
- Güvenlik olaylarını inceleme.

Yönetim işlemleri rol ve yetki sınırları dahilinde gerçekleştirilmelidir.

---

## 13. Ayarlar ve Kullanıcı Kontrolleri

- Profil ayarları
- Hesap gizliliği
- Bildirim tercihleri
- Flört görünürlüğü
- Engellenen kullanıcılar
- Veri izinleri
- Bağlı hesaplar
- Aktif oturumlar
- Veri indirme talebi
- Hesap silme talebi
- Yardım ve destek

---

## 14. Modüller Arası İlişki

| Modül | Bağlantılı modüller |
|---|---|
| AI Fal Merkezi | Profil, Sosyal Akış, Eşleşme |
| Falcılar Ligi | Profil, Ödeme, Bildirim |
| Sosyal Akış | Profil, Topluluk, Mesajlaşma |
| Topluluklar | Profil, Sosyal Akış, Bildirim |
| Flört | Profil, AI Fal Merkezi, Mesajlaşma |
| Mesajlaşma | Profil, Flört, Bildirim |
| Ödeme | Falcılar Ligi, AI Fal Merkezi |
| Yönetim Paneli | Tüm modüller |

Bu bağlantılar modüllerin birbirine bağımlı olması gerektiği anlamına gelmez. Her modül mümkün olduğunca bağımsız servis ve iş kurallarıyla geliştirilecektir.

---

## 15. Önceliklendirme

### P0 — İlk sürüm için gerekli

- Kullanıcı kayıt ve giriş
- Profil oluşturma
- AI ile en az bir fal türü
- Fal sonucu görüntüleme
- Fal geçmişi
- Temel yönetim paneli
- Temel güvenlik ve raporlama

### P1 — Sosyal ve ticari temel

- Sosyal gönderiler
- Beğeni ve yorum
- Topluluklar
- Mesajlaşma
- Falcılar Ligi
- Ödeme entegrasyonu
- Bildirim sistemi

### P2 — Gelişmiş deneyim

- Flört ve eşleşme
- Fal temelli uyum algoritması
- Gelişmiş keşfet
- Kişiselleştirilmiş akış
- Gelişmiş fal türleri

### P3 — Gelecek geliştirmeleri

- Canlı fal görüşmeleri
- Sesli fal yorumları
- Grup etkinlikleri
- Premium topluluklar
- Gelişmiş öneri algoritmaları
- Uluslararasılaştırma

---

## 16. Kabul Kriterleri

- [ ] Kullanıcı temel hesap işlemlerini yapabiliyor.
- [ ] AI fal süreci uçtan uca çalışıyor.
- [ ] Kullanıcı geçmiş fal sonuçlarını yönetebiliyor.
- [ ] Kullanıcı açıkça izin vermeden özel fal sonucu paylaşılmıyor.
- [ ] Sosyal gönderiler oluşturulabiliyor.
- [ ] Topluluk oluşturma ve katılma çalışıyor.
- [ ] Falcılar Ligi sipariş akışı çalışıyor.
- [ ] Flört modülü isteğe bağlı kullanılabiliyor.
- [ ] Mesajlaşma yetkilendirme kontrollerine sahip.
- [ ] Bildirim tercihleri yönetilebiliyor.
- [ ] Moderasyon ve raporlama mekanizmaları çalışıyor.
- [ ] Yönetim işlemleri denetlenebiliyor.

---

## 17. İlişkili Dokümanlar

- `PROJECT_OVERVIEW.md`
- `PRD.md`
- `USER_ROLES.md`
- `USER_FLOWS.md`
- `UI_UX_GUIDELINES.md`
- `API_SPECIFICATION.md`
- `DATABASE_SCHEMA.md`
- `SYSTEM_ARCHITECTURE.md`
- `AI_SYSTEM_DESIGN.md`
- `PAYMENT_AND_MONETIZATION.md`
- `SECURITY_AND_PRIVACY.md`

**Doküman durumu:** İlk sürüm ürün özellikleri tanımı.  
**Not:** Özelliklerin kapsamı ve öncelikleri MVP testleri ve teknik fizibilite sonucunda güncellenebilir.