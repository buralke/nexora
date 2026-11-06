# FLUTTER_ARCHITECTURE.md

# Flutter Uygulama Mimarisi

**Proje:** AI Destekli Fal ve Sosyal Etkileşim Platformu  
**Dosya:** `FLUTTER_ARCHITECTURE.md`  
**Sürüm:** 1.0.0  
**Durum:** Teknik mimari taslağı  
**Platform:** Android / iOS

---

## 1. Amaç

Bu doküman, mobil uygulamanın Flutter kullanılarak hangi mimari prensiplerle geliştirileceğini tanımlar.

Hedefimiz yalnızca çalışan ekranlar üretmek değil; büyüyebilen, test edilebilen, sürdürülebilir ve yeni özelliklerin kolayca eklenebildiği bir mobil uygulama altyapısı oluşturmaktır.

Uygulama aşağıdaki temel modülleri kapsayacaktır:

- Kimlik doğrulama
- Kullanıcı profili
- AI Fal Merkezi
- Falcılar Ligi
- Sosyal akış
- Topluluklar
- Flört ve eşleşme
- Mesajlaşma
- Bildirimler
- Ayarlar

Her modül kendi sorumluluk alanına sahip olacak, ancak gerektiğinde ortak altyapı servislerini kullanabilecektir.

---

## 2. Mimari Yaklaşım

Önerilen mimari:

**Feature-Based Architecture + Clean Architecture + Repository Pattern**

Bu yaklaşımda uygulama hem özelliklere göre hem de katmanlara göre ayrılır.

### 2.1. Temel katmanlar

| Katman | Sorumluluk |
|---|---|
| Presentation | Ekranlar, widget'lar ve kullanıcı etkileşimleri |
| Application | Use case'ler ve uygulama iş akışları |
| Domain | İş kuralları, entity ve repository sözleşmeleri |
| Data | API iletişimi, DTO, repository implementasyonları ve veri kaynakları |
| Core | Ortak altyapı, yardımcı sınıflar ve uygulama genelindeki servisler |

### 2.2. Veri akışı

Bir kullanıcı fal oluşturduğunda örnek akış:

1. Kullanıcı Presentation katmanında fal oluşturma işlemini başlatır.
2. Application katmanındaki ilgili Use Case çağrılır.
3. Use Case, Domain katmanında tanımlanmış repository arayüzünü kullanır.
4. Data katmanındaki repository implementasyonu API servisine ulaşır.
5. Backend işlemi gerçekleştirir.
6. Sonuç katmanlar üzerinden Presentation'a döner.
7. Arayüz başarılı veya hatalı durumu gösterir.

Presentation katmanı doğrudan HTTP isteği gerçekleştirmemelidir.

---

## 3. Önerilen Teknoloji Seti

| Alan | Önerilen teknoloji | Durum |
|---|---|---|
| Mobil framework | Flutter | Belirlendi |
| Programlama dili | Dart | Belirlendi |
| State management | Riverpod | Önerildi |
| Routing | GoRouter | Önerildi |
| HTTP istemcisi | Dio | Önerildi |
| Model serialization | Freezed + json_serializable | Önerildi |
| Local storage | SharedPreferences / Secure Storage | Önerildi |
| Görsel önbellekleme | Cached Network Image | Önerildi |
| Form yönetimi | Flutter Form + özel doğrulama katmanı | Önerildi |
| Realtime | WebSocket tabanlı istemci | Backend kararına bağlı |
| Push notifications | Firebase Cloud Messaging | Önerildi |
| Hata izleme | Sentry veya Firebase Crashlytics | TBD |
| Test | flutter_test / mocktail | Önerildi |

Bu teknolojiler başlangıç önerileridir. Backend mimarisi ve ekip ihtiyaçları doğrultusunda kesinleştirilecektir.

---

## 4. Proje Klasör Yapısı

Önerilen temel yapı:

```text
lib/
│
├── main.dart
├── bootstrap.dart
│
├── app/
│   ├── app.dart
│   ├── router/
│   │   ├── app_router.dart
│   │   └── route_names.dart
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── app_colors.dart
│   │   ├── app_typography.dart
│   │   └── app_spacing.dart
│   └── config/
│       ├── app_config.dart
│       └── environment.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   ├── storage/
│   ├── security/
│   ├── permissions/
│   ├── utils/
│   ├── extensions/
│   ├── services/
│   └── widgets/
│
├── shared/
│   ├── models/
│   ├── widgets/
│   ├── components/
│   └── providers/
│
├── features/
│   ├── auth/
│   ├── onboarding/
│   ├── profile/
│   ├── fortune/
│   ├── fortune_marketplace/
│   ├── social/
│   ├── communities/
│   ├── dating/
│   ├── chat/
│   ├── notifications/
│   ├── search/
│   ├── settings/
│   └── support/
│
└── l10n/
```

### 4.1. Feature klasör standardı

Her feature kendi içinde aşağıdaki yapıyı takip etmelidir:

```text
features/
└── fortune/
    ├── presentation/
    │   ├── pages/
    │   ├── widgets/
    │   └── providers/
    │
    ├── application/
    │   └── use_cases/
    │
    ├── domain/
    │   ├── entities/
    │   ├── repositories/
    │   └── value_objects/
    │
    └── data/
        ├── datasources/
        ├── dto/
        ├── models/
        └── repositories/
```

Küçük modüllerde gereksiz dosya ve katman oluşturulmayacaktır. Yapı, gerçek karmaşıklık arttıkça genişletilecektir.

---

## 5. Feature Modülleri

### 5.1. Auth

Sorumlulukları:

- Kayıt
- Giriş
- Çıkış
- Parola sıfırlama
- Token yenileme
- Oturum kontrolü
- Kullanıcı doğrulama

Örnek sayfalar:

```text
auth/
├── presentation/
│   ├── pages/
│   │   ├── login_page.dart
│   │   ├── register_page.dart
│   │   └── forgot_password_page.dart
│   └── widgets/
```

### 5.2. Fortune

AI fal işlemlerinin mobil arayüzünü yönetir.

Sorumlulukları:

- Fal türü seçimi
- Görsel yükleme
- Fal oluşturma
- İşlem durumunu takip etme
- Sonuç görüntüleme
- Fal geçmişi
- Fal paylaşımı başlatma

### 5.3. Fortune Marketplace

Falcılar Ligi arayüzünü yönetir.

Sorumlulukları:

- Yorumcu keşfetme
- Yorumcu profili
- Hizmet detayları
- Sipariş oluşturma
- Sipariş takibi
- Değerlendirme
- Yorumcu paneli

### 5.4. Social

Sorumlulukları:

- Akış görüntüleme
- Gönderi oluşturma
- Gönderi düzenleme
- Beğeni
- Yorum
- Takip
- Kaydetme
- Raporlama

### 5.5. Communities

Sorumlulukları:

- Topluluk keşfetme
- Topluluk oluşturma
- Üyelik işlemleri
- Konu oluşturma
- Yorum ve yanıtlar
- Moderasyon arayüzü

### 5.6. Dating

Sorumlulukları:

- Flört modülüne katılım
- Tercih ayarları
- Profil keşfetme
- Beğenme ve geçme
- Eşleşme listesi
- Eşleşme yönetimi

Flört modülü devre dışı bırakıldığında diğer uygulama modülleri çalışmaya devam etmelidir.

### 5.7. Chat

Sorumlulukları:

- Konuşma listesi
- Mesaj gönderme
- Mesaj alma
- Mesaj geçmişi
- Okundu bilgisi
- Yazıyor göstergesi
- Engelleme ve raporlama

Realtime bağlantısı feature içerisinde doğrudan yönetilmek yerine ortak altyapı servisleri üzerinden sağlanmalıdır.

---

## 6. State Management

Başlangıç için Riverpod önerilmektedir.

### 6.1. State yönetimi prensipleri

- UI doğrudan API çağırmaz.
- İş kuralları widget içerisine yazılmaz.
- Her feature kendi state yapısını yönetir.
- Ortak state yalnızca gerçekten ortak olan veriler için kullanılır.
- Asenkron işlemlerde loading, success ve error durumları tanımlanır.
- Gereksiz global state kullanımından kaçınılır.

### 6.2. Örnek state yapısı

```dart
sealed class FortuneState {}

class FortuneInitial extends FortuneState {}

class FortuneLoading extends FortuneState {}

class FortuneSuccess extends FortuneState {
  final FortuneResult result;

  FortuneSuccess(this.result);
}

class FortuneError extends FortuneState {
  final String message;

  FortuneError(this.message);
}
```

Bu örnek, state durumlarının açık biçimde modellenmesini gösterir. Riverpod'un AsyncValue yapısı da uygun yerlerde tercih edilebilir.

### 6.3. State ayrımı

| State | Kapsam |
|---|---|
| Authentication State | Kullanıcı oturumu |
| Profile State | Profil verileri |
| Fortune State | Fal oluşturma ve sonuç |
| Social State | Akış ve etkileşimler |
| Chat State | Konuşmalar |
| Dating State | Eşleşme ve tercihler |
| Notification State | Bildirimler |

---

## 7. API ve Network Katmanı

HTTP iletişimi ortak bir network katmanından yönetilecektir.

### 7.1. Dio yapılandırması

- Base URL ortam değişkenlerinden alınmalıdır.
- Timeout değerleri tanımlanmalıdır.
- Authorization header merkezi olarak eklenmelidir.
- Token yenileme mekanizması kontrollü çalışmalıdır.
- Hata cevapları ortak modele dönüştürülmelidir.
- İstek ve cevap logları üretim ortamında hassas veri içermemelidir.

### 7.2. Örnek yapı

```text
core/network/
├── dio_client.dart
├── api_endpoints.dart
├── auth_interceptor.dart
├── error_interceptor.dart
├── api_response.dart
└── network_exception.dart
```

### 7.3. API iletişim prensipleri

1. API endpointleri tek bir merkezi yapıdan yönetilir.
2. Feature servisleri yalnızca kendi sorumluluk alanındaki endpointleri kullanır.
3. JSON dönüşümleri DTO katmanında gerçekleştirilir.
4. Domain entity'leri doğrudan API response modellerine bağımlı olmaz.
5. Network hataları kullanıcıya anlaşılır mesajlarla sunulur.

---

## 8. Routing ve Navigasyon

Uygulama navigasyonu GoRouter ile yönetilebilir.

### 8.1. Ana navigasyon

Önerilen alt navigasyon:

| Sekme | İçerik |
|---|---|
| Ana Sayfa | Öneriler ve genel keşif |
| Fal | AI Fal Merkezi |
| Keşfet | Kullanıcılar, yorumcular ve topluluklar |
| Sosyal | Gönderi akışı |
| Profil | Kullanıcı hesabı |

Flört özellikleri Keşfet veya ayrı bir alt ekran üzerinden açılabilir.

### 8.2. Route koruması

- Giriş gerektiren sayfalar authentication kontrolünden geçmelidir.
- Yetkili ekranlar role göre korunmalıdır.
- Flört ekranları modül katılımı kontrolü yapmalıdır.
- Kullanıcı çıkış yaptığında korumalı ekranlara erişememelidir.
- Deep link yönlendirmeleri de yetkilendirme kontrolünden geçmelidir.

Örnek route grupları:

```text
/auth/login
/auth/register
/home
/fortune
/fortune/create
/fortune/:id
/marketplace
/marketplace/teller/:id
/social
/communities
/communities/:id
/dating
/chat
/chat/:conversationId
/profile
/settings
```

Route erişimi güvenlik kontrolünün yerine geçmez. Asıl yetkilendirme backend tarafında yapılmalıdır.

---

## 9. Tema ve Tasarım Sistemi

UI bileşenleri merkezi tasarım sistemi üzerinden oluşturulmalıdır.

Referans: `UI_UX_GUIDELINES.md`

### 9.1. Tema yapısı

```text
app/theme/
├── app_theme.dart
├── app_colors.dart
├── app_typography.dart
├── app_spacing.dart
├── app_radius.dart
└── app_shadows.dart
```

### 9.2. Renk sistemi

Başlangıç tasarım paleti:

| Renk | HEX | Kullanım |
|---|---|---|
| Midnight | #15151F | Ana arka plan |
| Deep Purple | #29233B | İkincil yüzey |
| Violet | #8B72D9 | Vurgu |
| Warm Gold | #D8B779 | Premium detay |
| Off White | #F5F2EC | Ana metin |
| Muted Gray | #9996A5 | İkincil metin |

Renkler widget dosyalarında doğrudan tanımlanmamalıdır.

### 9.3. Ortak widgetlar

- PrimaryButton
- SecondaryButton
- AppTextField
- AppCard
- LoadingView
- ErrorView
- EmptyState
- UserAvatar
- FortuneCard
- PostCard
- BottomNavigation

Ortak widgetlar yalnızca birden fazla modülde tekrar kullanıldığında shared katmanına taşınmalıdır.

---

## 10. Dosya ve Görsel Yönetimi

Görsel yükleme işlemleri ortak dosya servisi üzerinden yürütülmelidir.

- Görsel seçimi
- Dosya boyutu kontrolü
- Format doğrulama
- Gerekirse görsel sıkıştırma
- Upload progress
- Yükleme hatası yönetimi
- Güvenli dosya referansı saklama

Kullanıcı görselleri ve fal fotoğrafları aynı görünürlük politikasına sahip olmak zorunda değildir. Özel fal görselleri herkese açık medya olarak saklanmamalıdır.

---

## 11. Realtime ve Bildirimler

### 11.1. Realtime

Mesajlaşma, yazıyor göstergesi ve çevrimiçi durum gibi özellikler realtime altyapısını kullanabilir.

Mobil uygulama:

- Bağlantı kurma
- Bağlantı kesilmesini algılama
- Yeniden bağlanma
- Mesaj olaylarını dinleme
- Bağlantı durumunu gösterme

işlemlerini merkezi servis üzerinden yürütmelidir.

Mesajların kalıcı kaynağı backend olmalıdır. Socket bağlantısı kesildiğinde mesaj geçmişi API üzerinden tekrar senkronize edilebilmelidir.

### 11.2. Push notifications

FCM veya seçilecek bildirim sağlayıcısı üzerinden:

- Fal sonucu hazır
- Yeni mesaj
- Yeni eşleşme
- Sipariş güncellemesi
- Sosyal etkileşim

bildirimleri alınabilir.

Bildirim içeriği özel veri sızdırmayacak şekilde tasarlanmalıdır. Örneğin kilit ekranında özel fal yorumunun tamamı gösterilmemelidir.

---

## 12. Local Storage ve Cache

Yerel depolama iki ana gruba ayrılmalıdır.

### 12.1. Güvenli depolama

Secure Storage:

- Access token
- Refresh token
- Hassas oturum bilgileri

### 12.2. Normal yerel depolama

SharedPreferences veya uygun yerel veri tabanı:

- Tema tercihi
- Dil tercihi
- Onboarding durumu
- Son seçilen filtreler
- Hassas olmayan kullanıcı tercihleri

Özel fal sonuçları ve mesajlar gereksiz yere kalıcı yerel depolamada tutulmamalıdır.

### 12.3. Cache stratejisi

- Profil görselleri önbelleğe alınabilir.
- Sosyal akış sayfalı şekilde yüklenebilir.
- Eski cache verileri gerektiğinde temizlenmelidir.
- Özel içeriklerin cache politikası ayrıca belirlenmelidir.
- Kullanıcı çıkış yaptığında kullanıcıya ait hassas cache temizlenmelidir.

---

## 13. Hata Yönetimi

Uygulamada ortak hata modeli bulunmalıdır.

Örnek hata kategorileri:

| Hata | Davranış |
|---|---|
| Network Error | Bağlantı uyarısı |
| Unauthorized | Oturum yenileme veya giriş |
| Forbidden | Yetki uyarısı |
| Not Found | İçerik bulunamadı |
| Validation Error | Alan bazlı hata |
| Rate Limited | Bekleme ve tekrar deneme |
| Server Error | Genel hata ve tekrar deneme seçeneği |

Kullanıcıya teknik stack trace veya hassas backend hata detayları gösterilmemelidir.

---

## 14. Performans ve Ölçeklenebilirlik

- Uzun listeler lazy loading kullanmalıdır.
- Görseller uygun boyutlarda yüklenmelidir.
- Gereksiz widget rebuild işlemleri azaltılmalıdır.
- Ağ istekleri ihtiyaç dışı tekrarlanmamalıdır.
- Pagination uygulanmalıdır.
- Büyük işlemler arka planda yürütülmelidir.
- Fal oluşturma gibi uzun süren işlemlerde progress veya işlem durumu gösterilmelidir.

### 14.1. Performans hedefleri

Başlangıç hedefleri:

- İlk ekranın hızlı açılması.
- Navigasyon geçişlerinin akıcı olması.
- Ağ isteklerinde loading ve timeout kontrolü.
- Büyük görsellerin optimize edilmesi.
- Düşük bağlantı kalitesinde hata toleransı.

Kesin performans hedefleri gerçek cihaz ve ağ testlerinden sonra belirlenmelidir.

---

## 15. Test Mimarisi

Testler üç seviyede yürütülmelidir.

### 15.1. Unit Tests

- Use Case testleri
- Repository testleri
- Model dönüşüm testleri
- Validator testleri
- Yardımcı fonksiyon testleri

### 15.2. Widget Tests

- Login ekranı
- Fal oluşturma ekranı
- Fal sonuç ekranı
- Gönderi kartları
- Profil ekranı
- Form doğrulamaları

### 15.3. Integration Tests

- Kayıt ve giriş
- Fal oluşturma
- Fal geçmişini görüntüleme
- Sosyal gönderi oluşturma
- Sipariş oluşturma
- Mesajlaşma
- Eşleşme akışı

Özel veri ve ödeme işlemlerinde yetkilendirme testleri kritik kabul edilmelidir.

---

## 16. Ortam Yönetimi

En az üç farklı yapılandırma kullanılmalıdır:

| Ortam | Amaç |
|---|---|
| Development | Günlük geliştirme |
| Staging | Yayın öncesi test |
| Production | Gerçek kullanıcılar |

Ortam değişkenleri ve API adresleri merkezi olarak yönetilmelidir.

Gizli anahtarlar mobil uygulamaya gömülmemelidir. Mobil uygulamada kullanılan yapılandırma değerlerinin kullanıcı tarafından çıkarılabileceği varsayılmalıdır.

---

## 17. Kod Standartları

- Dosya ve sınıf isimleri tutarlı olmalıdır.
- Dart naming conventions uygulanmalıdır.
- Widget dosyaları gereksiz büyütülmemelidir.
- Tekrarlanan kodlar ortaklaştırılmalıdır.
- Business logic UI içerisinde tutulmamalıdır.
- Gereksiz soyutlama oluşturulmamalıdır.
- Her feature kendi sorumluluğuna sahip olmalıdır.
- Kod incelemesi yapılmadan ana dala birleştirme yapılmamalıdır.

### 17.1. İsimlendirme

| Tür | Örnek |
|---|---|
| Dosya | `fortune_result_page.dart` |
| Class | `FortuneResultPage` |
| Provider | `fortuneHistoryProvider` |
| Function | `createFortune()` |
| Constant | `defaultPageSize` |
| Enum | `FortuneStatus` |

---

## 18. Geliştirme Sırası

Önerilen Flutter geliştirme sırası:

1. Proje kurulumu ve temel klasör yapısı.
2. Tema ve ortak widgetlar.
3. Routing altyapısı.
4. Network ve hata yönetimi.
5. Authentication.
6. Profil ve onboarding.
7. AI Fal Merkezi.
8. Fal geçmişi.
9. Sosyal akış.
10. Topluluklar.
11. Bildirimler.
12. Mesajlaşma.
13. Falcılar Ligi.
14. Ödeme entegrasyonu.
15. Flört ve eşleşme.
16. Test, performans ve yayın hazırlığı.

Bu sıra bağımlılıklara göre değiştirilebilir.

---

## 19. Açık Teknik Kararlar

| Konu | Durum |
|---|---|
| State management | Riverpod önerildi |
| Routing | GoRouter önerildi |
| HTTP client | Dio önerildi |
| Local database | TBD |
| Realtime protokolü | TBD |
| Push notification | FCM önerildi |
| Crash reporting | TBD |
| Dependency injection yaklaşımı | Riverpod üzerinden değerlendirme |
| Localization | Flutter gen-l10n önerildi |
| CI/CD | TBD |

---

## 20. Kabul Kriterleri

- [ ] Proje feature-based mimariyle düzenlenmiş.
- [ ] UI ve business logic ayrılmış.
- [ ] Ortak API katmanı oluşturulmuş.
- [ ] Authentication ve routing korumaları çalışıyor.
- [ ] State management standardı belirlenmiş.
- [ ] Ortak tasarım sistemi uygulanmış.
- [ ] Hassas bilgiler güvenli depolanıyor.
- [ ] Realtime ve push altyapıları modüler tasarlanmış.
- [ ] Unit ve widget testleri çalışıyor.
- [ ] Development, staging ve production ortamları ayrılmış.
- [ ] Yeni feature eklemek mevcut modülleri bozmuyor.

---

## 21. İlişkili Dokümanlar

- `PROJECT_OVERVIEW.md`
- `APP_FEATURES.md`
- `PRD.md`
- `UI_UX_GUIDELINES.md`
- `API_SPECIFICATION.md`
- `SYSTEM_ARCHITECTURE.md`
- `DATABASE_SCHEMA.md`
- `SECURITY_AND_PRIVACY.md`
- `USER_ROLES.md`
- `USER_FLOWS.md`

**Doküman durumu:** Teknik mimari taslağı.  
**Not:** Teknoloji seçimleri uygulama başlangıcında küçük bir teknik prototiple doğrulanmalıdır.