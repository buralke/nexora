# Nexora çalışma alanı

AI destekli fal deneyimini sosyal etkileşimle birleştiren mobil platformun çalışma alanı. **Nexora şu an klasör/çalışma adıdır; nihai marka adı onaylanmış değildir.**

Proje planlama aşamasındadır. Bu iskelet çalışan uygulama, kurulmuş servis veya kesinleşmiş teknoloji seçimi içermez.

## Başlangıç noktaları

1. [Proje tanımı ve sınırları](project/PROJECT_CHARTER.md)
2. [Güncel durum ve açık kararlar](project/STATUS.md)
3. [Çalışma ve kayıt düzeni](project/WORKFLOW.md)
4. [Mevcut ürün vizyonu](docs/PROJECT_OVERVIEW.md) ve [gereksinimler](docs/PRD.md)
5. [Geliştirme yol haritası](docs/DEVELOPMENT_ROADMAP.md)
6. [Birlikte izlenecek adım adım ilerleme haritası](project/PROGRESS_MAP.md)

## Klasör haritası

```text
nexora/
├── docs/                   Mevcut ürün ve teknik dokümantasyon
├── project/                Güncel kapsam, durum, kararlar ve çalışma kayıtları
│   ├── decisions/          Ürün ve mimari karar kayıtları
│   ├── tasks/              Geliştirme görevleri
│   ├── sessions/           Oturum özeti ve devam bilgisi
│   └── templates/          Karar, görev ve oturum şablonları
├── prompts/
│   ├── development/        Geliştirmede kullanılan gerçek kullanıcı promptları
│   ├── runtime/            Uygulamanın AI servislerinde kullanacağı promptlar
│   ├── experiments/        Prompt denemeleri ve değerlendirmeleri
│   └── templates/          Prompt kayıt şablonu
├── apps/
│   ├── mobile/             Flutter mobil uygulaması için ayrılan alan
│   └── admin/              Yönetim arayüzü için ayrılan alan
├── services/
│   └── backend/            API, iş kuralları, worker ve migration alanı
├── contracts/              API, olay ve ortak veri sözleşmeleri
├── infrastructure/         Ortam, container ve dağıtım tanımları
├── scripts/                Tekrarlanabilir geliştirme ve bakım komutları
├── tests/                  Sistemler arası uçtan uca testler
├── assets/                 Ortak tasarım kaynakları ve marka dosyaları
├── archive/                Kullanımdan kaldırılmış, referans amaçlı kayıtlar
├── AGENTS.md               Kodlama asistanları için çalışma kuralları
└── .gitignore              Yerel ve üretilmiş dosya dışlamaları
```

`docs/` olduğu yerde ve içeriği değiştirilmeden korunmuştur. Yeni operasyonel kayıtlar `project/` altında tutulur; ürün gereksinimleri bu klasöre kopyalanmaz.

## Belgelerin anlamı

Mevcut belgeler taslaktır. Öneri, onaylanmış karar ve çalışan kod birbirinden ayrılır. Bir çelişki için [çalışma düzenini](project/WORKFLOW.md) izleyin. Her klasörün README dosyası kendi sorumluluk sınırını açıklar.
