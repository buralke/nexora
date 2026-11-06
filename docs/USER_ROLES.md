# USER_ROLES.md
# Kullanıcı Rolleri ve Yetkilendirme Sistemi

**Proje:** Fal ve Sosyal Etkileşim Platformu  
**Dosya:** USER_ROLES.md  
**Sürüm:** 1.0  
**Durum:** İlk Taslak  
**Uygulama Adı:** Henüz belirlenmedi

---

## 1. Amaç

Bu dokümanın amacı, platformda bulunacak kullanıcı rollerini, bu rollerin yetkilerini ve birbirleriyle olan ilişkilerini tanımlamaktır.

Platform; yapay zekâ destekli fal yorumlama, profesyonel falcı hizmetleri, arkadaşlık ve eşleşme, sosyal paylaşım ve topluluk özelliklerini bir araya getirecektir.

Bu nedenle her kullanıcının bütün özelliklere erişmesi doğru değildir. Kullanıcıların yalnızca görevleri ve sahip oldukları izinler doğrultusunda işlem yapabilmesi gerekir.

Yetkilendirme sistemi şu ilkeler üzerine kurulacaktır:

- En az yetki prensibi.
- Varsayılan olarak erişim reddi.
- Kullanıcıya ait verilerin kullanıcı tarafından kontrol edilmesi.
- Özel içeriklerin izinsiz görüntülenememesi.
- Yönetici işlemlerinin kayıt altına alınması.
- Birden fazla rolün aynı hesapta bulunabilmesi.

## 2. Rol Sistemi Genel Yapısı

Platformda roller iki ana gruba ayrılacaktır:

### 2.1. Temel hesap rolleri

Her kullanıcının sahip olduğu ana hesap kimliğini ve sistemdeki temel yetkilerini belirler.

| Rol | Açıklama |
|---|---|
| `USER` | Standart platform kullanıcısı |
| `SYSTEM_ADMIN` | Platformun genel yöneticisi |

### 2.2. Ek roller ve yetenekler

Kullanıcı hesabına eklenebilen, belirli özelliklere erişim sağlayan rollerdir.

| Rol | Açıklama |
|---|---|
| `FORTUNE_TELLER` | Profesyonel fal hizmeti sunan kullanıcı |
| `COMMUNITY_OWNER` | Topluluk oluşturan ve yöneten kullanıcı |
| `COMMUNITY_MODERATOR` | Belirli topluluklarda moderasyon yapan kullanıcı |
| `CONTENT_MODERATOR` | Platform genelinde içerik denetimi yapan kullanıcı |
| `SUPPORT_AGENT` | Kullanıcı destek süreçlerini yöneten görevli |

Bir kullanıcı aynı anda birden fazla ek role sahip olabilir.

Örneğin:
- Standart kullanıcı aynı zamanda profesyonel falcı olabilir.
- Falcı aynı zamanda topluluk kurabilir.
- Topluluk yöneticisi başka bir toplulukta moderatör olabilir.
- Moderatör aynı zamanda platformun standart kullanıcısı olarak sosyal özellikleri kullanabilir.

**Önemli:** Falcılık veya topluluk yöneticiliği, standart kullanıcı hesabının yerine geçen ayrı bir hesap türü değildir. Kullanıcının hesabına eklenen yeteneklerdir.

## 3. Rol Tanımları

### 3.1. USER – Standart Kullanıcı

Platforma kayıt olan her kullanıcı varsayılan olarak bu role sahip olur.

**Yetkileri:**
- Profil oluşturma ve düzenleme.
- Fal gönderme ve yapay zekâdan yorum alma.
- Fal geçmişini görüntüleme.
- Fal sonuçlarını paylaşma veya gizli tutma.
- Sosyal akışta içerik paylaşma.
- Diğer kullanıcıları takip etme.
- Arkadaşlık ve eşleşme özelliklerine katılma.
- Mesajlaşma.
- Topluluklara katılma.
- Konu açma ve yorum yapma.
- Falcılar Ligi üzerinden falcıları inceleme.
- Ücretli hizmet satın alma.

**Kısıtlamaları:**
- Başka kullanıcıların özel fal sonuçlarını göremez.
- Başka kullanıcıların hesap bilgilerini değiştiremez.
- Yetkili olmadığı topluluklarda yönetim işlemi yapamaz.
- Başka kullanıcılar adına işlem gerçekleştiremez.
- Moderasyon ve yönetim yetkilerine sahip değildir.

### 3.2. FORTUNE_TELLER – Profesyonel Falcı

Platformda ücretli veya ücretsiz profesyonel fal hizmeti sunmak isteyen kullanıcıdır.

Bu rol, Falcılar Ligi sisteminin temelini oluşturur.

**Yetkileri:**
- Falcı profili oluşturma.
- Uzmanlık alanlarını belirleme.
- Hizmet ve fiyat tanımlama.
- Hizmet açıklamalarını düzenleme.
- Gelen fal taleplerini görüntüleme.
- Kabul edilen taleplere yanıt verme.
- Kullanıcılarla hizmet kapsamında iletişim kurma.
- Tamamlanan hizmetlerden gelir elde etme.
- Kullanıcı değerlendirmelerini görüntüleme.
- Hizmet geçmişini inceleme.

**Kısıtlamaları:**
- Kullanıcıların özel fal geçmişlerine erişemez.
- Satın alınmamış hizmetlere ait özel içerikleri göremez.
- Kullanıcı adına işlem yapamaz.
- Kendi değerlendirmelerini silemez veya değiştiremez.
- Platformun ödeme ve komisyon kurallarını değiştiremez.

**Rol aktivasyonu:**

1. Kullanıcı falcı olmak için başvuru yapar.
2. Gerekli profil ve uzmanlık bilgilerini gönderir.
3. Başvuru değerlendirmeye alınır.
4. Başvuru kabul edilirse `FORTUNE_TELLER` yetkisi etkinleştirilir.
5. Kullanıcı Falcılar Ligi içerisinde hizmet sunmaya başlayabilir.

Başvurunun doğrulama yöntemi, gerekli belgeler ve değerlendirme kriterleri henüz belirlenecektir.

### 3.3. COMMUNITY_OWNER – Topluluk Sahibi

Platformda yeni bir topluluk oluşturan ve o topluluğun yönetiminden sorumlu kullanıcıdır.

Örnek topluluklar:
- Rüya Yorumları
- Kahve Falı
- Astroloji
- İlişkiler
- Kişisel Gelişim
- Gizemli Olaylar

**Yetkileri:**
- Topluluk oluşturma.
- Topluluk adını ve açıklamasını düzenleme.
- Topluluk görselini değiştirme.
- Topluluk kurallarını belirleme.
- İçerikleri sabitleme.
- İçerikleri kaldırma.
- Yorumları yönetme.
- Kullanıcıları topluluktan uzaklaştırma.
- Moderatör atama ve görevden alma.
- Topluluk üyelerini görüntüleme.

**Kısıtlamaları:**
- Başka toplulukların yönetimine müdahale edemez.
- Platform genelindeki kullanıcı hesaplarını kapatamaz.
- Sistem ayarlarını değiştiremez.
- Platform genelindeki içerikleri silemez.

Topluluk sahibinin hesabı kapatılırsa veya topluluktan ayrılırsa topluluğun sahipsiz kalmaması için bir devir mekanizması bulunmalıdır.

### 3.4. COMMUNITY_MODERATOR – Topluluk Moderatörü

Topluluk sahibi tarafından belirli bir topluluk için görevlendirilen kullanıcıdır.

**Yetkileri:**
- Topluluk kurallarına aykırı içerikleri kaldırma.
- Yorumları denetleme.
- Uygunsuz içerikleri raporlama.
- Kullanıcılara uyarı gönderme.
- Yetkisi varsa kullanıcıları geçici olarak uzaklaştırma.
- Topluluk tartışmalarını düzenli tutma.

**Kısıtlamaları:**
- Topluluk sahibinin yetkilerini devralamaz.
- Topluluğu silemez.
- Sahibi değiştiremez.
- Başka topluluklarda işlem yapamaz.
- Platform genelinde kullanıcı banlayamaz.

Moderatörün yetkileri yalnızca görevlendirildiği topluluk için geçerlidir.

### 3.5. CONTENT_MODERATOR – İçerik Moderatörü

Platform genelinde kullanıcı içeriklerini denetlemekle görevli personeldir.

**Yetkileri:**
- Şikâyet edilen içerikleri inceleme.
- Uygunsuz içerikleri kaldırma veya gizleme.
- Kullanıcı raporlarını değerlendirme.
- Topluluk ihlallerini inceleme.
- Kullanıcılara uyarı gönderme.
- Moderasyon geçmişini görüntüleme.
- Gerekli durumlarda üst yönetime bildirim oluşturma.

**Kısıtlamaları:**
- Kullanıcıların özel mesajlarını keyfî olarak görüntüleyemez.
- Kullanıcıların ödeme bilgilerini değiştiremez.
- Finansal işlemleri yönetemez.
- Sistem altyapısına müdahale edemez.
- Yetkisi yoksa kullanıcı hesabını kalıcı olarak kapatamaz.

### 3.6. SUPPORT_AGENT – Kullanıcı Destek Görevlisi

Kullanıcıların teknik sorunlarını ve platformla ilgili taleplerini çözmek için görevlendirilir.

**Yetkileri:**
- Destek taleplerini görüntüleme.
- Kullanıcılarla destek kapsamında iletişim kurma.
- Sorun kayıtları oluşturma.
- Ödeme sorunlarını ilgili yetki sınırları içerisinde inceleme.
- Talepleri ilgili birimlere yönlendirme.

**Kısıtlamaları:**
- Kullanıcı parolasını görüntüleyemez.
- Kullanıcı adına parola belirleyemez.
- Özel mesajlara erişemez.
- Finansal işlemleri doğrudan gerçekleştiremez.
- Kullanıcı hesaplarını keyfî olarak kapatamaz.

### 3.7. SYSTEM_ADMIN – Sistem Yöneticisi

Platformun en yüksek yetki seviyesine sahip rolüdür.

**Yetkileri:**
- Kullanıcıları yönetme.
- Rolleri atama ve kaldırma.
- Falcı başvurularını onaylama veya reddetme.
- Toplulukları yönetme.
- Moderasyon işlemlerini inceleme.
- Sistem ayarlarını yönetme.
- Platform istatistiklerini görüntüleme.
- Ödeme ve komisyon yapılandırmalarını yönetme.
- Yapay zekâ servislerini yapılandırma.
- Kullanıcı şikâyetlerini inceleme.
- Platform genelindeki operasyonları yönetme.

**Güvenlik kuralları:**
- Yönetici işlemleri kayıt altına alınmalıdır.
- Kritik işlemlerde ek doğrulama uygulanmalıdır.
- Yönetici hesaplarında çok faktörlü doğrulama zorunlu tutulmalıdır.
- Hassas kullanıcı verilerine erişim görev gerekliliğiyle sınırlandırılmalıdır.
- Yönetici yetkileri günlük kullanım hesabından ayrılabilmelidir.

## 4. Yetki Matrisi

Aşağıdaki tabloda temel rollerin ana işlem gruplarına erişimi gösterilmiştir.

| İşlem | USER | FORTUNE_TELLER | COMMUNITY_OWNER | COMMUNITY_MODERATOR | CONTENT_MODERATOR | SYSTEM_ADMIN |
|---|---|---|---|---|---|---|
| Profil yönetimi | Kendi | Kendi | Kendi | Kendi | Kendi | Yetkili |
| AI falı alma | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Falcı hizmeti sunma | - | ✓ | - | - | - | Yönetim |
| Falcı başvurusu | ✓ | ✓ | ✓ | ✓ | ✓ | Yönetim |
| Sosyal paylaşım | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Eşleşme | İsteğe bağlı | İsteğe bağlı | İsteğe bağlı | İsteğe bağlı | İsteğe bağlı | - |
| Topluluk oluşturma | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Topluluk yönetimi | - | - | Kendi | Atandığı | Moderasyon yetkisi | ✓ |
| İçerik moderasyonu | - | - | Kendi topluluğu | Atandığı topluluk | Platform geneli | ✓ |
| Kullanıcı banlama | - | - | Kendi topluluğu | Sınırlı | Yetkili | ✓ |
| Rol yönetimi | - | - | - | - | - | ✓ |
| Ödeme yönetimi | Kendi işlemleri | Kendi kazancı | - | - | - | ✓ |
| Sistem ayarları | - | - | - | - | - | ✓ |

Not: `COMMUNITY_OWNER` ve `COMMUNITY_MODERATOR` yetkileri yalnızca ilgili topluluk kapsamında değerlendirilmelidir. Tablodaki işaretler kapsamlı izin kontrolünün yerine geçmez.

## 5. İzin Kodları

Sistemde yetkiler yalnızca rol isimleri üzerinden kontrol edilmemelidir. Her işlem için ayrı bir izin kodu tanımlanmalıdır.

Örnek izin grupları:

### Kullanıcı ve profil izinleri

- `user.profile.read`
- `user.profile.update`
- `user.account.deactivate`
- `user.account.delete`

### Fal izinleri

- `fortune.create`
- `fortune.read.own`
- `fortune.update.own`
- `fortune.delete.own`
- `fortune.ai.interpret`
- `fortune.share`

### Falcı izinleri

- `fortune_teller.profile.manage`
- `fortune_teller.service.create`
- `fortune_teller.service.update`
- `fortune_teller.request.read`
- `fortune_teller.request.accept`
- `fortune_teller.request.complete`
- `fortune_teller.earnings.read`

### Sosyal ağ izinleri

- `social.post.create`
- `social.post.update.own`
- `social.post.delete.own`
- `social.comment.create`
- `social.comment.delete.own`
- `social.user.follow`

### Eşleşme izinleri

- `dating.profile.enable`
- `dating.profile.manage`
- `dating.match.view`
- `dating.match.accept`
- `dating.match.reject`

### Topluluk izinleri

- `community.create`
- `community.update.own`
- `community.delete.own`
- `community.member.manage`
- `community.moderator.assign`
- `community.post.pin`
- `community.post.remove`

### Moderasyon izinleri

- `moderation.report.read`
- `moderation.content.hide`
- `moderation.content.remove`
- `moderation.user.warn`
- `moderation.user.suspend`
- `moderation.user.ban`

### Yönetim izinleri

- `admin.user.manage`
- `admin.role.assign`
- `admin.role.revoke`
- `admin.system.configure`
- `admin.payment.manage`
- `admin.ai.configure`
- `admin.audit.read`

İzin kodları uygulama geliştirme sürecinde genişletilebilir.

## 6. Veri Sahipliği ve Erişim Kuralları

Bir kullanıcının bir role sahip olması, başka kullanıcıların özel verilerine erişebileceği anlamına gelmez.

### 6.1. Fal verileri

- Falı oluşturan kullanıcı kendi falını görüntüleyebilir.
- AI yorumlama servisi yalnızca yorumlama için gerekli verilere erişebilir.
- İnsan falcı, yalnızca kendisine atanmış ve kullanıcı tarafından hizmet kapsamında paylaşılmış fal verilerini görüntüleyebilir.
- Kullanıcı falını sosyal akışta paylaşmadığı sürece diğer kullanıcılar göremez.
- Özel fal içerikleri varsayılan olarak gizli olmalıdır.

### 6.2. Mesajlaşma

- Kullanıcılar yalnızca kendilerine ait veya katılımcısı oldukları konuşmalara erişebilir.
- Topluluk moderatörleri özel mesajları otomatik olarak görüntüleyemez.
- Şikâyet edilen mesajların incelenmesi, ilgili güvenlik ve moderasyon prosedürlerine bağlı olmalıdır.

### 6.3. Eşleşme

- Eşleşme sistemi varsayılan olarak kapalı olmalıdır.
- Kullanıcı eşleşmeye katılmayı kendisi seçmelidir.
- Kullanıcı istediği zaman eşleşme profilini devre dışı bırakabilmelidir.
- Eşleşme verileri diğer sosyal modüllerden erişim bakımından ayrıştırılmalıdır.

### 6.4. Ödeme ve kazanç

- Kullanıcı yalnızca kendi ödeme geçmişini görüntüleyebilir.
- Falcı yalnızca kendi hizmetlerinden elde ettiği kazançları görüntüleyebilir.
- Platform yöneticileri finansal verilere görev ve yetki sınırları içerisinde erişebilir.
- Kart bilgileri platform tarafından doğrudan saklanmamalı; uygun ödeme sağlayıcısı kullanılmalıdır.

## 7. Rol Atama ve Kaldırma Süreçleri

### 7.1. Falcı rolü

```text
USER
  |
  v
Başvuru oluştur
  |
  v
Başvuru değerlendirmesi
  |
  +---- Reddedildi ---> Kullanıcı bilgilendirilir
  |
  v
Onaylandı
  |
  v
FORTUNE_TELLER etkinleştirilir
  |
  v
Falcılar Ligi'nde hizmet sunumu
```

### 7.2. Topluluk moderatörü rolü

```text
COMMUNITY_OWNER
  |
  v
Moderatör seçimi
  |
  v
Görev daveti
  |
  v
Kullanıcı kabul eder
  |
  v
COMMUNITY_MODERATOR etkinleşir
  |
  v
Belirlenen yetkilerle moderasyon
```

### 7.3. Rolün kaldırılması

Bir rol aşağıdaki durumlarda kaldırılabilir:

- Kullanıcının kendi isteği.
- Yetkili yöneticinin kararı.
- Güvenlik ihlali.
- Platform kurallarının ihlali.
- Görev süresinin sona ermesi.
- Gerekli doğrulamaların geçerliliğini kaybetmesi.

Rol kaldırıldığında ilgili izinler derhal devre dışı bırakılmalıdır. Ancak geçmiş işlemlere ait kayıtlar denetim amacıyla korunmalıdır.

## 8. Yetki Önceliği ve Çakışmalar

Bir kullanıcı birden fazla role sahip olduğunda izinler birleştirilerek değerlendirilir.

Örnek:

Bir kullanıcı hem `USER` hem `FORTUNE_TELLER` hem de `COMMUNITY_OWNER` ise:
- Standart kullanıcı özelliklerini kullanabilir.
- Falcılık hizmeti sunabilir.
- Sahibi olduğu topluluğu yönetebilir.
- Başka topluluklarda yönetim yetkisi kazanmaz.

**Önemli güvenlik kuralı:** Bir rolün sahip olduğu yetki, diğer rolün kapsamını genişletmemelidir.

Örneğin bir kullanıcı hem falcı hem moderatör olsa bile moderatör yetkisi ona başka kullanıcıların özel fal geçmişini görüntüleme hakkı vermez.

## 9. Denetim Kayıtları (Audit Logs)

Aşağıdaki işlemler kayıt altına alınmalıdır:

- Rol atama ve kaldırma.
- Falcı başvurusunun onaylanması veya reddedilmesi.
- Kullanıcı hesabının askıya alınması.
- Kullanıcı hesabının kapatılması.
- İçerik silme veya gizleme.
- Topluluk sahipliği devri.
- Ödeme ve iade işlemleri.
- Yönetici ayarlarının değiştirilmesi.
- Hassas verilere yapılan yetkili erişimler.

Önerilen kayıt alanları:

| Alan | Açıklama |
|---|---|
| `id` | Kayıt kimliği |
| `actor_id` | İşlemi gerçekleştiren kullanıcı |
| `action` | Gerçekleştirilen işlem |
| `target_type` | İşlem yapılan nesnenin türü |
| `target_id` | İşlem yapılan nesnenin kimliği |
| `created_at` | İşlem zamanı |
| `ip_address` | Güvenlik amacıyla IP bilgisi |
| `metadata` | Ek işlem bilgileri |

Audit kayıtları sıradan kullanıcılar tarafından değiştirilememelidir.

## 10. Güvenlik İlkeleri

Yetkilendirme altyapısı aşağıdaki kurallara göre geliştirilecektir:

1. Her API isteğinde sunucu tarafında yetki kontrolü yapılmalıdır.
2. Mobil uygulamada buton gizlemek güvenlik önlemi olarak kabul edilmemelidir.
3. Kullanıcının rol bilgisi istemciden gelen veriye güvenilerek belirlenmemelidir.
4. Varsayılan izin politikası erişimi reddetmek olmalıdır.
5. Kullanıcıya özel veriler sahiplik kontrolünden geçmelidir.
6. Kritik yönetici işlemleri denetlenmelidir.
7. Rol değişiklikleri mevcut oturumlarda da güvenli biçimde uygulanmalıdır.
8. Hassas verilere erişim sınırlandırılmalıdır.
9. Yetki kontrolleri otomatik testlerle doğrulanmalıdır.
10. Kullanıcı verileri yürürlükteki gizlilik ve veri koruma yükümlülüklerine uygun işlenmelidir.

## 11. Örnek Yetkilendirme Senaryoları

**Senaryo 1: Standart kullanıcı başka bir kullanıcının falını açmaya çalışıyor.**

Beklenen sonuç: Erişim reddedilir.

**Senaryo 2: Falcı kendisine atanmış bir fal talebini görüntülüyor.**

Beklenen sonuç: Kullanıcının ilgili hizmet için paylaşım izni ve geçerli talep ilişkisi varsa erişim sağlanır.

**Senaryo 3: Topluluk moderatörü başka bir topluluğun içeriğini silmeye çalışıyor.**

Beklenen sonuç: Erişim reddedilir.

**Senaryo 4: Topluluk sahibi moderatör atıyor.**

Beklenen sonuç: Seçilen kullanıcı daveti kabul ettiğinde ilgili topluluk kapsamında moderatör yetkisi etkinleşir.

**Senaryo 5: Kullanıcı eşleşme özelliğini kapatıyor.**

Beklenen sonuç: Eşleşme profilinin görünürlüğü ve yeni eşleşme süreci durdurulur.

**Senaryo 6: Sistem yöneticisi bir falcının rolünü kaldırıyor.**

Beklenen sonuç: Falcılık izinleri devre dışı bırakılır. Kullanıcı standart hesabını kullanmaya devam eder.

## 12. Henüz Karar Verilmesi Gereken Konular

Aşağıdaki maddeler geliştirme öncesinde netleştirilmelidir:

- Falcı başvurusu için kimlik veya belge doğrulaması gerekecek mi?
- Falcılar için yaş sınırı ne olacak?
- Falcı değerlendirme ve puanlama sistemi nasıl işleyecek?
- Topluluk oluşturmak için minimum hesap yaşı veya etkinlik şartı olacak mı?
- Topluluk sahipleri moderatörlerine hangi yetkileri verebilecek?
- Platform moderatörleri hangi yaptırımları uygulayabilecek?
- Kullanıcı hesabı kapatıldığında içeriklerinin akıbeti ne olacak?
- Bir topluluğun sahibi hesabını kapatırsa topluluk kime devredilecek?
- Destek görevlileri hangi kullanıcı verilerini görüntüleyebilecek?
- Yönetici işlemlerinde çift onay gerektiren işlemler hangileri olacak?

## 13. Kabul Kriterleri

Bu dokümanın uygulamaya hazır kabul edilebilmesi için:

- [ ] Her kullanıcı varsayılan olarak `USER` rolüne sahip olmalı.
- [ ] Kullanıcıya birden fazla ek rol atanabilmeli.
- [ ] Roller ayrı izinlerle ilişkilendirilmeli.
- [ ] Falcı başvurusu ve onay süreci çalışmalı.
- [ ] Topluluk sahibi ve moderatör yetkileri birbirinden ayrılmalı.
- [ ] Topluluk moderatörleri yalnızca atanmış oldukları topluluklarda işlem yapabilmeli.
- [ ] Kullanıcılar özel fal verilerine izinsiz erişememeli.
- [ ] Eşleşme özelliği kullanıcı tercihine bağlı olmalı.
- [ ] Yönetici işlemleri audit log sistemine kaydedilmeli.
- [ ] Yetki kontrolleri sunucu tarafında uygulanmalı.
- [ ] Rol kaldırıldığında ilgili izinler devre dışı kalmalı.
- [ ] Yetkisiz erişim denemeleri güvenli şekilde reddedilmeli.

---

**Doküman durumu:** İlk taslak tamamlandı.  
**Bağlantılı dokümanlar:** `PROJECT_OVERVIEW.md`, `APP_FEATURES.md`, `USER_FLOWS.md`, `SYSTEM_ARCHITECTURE.md`, `DATABASE_SCHEMA.md`.

**Geliştirme notu:** Bu rol sistemi, veritabanı ve API mimarisi tasarlanırken temel yetkilendirme referansı olarak kullanılacaktır. Kesinleşmemiş iş kuralları geliştirme sırasında varsayılmamalı, ürün kararına bağlanmalıdır.