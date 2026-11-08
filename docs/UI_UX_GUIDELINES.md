# UI_UX_GUIDELINES.md
# Kullanıcı Arayüzü ve Deneyim Rehberi

**Proje:** Fal ve Sosyal Etkileşim Platformu  
**Doküman:** UI_UX_GUIDELINES.md  
**Sürüm:** 1.0  
**Durum:** İlk Taslak  
**Tasarım Yaklaşımı:** Modern / Premium / Mistik / Sosyal  
**Uygulama Adı:** TBD

---

## 1. Tasarım Vizyonu

Uygulamanın tasarımı, geleneksel fal kültürünün merak uyandıran atmosferini modern sosyal uygulamaların kullanım kolaylığıyla birleştirmelidir.

Kullanıcı uygulamayı açtığında üç temel hissi yaşamalıdır:

1. **Merak:** Yeni bir fal deneyimleme isteği.
2. **Aidiyet:** Diğer insanlarla etkileşim kurabileceği bir ortam.
3. **Güven:** Kişisel verilerinin ve özel içeriklerinin korunduğunu hissetmesi.

Tasarım yalnızca fal teması etrafında şekillenmemelidir. Platformun sosyal ağ, topluluk, arkadaşlık ve hizmet pazaryeri özellikleri de görsel kimlikte temsil edilmelidir.

## 2. Tasarım İlkeleri

### 2.1. Sadelik

- Gereksiz dekoratif öğelerden kaçınılmalıdır.
- Ekranlarda çok fazla renk kullanılmamalıdır.
- Kullanıcının dikkatini ana işlemden uzaklaştıran animasyonlar sınırlandırılmalıdır.
- Bilgi hiyerarşisi açık olmalıdır.

### 2.2. Tutarlılık

- Tüm modüller ortak tasarım sistemi kullanmalıdır.
- Butonlar, kartlar, ikonlar ve boşluklar standartlaştırılmalıdır.
- Aynı işlem farklı ekranlarda farklı davranmamalıdır.

### 2.3. Modernlik

- Güncel mobil uygulama tasarım standartları kullanılmalıdır.
- Kart tabanlı içerik sunumu tercih edilmelidir.
- Gerektiğinde yumuşak geçişler ve mikro animasyonlar kullanılmalıdır.

### 2.4. Güven

- Ödeme adımları açık ve anlaşılır olmalıdır.
- Gizlilik ayarları kolay bulunmalıdır.
- Kullanıcı özel içeriklerini paylaşmadan önce görünürlüğü kontrol edebilmelidir.
- Falcı profillerinde doğrulama ve değerlendirme bilgileri açıkça gösterilmelidir.

### 2.5. Erişilebilirlik

- Metinler yeterli kontrasta sahip olmalıdır.
- Etkileşim alanları rahat dokunulabilir büyüklükte olmalıdır.
- Renk tek başına durum bildirmek için kullanılmamalıdır.
- Ekran okuyucu desteği düşünülmelidir.
- Dinamik yazı boyutları desteklenmelidir.

## 3. Görsel Kimlik ve Tema

### 3.1. Önerilen tasarım karakteri

<badge color="discovery">Tasarım önerisi</badge>

**Modern mistik minimalizm**

Uygulama, mistik atmosferi küçük detaylarla hissettirmeli; tüm ekranları semboller, yıldızlar ve karmaşık desenlerle doldurmamalıdır.

Önerilen görsel yaklaşım:
- Koyu arka planlar.
- Sıcak ve kontrollü vurgu renkleri.
- Yüksek okunabilirlik.
- Minimal ikonlar.
- Yumuşak köşeli kartlar.
- Kaliteli fotoğraf ve illüstrasyon kullanımı.

### 3.2. Renk paleti

Önerilen başlangıç paleti:

| Renk | HEX | Kullanım |
|---|---|---|
| Midnight | `#15151F` | Ana koyu arka plan |
| Deep Purple | `#29233B` | İkincil yüzey |
| Violet | `#8B72D9` | Ana vurgu |
| Warm Gold | `#D8B779` | Premium ve özel alanlar |
| Off White | `#F5F2EC` | Açık tema metin ve yüzey |
| Muted Gray | `#9996A5` | İkincil metin |
| Success | `#55A985` | Başarılı işlemler |
| Warning | `#E0A64F` | Uyarılar |
| Error | `#D96B73` | Hatalar |

Bu renkler ilk tasarım önerisidir. Kullanıcı testleri ve marka kimliği oluşturulduktan sonra kesinleştirilecektir.

### 3.3. Tema desteği

İlk tasarımda koyu tema ana deneyim olarak önerilmektedir.

İlerleyen aşamada:
- Koyu tema.
- Açık tema.
- Sistem temasını takip etme.

seçenekleri sunulabilir.

## 4. Tipografi

Tipografi modern, okunabilir ve sade olmalıdır.

Önerilen font aileleri:
- Inter
- Manrope
- Plus Jakarta Sans

Önerilen yazı hiyerarşisi:

| Kullanım | Boyut |
|---|---:|
| Büyük başlık | 28–32 px |
| Sayfa başlığı | 22–26 px |
| Bölüm başlığı | 18–20 px |
| Gövde metni | 14–16 px |
| Açıklama | 12–14 px |
| Küçük etiket | 10–12 px |

Font ağırlıkları:
- Regular: 400
- Medium: 500
- SemiBold: 600
- Bold: 700

Küçük metinler uzun açıklamalar için kullanılmamalıdır.

## 5. Tasarım Sistemi

### 5.1. Boşluk sistemi

8 tabanlı boşluk sistemi önerilir.

| Değer | Kullanım |
|---|---|
| 4 px | Çok küçük ayrımlar |
| 8 px | İkon ve metin arası |
| 16 px | Standart içerik boşluğu |
| 24 px | Kart ve bölüm arası |
| 32 px | Büyük bölüm ayrımı |
| 40 px | Ekran içi geniş boşluk |

### 5.2. Köşe yuvarlaklıkları

| Bileşen | Radius |
|---|---:|
| Küçük etiket | 8 px |
| Standart buton | 12 px |
| Kart | 16 px |
| Büyük panel | 20 px |
| Modal | 24 px |

### 5.3. Butonlar

Üç temel buton tipi kullanılmalıdır:

**Primary Button**
- Ana işlemler.
- Yüksek görsel öncelik.
- Tek ekranda mümkün olduğunca bir ana aksiyon.

**Secondary Button**
- Alternatif işlemler.
- Daha düşük görsel öncelik.

**Text Button**
- İkincil ve düşük riskli işlemler.
- Gereksiz görsel ağırlık oluşturmamalıdır.

Buton durumları:
- Normal.
- Basılı.
- Devre dışı.
- Yükleniyor.
- Başarılı veya hata sonrası durum.

### 5.4. Kartlar

Kartlar platformun ana içerik taşıyıcılarından biri olacaktır.

Kullanım alanları:
- Fal türleri.
- Falcı profilleri.
- Sosyal gönderiler.
- Topluluklar.
- Eşleşme önerileri.
- Siparişler.

Kartlarda:
- Başlık.
- Kısa açıklama.
- Görsel.
- Durum bilgisi.
- Gerekli aksiyon.

bulunabilir.

## 6. Navigasyon Yapısı

Ana navigasyon, kullanıcıların en sık kullanacağı modüllere hızlı erişim sağlamalıdır.

Önerilen alt navigasyon:

| Sekme | İçerik |
|---|---|
| Ana Sayfa | Öneriler ve genel keşif |
| Fal | AI Fal Merkezi |
| Keşfet | Falcılar, topluluklar ve içerikler |
| Sosyal | Sosyal akış |
| Profil | Kullanıcı hesabı |

Eşleşme, keşfet alanı içerisinden veya ayrı bir giriş noktası üzerinden sunulabilir.

Bu yapı prototip aşamasında test edilmelidir. Ana navigasyon kalabalıklaşırsa modüller yeniden gruplanmalıdır.

## 7. Ana Ekran Tasarımı

Ana ekran, kullanıcıyı bütün özelliklerle aynı anda karşı karşıya bırakmamalıdır.

Önerilen bölümler:

1. Karşılama alanı.
2. Öne çıkan fal deneyimi.
3. Popüler fal türleri.
4. Falcılar Ligi önerileri.
5. Topluluk keşfi.
6. Sosyal akıştan seçilmiş içerikler.
7. Kullanıcıya özel öneriler.

Ana ekranın sıralaması kullanıcı davranışına ve ürün hedeflerine göre değiştirilebilir.

## 8. AI Fal Merkezi Tasarımı

Fal merkezi, platformun en önemli deneyimlerinden biri olacağı için özel bir görsel kimliğe sahip olmalıdır.

### 8.1. Fal türleri ekranı

Her fal türü için:
- Temsilî görsel veya ikon.
- Fal türünün adı.
- Kısa açıklama.
- Gerekli girdiler hakkında bilgi.

Örnek fal türleri:
- Kahve falı.
- Tarot.
- Rüya yorumu.
- El falı.
- Burç yorumları.

Fal türlerinin kesin listesi ürün kapsamıyla belirlenecektir.

### 8.2. Fal girdi ekranı

- Fotoğraf yükleme alanı.
- Kamera açma seçeneği.
- Gerekli metin girişleri.
- Kullanım ve gizlilik bilgilendirmesi.
- Yorumlama butonu.

Görsel yükleme alanında desteklenen formatlar ve boyut sınırları belirtilmelidir.

### 8.3. Yükleniyor ekranı

AI yorumlama sırasında:
- İşlem durumu gösterilmelidir.
- Kullanıcıya bekleme süreci açıklanmalıdır.
- İşlem devam ederken tekrar tekrar istek gönderilmesi önlenmelidir.
- İptal veya geri dönme davranışı belirlenmelidir.

### 8.4. Fal sonucu ekranı

Sonuç ekranı uzun metinleri rahat okunabilecek biçimde sunmalıdır.

Önerilen yapı:
- Genel yorum.
- Konu başlıklarına göre yorumlar.
- Kullanıcının sorusuna yanıt.
- Kaydet ve paylaş aksiyonları.
- Yeni fal başlatma.

Yorumlar kesin gelecek bilgisi olarak sunulmamalıdır.

## 9. Falcılar Ligi Tasarımı

Falcılar Ligi, klasik bir hizmet pazaryeri gibi kullanılabilmelidir.

### Falcı liste ekranı

Her falcı kartında:
- Profil fotoğrafı.
- Kullanıcı adı.
- Uzmanlık alanları.
- Değerlendirme puanı.
- Hizmet başlangıç fiyatı.
- Uygunluk durumu.

### Falcı detay ekranı

- Profil bilgileri.
- Tanıtım metni.
- Uzmanlık alanları.
- Hizmet listesi.
- Kullanıcı değerlendirmeleri.
- Hizmet koşulları.
- Satın alma aksiyonu.

### Falcı paneli

Falcılar için ayrı bir yönetim alanı bulunmalıdır.

Bu panelde:
- Hizmet yönetimi.
- Siparişler.
- Müşteri iletişimi.
- Kazançlar.
- Değerlendirmeler.
- Profil ayarları.

yer almalıdır.

## 10. Sosyal Akış Tasarımı

Sosyal akış modern sosyal medya uygulamalarındaki gibi kolay tüketilebilir ve etkileşime açık olmalıdır.

Gönderi bileşenleri:
- Profil görseli.
- Kullanıcı adı.
- Zaman bilgisi.
- Gönderi metni.
- Görsel veya fal sonucu.
- Beğeni.
- Yorum.
- Paylaşım.
- Kaydetme.

İçeriklerin görünürlüğü ve gizlilik durumu açıkça belirtilmelidir.

## 11. Topluluk Tasarımı

Topluluk ekranları forum mantığını modern mobil deneyimle birleştirmelidir.

Topluluk kartında:
- Topluluk adı.
- Görsel.
- Açıklama.
- Üye sayısı.
- Konu sayısı.

Topluluk detay ekranında:
- Topluluk bilgisi.
- Kurallar.
- Öne çıkan konular.
- Son tartışmalar.
- Yeni konu oluşturma butonu.

Konu detayında yorumlar ve yanıtlar kolay takip edilebilir biçimde gösterilmelidir.

## 12. Eşleşme Tasarımı

Eşleşme modülü diğer platform özelliklerinden görsel olarak ayrışabilir; ancak genel tasarım sistemiyle uyumlu kalmalıdır.

Ekranlar:
- Eşleşme tanıtımı.
- Profil oluşturma.
- Tercih ayarları.
- Öneriler.
- Eşleşme detayları.
- Mesajlaşma.

Kullanıcıya eşleşme profilinin görünürlüğünü kontrol edebileceği açık bir alan sunulmalıdır.

## 13. Profil ve Ayarlar

Profil ekranı kullanıcının platformdaki kimliğini yansıtmalıdır.

Bölümler:
- Profil bilgileri.
- Paylaşımlar.
- Takipçiler.
- Takip edilenler.
- Topluluklar.
- Kaydedilen içerikler.
- Fal geçmişi.

Ayarlar:
- Hesap yönetimi.
- Gizlilik.
- Bildirimler.
- Güvenlik.
- Tema.
- Engellenen kullanıcılar.
- Destek.
- Hesap silme.

Özel fal geçmişi, herkese açık profil içeriğinden ayrı tutulmalıdır.

## 14. Bildirim Tasarımı

Bildirimler kullanıcıyı bilgilendirmeli ancak rahatsız etmemelidir.

Bildirim kategorileri:
- Sosyal.
- Mesajlaşma.
- Eşleşme.
- Fal hizmeti.
- Ödeme.
- Topluluk.
- Sistem.

Kullanıcı kategori bazında bildirimleri kapatabilmelidir.

## 15. Durumlar ve Geri Bildirim

Her önemli bileşenin farklı durumları tasarlanmalıdır.

| Durum | Kullanıcıya gösterilecek davranış |
|---|---|
| Loading | Yükleniyor göstergesi |
| Empty | Açıklayıcı boş durum |
| Error | Anlaşılır hata mesajı |
| Success | İşlem tamamlandı bildirimi |
| Disabled | İşlemin neden kullanılamadığı |
| Offline | Bağlantı uyarısı |

Boş ekranlarda kullanıcıya bir sonraki adım önerilmelidir.

## 16. Animasyon ve Mikro Etkileşimler

Animasyonlar kullanıcı deneyimini desteklemeli, dikkat dağıtmamalıdır.

Kullanılabilecek örnekler:
- Buton basılma animasyonu.
- Sayfa geçişleri.
- Kart etkileşimleri.
- Fal yorumlama sırasında yumuşak yükleme animasyonu.
- Başarılı işlem geri bildirimi.

Sürekli hareket eden arka planlardan ve gereksiz efektlerden kaçınılmalıdır.

## 17. Responsive ve Cihaz Uyumluluğu

İlk hedef mobil cihazlardır.

Tasarım:
- Farklı Android ekran boyutlarını.
- Farklı iPhone ekran boyutlarını.
- Ekran yönü değişikliklerini gerektiği ölçüde.
- Sistem yazı boyutu ayarlarını.
- Güvenli alanları ve çentikleri.

desteklemelidir.

Tablet ve web desteği ilerleyen aşamalarda değerlendirilebilir.

## 18. Flutter Tasarım Mimarisi

Flutter tarafında tekrar kullanılabilir bileşenler oluşturulmalıdır.

Önerilen klasör yapısı:

```text
lib/
├── core/
│   ├── theme/
│   │   ├── app_colors.dart
│   │   ├── app_theme.dart
│   │   └── app_typography.dart
│   ├── constants/
│   ├── components/
│   └── utilities/
│
├── features/
│   ├── authentication/
│   ├── profile/
│   ├── fortune/
│   ├── fortune_teller/
│   ├── social/
│   ├── communities/
│   ├── dating/
│   ├── messaging/
│   └── notifications/
│
└── main.dart
```

Bu yapı başlangıç önerisidir. Kesin mimari `SYSTEM_ARCHITECTURE.md` dosyasında tanımlanacaktır.

### Tasarım sistemi bileşenleri

- `AppButton`
- `AppTextField`
- `AppCard`
- `AppAvatar`
- `AppBottomNavigation`
- `AppLoading`
- `AppErrorView`
- `AppEmptyState`
- `AppDialog`
- `AppBadge`

Bileşenler farklı modüllerde tekrar kullanılabilmelidir.

## 19. Tasarım Kalite Kontrol Listesi

- [ ] Bütün ekranlar ortak renk sistemini kullanıyor.
- [ ] Tipografi hiyerarşisi tutarlı.
- [ ] Buton durumları tanımlanmış.
- [ ] Yükleniyor ve hata durumları tasarlanmış.
- [ ] Boş ekranlar kullanıcıya yol gösteriyor.
- [ ] Özel ve herkese açık içerikler görsel olarak ayrılıyor.
- [ ] Falcı doğrulama durumu açıkça gösteriliyor.
- [ ] Ödeme adımları anlaşılır.
- [ ] Eşleşme gizlilik kontrolleri erişilebilir.
- [ ] Erişilebilirlik kontrolleri yapılmış.
- [ ] Küçük ve büyük ekranlarda taşma sorunu bulunmuyor.
- [ ] Temel kullanıcı akışları kullanılabilirlik testinden geçmiş.

## 20. Açık Tasarım Kararları

- Kesin marka adı ve logosu.
- Nihai renk paleti.
- Açık tema desteğinin ilk sürümde bulunup bulunmayacağı.
- Ana navigasyonda kullanılacak sekme sayısı.
- Eşleşme modülünün ayrı sekme olup olmayacağı.
- Falcılar Ligi için özel marka görseli.
- Uygulamanın illüstrasyon dili.
- Animasyon yoğunluğu.
- Tablet ve web tasarım kapsamı.

---

**Doküman durumu:** İlk taslak tamamlandı.

**Bağlantılı dokümanlar:** `PROJECT_OVERVIEW.md`, `APP_FEATURES.md`, `USER_ROLES.md`, `USER_FLOWS.md`, `PRD.md`, `SYSTEM_ARCHITECTURE.md`.

**Geliştirme notu:** Bu doküman, Flutter arayüz geliştirmesinde temel tasarım referansı olacaktır. Nihai renkler ve ekran düzenleri prototipler üzerinden test edilerek kesinleştirilmelidir.2
## 21. Sıvı cam uygulama yönü — 2026-11-08

Dayanak: [ADR-0003](../project/decisions/ADR-0003-sivi-cam.md). Kullanıcı camın ağırlıklı kullanıldığı ve renklerin uyumlu olduğu bir tasarım istedi. Aşağıdaki palet mevcut Flutter prototipinde önceki başlangıç paletinin yerini alır; nihai marka onayı değildir.

| Rol | Renk | Kullanım |
|---|---|---|
| Gece laciverti | `#0C1020` | Ana zemin |
| Dumanlı lacivert | `#1B2339` | Yüzey ve semantik surface |
| İnci lila | `#C3BBF4` | Ana işlem, seçili öğeler |
| Sis yeşili | `#A5DAD6` | İkincil vurgu ve dekoratif ışık |
| Şampanya | `#DFD2B5` | Küçük sembol detayları |
| İnci beyazı | `#F3F4FC` | Ana metin |
| Gri mavi | `#B9C2D7` | İkincil metin |

Cam malzemesi: panel sınırına kırpılan 16 sigma arka plan bulanıklığı, okunabilirliği koruyan lacivert renk katmanı, ince açık kenar ve yumuşak gölge. Ana kartlar ve yüzen alt gezinme aynı GlassPanel bileşenini paylaşır. Formlar, ikon düğmeleri ve chip'ler geçirgen renk/kenar dilini kullanır; her küçük öğeye blur eklenmez. Gövde metinleri degradenin üzerine doğrudan çok düşük opaklıkla yerleştirilmez.

Arka plan lacivert üzerinde sabit lila/yeşil ışımalar kullanır. Ana sayfadaki yörünge/fincan süslemesi yerel çizimdir; dekoratif olup ekran okuyucudan hariçtir. Sürekli hareket veya yeni görsel/servis bağımlılığı yoktur. Bu uygulama optik kırılma simülasyonu veya yerel Apple Liquid Glass API entegrasyonu değildir.

Büyük metinler satır kırabilir; etiketler sabit genişliğe zorlanmaz. Gerçek cihazlarda blur performansı, kontrast ve daha fazla erişilebilirlik senaryosu yayın öncesinde değerlendirilmelidir. Açık tema bu dilimde uygulanmadı.
