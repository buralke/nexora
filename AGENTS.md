# Projede çalışan asistanlar için kurallar

## İşe başlarken

- Kök README, `project/PROJECT_CHARTER.md`, `project/STATUS.md` ve `project/WORKFLOW.md` dosyalarını okuyun.
- Görevle ilgili `docs/` belgelerini, karar kayıtlarını ve varsa son oturum kaydını inceleyin.
- Mevcut kullanıcı talimatları önceliklidir. Belgelerdeki önerileri onaylanmış teknik karar gibi uygulamayın.
- Her çalışma başında ve push öncesinde `scripts/check-repo.ps1` ile GitHub güncelliğini kontrol edin. Ağ kontrolü başarısızsa senkronizasyon doğrulanmış sayılmaz. Uzak değişiklikleri incelemeden birleştirmeyin; force push kullanmayın. Ayrıntılar `project/REPOSITORY.md` içindedir.

## Kapsam ve mimari

- Ürünün uzun vadeli hedefi fal üzerinden sosyal etkileşimdir; ilk sürümün kapsamını ayrıca izleyin.
- Yeni bir teknoloji, ücretli servis, modül veya kapsam değişikliğini sessizce kesinleştirmeyin. Kararı ve gerekçesini kaydedin; henüz verilmediyse açık karar olarak bırakın.
- Gereksiz iskelet kod, kullanılmayan bağımlılık ve boş özellik modülleri oluşturmayın.
- `docs/` dosyalarını taşımayın veya topluca yeniden yazmayın. Gerektiğinde ilgili belgeyi hedefli olarak güncelleyin ve kayıtla ilişkilendirin.
- Gizli anahtarları, gerçek kullanıcı verilerini ve özel ortam dosyalarını kaynak koduna veya prompt kayıtlarına koymayın.

## Prompt ve çalışma kaydı

- Her geliştirme/değişiklik talebinin kullanıcı tarafından verilen metnini `prompts/development/YYYY-MM-DD-NNN-kisa-baslik.md` altında kaydedin. Aynı gün NNN değerini mevcut kayıtlara göre artırın.
- Anlamı değiştirmeden gerçek metni saklayın. Gizli veya kişisel kısımları `[REDACTED]` ile değiştirip redaksiyonu belirtin. Görülmeyen eski mesajları uydurmayın.
- Talebe ait devam mesajlarını aynı kayda, sıralı ve tarihli olarak ekleyin. Yeni bağımsız iş için yeni kayıt açın.
- Kullanıcıya ait promptu kendi uygulama planınızdan ayırın. İç akıl yürütmeyi, gizli sistem/geliştirici talimatlarını ve kimlik bilgilerini kaydetmeyin.
- Uygulamanın çalışırken kullandığı AI promptları `prompts/runtime/`, denemeler `prompts/experiments/` altında tutulur. Üretim promptları açık sürümle koddan referanslanır.
- Çalışma sonunda `project/STATUS.md` dosyasını güncel tutun ve `project/sessions/` altında sonuç, değişen dosyalar, doğrulama ve sıradaki adımı kaydedin.
- Anlamlı ürün/mimari kararlarını `project/decisions/`, çok adımlı geliştirme görevlerini `project/tasks/` altında şablonlarıyla izleyin.

## Doğrulama ve teslim

- Değişikliğin etkisine uygun kontroller yapın. Çalıştırılmayan testi başarılı gibi bildirmeyin.
- Uygulama testlerini uygulamanın içinde; sistemler arası testleri kök `tests/` altında tutun.
- Sonuçta neyin değiştiğini, nasıl doğrulandığını ve kalan belirsizlikleri açıkça belirtin.
