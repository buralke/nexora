# Ürün fikir havuzu

Son güncelleme: 2026-11-08

Bu dosya tartışılan fikirleri unutmamak için tutulur. Fikirler onaylanmış gereksinim, MVP kapsamı veya geliştirme taahhüdü değildir. Seçilen fikirler ilgili ürün belgesine ve gerektiğinde karar kaydına aktarılır.

Kaynak: [Fikirleri saklama talebi](../prompts/development/2026-11-08-003-urun-fikirleri.md). İlk üç fikir asistan tarafından önerildi; kullanıcı olumlu bulup saklanmasını istedi. Dördüncü fikir kullanıcıdan geldi. 2026-11-08 devamında kullanıcı dört fikrin aynı havuzda birleştirilmesini istedi.

## IDEA-001 — Faldan sohbete

- Durum: Tartışılacak; kullanıcı olumlu buldu, uygulama kararı yok.
- Amaç: Bireysel fal deneyiminden sosyal etkileşime doğal geçiş.
- Deneyim: Kullanıcı falından seçtiği bir temayı paylaşım kartına dönüştürür. Örneğin “Yeni başlangıçlar” teması “Sen en son neye yeniden başladın?” sorusuyla sohbet açar.
- Kontrol: Özel yorumun tamamı paylaşılmaz; kullanıcı paylaşılacak bölümü ve görünürlüğü önizleyip onaylar.
- Açık sorular: Kartta ne gösterilir? Soru nasıl hazırlanır? Paylaşım akışa mı topluluğa mı gider?
- İlgili mevcut alanlar: USER_FLOWS §5.4 ve §8; PRD fal paylaşımı.

## IDEA-002 — Küçük ritüeller

- Durum: Tartışılacak; kullanıcı olumlu buldu, uygulama kararı yok.
- Amaç: Kullanıcının ortak deneyim ve hikâyeler için geri gelmesini desteklemek.
- Deneyim: “Pazar kahvesi” veya “Rüya günlüğü” gibi ortak buluşmalar. Katılımcılar kendi hikâyelerini paylaşır ve birbirlerinin anlatılarına katılır.
- Kontrol: Katılım ve paylaşım isteğe bağlıdır.
- Açık sorular: Buluşmalar zamanlı mı sürekli mi? Kim başlatır? Topluluklarla ilişkisi ve moderasyonu nasıl olur?
- İlgili mevcut alanlar: USER_FLOWS §10 ve §12; topluluklar ve bildirim tercihleri.

## IDEA-003 — Fal arkadaşı

- Durum: Tartışılacak; kullanıcı olumlu buldu, uygulama kararı yok.
- Amaç: İki kişinin birlikte eğlenceli bir keşif deneyimi yaşaması.
- Deneyim: İki kişi kendi isteğiyle aynı soruya cevap verir veya birlikte kart seçer. Arkadaşlar arasında da kullanılabilir.
- Kontrol: Ortak deneyim romantik eşleşme anlamına gelmez; kişisel fal geçmişi kendiliğinden açılmaz.
- Açık sorular: Davet nasıl yapılır? Eşzamanlı katılım gerekir mi? Hangi cevaplar ortak görünür? İptal ve engelleme nasıl işler?
- İlgili mevcut alanlar: USER_FLOWS §5, §9 ve §11; ortak deneyimin eşleşmeden ayrımı ayrıca tasarlanmalı.

## IDEA-004 — Kafede check-in ile etkileşim

- Durum: Fikir havuzuna alındı; uygulama/MVP kararı yok.
- Kaynak: Kullanıcı önerisi — “mesela bir kafeye gittim kafede check-in yaptım kafede check-in yapmış kişiler arasında bir etkileşim başlatmak nasıl fikir”.
- Amaç: Aynı kafede bulunan ve check-in yapan kişiler arasında etkileşim başlatmak.
- Kullanıcının tarif ettiği çekirdek deneyim: Kafeye git → check-in yap → aynı kafede check-in yapmış kişilerle etkileşim başlat.

### Konuşmada geliştirilen öneriler — henüz onaylanmadı

- Check-in'den ayrı “Burada tanışmaya açığım” görünürlük tercihi.
- Kişiye sohbet daveti veya ortak fal kartı gönderme; karşılıklı kabul sonrası konuşma.
- Sohbet, arkadaşlık veya flört niyeti seçimi; romantik eşleşmenin zorunlu olmaması.
- Süreli check-in, kolay kapatma ve ayrılınca görünürlüğün sona ermesi; masa veya kesin konum göstermeme.
- Tekrarlı davet sınırı, engelleme ve şikâyet mekanizmaları.
- Küçük bir deneme olarak tek kafede isteğe bağlı check-in fikri.

Bunlar asistanın tartışma önerileridir; kullanıcı kayıt altına alınmasını istedi, ayrıntılı iş kurallarını veya pilotu onaylamadı.

### Açık sorular

- Kişileri görüp bireysel davet göndermek mi, kafenin ortak sohbet alanına katılmak mı, ikisi birlikte mi? Kullanıcı henüz seçim yapmadı.
- Mekânda bulunma nasıl doğrulanır? Konum, QR veya başka bir yöntem henüz seçilmedi.
- Check-in süresi, ayrılmayı algılama ve görünürlüğü kapatma nasıl işleyecek?
- Hangi profil bilgileri görünür; yaş uygunluğu, davet/engelleme ve mesaj erişimi nasıl yönetilir?
- Mekândan ayrıldıktan sonra kabul edilmiş konuşma sürer mi?
- Check-in/konum verilerinin saklama ve silme sınırları ne olur?
- Mekân katılımı veya işletmeyle ortaklık gerekir mi? Henüz ortaklık/servis kararı yok.

İlgili mevcut alanlar: USER_FLOWS §9 ve §11; yeni check-in akışı mevcut gereksinimlere henüz eklenmedi.

## Dört fikrin birlikte oluşturabileceği deneyim

Bu bağlantı bir ürün önerisidir; dört fikrin tek özellik olarak uygulanması kararı değildir. Kimlikler bağımsız değerlendirme için korunur.

| Fikir | Ortak deneyimdeki rolü | Diğer fikirlerle bağlantısı |
|---|---|---|
| IDEA-001 — Faldan sohbete | Sohbeti başlatacak tema/soru | Ortak ritüelde veya kafedeki davette kullanıcı onaylı kart olarak kullanılabilir |
| IDEA-002 — Küçük ritüeller | İnsanları ortak bir deneyimde buluşturma | Örneğin pazar kahvesi, çevrimiçi toplulukta veya isteğe bağlı mekân buluşmasında yapılabilir |
| IDEA-003 — Fal arkadaşı | İki kişinin ortak fal/kart deneyimi | Mevcut arkadaşla veya karşılıklı kabul edilen kafe davetiyle başlayabilir |
| IDEA-004 — Kafede check-in | Aynı mekânda karşılaşma bağlamı | Sohbet kartına, ortak ritüele veya fal arkadaşlığına giriş olabilir |

Örnek birleşik yolculuk: Kullanıcı kafede check-in yapar → ayrıca görünür olmayı seçer → uygun kişiye bir sohbet kartıyla davet gönderir → karşılıklı kabul sonrası ortak kart deneyimi yaşanır → iki taraf isterse sohbet sürer. Bu akış keşif taslağıdır; konum, yaş, görünürlük ve mesajlaşma kararları verilmeden uygulanmaz.
