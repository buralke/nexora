# Proje tanımı ve sınırları

Durum: Mevcut belgelerden çıkarılmış çalışma özeti, 2026-11-06. Bu özet yeni ürün veya teknoloji kararı vermez.

## Proje nedir?

Android ve iOS için planlanan, AI fal deneyimini sosyal etkileşimle birleştiren bir platformdur. Fal kullanıcıyı keşfe davet eder; sosyal ağ, topluluklar ve isteğe bağlı eşleşme uzun vadeli etkileşim sağlar.

Ana ürün alanları:

- AI Fal Merkezi: kahve, tarot, el falı, rüya ve astroloji gibi deneyimler.
- Falcılar Ligi: insan yorumcuların hizmet sunduğu pazaryeri.
- Sosyal akış: paylaşım, takip, beğeni ve yorum.
- Topluluklar: konu ve tartışmalar.
- İsteğe bağlı flört/eşleşme: tercihler ve izin verilen eğlence amaçlı fal sinyalleri.

## Proje ne değildir?

- Fal yorumlarının bilimsel doğruluğunu veya geleceği bilmesini vaat eden bir ürün değildir.
- Tıbbi, hukuki, finansal veya psikolojik uzman hizmeti değildir.
- Her kullanıcıyı flört havuzuna dahil eden veya özel fal sonuçlarını kendiliğinden paylaşan bir sistem değildir.
- Yalnızca bir AI sohbet botu değildir; insan yorumcuların hizmeti AI üretiminden ayrı tutulur.
- Tüm modülleri ilk sürümde birlikte geliştirme taahhüdü değildir.
- Bu klasör iskeleti teknoloji, sağlayıcı, fiyat, yayın tarihi veya marka onayı değildir.

## İlk sürüm için çalışma referansı

`docs/DEVELOPMENT_ROADMAP.md` Core MVP bölümü; onboarding, hesap/profil, AI kahve falı ve ikinci fal türü, sonuç/geçmiş, kullanım hakkı ve günlük limit, temel bildirim, ayarlar, hesap silme, güvenlik, analitik ve minimum operasyonel araçları tarif eder.

Sosyal ağ, topluluklar, pazaryeri ve eşleşme sonraki aşamalardır. **MVP kapsamı belgeler arasında tamamen tutarlı değildir; uygulamaya başlamadan netleştirilmelidir.**

## Korunacak ilkeler

- Özel sonuçlar için varsayılan gizlilik ve kullanıcı kontrollü paylaşım.
- Eşleşmeye açık katılım; fal verilerini eşleşmede kullanmak için ayrıca izin.
- Backend tarafında yetkilendirme, AI anahtarları ve iş kuralları.
- AI maliyeti, başarısız işlem ve kullanım hakkının birlikte yönetilmesi.
- Aşamalı geliştirme ve gereksiz mimari karmaşıklıktan kaçınma.

Asıl gereksinimler: [vizyon](../docs/PROJECT_OVERVIEW.md), [PRD](../docs/PRD.md), [yol haritası](../docs/DEVELOPMENT_ROADMAP.md). Değişen kapsam karar kaydıyla ilgili belgeye işlenir.
