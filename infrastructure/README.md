# Altyapı ve dağıtım

Container, yerel servis düzeni, ortam ve dağıtım tanımları burada tutulur. Henüz Docker, hosting veya CI/CD kurulmadı.

Gerçek secret ve `.env` dosyaları sürüm kontrolüne girmez; gerekli değişkenler kurulum sırasında örnek dosyalarda belgelenir. Uygulama içi yapılandırma kodu ilgili uygulamada kalır. Sağlayıcıdan bağımsız ihtiyaçlar için `../docs/DEPLOYMENT_AND_DEVOPS.md` ve `../docs/ENVIRONMENT_CONFIGURATION.md` referanstır. CI sağlayıcısının zorunlu dosyaları gerektiğinde kendi standart konumunda oluşturulur.
