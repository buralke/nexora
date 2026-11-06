# ENVIRONMENT_CONFIGURATION.md

# Ortam Değişkenleri, Yapılandırma ve Secret Yönetimi

**Proje:** AI Destekli Fal ve Sosyal Etkileşim Platformu  
**Dosya:** `ENVIRONMENT_CONFIGURATION.md`  
**Sürüm:** 1.0.0  
**Durum:** Teknik yapılandırma taslağı  
**Öncelik:** P0 — İlk geliştirme sprintinde uygulanmalıdır.

---

## 1. Amaç

Bu doküman, platformun farklı çalışma ortamlarında ihtiyaç duyduğu yapılandırma değerlerini, ortam değişkenlerini, secret yönetimini ve doğrulama kurallarını tanımlar.

Kapsam:

- Flutter yapılandırması.
- FastAPI yapılandırması.
- PostgreSQL.
- Redis.
- Celery.
- AI sağlayıcıları.
- Firebase.
- Object storage.
- Ödeme altyapısı.
- E-posta.
- WebSocket.
- Monitoring.
- Analytics.
- Feature flags.
- Secret yönetimi.
- CI/CD yapılandırması.

**Temel ilke:** Uygulama kodu ortamdan bağımsız olmalı; ortamlar arasındaki farklılıklar doğrulanmış yapılandırmalarla yönetilmelidir.

---

## 2. Ortam Türleri

Dört temel ortam kullanılacaktır.

| Ortam | Kod | Veri | Harici servisler |
|---|---|---|---|
| Local | Geliştirme | Test verisi | Mock / Sandbox |
| CI | Otomatik test | Geçici test verisi | Mock / Sandbox |
| Staging | Release candidate | İzole test verisi | Sandbox |
| Production | Onaylı sürüm | Gerçek kullanıcı verisi | Production |

### 2.1. Local

Geliştiricilerin bilgisayarlarında çalışır.

Hızlı geliştirme, hata ayıklama ve yerel testler için kullanılır.

### 2.2. CI

Otomatik test ve build işlemleri için kullanılır.

Mümkün olduğunca geçici ve izole servisler kullanılmalıdır.

### 2.3. Staging

Production ortamına benzer fakat gerçek kullanıcı verilerinden ayrılmış test ortamıdır.

### 2.4. Production

Gerçek kullanıcıların kullandığı canlı ortamdır.

Production secretları diğer ortamlarda kullanılmamalıdır.

---

## 3. Yapılandırma İlkeleri

1. Gizli bilgiler kaynak koda yazılmaz.
2. Ortam değişkenleri merkezi olarak doğrulanır.
3. Her ortamın ayrı kimlik bilgileri bulunur.
4. Production varsayılan olarak güvenli ayarlarla çalışır.
5. Eksik kritik ayarlar uygulama başlangıcında hata üretir.
6. Gizli bilgiler loglara yazılmaz.
7. Flutter istemcisine sunucu secretları gönderilmez.
8. Yapılandırma değişiklikleri izlenebilir olmalıdır.
9. Secret rotasyonu desteklenmelidir.
10. `.env.example` dosyaları gerçek secret içermez.

---

## 4. Önerilen Dosya Yapısı

```text
project/
├── apps/
│   ├── backend/
│   │   ├── app/
│   │   │   └── core/
│   │   │       └── config.py
│   │   ├── .env.example
│   │   ├── .env.local
│   │   └── .env.test
│   │
│   └── mobile/
│       ├── lib/
│       │   └── core/
│       │       └── config/
│       │           └── app_config.dart
│       └── config/
│           ├── development.json
│           ├── staging.json
│           └── production.json
│
├── infrastructure/
│   ├── compose/
│   └── scripts/
│
├── .github/
│   └── workflows/
│
└── docs/
    └── ENVIRONMENT_CONFIGURATION.md
```

**Not:** Mobil yapılandırma JSON dosyaları yalnızca herkese açık olmasında sakınca bulunmayan değerleri içermelidir.

---

## 5. Backend Environment Değişkenleri

### 5.1. Uygulama ayarları

| Değişken | Açıklama | Production |
|---|---|---|
| `APP_NAME` | Uygulama adı | Gerekli |
| `APP_ENV` | Ortam | Gerekli |
| `APP_DEBUG` | Debug modu | `false` |
| `APP_VERSION` | Sürüm | Gerekli |
| `APP_HOST` | Bind adresi | Gerekli |
| `APP_PORT` | Port | Gerekli |
| `LOG_LEVEL` | Log seviyesi | Gerekli |
| `PUBLIC_API_URL` | Public API adresi | Gerekli |

### 5.2. Örnek

```dotenv
APP_NAME=fortune-platform
APP_ENV=local
APP_DEBUG=true
APP_VERSION=0.1.0

APP_HOST=0.0.0.0
APP_PORT=8000

LOG_LEVEL=DEBUG
PUBLIC_API_URL=http://localhost:8000
```

Production ortamında `APP_DEBUG=false` zorunlu olmalıdır.

---

## 6. PostgreSQL Configuration

### 6.1. Değişkenler

| Değişken | Açıklama |
|---|---|
| `DATABASE_URL` | Veritabanı bağlantısı |
| `DB_POOL_SIZE` | Connection pool büyüklüğü |
| `DB_MAX_OVERFLOW` | Ek bağlantı limiti |
| `DB_POOL_TIMEOUT` | Bağlantı bekleme süresi |
| `DB_ECHO` | SQL debug logging |

### 6.2. Örnek

```dotenv
DATABASE_URL=postgresql+asyncpg://app:local_password@localhost:5432/app_local

DB_POOL_SIZE=10
DB_MAX_OVERFLOW=20
DB_POOL_TIMEOUT=30
DB_ECHO=false
```

Bu değerler başlangıç örneğidir.

Production connection pool değerleri veritabanı bağlantı sınırları ve API instance sayısı dikkate alınarak belirlenmelidir.

### 6.3. Güvenlik

- Production bağlantı bilgileri secret manager üzerinden sağlanmalıdır.
- Database public internete açık olmamalıdır.
- Uygulama kullanıcısına minimum yetki verilmelidir.
- Gerektiğinde TLS bağlantısı zorunlu tutulmalıdır.

---

## 7. Redis Configuration

### 7.1. Değişkenler

| Değişken | Açıklama |
|---|---|
| `REDIS_URL` | Redis bağlantısı |
| `REDIS_CACHE_TTL` | Varsayılan cache süresi |
| `REDIS_CONNECT_TIMEOUT` | Bağlantı timeout |
| `REDIS_SOCKET_TIMEOUT` | İşlem timeout |

### 7.2. Örnek

```dotenv
REDIS_URL=redis://localhost:6379/0

REDIS_CACHE_TTL=300
REDIS_CONNECT_TIMEOUT=5
REDIS_SOCKET_TIMEOUT=5
```

Production ortamında Redis erişimi private network ile sınırlandırılmalıdır.

---

## 8. Celery Configuration

### 8.1. Değişkenler

| Değişken | Açıklama |
|---|---|
| `CELERY_BROKER_URL` | Görev kuyruğu bağlantısı |
| `CELERY_RESULT_BACKEND` | Sonuç backend'i |
| `CELERY_TASK_TIME_LIMIT` | Görev zaman limiti |
| `CELERY_TASK_SOFT_TIME_LIMIT` | Yumuşak zaman limiti |
| `CELERY_WORKER_CONCURRENCY` | Worker eşzamanlılığı |

### 8.2. Örnek

```dotenv
CELERY_BROKER_URL=redis://localhost:6379/1
CELERY_RESULT_BACKEND=redis://localhost:6379/2

CELERY_TASK_TIME_LIMIT=180
CELERY_TASK_SOFT_TIME_LIMIT=150
CELERY_WORKER_CONCURRENCY=4
```

### 8.3. Kritik not

AI işlemleri, bildirimler ve finansal süreçler için farklı görev zaman limitleri gerekebilir.

Global değerler yalnızca varsayılan olarak kullanılmalı, görev bazlı sınırlar ayrıca tanımlanmalıdır.

---

## 9. Authentication Configuration

### 9.1. Değişkenler

| Değişken | Açıklama |
|---|---|
| `JWT_SECRET_KEY` | JWT imzalama anahtarı |
| `JWT_ALGORITHM` | İmzalama algoritması |
| `ACCESS_TOKEN_EXPIRE_MINUTES` | Access token süresi |
| `REFRESH_TOKEN_EXPIRE_DAYS` | Refresh token süresi |
| `PASSWORD_RESET_EXPIRE_MINUTES` | Parola sıfırlama süresi |
| `EMAIL_VERIFICATION_EXPIRE_HOURS` | E-posta doğrulama süresi |

### 9.2. Örnek

```dotenv
JWT_SECRET_KEY=REPLACE_WITH_SECURE_RANDOM_SECRET
JWT_ALGORITHM=HS256

ACCESS_TOKEN_EXPIRE_MINUTES=15
REFRESH_TOKEN_EXPIRE_DAYS=30

PASSWORD_RESET_EXPIRE_MINUTES=30
EMAIL_VERIFICATION_EXPIRE_HOURS=24
```

### 9.3. Güvenlik kuralları

- Production anahtarları güvenli rastgelelik kaynağından oluşturulmalıdır.
- Geliştirme anahtarları production'da kullanılmamalıdır.
- Token süreleri güvenlik politikasına göre belirlenmelidir.
- Refresh token rotation uygulanmalıdır.
- Secret rotasyonu planlanmalıdır.

---

## 10. AI Provider Configuration

AI Fal Merkezi harici model sağlayıcılarıyla iletişim kurabilir.

### 10.1. Değişkenler

| Değişken | Açıklama |
|---|---|
| `AI_PROVIDER` | Aktif sağlayıcı |
| `AI_API_KEY` | Sağlayıcı API anahtarı |
| `AI_MODEL` | Kullanılan model |
| `AI_TIMEOUT_SECONDS` | İstek timeout |
| `AI_MAX_RETRIES` | Retry limiti |
| `AI_MAX_OUTPUT_TOKENS` | Maksimum çıktı |
| `AI_TEMPERATURE` | Üretim parametresi |
| `AI_DAILY_BUDGET_MINOR` | Günlük maliyet bütçesi |

### 10.2. Örnek

```dotenv
AI_PROVIDER=provider_name
AI_API_KEY=REPLACE_WITH_PROVIDER_KEY
AI_MODEL=selected-model

AI_TIMEOUT_SECONDS=60
AI_MAX_RETRIES=2
AI_MAX_OUTPUT_TOKENS=1200
AI_TEMPERATURE=0.7

AI_DAILY_BUDGET_MINOR=10000
```

### 10.3. Model bağımlılığı

Bütün AI modelleri aynı parametreleri desteklemeyebilir.

Model adapterı yalnızca desteklenen parametreleri göndermelidir.

### 10.4. Güvenlik

AI API anahtarı Flutter uygulamasına yerleştirilmemelidir.

AI istekleri backend üzerinden yapılmalıdır.

---

## 11. AI Prompt Configuration

Promptlar uygulama sürümünden bağımsız biçimde versiyonlanabilir.

### 11.1. Değişkenler

```dotenv
AI_COFFEE_PROMPT_VERSION=v1
AI_TAROT_PROMPT_VERSION=v1
AI_DREAM_PROMPT_VERSION=v1
AI_PALM_PROMPT_VERSION=v1
```

### 11.2. Kurallar

- Prompt sürümü kayıt altına alınmalıdır.
- Prompt değişiklikleri test edilmelidir.
- Eski sonuçlar kullanılan prompt sürümüyle ilişkilendirilebilmelidir.
- Prompt içerikleri ve kullanıcı girdileri gereksiz yere loglanmamalıdır.

---

## 12. Object Storage Configuration

### 12.1. Değişkenler

| Değişken | Açıklama |
|---|---|
| `STORAGE_PROVIDER` | Depolama sağlayıcısı |
| `STORAGE_ENDPOINT` | Servis endpointi |
| `STORAGE_REGION` | Bölge |
| `STORAGE_BUCKET` | Bucket |
| `STORAGE_ACCESS_KEY` | Erişim anahtarı |
| `STORAGE_SECRET_KEY` | Gizli anahtar |
| `STORAGE_SIGNED_URL_TTL` | Signed URL süresi |
| `STORAGE_MAX_UPLOAD_MB` | Maksimum yükleme boyutu |

### 12.2. Örnek

```dotenv
STORAGE_PROVIDER=s3
STORAGE_ENDPOINT=https://storage.example.com
STORAGE_REGION=eu-central-1
STORAGE_BUCKET=fortune-private

STORAGE_ACCESS_KEY=REPLACE_WITH_ACCESS_KEY
STORAGE_SECRET_KEY=REPLACE_WITH_SECRET_KEY

STORAGE_SIGNED_URL_TTL=300
STORAGE_MAX_UPLOAD_MB=10
```

### 12.3. Güvenlik

- Varsayılan bucket erişimi private olmalıdır.
- Dosya erişimi yetkilendirilmelidir.
- Signed URL süreleri sınırlı olmalıdır.
- Dosya türü ve boyutu backend tarafından kontrol edilmelidir.
- Kullanıcı dosyalarının saklama ve silme politikaları uygulanmalıdır.

---

## 13. Firebase Configuration

Firebase aşağıdaki alanlarda kullanılabilir:

- Push notifications.
- Firebase Cloud Messaging.
- Firebase Analytics, tercih edilirse.
- Crashlytics, tercih edilirse.

### 13.1. Backend

Örnek:

```dotenv
FCM_PROJECT_ID=project-id
FCM_CREDENTIALS_SOURCE=workload_identity
```

### 13.2. Kimlik bilgileri

Production ortamında mümkünse kısa ömürlü kimlik bilgileri veya workload identity kullanılmalıdır.

Servis hesabı JSON dosyaları repository içerisine eklenmemelidir.

### 13.3. Flutter

Flutter Firebase yapılandırması platforma özel dosyalarla yönetilebilir.

Örnekler:

```text
android/app/google-services.json
ios/Runner/GoogleService-Info.plist
```

Bu dosyalardaki istemci yapılandırma değerleri tek başına sunucu secretı olarak değerlendirilmez.

Bununla birlikte Firebase Security Rules, API kısıtlamaları ve servis yetkileri ayrıca güvenli yapılandırılmalıdır.

---

## 14. Payment Configuration

Ödeme altyapısı hem kredi satın alma hem de Falcılar Ligi işlemlerini destekleyebilir.

### 14.1. Değişkenler

| Değişken | Açıklama |
|---|---|
| `PAYMENT_PROVIDER` | Ödeme sağlayıcısı |
| `PAYMENT_ENV` | Sandbox / Production |
| `PAYMENT_API_KEY` | API anahtarı |
| `PAYMENT_API_SECRET` | Gizli anahtar |
| `PAYMENT_WEBHOOK_SECRET` | Webhook doğrulama anahtarı |
| `PAYMENT_CURRENCY` | Para birimi |
| `PAYMENT_TIMEOUT_SECONDS` | İstek timeout |

### 14.2. Örnek

```dotenv
PAYMENT_PROVIDER=selected_provider
PAYMENT_ENV=sandbox

PAYMENT_API_KEY=REPLACE_WITH_API_KEY
PAYMENT_API_SECRET=REPLACE_WITH_API_SECRET
PAYMENT_WEBHOOK_SECRET=REPLACE_WITH_WEBHOOK_SECRET

PAYMENT_CURRENCY=TRY
PAYMENT_TIMEOUT_SECONDS=30
```

### 14.3. Production doğrulama

Production ortamında:

- Sandbox kimlik bilgileri kabul edilmemelidir.
- Webhook doğrulaması zorunlu olmalıdır.
- Payment provider endpointi kontrol edilmelidir.
- Tutar ve para birimi backend tarafından doğrulanmalıdır.

### 14.4. Mobil mağaza kuralları

Dijital içerik satışlarında App Store ve Google Play ödeme gereksinimleri ayrıca uygulanmalıdır.

Ödeme sağlayıcısı yapılandırması, ilgili ürünün satış modeline göre belirlenmelidir.

---

## 15. E-posta Configuration

### 15.1. Değişkenler

```dotenv
EMAIL_PROVIDER=selected_provider
EMAIL_API_KEY=REPLACE_WITH_EMAIL_API_KEY

EMAIL_FROM_ADDRESS=no-reply@example.com
EMAIL_FROM_NAME=Fortune Platform

EMAIL_TIMEOUT_SECONDS=15
```

### 15.2. Kullanım alanları

- E-posta doğrulama.
- Parola sıfırlama.
- Hesap güvenliği.
- Sipariş bilgilendirmeleri.
- Gerekli operasyonel bildirimler.

Pazarlama e-postaları için ayrı izin ve tercih yönetimi uygulanmalıdır.

---

## 16. WebSocket Configuration

### 16.1. Değişkenler

```dotenv
WEBSOCKET_ENABLED=true

WEBSOCKET_HEARTBEAT_SECONDS=30
WEBSOCKET_IDLE_TIMEOUT_SECONDS=90
WEBSOCKET_MAX_MESSAGE_BYTES=65536
```

### 16.2. Kurallar

- Bağlantılar kimlik doğrulaması gerektirmelidir.
- Mesaj boyutu sınırlandırılmalıdır.
- Token süresi kontrol edilmelidir.
- Bağlantı ve mesaj hız limitleri uygulanmalıdır.
- Çoklu instance koordinasyonu desteklenmelidir.

---

## 17. Rate Limiting Configuration

### 17.1. Örnek değişkenler

```dotenv
RATE_LIMIT_ENABLED=true

RATE_LIMIT_LOGIN_PER_MINUTE=5
RATE_LIMIT_REGISTER_PER_HOUR=10
RATE_LIMIT_FORTUNE_PER_MINUTE=3
RATE_LIMIT_MESSAGE_PER_MINUTE=60
```

Bu değerler başlangıç örnekleridir.

### 17.2. Kurallar

Rate limiting:

- Kullanıcı kimliği.
- IP adresi.
- Endpoint.
- Risk seviyesi.

gibi faktörlere göre uygulanabilir.

IP tabanlı sınırlar NAT ve paylaşılan ağlar nedeniyle dikkatli kullanılmalıdır.

---

## 18. CORS Configuration

### 18.1. Değişken

```dotenv
CORS_ALLOWED_ORIGINS=https://admin.example.com
```

### 18.2. Güvenlik

- Production'da gereksiz wildcard kullanılmamalıdır.
- Yönetici panelinin origin'i açıkça tanımlanmalıdır.
- Credential kullanılan isteklerde origin politikası dikkatle yapılandırılmalıdır.

### 18.3. Mobil uygulama notu

Native Flutter uygulamalarında tarayıcı CORS mekanizması temel güvenlik sınırı değildir.

API güvenliği authentication ve authorization üzerinden sağlanmalıdır.

---

## 19. Logging Configuration

### 19.1. Değişkenler

```dotenv
LOG_LEVEL=INFO
LOG_FORMAT=json

LOG_INCLUDE_REQUEST_ID=true
LOG_REDACT_SENSITIVE_FIELDS=true
```

### 19.2. Gizli alanlar

Loglardan çıkarılması gereken örnek alanlar:

- Password.
- Access token.
- Refresh token.
- API key.
- Payment credentials.
- Özel mesaj içeriği.
- Hassas kullanıcı girdileri.

---

## 20. Monitoring Configuration

### 20.1. Değişkenler

```dotenv
SENTRY_DSN=
SENTRY_ENVIRONMENT=production

METRICS_ENABLED=true
TRACING_ENABLED=true
```

### 20.2. Kurallar

- Production ve staging ayrı izlenmelidir.
- Hata kayıtlarında release sürümü bulunmalıdır.
- Hassas veri maskeleme uygulanmalıdır.
- Sampling oranları maliyet ve gizlilik ihtiyaçlarına göre belirlenmelidir.

---

## 21. Analytics Configuration

### 21.1. Değişkenler

```dotenv
ANALYTICS_ENABLED=true
ANALYTICS_PROVIDER=selected_provider

ANALYTICS_BATCH_SIZE=100
ANALYTICS_FLUSH_INTERVAL_SECONDS=30
```

### 21.2. Gizlilik

Analytics olayları kişisel veya hassas verileri gereksiz yere içermemelidir.

Kullanıcı izinleri ve uygulanabilir mevzuat dikkate alınmalıdır.

---

## 22. Feature Flags

Feature flags modüllerin kontrollü açılmasını sağlar.

### 22.1. Örnek

```dotenv
FEATURE_AI_COFFEE_ENABLED=true
FEATURE_AI_TAROT_ENABLED=true

FEATURE_SOCIAL_ENABLED=false
FEATURE_COMMUNITIES_ENABLED=false
FEATURE_CHAT_ENABLED=false
FEATURE_MARKETPLACE_ENABLED=false
FEATURE_DATING_ENABLED=false
```

### 22.2. Kurallar

- Kritik feature flags backend tarafından uygulanmalıdır.
- Flutter yalnızca arayüz görünürlüğünü kontrol etmemelidir.
- Flag değişiklikleri izlenebilir olmalıdır.
- Kullanıcı bazlı rollout gerektiğinde merkezi flag sistemi değerlendirilebilir.

---

## 23. Flutter Environment Configuration

Flutter uygulamasında yalnızca public yapılandırmalar bulunmalıdır.

### 23.1. Örnek JSON

`config/development.json`

```json
{
  "APP_ENV": "development",
  "API_BASE_URL": "http://10.0.2.2:8000",
  "WEBSOCKET_BASE_URL": "ws://10.0.2.2:8000",
  "ENABLE_DEBUG_LOGS": "true"
}
```

Android Emulator için `10.0.2.2` host bilgisayara erişim amacıyla kullanılabilir.

Fiziksel cihazlarda ve iOS simülatöründe adres yapılandırması farklı olabilir.

### 23.2. Production

`config/production.json`

```json
{
  "APP_ENV": "production",
  "API_BASE_URL": "https://api.example.com",
  "WEBSOCKET_BASE_URL": "wss://api.example.com",
  "ENABLE_DEBUG_LOGS": "false"
}
```

---

## 24. Flutter AppConfig

Örnek yapı:

```dart
class AppConfig {
  static const environment = String.fromEnvironment(
    'APP_ENV',
    defaultValue: 'development',
  );

  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
  );

  static const websocketBaseUrl = String.fromEnvironment(
    'WEBSOCKET_BASE_URL',
  );

  static const enableDebugLogs = bool.fromEnvironment(
    'ENABLE_DEBUG_LOGS',
    defaultValue: false,
  );
}
```

### 24.1. Kullanım

```dart
final apiUrl = AppConfig.apiBaseUrl;
```

### 24.2. Build örneği

```bash
flutter run \
  --dart-define-from-file=config/development.json
```

Production:

```bash
flutter build apk \
  --release \
  --dart-define-from-file=config/production.json
```

### 24.3. Kritik güvenlik notu

`--dart-define` ile verilen değerler derlenmiş uygulamada bulunabilir.

Bu nedenle:

- AI secret.
- Payment secret.
- Database password.
- JWT signing key.
- Firebase Admin credentials.

Flutter build içerisine eklenmemelidir.

---

## 25. Backend Settings Sınıfı

FastAPI için Pydantic Settings kullanılabilir.

### 25.1. Örnek

```python
from functools import lru_cache
from typing import Literal

from pydantic import Field, model_validator
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(
        env_file=".env.local",
        env_file_encoding="utf-8",
        extra="ignore",
    )

    app_env: Literal[
        "local",
        "test",
        "staging",
        "production",
    ] = "local"

    app_debug: bool = False

    database_url: str
    redis_url: str

    jwt_secret_key: str = Field(min_length=32)

    ai_provider: str
    ai_api_key: str

    @model_validator(mode="after")
    def validate_production(self):
        if self.app_env == "production":
            if self.app_debug:
                raise ValueError(
                    "Debug must be disabled in production"
                )

        return self


@lru_cache
def get_settings() -> Settings:
    return Settings()
```

### 25.2. Önemli not

Bu örnek minimum doğrulama altyapısıdır.

Production sürümünde:

- Secret strength.
- HTTPS zorunluluğu.
- Sandbox/production ayrımı.
- Storage yapılandırması.
- Payment yapılandırması.
- Token algoritması.
- CORS kuralları.

için ek doğrulamalar bulunmalıdır.

### 25.3. CI ortamı

CI testlerinde `.env.local` dosyasına bağımlılık oluşmamalıdır.

Test ayarları ayrı environment veya test fixture üzerinden sağlanmalıdır.

---

## 26. Backend .env.example

Aşağıdaki dosya geliştiriciler için başlangıç şablonudur.

```dotenv
# Application
APP_NAME=fortune-platform
APP_ENV=local
APP_DEBUG=true
APP_VERSION=0.1.0
APP_HOST=0.0.0.0
APP_PORT=8000

# Database
DATABASE_URL=postgresql+asyncpg://app:local_password@localhost:5432/app_local
DB_POOL_SIZE=10
DB_MAX_OVERFLOW=20
DB_POOL_TIMEOUT=30

# Redis
REDIS_URL=redis://localhost:6379/0

# Celery
CELERY_BROKER_URL=redis://localhost:6379/1
CELERY_RESULT_BACKEND=redis://localhost:6379/2

# Authentication
JWT_SECRET_KEY=REPLACE_WITH_RANDOM_SECRET_AT_LEAST_32_CHARACTERS
JWT_ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=15
REFRESH_TOKEN_EXPIRE_DAYS=30

# AI
AI_PROVIDER=provider_name
AI_API_KEY=REPLACE_WITH_AI_API_KEY
AI_MODEL=selected-model
AI_TIMEOUT_SECONDS=60
AI_MAX_RETRIES=2

# Storage
STORAGE_PROVIDER=s3
STORAGE_ENDPOINT=
STORAGE_BUCKET=
STORAGE_REGION=
STORAGE_ACCESS_KEY=
STORAGE_SECRET_KEY=

# Payment
PAYMENT_PROVIDER=selected_provider
PAYMENT_ENV=sandbox
PAYMENT_API_KEY=
PAYMENT_API_SECRET=
PAYMENT_WEBHOOK_SECRET=

# Firebase
FCM_PROJECT_ID=
FCM_CREDENTIALS_SOURCE=

# Email
EMAIL_PROVIDER=selected_provider
EMAIL_API_KEY=
EMAIL_FROM_ADDRESS=no-reply@example.com

# Monitoring
SENTRY_DSN=
METRICS_ENABLED=true

# Features
FEATURE_AI_COFFEE_ENABLED=true
FEATURE_AI_TAROT_ENABLED=true
FEATURE_SOCIAL_ENABLED=false
FEATURE_COMMUNITIES_ENABLED=false
FEATURE_CHAT_ENABLED=false
FEATURE_MARKETPLACE_ENABLED=false
FEATURE_DATING_ENABLED=false
```

Bu dosya gerçek secret içermez.

Yerel geliştirmede çalıştırılacak servisler için gerekli alanlar doldurulmalıdır.

---

## 27. Gitignore Politikası

Önerilen `.gitignore` kuralları:

```gitignore
# Environment secrets
.env
.env.*
!.env.example

# Credentials
*.pem
*.p12
*.p8
service-account*.json

# Python
__pycache__/
.pytest_cache/
.venv/

# Flutter
.dart_tool/
build/

# IDE
.idea/
.vscode/
```

### 27.1. Dikkat

Bu örnek kurallar proje ihtiyaçlarına göre uyarlanmalıdır.

Özellikle Firebase istemci yapılandırma dosyaları ile gizli servis hesabı dosyaları aynı kategoride değerlendirilmemelidir.

Ayrıca `.gitignore` mevcut Git geçmişindeki secretları kaldırmaz.

Secret yanlışlıkla commit edildiyse rotasyon yapılmalıdır.

---

## 28. Secret Yönetimi

### 28.1. Secret kategorileri

**High sensitivity:**

- Payment API secrets.
- JWT signing keys.
- Database credentials.
- Firebase Admin credentials.

**Operational secrets:**

- AI provider keys.
- E-posta API keys.
- Storage credentials.
- Monitoring auth tokens.

**Public configuration:**

- API base URL.
- Public feature metadata.
- Firebase client identifiers.
- Uygulama sürümü.

### 28.2. Secret saklama

Production ortamında:

- Cloud secret manager.
- Managed hosting secrets.
- CI/CD protected secrets.

kullanılabilir.

### 28.3. Minimum yetki

Her servis yalnızca ihtiyaç duyduğu secretlara erişmelidir.

Örneğin:

- AI worker → AI provider credentials.
- Payment worker → Payment credentials.
- Notification worker → Push credentials.

---

## 29. Secret Rotation

### 29.1. Rotasyon sebepleri

- Secret sızıntısı.
- Personel erişim değişikliği.
- Sağlayıcı gereksinimi.
- Planlı güvenlik rotasyonu.
- Şüpheli erişim.

### 29.2. Rotasyon adımları

1. Yeni secret oluşturulur.
2. İlgili ortam güncellenir.
3. Servisler yeni secret ile doğrulanır.
4. Eski secret devre dışı bırakılır.
5. Log ve erişim kayıtları incelenir.
6. İşlem kayıt altına alınır.

### 29.3. Sıfır kesinti

Bazı sağlayıcılarda eski ve yeni secretların kısa süre birlikte geçerli olması gerekebilir.

Bu durum desteklenmiyorsa bakım veya kontrollü yeniden başlatma planlanmalıdır.

---

## 30. CI/CD Secrets

GitHub Actions veya seçilen CI/CD platformunda environment bazlı secretlar kullanılmalıdır.

### 30.1. Örnek ayrım

```text
CI_TEST_*
STAGING_*
PRODUCTION_*
```

### 30.2. Kurallar

- Pull request işlemlerine production secretları verilmemelidir.
- Güvenilmeyen fork PR'larında secret erişimi engellenmelidir.
- Production deployment onay gerektirebilir.
- CI loglarında secret değerleri yazdırılmamalıdır.
- Mümkünse kısa ömürlü OIDC kimlik bilgileri kullanılmalıdır.

---

## 31. Configuration Validation

Uygulama başlangıcında yapılandırma doğrulanmalıdır.

### 31.1. Örnek kontroller

- `APP_ENV` geçerli mi?
- Production debug kapalı mı?
- Database URL tanımlı mı?
- JWT secret yeterince güçlü mü?
- AI sağlayıcısı seçilmiş mi?
- AI API key mevcut mu?
- Payment aktifse gerekli secretlar var mı?
- Object storage yapılandırması eksiksiz mi?
- Public API URL HTTPS mi?
- Feature flags tutarlı mı?

### 31.2. Fail-fast

Kritik yapılandırma eksikse uygulama sessizce hatalı çalışmaya devam etmemelidir.

Başlangıç sırasında anlaşılır hata vermelidir.

Hata mesajı secret değerini göstermemelidir.

---

## 32. Feature Dependency Validation

Bazı özellikler diğer servislerin aktif olmasını gerektirir.

### 32.1. Örnek bağımlılıklar

| Feature | Gerekli servis |
|---|---|
| AI Coffee | AI Provider + Storage |
| AI Tarot | AI Provider |
| Chat | Database + Realtime |
| Marketplace | Payment + Order + Moderation |
| Dating | Matching + Chat + Moderation |
| Push Notifications | FCM |
| Analytics | Analytics Provider |

### 32.2. Örnek kural

Marketplace aktifse ödeme ve moderasyon yapılandırmaları tamamlanmış olmalıdır.

Bu bağımlılıklar uygulama başlangıcında veya deployment doğrulamasında kontrol edilmelidir.

---

## 33. Configuration Drift

Staging ve production arasında kontrolsüz yapılandırma farkları oluşmamalıdır.

### 33.1. Kontroller

- Environment schema aynı olmalıdır.
- Zorunlu değişkenler karşılaştırılmalıdır.
- Feature flag farkları izlenmelidir.
- Servis sürümleri takip edilmelidir.
- Deployment konfigürasyonları versiyonlanmalıdır.

### 33.2. Gizlilik

Karşılaştırma raporlarında secret değerleri gösterilmemelidir.

Yalnızca varlık, tür ve uygunluk bilgisi kullanılabilir.

---

## 34. Local Developer Setup

Yeni geliştirici için önerilen kurulum:

### 34.1. Repository

```bash
git clone <repository-url>
cd project
```

### 34.2. Environment

```bash
cp apps/backend/.env.example apps/backend/.env.local
```

### 34.3. Servisler

```bash
docker compose up -d
```

Gerçek komut, seçilen Compose dosyasının konumuna göre uyarlanmalıdır.

### 34.4. Migration

```bash
alembic upgrade head
```

### 34.5. Flutter

```bash
cd apps/mobile

flutter pub get

flutter run \
  --dart-define-from-file=config/development.json
```

### 34.6. Kontrol

- API health endpoint.
- Database connection.
- Redis connection.
- Flutter API connection.
- Authentication test flow.

---

## 35. Production Deployment Validation

Production deployment öncesi:

- [ ] Environment schema doğrulandı.
- [ ] Secretlar mevcut.
- [ ] Debug kapalı.
- [ ] HTTPS aktif.
- [ ] Database erişimi güvenli.
- [ ] Redis erişimi güvenli.
- [ ] AI provider yapılandırıldı.
- [ ] Payment ortamı doğrulandı.
- [ ] Storage private.
- [ ] Firebase credentials doğrulandı.
- [ ] Monitoring aktif.
- [ ] Feature flags kontrol edildi.
- [ ] Migration uyumluluğu doğrulandı.
- [ ] Rollback planı hazır.

---

## 36. Configuration Testing

### 36.1. Unit tests

- Eksik environment değişkeni.
- Geçersiz veri tipi.
- Geçersiz ortam.
- Debug production çakışması.
- Eksik secret.
- Geçersiz URL.
- Feature dependency hatası.

### 36.2. Integration tests

- Database bağlantısı.
- Redis bağlantısı.
- AI sandbox bağlantısı.
- Payment sandbox bağlantısı.
- Storage upload.
- FCM test gönderimi.

### 36.3. Security tests

- Secret logging.
- Secret scanning.
- Yanlışlıkla public exposure.
- CI secret permissions.
- Production credential isolation.

---

## 37. MVP Configuration Öncelikleri

### P0

- Backend Settings.
- `.env.example`.
- Local `.env`.
- PostgreSQL.
- Redis.
- AI provider.
- JWT configuration.
- Flutter API URL.
- Secret isolation.
- Production validation.
- Feature flags.
- Temel monitoring.

### P1

- Payment configuration.
- FCM.
- Object storage lifecycle.
- Advanced rate limiting.
- Secret rotation automation.
- Configuration drift detection.

### P2

- Merkezi feature flag platformu.
- Dinamik remote configuration.
- Çok bölgeli yapılandırma.
- Gelişmiş secret rotation.
- Otomatik configuration compliance.

P1 kapsamındaki bir servis MVP'de aktif kullanılacaksa ilgili yapılandırması P0 kabul edilmelidir.

---

## 38. Açık Teknik Kararlar

| Konu | Durum |
|---|---|
| Backend Settings | Pydantic Settings önerildi |
| Flutter Configuration | dart-define önerildi |
| Production Secret Manager | TBD |
| AI Provider | TBD |
| AI Model | TBD |
| Payment Provider | TBD |
| Object Storage | TBD |
| Firebase Project | TBD |
| Monitoring Provider | TBD |
| Analytics Provider | TBD |
| Feature Flag Provider | Başlangıçta environment |
| Production Region | TBD |
| Secret Rotation Policy | TBD |
| Configuration Validation CI | Planlandı |

---

## 39. Kabul Kriterleri

- [ ] Backend yapılandırmaları merkezi Settings sınıfından okunuyor.
- [ ] Eksik kritik environment değişkenleri hata üretiyor.
- [ ] Production debug modu engelleniyor.
- [ ] Flutter environment ayrımı çalışıyor.
- [ ] Flutter içerisinde sunucu secretı bulunmuyor.
- [ ] `.env.example` gerçek secret içermiyor.
- [ ] Local ve production kimlik bilgileri ayrılmış.
- [ ] Database configuration doğrulanıyor.
- [ ] Redis configuration doğrulanıyor.
- [ ] AI provider configuration doğrulanıyor.
- [ ] Payment configuration doğrulanıyor, aktifse.
- [ ] Storage configuration doğrulanıyor, aktifse.
- [ ] Feature dependency kontrolleri uygulanıyor.
- [ ] CI secret scanning çalışıyor.
- [ ] Production secretları güvenli saklanıyor.
- [ ] Secret rotasyon prosedürü mevcut.
- [ ] Configuration testleri CI içinde çalışıyor.
- [ ] Production deployment checklist tamamlandı.

---

## 40. İlişkili Dokümanlar

- `PROJECT_OVERVIEW.md`
- `SYSTEM_ARCHITECTURE.md`
- `BACKEND_ARCHITECTURE.md`
- `FLUTTER_ARCHITECTURE.md`
- `API_SPECIFICATION.md`
- `DATABASE_SCHEMA.md`
- `AI_SYSTEM_DESIGN.md`
- `PAYMENT_AND_MONETIZATION.md`
- `SECURITY_AND_PRIVACY.md`
- `NOTIFICATION_SYSTEM.md`
- `CHAT_AND_REALTIME.md`
- `MATCHING_ALGORITHM.md`
- `FORTUNE_TELLER_MARKETPLACE.md`
- `CONTENT_MODERATION.md`
- `ANALYTICS_AND_METRICS.md`
- `TESTING_STRATEGY.md`
- `DEPLOYMENT_AND_DEVOPS.md`
- `DEVELOPMENT_ROADMAP.md`
- `LEGAL_AND_COMPLIANCE.md`

---

## 41. Sonuç

Ortam yapılandırması, platformun güvenli ve sürdürülebilir çalışması için temel altyapı bileşenidir.

Flutter, backend, worker ve harici servisler arasında yapılandırma sınırları açık olmalıdır.

Sunucu secretları hiçbir koşulda mobil uygulama içerisinde saklanmamalıdır.

**Temel mimari kararı:** Backend yapılandırmaları Pydantic Settings ile doğrulanacak; Flutter ortam ayarları `dart-define` üzerinden yönetilecek; production secretları güvenli secret yönetim altyapısında saklanacak ve CI/CD süreçlerinde ortam izolasyonu uygulanacaktır.

**Doküman durumu:** Teknik yapılandırma taslağı.