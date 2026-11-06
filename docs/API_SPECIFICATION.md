# API_SPECIFICATION.md
# API Tasarımı ve Entegrasyon Sözleşmesi

**Belge Sürümü:** 1.0.0  
**Durum:** İlk Taslak  
**Proje:** Fal ve Sosyal Platform  
**API Mimarisi:** REST API (önerilen)  
**API Versiyonu:** v1  
**Base URL:** TBD  
**Veri Formatı:** JSON  
**Kimlik Doğrulama:** TBD

---

## 1. Belgenin Amacı

Bu belge, Flutter mobil uygulaması ile backend arasındaki iletişim kurallarını tanımlar.

API sözleşmesi aşağıdaki konuları kapsar:

- Endpoint isimlendirme standartları.
- HTTP metotları.
- İstek ve yanıt formatları.
- Kimlik doğrulama.
- Yetkilendirme.
- Hata yönetimi.
- Sayfalama ve filtreleme.
- Kullanıcı işlemleri.
- Fal işlemleri.
- Falcılar Ligi.
- Sipariş ve ödeme.
- Sosyal ağ.
- Topluluklar.
- Dating ve eşleşme.
- Mesajlaşma.
- Bildirimler.
- Moderasyon.

Endpoint'ler ilk taslaktır. Backend teknolojisi ve veri modeli kesinleştiğinde güncellenmelidir.

## 2. Genel API Standartları

### 2.1. Base URL

Örnek geliştirme adresi:

```text
https://api.example.com/v1
```

Gerçek domain ve ortam adresleri daha sonra belirlenecektir.

### 2.2. HTTP Metotları

| Metot | Kullanım |
|---|---|
| GET | Veri görüntüleme |
| POST | Yeni kayıt veya işlem oluşturma |
| PUT | Bir kaynağı tamamen güncelleme |
| PATCH | Bir kaynağın belirli alanlarını güncelleme |
| DELETE | Kaynak silme veya silme talebi |

### 2.3. Standart Header'lar

```http
Content-Type: application/json
Accept: application/json
Authorization: Bearer <access_token>
```

Kimlik doğrulama gerektirmeyen endpoint'lerde Authorization zorunlu değildir.

### 2.4. JSON Standartları

- Alan isimleri `snake_case` kullanılmalıdır.
- Tarihler ISO 8601 formatında gönderilmelidir.
- Para tutarları decimal hassasiyetini koruyan bir formatta taşınmalıdır.
- Benzersiz kayıt kimlikleri UUID olmalıdır.
- Boş alanlar için `null` veya alanın gönderilmemesi kuralları endpoint bazında belirlenmelidir.

## 3. Standart Yanıt Formatı

### 3.1. Başarılı Yanıt

```json
{
  "success": true,
  "data": {
    "id": "uuid",
    "message": "İşlem başarılı"
  },
  "meta": {}
}
```

### 3.2. Hatalı Yanıt

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Gönderilen bilgiler kontrol edilmeli.",
    "details": {
      "email": "Geçerli bir e-posta adresi giriniz."
    }
  }
}
```

Backend, kullanıcıya gösterilecek mesajla teknik hata detaylarını birbirinden ayırmalıdır.

## 4. HTTP Durum Kodları

| Kod | Açıklama |
|---|---|
| 200 | Başarılı |
| 201 | Kayıt oluşturuldu |
| 202 | İşlem kabul edildi, tamamlanması bekleniyor |
| 204 | İşlem başarılı, içerik dönülmedi |
| 400 | Hatalı istek |
| 401 | Kimlik doğrulama gerekli |
| 403 | Yetki yok |
| 404 | Kayıt bulunamadı |
| 409 | Çakışma |
| 422 | Veri doğrulama hatası |
| 429 | İstek sınırı aşıldı |
| 500 | Sunucu hatası |
| 502 | Dış servis hatası |
| 503 | Servis geçici olarak kullanılamıyor |

## 5. Sayfalama ve Filtreleme

Büyük veri listelerinde sayfalama kullanılmalıdır.

Örnek:

```http
GET /v1/posts?page=1&limit=20
```

Yanıt:

```json
{
  "success": true,
  "data": [],
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 120,
    "total_pages": 6
  }
}
```

İleri aşamada yoğun akışlar ve mesaj geçmişi için cursor tabanlı sayfalama tercih edilebilir.

## 6. Kimlik Doğrulama API'leri

### 6.1. Kayıt Ol

`POST /auth/register`

İstek:

```json
{
  "email": "user@example.com",
  "username": "example_user",
  "password": "StrongPassword123",
  "display_name": "Example User"
}
```

Yanıt:

```json
{
  "success": true,
  "data": {
    "user_id": "uuid",
    "verification_required": true
  }
}
```

### 6.2. Giriş Yap

`POST /auth/login`

İstek:

```json
{
  "email": "user@example.com",
  "password": "StrongPassword123"
}
```

Yanıt:

```json
{
  "success": true,
  "data": {
    "access_token": "token",
    "refresh_token": "token",
    "expires_in": 3600,
    "token_type": "Bearer"
  }
}
```

### 6.3. Token Yenile

`POST /auth/refresh`

İstek:

```json
{
  "refresh_token": "refresh_token"
}
```

### 6.4. Çıkış Yap

`POST /auth/logout`

Aktif oturumun veya refresh token'ın iptal edilmesini sağlar.

### 6.5. E-posta Doğrula

`POST /auth/verify-email`

### 6.6. Şifremi Unuttum

`POST /auth/forgot-password`

### 6.7. Yeni Şifre Belirle

`POST /auth/reset-password`

### 6.8. Mevcut Kullanıcı

`GET /auth/me`

Oturum açmış kullanıcının temel hesap ve rol bilgilerini döndürür.

## 7. Profil API'leri

| Metot | Endpoint | Açıklama |
|---|---|---|
| GET | `/users/me` | Kendi profilini getir |
| PATCH | `/users/me` | Profilini güncelle |
| GET | `/users/{user_id}` | Görüntülenmesine izin verilen profili getir |
| POST | `/users/me/avatar` | Profil fotoğrafı yükleme sürecini başlat |
| DELETE | `/users/me` | Hesap silme talebi oluştur |

Profil yanıtı örneği:

```json
{
  "success": true,
  "data": {
    "id": "uuid",
    "username": "example_user",
    "display_name": "Example User",
    "bio": "Profil açıklaması",
    "avatar_url": "https://example.com/avatar.jpg"
  }
}
```

Özel alanlar yalnızca yetkili kullanıcıya gösterilmelidir.

## 8. Fal API'leri

### 8.1. Fal Türlerini Listele

`GET /fortune-types`

### 8.2. Fal Oluştur

`POST /fortunes`

İstek:

```json
{
  "fortune_type": "COFFEE",
  "input_data": {
    "question": "İş hayatımla ilgili neler keşfedebilirim?"
  },
  "media_ids": [
    "uuid"
  ],
  "visibility": "PRIVATE"
}
```

Yanıt:

```json
{
  "success": true,
  "data": {
    "fortune_id": "uuid",
    "status": "PENDING"
  }
}
```

### 8.3. Fal Sonucunu Getir

`GET /fortunes/{fortune_id}`

### 8.4. Fal Geçmişini Listele

`GET /fortunes?page=1&limit=20`

### 8.5. Falı Silme Talebi

`DELETE /fortunes/{fortune_id}`

### 8.6. Fal İşlem Durumu

`GET /fortunes/{fortune_id}/status`

AI işlemi asenkron yürütülüyorsa mobil uygulama bu endpoint üzerinden durum kontrolü yapabilir. Alternatif olarak bildirim veya realtime olayları kullanılabilir.

## 9. AI API'leri

AI işlemlerinin doğrudan sağlayıcıya değil backend'e gönderilmesi zorunludur.

### 9.1. AI Fal Üretimi

`POST /ai/fortune-generations`

İstek:

```json
{
  "fortune_id": "uuid",
  "generation_options": {
    "style": "DETAILED",
    "language": "tr"
  }
}
```

Yanıt:

```json
{
  "success": true,
  "data": {
    "generation_id": "uuid",
    "status": "PROCESSING"
  }
}
```

### 9.2. AI Üretim Durumu

`GET /ai/fortune-generations/{generation_id}`

### 9.3. AI İşlem Kuralları

- Kullanıcı yalnızca kendi fal kaydı için işlem başlatabilmelidir.
- Aynı fal için kontrolsüz biçimde birden fazla üretim başlatılmamalıdır.
- Maliyet ve kullanım sınırları backend tarafından yönetilmelidir.
- Sağlayıcı API anahtarları mobil uygulamaya gönderilmemelidir.
- AI sonucu tamamlandığında bildirim oluşturulabilmelidir.

## 10. Falcılar Ligi API'leri

### 10.1. Falcıları Listele

`GET /fortune-tellers?page=1&limit=20`

Filtre örnekleri:

```text
?rating_min=4
?fortune_type=COFFEE
?sort=rating
```

### 10.2. Falcı Detayı

`GET /fortune-tellers/{teller_id}`

### 10.3. Falcının Hizmetlerini Listele

`GET /fortune-tellers/{teller_id}/services`

### 10.4. Falcı Başvurusu

`POST /fortune-tellers/applications`

### 10.5. Falcı Hizmeti Oluştur

`POST /fortune-tellers/me/services`

### 10.6. Hizmet Güncelle

`PATCH /fortune-tellers/me/services/{service_id}`

### 10.7. Hizmet Sil

`DELETE /fortune-tellers/me/services/{service_id}`

### 10.8. Falcı Siparişlerini Listele

`GET /fortune-tellers/me/orders`

Bu endpoint yalnızca ilgili falcının yetkili olduğu siparişleri döndürmelidir.

## 11. Sipariş ve Ödeme API'leri

### 11.1. Sipariş Oluştur

`POST /orders`

İstek:

```json
{
  "service_id": "uuid",
  "customer_note": "Fal için iletmek istediğim not."
}
```

Yanıt:

```json
{
  "success": true,
  "data": {
    "order_id": "uuid",
    "total_amount": "250.00",
    "currency": "TRY",
    "status": "PENDING_PAYMENT"
  }
}
```

### 11.2. Sipariş Detayı

`GET /orders/{order_id}`

### 11.3. Siparişlerim

`GET /orders?page=1&limit=20`

### 11.4. Ödeme Başlat

`POST /payments/checkout`

İstek:

```json
{
  "order_id": "uuid",
  "payment_method": "PROVIDER_CHECKOUT"
}
```

Yanıt:

```json
{
  "success": true,
  "data": {
    "payment_id": "uuid",
    "checkout_url": "https://payment-provider.example/checkout"
  }
}
```

Ödeme adresi yalnızca backend tarafından doğrulanmış sağlayıcı yanıtından alınmalıdır.

### 11.5. Ödeme Durumu

`GET /payments/{payment_id}`

### 11.6. Sipariş Teslim Et

`POST /orders/{order_id}/deliver`

Bu endpoint yalnızca siparişin sahibi olan ve ilgili hizmeti sunan falcının yetkisiyle kullanılabilir.

### 11.7. Siparişi Tamamla

`POST /orders/{order_id}/complete`

### 11.8. Ödeme Webhook

`POST /webhooks/payments/{provider}`

Bu endpoint kullanıcı oturumu yerine sağlayıcı imza doğrulamasıyla güvence altına alınmalıdır. Tekrarlanan webhook bildirimleri aynı finansal işlemi birden fazla kez oluşturmamalıdır.

## 12. Sosyal Ağ API'leri

| Metot | Endpoint | Açıklama |
|---|---|---|
| GET | `/posts` | Gönderi akışı |
| POST | `/posts` | Gönderi oluştur |
| GET | `/posts/{post_id}` | Gönderi detayı |
| PATCH | `/posts/{post_id}` | Gönderiyi güncelle |
| DELETE | `/posts/{post_id}` | Gönderiyi sil |
| POST | `/posts/{post_id}/likes` | Beğen |
| DELETE | `/posts/{post_id}/likes` | Beğeniyi kaldır |
| GET | `/posts/{post_id}/comments` | Yorumları getir |
| POST | `/posts/{post_id}/comments` | Yorum oluştur |
| DELETE | `/comments/{comment_id}` | Yorum sil |

Gönderi oluşturma örneği:

```json
{
  "content": "Bugünkü falımı paylaşmak istedim.",
  "fortune_reading_id": "uuid",
  "visibility": "PUBLIC",
  "media_ids": []
}
```

Fal paylaşımında kullanıcının özel fal kaydı doğrudan herkese açılmamalıdır. Paylaşım için ayrı görünürlük ve izin kontrolü uygulanmalıdır.

## 13. Topluluk API'leri

| Metot | Endpoint | Açıklama |
|---|---|---|
| GET | `/communities` | Toplulukları listele |
| POST | `/communities` | Topluluk oluştur |
| GET | `/communities/{id}` | Topluluk detayı |
| PATCH | `/communities/{id}` | Topluluk güncelle |
| POST | `/communities/{id}/join` | Katıl |
| DELETE | `/communities/{id}/leave` | Ayrıl |
| GET | `/communities/{id}/topics` | Konuları listele |
| POST | `/communities/{id}/topics` | Konu oluştur |
| GET | `/topics/{topic_id}` | Konu detayı |
| POST | `/topics/{topic_id}/comments` | Yanıt oluştur |

Topluluk yöneticileri yalnızca yetkili oldukları topluluklarda yönetim işlemi gerçekleştirebilmelidir.

## 14. Dating ve Eşleşme API'leri

### 14.1. Dating Katılımını Aç/Kapat

`PATCH /dating/preferences`

İstek:

```json
{
  "is_enabled": true,
  "preferred_age_min": 20,
  "preferred_age_max": 27,
  "preferred_distance_km": 30
}
```

### 14.2. Eşleşme Önerileri

`GET /dating/discover`

### 14.3. Kullanıcıyı Beğen

`POST /dating/interactions`

İstek:

```json
{
  "target_user_id": "uuid",
  "action": "LIKE"
}
```

### 14.4. Eşleşmelerim

`GET /dating/matches`

### 14.5. Eşleşmeyi Sonlandır

`DELETE /dating/matches/{match_id}`

### 14.6. Kullanıcı Engelle

`POST /users/{user_id}/block`

### 14.7. Engeli Kaldır

`DELETE /users/{user_id}/block`

Dating endpoint'leri, kullanıcının açık katılım izni yoksa çalışmamalıdır. Engelleme kuralları bütün ilgili modüllerde uygulanmalıdır.

## 15. Mesajlaşma API'leri

| Metot | Endpoint | Açıklama |
|---|---|---|
| GET | `/conversations` | Konuşmaları listele |
| POST | `/conversations` | Konuşma oluştur |
| GET | `/conversations/{id}` | Konuşma detayı |
| GET | `/conversations/{id}/messages` | Mesajları getir |
| POST | `/conversations/{id}/messages` | Mesaj gönder |
| PATCH | `/conversations/{id}/read` | Okundu olarak işaretle |

Mesaj gönderme örneği:

```json
{
  "content": "Merhaba, nasılsın?",
  "message_type": "TEXT"
}
```

Mesajların gerçek zamanlı iletimi için ayrıca WebSocket veya yönetilen bir realtime servis kullanılabilir. Bağlantı adresi ve olay şeması teknik sağlayıcı belirlendiğinde tanımlanacaktır.

## 16. Bildirim API'leri

| Metot | Endpoint | Açıklama |
|---|---|---|
| GET | `/notifications` | Bildirimleri listele |
| PATCH | `/notifications/{id}/read` | Okundu işaretle |
| POST | `/notifications/read-all` | Hepsini okundu yap |
| DELETE | `/notifications/{id}` | Bildirimi sil |
| POST | `/devices/register` | Cihaz tokenı kaydet |
| DELETE | `/devices/{id}` | Cihaz kaydını kaldır |

## 17. Moderasyon API'leri

### 17.1. Rapor Oluştur

`POST /reports`

İstek:

```json
{
  "target_type": "POST",
  "target_id": "uuid",
  "reason": "INAPPROPRIATE_CONTENT",
  "description": "İçerik kurallara aykırı görünüyor."
}
```

### 17.2. Admin Rapor Listesi

`GET /admin/reports`

### 17.3. Rapor İncele

`GET /admin/reports/{report_id}`

### 17.4. Moderasyon İşlemi

`POST /admin/moderation/actions`

Bu endpoint yalnızca ilgili moderasyon yetkisine sahip hesaplar tarafından kullanılmalıdır.

## 18. Admin API'leri

Önerilen endpoint grupları:

```text
GET    /admin/dashboard
GET    /admin/users
GET    /admin/users/{id}
PATCH  /admin/users/{id}/status

GET    /admin/fortune-tellers/applications
POST   /admin/fortune-tellers/{id}/approve
POST   /admin/fortune-tellers/{id}/reject

GET    /admin/orders
GET    /admin/payments

GET    /admin/audit-logs
GET    /admin/moderation/actions
```

Admin işlemleri ayrıca audit log kayıtlarına yazılmalıdır.

## 19. Rate Limiting ve Güvenlik

API üzerinde istek sınırları uygulanmalıdır.

Özellikle aşağıdaki endpoint'ler korumalı olmalıdır:

- Kayıt ve giriş.
- Şifre sıfırlama.
- AI fal üretimi.
- Ödeme başlatma.
- Mesaj gönderme.
- Yorum ve gönderi oluşturma.
- Dating etkileşimleri.

Güvenlik kuralları:

1. Her kullanıcıya ait kaynaklarda sahiplik kontrolü yapılmalıdır.
2. İstemciden gelen rol bilgisine güvenilmemelidir.
3. Hassas endpoint'lerde rate limiting kullanılmalıdır.
4. Ödeme ve AI işlemlerinde idempotency uygulanmalıdır.
5. Dış servis hataları kontrollü biçimde ele alınmalıdır.
6. Kullanıcıya sunulan hata mesajlarında sistem detayları açıklanmamalıdır.
7. API istekleri ve yanıtları hassas veri içermeyecek şekilde loglanmalıdır.

## 20. Idempotency ve Tekrarlı İstek Yönetimi

Özellikle ödeme, sipariş ve AI üretimi gibi maliyetli işlemlerde aynı isteğin yanlışlıkla tekrar işlenmesi engellenmelidir.

Örnek:

```http
Idempotency-Key: unique-request-id
```

Backend aynı anahtarla gelen geçerli tekrarlı isteğe, tanımlanan süre ve kapsam içinde aynı işlem sonucunu döndürmelidir.

## 21. Flutter API Entegrasyon Standartları

Flutter uygulamasında API iletişimi ekranların içerisine doğrudan yazılmamalıdır.

Önerilen katmanlar:

```text
Feature
  |
  v
Presentation
  |
  v
Controller / State Management
  |
  v
Repository
  |
  v
API Client
  |
  v
Backend
```

Önerilen sorumluluklar:

- API Client: HTTP iletişimi.
- Repository: Veri erişimi ve dönüşüm.
- Controller: Ekran durumları.
- Presentation: Kullanıcı arayüzü.

API hata kodları uygulama içerisinde merkezi olarak ele alınmalıdır.

## 22. API Versiyonlama

API adresleri versiyonlanmalıdır.

Örnek:

```text
/v1/auth/login
/v1/fortunes
/v1/posts
```

Geriye dönük uyumluluğu bozan değişikliklerde yeni versiyon kullanılmalıdır.

## 23. Test ve Dokümantasyon

API geliştirme sürecinde aşağıdaki testler bulunmalıdır:

- Endpoint doğrulama testleri.
- Kimlik doğrulama testleri.
- Yetkilendirme testleri.
- Hatalı veri testleri.
- Sınır durum testleri.
- Ödeme webhook testleri.
- Tekrarlı istek testleri.
- Modüller arası entegrasyon testleri.

API dokümantasyonu için OpenAPI/Swagger uyumlu bir tanım dosyası hazırlanması önerilir.

## 24. Açık Kararlar

- Backend framework.
- Kimlik doğrulama yöntemi.
- Token yaşam süreleri.
- Gerçek API domain adresi.
- Dosya yükleme yöntemi.
- Realtime iletişim protokolü.
- Ödeme sağlayıcısı webhook formatı.
- AI üretim durumlarının bildirim yöntemi.
- Admin paneli erişim modeli.
- API rate limit değerleri.

## 25. Kabul Kriterleri

- Bütün endpoint'ler tutarlı isimlendirme standardına sahip olmalıdır.
- İstek ve yanıt formatları belgelenmelidir.
- Kimlik doğrulama ve yetkilendirme kuralları tanımlanmalıdır.
- Kullanıcılar yalnızca izin verilen kaynaklara erişebilmelidir.
- AI işlemleri backend üzerinden yürütülmelidir.
- Ödeme işlemleri güvenli ve tekrarlı isteklere dayanıklı olmalıdır.
- Dating modülü açık katılım izni gerektirmelidir.
- Hata yanıtları standartlaştırılmalıdır.
- API versiyonlaması desteklenmelidir.
- Flutter ve backend ekipleri aynı API sözleşmesini kullanabilmelidir.

---

**Belge Sonu**

**Önemli:** Bu dokümandaki endpoint'ler geliştirme öncesi API sözleşmesi taslağıdır. Gerçek uygulamada OpenAPI şeması, doğrulama kuralları, yetki matrisi ve gerçek sağlayıcı entegrasyonlarıyla kesinleştirilmelidir.