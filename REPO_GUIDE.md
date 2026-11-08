# Repo rehberi — Aradığım dosya nerede?

Son kontrol: 2026-11-08. Bu rehber dosyaların yerini ve sorumluluğunu gösterir; gereksinimleri veya kararları tekrar tanımlamaz. Yeni bir ana belge/klasör veya uygulama giriş noktası eklendiğinde ilgili bağlantıyı burada güncelleyin.

## İlk gelişte okuma sırası

1. [README](README.md): Ürün ve çalışma alanının genel görünümü.
2. [Proje tanımı](project/PROJECT_CHARTER.md): Amaç, sınırlar ve ilkeler.
3. [Güncel durum](project/STATUS.md): Çalışanlar, öneriler ve açık kararlar.
4. [İlerleme haritası](project/PROGRESS_MAP.md): Birlikte izlenen iş sırası.
5. [Çalışma düzeni](project/WORKFLOW.md) ve [GitHub düzeni](project/REPOSITORY.md): Değişiklik ve teslim kuralları.
6. Görev alanınıza göre aşağıdaki dosyalara geçin. Kodlama asistanları ayrıca [AGENTS.md](AGENTS.md) kurallarını izler.

**Önemli ayrım:** `docs/` altında taslaklar bulunur; bir dosyanın varlığı işlevin geliştirildiği veya önerinin onaylandığı anlamına gelmez. Güncel kullanıcı talimatı, karar kaydı ve gereksinimi birlikte değerlendirin. Eski oturumları güncel durum yerine kullanmayın.

## Ne yapmak istiyorsunuz?

| Aradığınız şey | Başlangıç noktası |
|---|---|
| Uygulamayı çalıştırmak | [Mobil kurulum ve komutlar](apps/mobile/README.md) |
| Şu an hangi özellikler çalışıyor? | [STATUS](project/STATUS.md) ve [mobil demo sınırları](apps/mobile/README.md) |
| Hangi ekranlar planlanıyor? | [USER_FLOWS](docs/USER_FLOWS.md), §18 ekran envanteri, §19 ilk kod dilimi |
| Renk, cam efekti, kart veya gezinme değiştirmek | [Kod haritası](#mobil-kod-haritası) ve [UX rehberi](docs/UI_UX_GUIDELINES.md) |
| Yeni ürün fikri eklemek | [Fikir havuzu](project/IDEA_BACKLOG.md); henüz kapsam kararı değildir |
| Kafe check-in/Premium/sohbet kilidi kuralları | [IDEA-004](project/IDEA_BACKLOG.md) ve [ADR-0004](project/decisions/ADR-0004-kafe-check-in-kurallari.md) |
| Bir seçimin gerekçesini bulmak | [Karar kayıtları](project/decisions/README.md) |
| Bir işin kabul kriterlerini bulmak | [Görevler](project/tasks/README.md) |
| Son oturumdan devam etmek | Önce [STATUS](project/STATUS.md), sonra işaret ettiği [oturum kayıtları](project/sessions/README.md) |
| Kullanıcının özgün talebini bulmak | [Geliştirme promptları](prompts/development/) |
| AI'nin çalışma talimatları nerede? | [Runtime promptları](prompts/runtime/README.md); henüz üretim promptu yok |
| API sözleşmesi/veritabanı/backend | [API taslağı](docs/API_SPECIFICATION.md), [veri taslağı](docs/DATABASE_SCHEMA.md), [backend alanı](services/backend/README.md) |
| GitHub ile güncelliği kontrol etmek | [Repo düzeni](project/REPOSITORY.md), [kontrol scripti](scripts/check-repo.ps1) |

## Klasörlerin sorumlulukları

| Konum | İçerik ve mevcut durum |
|---|---|
| [docs/](docs/) | 25 ürün/teknik belge; aşağıda konu dizini var |
| [project/](project/) | Durum, ilerleme, fikir havuzu, karar/görev/oturum kayıtları |
| [project/templates/](project/templates/) | [Karar](project/templates/decision.md), [görev](project/templates/task.md), [oturum](project/templates/session.md) şablonları |
| [prompts/](prompts/README.md) | Gerçek talepler, runtime talimatları ve deneyler ayrı dizinlerde |
| [prompts/experiments/](prompts/experiments/README.md) | Deneme ve değerlendirmeler için alan |
| [prompts/templates/](prompts/templates/development-prompt.md) | Geliştirme talebi kayıt şablonu |
| [apps/mobile/](apps/mobile/README.md) | Çalışan Flutter arayüz demosu, uygulama kodu ve widget testleri |
| [apps/admin/](apps/admin/README.md) | Yönetim arayüzü için ayrılan alan; henüz uygulama yok |
| [services/backend/](services/backend/README.md) | API, iş kuralları, worker ve migration için alan; henüz servis yok |
| [contracts/](contracts/README.md) | Makine doğrulanabilir ortak sözleşmeler için alan; henüz şema yok |
| [infrastructure/](infrastructure/README.md) | Ortam ve dağıtım tanımları için alan; henüz kurulum yok |
| [scripts/](scripts/README.md) | Tekrarlanabilir bakım komutları; mevcut Git kontrol scripti |
| [tests/](tests/README.md) | Sistemler arası testler için alan; uygulama içi testlerle karıştırmayın |
| [assets/](assets/README.md) | Ortak marka/tasarım kaynakları için alan; kullanıcı yüklemeleri burada tutulmaz |
| [archive/](archive/README.md) | Kullanımdan kaldırılan kayıtlar için alan; güncel karar kaynağı değildir |
| [.gitignore](.gitignore) | Secret, bağımlılık ve üretilen çıktı dışlamaları |

## Mobil kod haritası

| Dosya / dizin | Değiştireceğiniz şey |
|---|---|
| [main.dart](apps/mobile/lib/main.dart) | Flutter başlangıcı |
| [app.dart](apps/mobile/lib/app/app.dart) | MaterialApp, beş sekme, mesaj/bildirim girişleri ve gezinme |
| [theme.dart](apps/mobile/lib/app/theme.dart) | Palette, buton, form, chip ve gezinme stilleri |
| [glass.dart](apps/mobile/lib/shared/glass.dart) | GlassPanel, AuroraBackground, dekoratif OrbitalSeal |
| [widgets.dart](apps/mobile/lib/shared/widgets.dart) | Sayfa gövdesi, başlık, ortak kart, boş durum ve sayfa açma yardımcısı |
| [home_page.dart](apps/mobile/lib/features/home/home_page.dart) | Ana sayfa ve öne çıkan fal kartı |
| [fortune_page.dart](apps/mobile/lib/features/fortune/fortune_page.dart) | Tür seçimi, örnek girdi, doğrulama/bekleme ve sabit sonuç |
| [discover_page.dart](apps/mobile/lib/features/discover/discover_page.dart) | Topluluk, Falcılar Ligi ve eşleşme girişleri |
| [social_page.dart](apps/mobile/lib/features/social/social_page.dart) | Oturumluk demo gönderileri ve beğeni |
| [profile_page.dart](apps/mobile/lib/features/profile/profile_page.dart) | Profil ve ilgili boş/bilgilendirme görünümleri |
| [widget_test.dart](apps/mobile/test/widget_test.dart) | Fal akışı, sosyal durum ve dar ekran/büyük yazı testleri |
| [pubspec.yaml](apps/mobile/pubspec.yaml), [pubspec.lock](apps/mobile/pubspec.lock) | Bağımlılık tanımları ve çözülen sürümler |
| [analysis_options.yaml](apps/mobile/analysis_options.yaml) | Statik analiz kuralları |
| [android/](apps/mobile/android/) | Android proje/manifest/Gradle/yerel başlangıç kaynakları |
| [ios/](apps/mobile/ios/) | iOS Xcode projesi, Runner, platform kaynakları ve yerel test alanı |
| [web/](apps/mobile/web/) | Aynı Flutter demosunun web başlatma sayfası, manifest ve ikonları |

Kafe kurallarının kaydedilmiş olması mobilde check-in'in çalıştığı anlamına gelmez. Demo henüz backend, gerçek kimlik doğrulama, AI, ödeme veya mesaj servisine bağlı değildir.

## Ürün ve teknik belge dizini

| Konu | Belgeler |
|---|---|
| Ürün ve özellikler | [PROJECT_OVERVIEW](docs/PROJECT_OVERVIEW.md), [PRD](docs/PRD.md), [APP_FEATURES](docs/APP_FEATURES.md) |
| Akışlar ve tasarım | [USER_FLOWS](docs/USER_FLOWS.md), [USER_ROLES](docs/USER_ROLES.md), [UI_UX_GUIDELINES](docs/UI_UX_GUIDELINES.md) |
| Mimari | [SYSTEM_ARCHITECTURE](docs/SYSTEM_ARCHITECTURE.md), [FLUTTER_ARCHITECTURE](docs/FLUTTER_ARCHITECTURE.md), [BACKEND_ARCHITECTURE](docs/BACKEND_ARCHITECTURE.md) |
| Veri, API ve AI | [DATABASE_SCHEMA](docs/DATABASE_SCHEMA.md), [API_SPECIFICATION](docs/API_SPECIFICATION.md), [AI_SYSTEM_DESIGN](docs/AI_SYSTEM_DESIGN.md) |
| Sosyal iletişim | [CHAT_AND_REALTIME](docs/CHAT_AND_REALTIME.md), [NOTIFICATION_SYSTEM](docs/NOTIFICATION_SYSTEM.md), [MATCHING_ALGORITHM](docs/MATCHING_ALGORITHM.md) |
| Ticaret | [FORTUNE_TELLER_MARKETPLACE](docs/FORTUNE_TELLER_MARKETPLACE.md), [PAYMENT_AND_MONETIZATION](docs/PAYMENT_AND_MONETIZATION.md) |
| Güvenlik ve operasyon | [SECURITY_AND_PRIVACY](docs/SECURITY_AND_PRIVACY.md), [CONTENT_MODERATION](docs/CONTENT_MODERATION.md), [LEGAL_AND_COMPLIANCE](docs/LEGAL_AND_COMPLIANCE.md) |
| Teslim, test ve ölçüm | [DEVELOPMENT_ROADMAP](docs/DEVELOPMENT_ROADMAP.md), [TESTING_STRATEGY](docs/TESTING_STRATEGY.md), [ANALYTICS_AND_METRICS](docs/ANALYTICS_AND_METRICS.md) |
| Ortam ve dağıtım | [ENVIRONMENT_CONFIGURATION](docs/ENVIRONMENT_CONFIGURATION.md), [DEPLOYMENT_AND_DEVOPS](docs/DEPLOYMENT_AND_DEVOPS.md) |

## Yeni kayıt nereye konur?

- Kullanıcı talebi: `prompts/development/YYYY-MM-DD-NNN-kisa-baslik.md`; aynı işin devamı aynı kayda eklenir.
- Yeni fikir: `project/IDEA_BACKLOG.md`; onaylanmış kapsam gibi işaretlenmez.
- Anlamlı ürün/mimari kararı: `project/decisions/ADR-NNNN-kisa-baslik.md`.
- Çok adımlı iş/kabul kriterleri: `project/tasks/TASK-NNNN-kisa-baslik.md`.
- Yapılan iş ve doğrulama: `project/sessions/YYYY-MM-DD-NNN-kisa-baslik.md`; devam noktası STATUS'ta güncellenir.
- Ürün gereksinimi: ilgili mevcut `docs/` belgesine hedefli değişiklik; rakip gereksinim kopyası oluşturulmaz.
- Mobil test: `apps/mobile/test/`; gelecekteki servis içi test ilgili servisin içinde, sistemler arası test kök `tests/` altında.

## Dosyayı arayarak bulmak

Repo kökünde:

```powershell
rg --files
rg --files apps/mobile/lib
rg -n 'Premium|check-in' project docs
rg -n 'GlassPanel|Palette' apps/mobile/lib
```

`rg --files` normalde ignore edilen üretilmiş dosyaları göstermez. Gerçek `.env`, SDK/bağımlılık önbellekleri, `build/` ve yerel `artifacts/` çıktıları kaynak haritasının parçası değildir; push kapsamı [.gitignore](.gitignore) ve [repo düzeni](project/REPOSITORY.md) ile belirlenir. Flutter oluşturma araçlarına ait `.metadata` ve platform proje dosyaları uygulama klasöründe bulunur.

Bu rehberin bağlantıları dosya/dizin konumlarını gösterir. Ayrıntılı bir kaydı bulmak için ilgili klasörde tarih, ADR veya TASK kimliğini arayın.
