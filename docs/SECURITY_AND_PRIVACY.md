# SECURITY_AND_PRIVACY.md

# Güvenlik ve Gizlilik Mimarisi

**Proje:** AI Destekli Fal ve Sosyal Etkileşim Platformu  
**Dosya:** `SECURITY_AND_PRIVACY.md`  
**Sürüm:** 1.0.0  
**Durum:** Teknik taslak  
**Son güncelleme:** 06.11.2026

---

## 1. Amaç

Bu dokümanın amacı, platformun kullanıcı verilerini, hesaplarını, içeriklerini, finansal işlemlerini ve sistem altyapısını korumak için uygulanması gereken güvenlik ve gizlilik prensiplerini tanımlamaktır.

Platform aşağıdaki modülleri kapsadığı için güvenlik yalnızca kullanıcı hesabıyla sınırlı değildir:

- AI destekli fal yorumlama
- Falcılar Ligi
- Sosyal medya akışı
- Topluluklar ve forumlar
- Kullanıcılar arası mesajlaşma
- Flört ve eşleştirme sistemi
- Ödeme ve abonelik altyapısı
- Yönetim paneli

Bu modüllerin her biri farklı veri türleri ve güvenlik riskleri barındırır.

**Temel yaklaşım:** Kullanıcı yalnızca izin verdiği verinin, izin verdiği amaç doğrultusunda ve yetkili kişiler tarafından kullanılmasını sağlamaktır.

Bu doküman teknik güvenlik taslağıdır. Tek başına yasal uygunluk veya güvenlik sertifikasyonu anlamına gelmez.

---

## 2. Güvenlik ve Gizlilik İlkeleri

Platform aşağıdaki temel prensiplerle geliştirilecektir.

| İlke | Açıklama |
|---|---|
| Privacy by Design | Gizlilik, geliştirme sürecinin başlangıcından itibaren dikkate alınır. |
| Privacy by Default | Kullanıcı aksini seçmedikçe güvenli ve özel ayarlar varsayılan olur. |
| Least Privilege | Her kullanıcı ve servis yalnızca ihtiyaç duyduğu yetkiye sahip olur. |
| Defense in Depth | Güvenlik tek bir katmana bağlı kalmaz. |
| Data Minimization | Gereğinden fazla veri toplanmaz. |
| Purpose Limitation | Veriler belirtilen amaç dışında kullanılmaz. |
| Secure by Default | Güvenli olmayan yapılandırmalar varsayılan olarak etkinleştirilmez. |
| Accountability | Kritik işlemler izlenebilir ve denetlenebilir olur. |

### 2.1. Temel kurallar

1. Kullanıcıların özel fal sonuçları varsayılan olarak gizli olacaktır.
2. Fal sonuçlarının sosyal medyada paylaşılması açık kullanıcı eylemi gerektirecektir.
3. Flört modülü isteğe bağlı olacaktır.
4. Flört modülüne katılmayan kullanıcılar bu modülde görünmeyecektir.
5. Kullanıcı mesajları yalnızca ilgili konuşmanın katılımcıları tarafından görüntülenebilecektir.
6. Fal yorumcuları yalnızca kendilerine atanmış ve gerekli erişim izni verilmiş siparişleri görüntüleyebilecektir.
7. Yönetici yetkileri sınırsız ve denetimsiz olmayacaktır.
8. AI servislerine gereksiz kişisel veri gönderilmeyecektir.
9. Kullanıcı verileri açık izin olmadan model eğitimi amacıyla kullanılmayacaktır.
10. Kullanıcı hesabını silmek istediğinde ilgili veri silme süreci başlatılabilecektir.

---

## 3. Veri Sınıflandırması

Sistemde tutulan veriler güvenlik seviyelerine göre sınıflandırılacaktır.

| Sınıf | Veri türleri | Koruma yaklaşımı |
|---|---|---|
| Public | Herkese açık profil bilgileri, herkese açık gönderiler | Görüntüleme ve kötüye kullanım kontrolleri |
| Internal | Sistem yapılandırmaları, operasyonel bilgiler | Yetkilendirilmiş erişim |
| Personal | E-posta, telefon, profil bilgileri | Erişim kontrolü ve şifreleme |
| Sensitive | Özel mesajlar, özel fal sonuçları, flört tercihleri, kişisel görseller | Sıkı erişim kontrolü, veri minimizasyonu ve şifreleme |
| Critical | Kimlik doğrulama sırları, ödeme güvenliği verileri, API anahtarları | Güçlü erişim kontrolü, secret management ve denetim |

Verinin sınıfı, yalnızca içeriğine değil kullanım amacına ve bir araya getirildiğinde oluşturabileceği riske göre de belirlenmelidir.

### 3.1. Modüllere göre veri envanteri

| Modül | İşlenen veriler | Önemli risk |
|---|---|---|
| Kullanıcı hesabı | E-posta, telefon, parola özeti, profil | Hesap ele geçirilmesi |
| Fal merkezi | Fal görselleri, giriş metinleri, sonuçlar | Özel içerik sızıntısı |
| AI sistemi | Prompt, bağlam, çıktı | Üçüncü taraf veri aktarımı |
| Sosyal ağ | Gönderiler, yorumlar, beğeniler | İstenmeyen ifşa |
| Flört | Tercihler, eşleşmeler, etkileşimler | Hassas profil çıkarımı |
| Mesajlaşma | Özel mesajlar, medya | Yetkisiz erişim |
| Falcılar Ligi | Siparişler, yorumlar, değerlendirmeler | Ticari ve kişisel veri sızıntısı |
| Ödemeler | İşlem referansları, ödeme durumu | Finansal dolandırıcılık |
| Analitik | Kullanım ve performans olayları | Gereksiz kişisel veri toplama |

---

## 4. Kimlik Doğrulama ve Oturum Yönetimi

### 4.1. Kimlik doğrulama

Platform aşağıdaki kimlik doğrulama yöntemlerini destekleyebilecek şekilde tasarlanacaktır:

- E-posta ve parola
- Telefon doğrulaması
- Desteklenen üçüncü taraf kimlik sağlayıcıları
- İlerleyen aşamada çok faktörlü kimlik doğrulama (MFA)

Parolalar hiçbir zaman düz metin olarak saklanmayacaktır.

Parola saklama için Argon2id veya uygun yapılandırılmış bcrypt gibi modern parola özetleme algoritmaları kullanılacaktır.

### 4.2. Oturum yönetimi

- Erişim tokenları kısa ömürlü olmalıdır.
- Yenileme tokenları güvenli biçimde saklanmalıdır.
- Token yenileme sırasında rotation uygulanmalıdır.
- Çıkış işleminde ilgili oturum geçersizleştirilmelidir.
- Kullanıcı aktif oturumlarını görüntüleyip sonlandırabilmelidir.
- Şüpheli girişler tespit edildiğinde ek doğrulama istenebilmelidir.
- Kritik hesap değişikliklerinde yeniden kimlik doğrulama uygulanmalıdır.

Mobil uygulamada tokenlar güvenli cihaz depolama mekanizmalarıyla saklanmalıdır. Flutter uygulamasına gizli API anahtarları veya sunucu sırları gömülmemelidir.

### 4.3. MFA

Özellikle aşağıdaki roller için MFA desteklenmesi önerilir:

- SYSTEM_ADMIN
- CONTENT_MODERATOR
- SUPPORT_AGENT
- FORTUNE_TELLER

MFA zorunluluğunun hangi roller için uygulanacağı ürün ve operasyon kararlarıyla netleştirilecektir.

---

## 5. Yetkilendirme Mimarisi

Yetkilendirme yalnızca kullanıcının rolüne göre yapılmayacaktır.

Sistem üç kontrolü birlikte uygulamalıdır:

1. Kullanıcının rolü
2. Kullanıcının ilgili işlem için yetkisi
3. Erişilmek istenen kaynağın kullanıcıyla ilişkisi

Örneğin bir kullanıcı USER rolüne sahip olsa bile başka bir kullanıcının özel fal sonucuna erişememelidir.

### 5.1. Rol bazlı yetkilendirme

`USER_ROLES.md` dosyasında tanımlanan roller esas alınacaktır:

| Rol | Erişim kapsamı |
|---|---|
| USER | Kendi hesabı ve izin verilen platform özellikleri |
| FORTUNE_TELLER | Atanmış siparişler ve kendi hizmet paneli |
| COMMUNITY_OWNER | Sahibi olduğu topluluğun yönetimi |
| COMMUNITY_MODERATOR | Yetkili olduğu toplulukta moderasyon |
| CONTENT_MODERATOR | Platform genelinde tanımlı içerik denetimi |
| SUPPORT_AGENT | Destek süreçleri için gerekli sınırlı kullanıcı bilgileri |
| SYSTEM_ADMIN | Yönetim ve sistem operasyonları |

### 5.2. Kaynak sahipliği kontrolü

Her hassas API isteğinde kaynak sahipliği kontrol edilmelidir.

Örnek:

- Kullanıcı yalnızca kendi fal geçmişini görüntüleyebilir.
- Fal yorumcusu yalnızca kendisine atanmış siparişe erişebilir.
- Topluluk moderatörü yalnızca yetkili olduğu topluluğu yönetebilir.
- Mesajlaşma servisi yalnızca konuşma katılımcılarına erişim verir.
- Destek personeli kullanıcı parolalarını veya özel mesaj içeriklerini görüntüleyemez.

### 5.3. Yetkilendirme kuralları

- Varsayılan politika erişimi reddetmektir.
- Yetki kontrolü istemcide değil sunucuda yapılmalıdır.
- Yönetici işlemleri kayıt altına alınmalıdır.
- Rol değişiklikleri denetlenmelidir.
- Yetki yükseltme işlemleri ayrı doğrulama gerektirmelidir.
- Moderatör yetkileri kapsam dışına taşmamalıdır.

---

## 6. Veri Şifreleme ve Saklama Güvenliği

### 6.1. Aktarım sırasında şifreleme

İstemci ve sunucu arasındaki iletişim TLS üzerinden gerçekleştirilmelidir.

- HTTPS zorunlu olmalıdır.
- Güvensiz HTTP istekleri engellenmelidir.
- Üçüncü taraf servis bağlantıları da güvenli protokoller kullanmalıdır.
- Sertifika ve TLS yapılandırmaları düzenli kontrol edilmelidir.

### 6.2. Saklama sırasında şifreleme

Veritabanı, dosya depolama alanı ve yedekler için uygun şifreleme mekanizmaları kullanılmalıdır.

Özellikle aşağıdaki veriler korunmalıdır:

- Özel fal sonuçları
- Kullanıcı görselleri
- Mesajlaşma verileri
- Flört tercihleri
- Kişisel hesap bilgileri
- Finansal işlem referansları

Şifreleme anahtarları uygulama koduyla aynı yerde tutulmamalıdır.

### 6.3. Anahtar yönetimi

- Secret management servisi kullanılmalıdır.
- Anahtar erişimleri sınırlandırılmalıdır.
- Anahtar rotasyonu planlanmalıdır.
- Üretim ve geliştirme anahtarları ayrılmalıdır.
- API anahtarları GitHub gibi kod depolarına gönderilmemelidir.

---

## 7. Görsel ve Dosya Güvenliği

Platformda kullanıcılar kahve fincanı, tarot kartı, el fotoğrafı veya diğer görselleri yükleyebilir.

Bu nedenle dosya yükleme sistemi özel olarak korunmalıdır.

### 7.1. Yükleme kontrolleri

- İzin verilen dosya türleri açıkça tanımlanmalıdır.
- MIME type kontrolü tek başına yeterli kabul edilmemelidir.
- Dosyanın gerçek formatı magic-byte kontrolüyle doğrulanmalıdır.
- Dosya boyutu sınırlandırılmalıdır.
- Zararlı dosya taraması uygulanmalıdır.
- Dosya adları sunucu tarafından güvenli şekilde oluşturulmalıdır.
- Dosyalar doğrudan çalıştırılabilir web dizinlerinde tutulmamalıdır.

### 7.2. Görsel gizliliği

- Uygun durumlarda EXIF ve konum metadata bilgileri temizlenmelidir.
- Özel görseller herkese açık URL üzerinden sunulmamalıdır.
- Erişim kontrollü ve kısa ömürlü imzalı URL kullanılmalıdır.
- Dosyaya erişim kullanıcı ve kaynak sahipliği kontrolünden geçmelidir.

### 7.3. Saklama politikası

Kullanıcıya yüklediği dosyaların hangi amaçla saklandığı ve ne zaman silinebileceği açıklanmalıdır.

Silinen bir fal kaydına bağlı dosyaların da silme sürecine dahil edilmesi gerekir.

---

## 8. AI Servisleri ve Veri Gizliliği

Platformun AI modülü, kullanıcıların fal görsellerini, metinlerini ve gerekli bağlam bilgilerini işleyebilir.

Bu veriler üçüncü taraf AI sağlayıcılarına aktarılabileceğinden özel kontroller gereklidir.

### 8.1. Veri minimizasyonu

AI servisine yalnızca yorumlama için gerekli veriler gönderilmelidir.

Örnek:

- Kullanıcının gerçek adı yerine takma kimlik kullanılabilir.
- E-posta ve telefon bilgileri prompt içerisine eklenmemelidir.
- Gereksiz profil bilgileri AI bağlamına dahil edilmemelidir.
- Kullanıcı geçmişi yalnızca gerekli ve izin verilen durumlarda kullanılmalıdır.

### 8.2. AI sağlayıcı güvenliği

AI sağlayıcısı seçilirken aşağıdaki konular incelenmelidir:

- Gönderilen verilerin saklanma süresi
- Verilerin model eğitiminde kullanılıp kullanılmadığı
- Veri işleme ve silme politikaları
- Verilerin hangi ülkelerde işlendiği
- Alt veri işleyenler
- Sözleşmesel gizlilik ve güvenlik koşulları

Kullanıcı verilerinin model eğitiminde kullanılması için gerekli hukuki değerlendirme ve uygun ayrı izin mekanizması olmadan böyle bir kullanım yapılmamalıdır.

### 8.3. Prompt güvenliği

AI sisteminde kullanıcı girdileri güvenilir talimat olarak değerlendirilmemelidir.

- Prompt injection girişimleri kontrol edilmelidir.
- Sistem talimatları kullanıcı girdisinden ayrılmalıdır.
- AI çıktıları şema ve içerik doğrulamasından geçirilmelidir.
- AI başka kullanıcıların verilerine erişememelidir.
- AI çıktısı doğrudan yetki veya ödeme işlemi başlatamamalıdır.

### 8.4. AI çıktısı

Fal yorumları eğlence ve kişisel keşif amacı taşımalıdır.

- Kesin gelecek tahmini gibi sunulmamalıdır.
- Sağlık, hukuk veya finans konusunda profesyonel karar yerine geçmemelidir.
- Kullanıcıyı korkutan veya manipüle eden ifadeler engellenmelidir.
- Hassas kişisel çıkarımlar gereksiz yere üretilmemelidir.

---

## 9. Mesajlaşma ve Sosyal Alan Güvenliği

### 9.1. Özel mesajlar

- Mesajları yalnızca konuşma katılımcıları görüntüleyebilir.
- Mesaj silme ve raporlama kuralları tanımlanmalıdır.
- Engelleme özelliği bulunmalıdır.
- Mesaj içerikleri loglara düz metin olarak yazılmamalıdır.
- Destek personelinin mesaj içeriklerine erişimi varsayılan olarak kapalı olmalıdır.

Uçtan uca şifreleme (E2EE) uygulanmadığı sürece mesajlaşma sistemi uçtan uca şifreli olarak tanıtılmamalıdır.

### 9.2. Sosyal içerikler

- Kullanıcı gönderi ve yorumlarını raporlayabilmelidir.
- Spam ve otomatik hesap davranışları izlenmelidir.
- Zararlı bağlantılar ve dosyalar kontrol edilmelidir.
- Moderasyon kararları kayıt altına alınmalıdır.
- Kullanıcı engelleme ve içerik gizleme mekanizmaları bulunmalıdır.

### 9.3. İçerik görünürlüğü

Her gönderi için görünürlük seviyesi açıkça belirlenmelidir:

- Herkese açık
- Takipçilere açık
- Yalnızca belirli topluluk üyelerine açık
- Özel

Kullanıcı, paylaşım yapmadan önce içeriğin kimler tarafından görülebileceğini anlayabilmelidir.

---

## 10. Flört ve Eşleştirme Güvenliği

Flört modülü isteğe bağlı ve ayrı bir katılım mekanizmasına sahip olmalıdır.

### 10.1. Katılım ve görünürlük

- Kullanıcı flört modülünü açıkça etkinleştirmelidir.
- Modül devre dışı bırakıldığında keşfedilebilirliği durmalıdır.
- Kullanıcı profil görünürlüğünü kontrol edebilmelidir.
- Eşleşme tercihleri izinsiz paylaşılmamalıdır.
- Hassas tercihler gereksiz yere analitik sistemlere aktarılmamalıdır.

### 10.2. Konum gizliliği

- Kesin konum diğer kullanıcılara gösterilmemelidir.
- Mesafe bilgisi gerekiyorsa yaklaşık değer kullanılmalıdır.
- Konum verisi gereksiz yere saklanmamalıdır.
- Konum izni verilmediğinde temel kullanım engellenmemelidir.

### 10.3. Kullanıcı güvenliği

- Engelleme
- Şikâyet etme
- Sahte profil bildirimi
- Taciz ve spam kontrolü
- Şüpheli hesapların incelenmesi

gibi mekanizmalar sağlanmalıdır.

Yaş sınırı, yaş doğrulama yöntemi ve flört modülünün hangi kullanıcı gruplarına açılacağı ürün ve hukuk değerlendirmesiyle kesinleştirilmelidir.

---

## 11. Ödeme Güvenliği

Platformda abonelik, AI kredisi ve Falcılar Ligi siparişleri bulunabileceğinden ödeme güvenliği kritik önemdedir.

### 11.1. Kart verileri

- Ham kart numarası saklanmamalıdır.
- CVV/CVC bilgisi hiçbir koşulda veritabanında tutulmamalıdır.
- Ödeme sağlayıcısının tokenizasyon altyapısı kullanılmalıdır.
- Kart bilgileri mümkün olduğunca sağlayıcının güvenli ödeme ekranında işlenmelidir.

### 11.2. Ödeme doğrulama

- Webhook imzaları doğrulanmalıdır.
- Aynı ödeme bildiriminin tekrar işlenmesi engellenmelidir.
- Ödeme ve sipariş durumları sunucu tarafında doğrulanmalıdır.
- Kullanıcının istemciden gönderdiği ödeme başarılı bilgisi tek başına yeterli kabul edilmemelidir.
- İade ve iptal işlemleri denetlenmelidir.

### 11.3. Finansal yetkilendirme

- Ödeme kayıtlarına erişim sınırlandırılmalıdır.
- Satıcı ve fal yorumcusu yalnızca kendi işlem bilgilerini görüntüleyebilmelidir.
- Ödeme ve komisyon değişiklikleri denetlenmelidir.
- Finansal işlemler için ayrı audit kayıtları tutulmalıdır.

---

## 12. Loglama ve Denetim Kayıtları

Sistem güvenliği için kritik olaylar kayıt altına alınmalıdır.

### 12.1. Kaydedilecek olaylar

- Başarısız ve şüpheli giriş denemeleri
- Oturum açma ve kapatma
- Parola ve hesap güvenliği değişiklikleri
- Rol ve yetki değişiklikleri
- Yönetici işlemleri
- Ödeme ve iade işlemleri
- Sipariş durum değişiklikleri
- Veri dışa aktarma işlemleri
- Hesap silme talepleri
- Güvenlik ihlali şüpheleri

### 12.2. Log güvenliği

- Loglara parola, token, CVV veya gereksiz kişisel veri yazılmamalıdır.
- Hassas payload içerikleri maskelenmelidir.
- Log erişimleri sınırlandırılmalıdır.
- Loglar üzerinde yetkisiz değişiklik yapılması önlenmelidir.
- Kritik audit kayıtları değiştirilmeye karşı korumalı olmalıdır.
- Saklama süreleri veri türüne ve hukuki gerekliliklere göre belirlenmelidir.

---

## 13. Kullanıcı Veri Hakları ve Hesap Silme

Kullanıcıların verileri üzerindeki talepleri için merkezi bir süreç bulunmalıdır.

Desteklenmesi gereken işlemler:

1. Kişisel verileri görüntüleme talebi
2. Yanlış bilgileri düzeltme
3. Uygun verileri dışa aktarma
4. Hesabı silme talebi
5. İlgili izinleri geri çekme
6. Uygun durumlarda veri işleme itirazı veya kısıtlama talebi

### 13.1. Hesap silme süreci

Hesap silme işlemi tek bir veritabanı kaydını kaldırmaktan ibaret değildir.

İlgili süreç aşağıdaki alanları değerlendirmelidir:

- Kullanıcı profili
- Fal geçmişi
- Yüklenen görseller
- Sosyal içerikler
- Mesajlaşma verileri
- Flört tercihleri
- AI sağlayıcısına aktarılmış veriler
- Analitik sistemler
- Üçüncü taraf servisler

Bazı finansal veya hukuki kayıtların mevzuat gereği saklanması gerekebilir. Bu kayıtlar için silme yerine erişimi sınırlandırma veya kimlikten arındırma gibi uygun yöntemler değerlendirilmelidir.

Yedeklerdeki silme işlemleri de tanımlı yedek saklama ve imha takvimine uygun yürütülmelidir.

---

## 14. Veri Saklama ve İmha Politikası

Her veri türü için saklama amacı, saklama süresi ve imha yöntemi tanımlanmalıdır.

| Veri | Saklama politikası |
|---|---|
| Kullanıcı hesabı | Hesap aktifliği ve hukuki gerekliliklere göre |
| Fal geçmişi | Kullanıcı tercihleri ve ürün politikasına göre |
| Fal görselleri | İşleme amacı ve belirlenen dosya saklama süresine göre |
| AI prompt ve çıktıları | Hata ayıklama ve ürün ihtiyacıyla sınırlı |
| Özel mesajlar | Kullanıcı ve hizmet politikalarına göre |
| Sosyal gönderiler | Kullanıcı silme ve moderasyon kurallarına göre |
| Ödeme kayıtları | Uygulanabilir mali ve hukuki saklama yükümlülüklerine göre |
| Güvenlik logları | Güvenlik ve denetim ihtiyacına göre |
| Yedekler | Tanımlı yedekleme ve imha takvimine göre |

Bu tabloda sabit gün veya yıl değerleri henüz belirlenmemiştir. Süreler, hukuki değerlendirme ve operasyonel ihtiyaçlar doğrultusunda belirlenecektir.

---

## 15. Güvenlik Tehdit Modeli

Platformun karşılaşabileceği başlıca tehditler aşağıda listelenmiştir.

| Tehdit | Risk | Önerilen önlem |
|---|---|---|
| BOLA / IDOR | Başka kullanıcının verisine erişim | Kaynak sahipliği kontrolü |
| Brute force | Hesap ele geçirme | Rate limit, MFA, anomali tespiti |
| SQL / NoSQL Injection | Veri sızıntısı veya değişikliği | Parametreli sorgular ve input validation |
| XSS | Zararlı içerik çalıştırılması | Output encoding ve içerik sanitizasyonu |
| CSRF | Yetkisiz işlem | Web panelinde uygun CSRF koruması |
| Token theft | Oturum ele geçirilmesi | Güvenli token saklama ve rotation |
| Webhook spoofing | Sahte ödeme bildirimi | İmza doğrulama ve idempotency |
| Malicious upload | Zararlı dosya yükleme | Format kontrolü ve malware taraması |
| Prompt injection | AI davranışının manipülasyonu | Talimat ayrımı ve çıktı doğrulama |
| Data leakage | Özel verilerin açığa çıkması | Yetkilendirme ve veri minimizasyonu |
| Spam / bot abuse | Platformun kötüye kullanılması | Rate limit ve davranış analizi |
| Privilege escalation | Yetkisiz yetki kazanımı | Merkezi rol ve izin kontrolleri |

### 15.1. Özellikle dikkat edilmesi gereken alanlar

Platformda çok sayıda kullanıcı içeriği ve özel veri bulunduğundan BOLA/IDOR açıkları kritik kabul edilmelidir.

Örneğin:

`GET /api/v1/fortunes/{fortuneId}`

isteğinde yalnızca fortuneId değerinin geçerli olması yeterli değildir. İsteği yapan kullanıcının ilgili fal kaydına erişim yetkisi de kontrol edilmelidir.

---

## 16. Güvenli Yazılım Geliştirme Süreci

Güvenlik yalnızca canlı sistemde değil geliştirme sürecinde de uygulanmalıdır.

### 16.1. Kod güvenliği

- Kod incelemesi yapılmalıdır.
- Bağımlılık güvenlik taraması uygulanmalıdır.
- Secret scanning kullanılmalıdır.
- Statik kod analizi yapılmalıdır.
- API girişleri doğrulanmalıdır.
- Kritik işlemler için güvenlik testleri yazılmalıdır.

### 16.2. Ortam ayrımı

Aşağıdaki ortamlar birbirinden ayrılmalıdır:

- Development
- Testing
- Staging
- Production

Üretim verileri doğrudan geliştirme ortamına kopyalanmamalıdır. Testlerde mümkün olduğunca sentetik veya kimlikten arındırılmış veriler kullanılmalıdır.

### 16.3. Güvenlik testleri

- Authentication testleri
- Authorization testleri
- API güvenlik testleri
- Dosya yükleme testleri
- Ödeme webhook testleri
- Rate limit testleri
- Veri silme testleri
- Mobil uygulama güvenlik testleri

Düzenli güvenlik değerlendirmesi ve risk seviyesine göre penetrasyon testi planlanmalıdır.

---

## 17. Sunucu ve Operasyon Güvenliği

- Sunucu servisleri minimum yetkiyle çalışmalıdır.
- Üretim erişimleri sınırlandırılmalıdır.
- Yönetici erişimleri MFA ile korunmalıdır.
- Güvenlik güncellemeleri düzenli uygulanmalıdır.
- Veritabanı internete doğrudan açık bırakılmamalıdır.
- Yedekler şifrelenmelidir.
- Yedekten geri yükleme testleri yapılmalıdır.
- Servislerde anormal trafik ve hata oranları izlenmelidir.
- Kritik güvenlik olayları için alarm mekanizması kurulmalıdır.

---

## 18. Güvenlik Olayı Müdahale Planı

Bir güvenlik ihlali veya veri sızıntısı şüphesinde aşağıdaki süreç izlenmelidir.

1. **Tespit:** Olayın belirlenmesi ve kapsamının anlaşılması.
2. **Sınırlama:** Etkilenen oturumların, servislerin veya anahtarların güvenli şekilde sınırlandırılması.
3. **Değerlendirme:** Hangi verilerin ve kullanıcıların etkilendiğinin belirlenmesi.
4. **Bildirim:** Uygulanabilir mevzuat ve sözleşmeler doğrultusunda gerekli bildirimlerin yapılması.
5. **Kurtarma:** Sistemlerin güvenli biçimde yeniden çalışır hale getirilmesi.
6. **İnceleme:** Olayın kök nedeninin belirlenmesi.
7. **İyileştirme:** Aynı olayın tekrarlanmasını önleyecek kontrollerin uygulanması.

Her kritik olay için olay kaydı, sorumlu kişi, zaman çizelgesi ve alınan aksiyonlar tutulmalıdır.

---

## 19. KVKK ve Diğer Hukuki Gereklilikler

Bu doküman hukuki danışmanlık veya mevzuata uygunluk belgesi değildir.

Platformun faaliyet göstereceği ülkelere ve veri işleme biçimine göre aşağıdaki konular uzman hukuk danışmanlarıyla değerlendirilmelidir:

- KVKK kapsamındaki veri sorumlusu ve veri işleyen rolleri
- Aydınlatma metinleri
- Açık rıza gerektiren işlemler
- Veri işleme amaçları ve hukuki sebepler
- Kullanıcıların veri hakları
- Veri saklama ve imha politikaları
- Yurt dışına veri aktarımı
- AI sağlayıcılarının veri işleme koşulları
- Çerez ve analitik izinleri
- Flört modülündeki hassas veri işleme riskleri
- E-ticaret ve pazaryeri yükümlülükleri
- Ödeme ve finansal kayıtların saklanması

Özellikle yurt dışında bulunan AI sağlayıcılarına kullanıcı verisi aktarılması, ayrı bir hukuki ve teknik değerlendirme gerektirir.

---

## 20. Açık Teknik Kararlar

| Konu | Karar durumu |
|---|---|
| Authentication sağlayıcısı | TBD |
| Parola algoritması ve parametreleri | TBD |
| Token yönetimi | TBD |
| MFA kapsamı | TBD |
| Veritabanı şifreleme yöntemi | TBD |
| Secret management servisi | TBD |
| Dosya tarama servisi | TBD |
| AI sağlayıcı veri politikası | TBD |
| Log saklama süresi | TBD |
| Yedek saklama süresi | TBD |
| Hesap silme iş akışı | TBD |
| Güvenlik izleme altyapısı | TBD |
| Veri merkezi ve ülke seçimi | TBD |
| Hukuki veri saklama politikası | Hukuk incelemesi gerekli |

---

## 21. Kabul Kriterleri

Güvenlik mimarisinin ilk sürümü aşağıdaki koşulları sağlamalıdır:

- [ ] Parolalar güvenli algoritmalarla hashleniyor.
- [ ] İstemci-sunucu iletişimi TLS kullanıyor.
- [ ] Sunucu tarafında kaynak sahipliği kontrolü yapılıyor.
- [ ] Kullanıcılar başka kullanıcıların özel fal sonuçlarına erişemiyor.
- [ ] Fal yorumcuları yalnızca atanmış siparişlerine erişebiliyor.
- [ ] Moderatörlerin yetkileri kapsamla sınırlandırılmış.
- [ ] Özel görseller herkese açık dosya alanında tutulmuyor.
- [ ] AI servislerine gereksiz kişisel veri gönderilmiyor.
- [ ] Ödeme kartı bilgileri platformda saklanmıyor.
- [ ] Webhook imzaları doğrulanıyor.
- [ ] Kullanıcı engelleme ve raporlama çalışıyor.
- [ ] Kritik yönetici işlemleri denetleniyor.
- [ ] Hesap silme süreci ilgili veri kaynaklarını kapsıyor.
- [ ] Yedekleme ve geri yükleme süreçleri test ediliyor.
- [ ] Güvenlik testleri CI/CD sürecine dahil ediliyor.
- [ ] Veri işleme ve saklama politikaları hukuk incelemesinden geçiriliyor.

---

## 22. Sonuç

Bu platformun güvenlik mimarisi, yalnızca kullanıcı hesaplarını korumak üzerine değil; kullanıcıların özel fal sonuçlarını, sosyal ilişkilerini, mesajlarını, flört tercihlerini ve finansal işlemlerini birlikte korumak üzerine kurulmalıdır.

En önemli mimari karar şudur:

**Hiçbir modül, başka bir modülün özel verilerine yalnızca aynı platformun parçası olduğu için erişememelidir.**

Her erişim açık bir yetki, kaynak sahipliği ve kullanım amacı üzerinden doğrulanmalıdır.

Bu yaklaşım, platformun gelecekte büyümesi ve yeni modüller eklenmesi durumunda da güvenlik sınırlarının korunmasını sağlayacaktır.

---

**Doküman durumu:** Teknik taslak  
**Sürüm:** 1.0.0  
**İlişkili dokümanlar:**
- `PROJECT_OVERVIEW.md`
- `APP_FEATURES.md`
- `USER_ROLES.md`
- `USER_FLOWS.md`
- `PRD.md`
- `API_SPECIFICATION.md`
- `AI_SYSTEM_DESIGN.md`
- `PAYMENT_AND_MONETIZATION.md`
- `UI_UX_GUIDELINES.md`

**Not:** Bu dokümandaki teknoloji, saklama süresi, hukuki yükümlülük ve güvenlik kontrolleri uygulama öncesinde doğrulanmalıdır.