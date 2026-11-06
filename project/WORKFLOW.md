# Çalışma ve kayıt düzeni

## Bilginin sorumluluğu

| Bilgi | Yeri |
|---|---|
| Ürün gereksinimleri ve teknik taslaklar | `docs/` |
| Projenin kısa tanımı ve sınırları | `project/PROJECT_CHARTER.md` |
| Şu an nerede olduğumuz | `project/STATUS.md` |
| Neden bir seçim yapıldığı | `project/decisions/` |
| Yapılacak iş ve kabul kriterleri | `project/tasks/` |
| Yapılan iş ve devam bilgisi | `project/sessions/` |
| Kullanıcının geliştirme talebi | `prompts/development/` |
| Uygulamanın çalıştırdığı AI promptu | `prompts/runtime/` |
| Deney ve değerlendirme | `prompts/experiments/` |

## Belgeler çelişirse

Güncel açık kullanıcı talimatını esas alın ve kaydedin. Önceden onaylanmış kapsam/karar varsa ilgili karar kaydını ve gereksinimi birlikte inceleyin. Dosyanın daha yeni veya ayrıntılı olması tek başına onay anlamına gelmez.

Çelişkiyi `STATUS.md` veya ilgili görevde belirtin; etkilenmeyen işlere devam edin. Kapsama veya teknolojiye bağlı iş için gerekli kararı netleştirin. Karar sonrası ilgili `docs/` belgesini hedefli olarak güncelleyin ve karar bağlantısını ekleyin. İkinci bir bağımsız gereksinim listesi üretmeyin.

## Bir işin yaşam döngüsü

1. Gerçek kullanıcı talebini prompt şablonuyla kaydet.
2. İlgili belgeleri ve mevcut kodu incele; çok adımlı iş için görev oluştur.
3. Gerekli kararları öneri/onay durumu açık şekilde kaydet.
4. Değişikliği doğru uygulama veya servis klasöründe yap.
5. Etkisine uygun doğrulama yap; sonucu ve sınırlamalarını kaydet.
6. Prompt, görev, karar ve oturum kayıtlarını birbirine bağla; güncel durumu yenile.

## Dosya adlandırma

- Tarihli kayıtlar: `YYYY-MM-DD-NNN-kisa-baslik.md`; aynı gün ve kayıt klasörü içinde NNN benzersizdir.
- Kararlar: `ADR-NNNN-kisa-baslik.md`; ürün kararları da bu dizide tutulabilir, tür alanıyla ayrılır.
- Görevler: `TASK-NNNN-kisa-baslik.md`.
- Dosya adlarında boşluksuz ASCII ve kısa, anlamlı adlar kullanın. İçerik dili Türkçedir.
- Şablonları kayıt klasörlerine kopyalayın; şablonun kendisini gerçek kayıt olarak doldurmayın.

## Gizlilik ve geçmiş

Prompt arşivi kullanıcıya görünür talepleri ve uygulama talimatlarını saklar; gizli sistem talimatları veya iç düşünce kaydı değildir. Anahtar, şifre ve kişisel verileri redakte edin. Deneylerde sentetik veri kullanın.

Kayıtlar elle veya çalışan asistan tarafından tutulur; otomatik sohbet yakalama kurulmuş değildir. Göremediğiniz eski konuşmaları tamamlamaya çalışmayın. Kayıtlardaki durum değişikliklerini tarihli notla belirtin. Dosya geçmişi Git ile izlenir; repo ve senkronizasyon düzeni [REPOSITORY.md](REPOSITORY.md) içindedir.
