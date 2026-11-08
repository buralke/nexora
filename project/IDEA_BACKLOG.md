# Ürün fikir havuzu

Son güncelleme: 2026-11-08

Bu dosya tartışılan fikirleri unutmamak için tutulur. IDEA-001–003 ve IDEA-005 fikir aşamasındadır. IDEA-006 için prototip akışı ve günlük ikinci bakış, IDEA-007 için özetin kullanıcı notlarına dayanması netleştirildi; diğer ayrıntılar taslaktır. IDEA-004 için bazı ürün kuralları karar kaydına bağlanmıştır; bu, MVP kapsamı veya geliştirme taahhüdü değildir. Seçilen fikirler ilgili ürün belgesine ve gerektiğinde karar kaydına aktarılır.

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

- Durum: Ürün davranışları netleştirildi. Uygulama ve MVP kapsamı ayrıca belirlenecek.
- Amaç: Aynı kafede bulunan kişilere ortak sohbet ve isteğe bağlı bire bir etkileşim sunmak.
- Karar kaydı: [ADR-0004](decisions/ADR-0004-kafe-check-in-kurallari.md).

### Kafeye giriş ve süre

- Kafe deneyiminin tamamı 18 yaş ve üzeri kullanıcılara açık. Haritada listelenen tüm kafelerde işletme kaydı aranmadan check-in yapılabilir.
- Kullanıcı kafeyi haritadan seçer, varsa QR kodunu okutur veya `beeg-38-anyrt` gibi benzersiz mekân kodunu girer. Üç yöntemde de kafenin haritadaki konumuna en fazla 100 metre uzakta olmak gerekir. Konum yeterince kesin okunamazsa yeniden denemesi istenir.
- Kullanıcının aynı anda tek aktif check-in'i olabilir. Check-in 2 saat sürer. Erken bitirilebilir veya yakınlık yeniden doğrulanarak uzatılabilir. Başka bir kafeye geçmeden önce kullanıcı mevcut check-in'i bitirmeyi onaylar.
- Sosyal akışta paylaşım ayrı ve isteğe bağlıdır. “Akışta paylaş” varsayılan olarak kapalıdır.

### Kafe alanı ve etkileşim tercihleri

- Aktif check-in kafenin uygulama içindeki alanını açar. Kullanıcı ortak sohbeti kişi listesinde görünmeden okuyabilir. Yazmak için “Sohbete katıl” adımını tamamlar. Görünen adı mesajının yanında yer alır. Bu adım kullanıcıyı eşleşmeye veya bire bir sohbete dahil etmez.
- Eşleşmeye kapalı kullanıcı kafenin kişi listesinde görünmez. Görünen kişilerin kartında ad, fotoğraf ve izin verilen etkileşimler yer alır. Karta dokununca herkese açık profil açılır. Masa, kesin konum ve özel fal geçmişi gösterilmez.
- Check-in sırasında eşleşme, ilk mesaj ve oyun daveti tercihleri ayrı seçilir. Tercihler aktif check-in sırasında değiştirilebilir.

| Tercih | Seçenekler |
|---|---|
| Eşleşme | Açığım · Kapalıyım |
| İlk mesaj | İkimiz de başlatabiliriz · Yalnızca ben başlatırım · Kapalıyım |
| Oyun daveti | İkimiz de gönderebiliriz · Yalnızca ben gönderirim · Kapalıyım |

- İlk mesaj karşılıklı eşleşmeden sonra, gönderenin ve alıcının tercihleri izin verdiğinde atılabilir. “Yalnızca ben başlatırım” seçen kişi ilk mesaj alamaz. Kendisi sohbet açarsa karşı taraf yanıt verebilir. Bire bir mesajlara normal kullanımda yalnızca iki katılımcı erişebilir; şikâyete eklenen mesajlar yetkili inceleme kapsamında değerlendirilir.
- Oyun daveti için eşleşme gerekmez. Eşleşmeye kapalı bir kullanıcı, davet almaya açıksa ortak sohbetteki mesajı üzerinden davet alabilir. Daveti kabul etmek yalnızca oyunu açar.
- Tercih değişikliği hemen uygulanır ve yeni tercihin izin vermediği bekleyen davetler kapanır. Engelleme, Premium durumundan bağımsız olarak aradaki mesajlaşmayı, oyunu ve bekleyen davetleri kapatır. Şikâyete nedeni ve bildirilen hesap bilgisi eklenir. Kullanıcı şikâyetine mesaj içeriği ekleyebilir. Bu, tüm özel konuşmalara genel erişim sağlamaz; kanıt seçimi, yetkili inceleme ve saklama kuralları ayrıca tasarlanacak.

### Check-in sonrası ve Premium

- İki kişiden birinin check-in'i sona erdiğinde aktif kafe görünürlüğü biter ve o check-in üzerinden yeni davet gönderilemez.
- Check-in bitişinde taraflardan en az biri Premium ise mevcut bire bir etkileşim iki taraf için sürer. Ancak sonradan Premium üyeliği biten kullanıcı için aşağıdaki kişisel erişim kuralı önceliklidir. Bekleyen eşleşme ve oyun istekleri kabul edilebilir. Başlamış sohbetler ve oyunlar devam eder. Henüz ilk mesaj gönderilmediyse mevcut sohbet izinleri uygulanır.
- **2026-11-08 güncellemesi — 2 saatlik kurtarma:** Devam hakkı olmayan kullanıcıya Premium ile sohbetini kurtarabileceği bildirilir ve 2 saat tanınır. Önceki otomatik bitişte 24 saat ve manuel bitişte teklifi geçince hemen kapatma kuralları bu güncellemeyle değiştirilir. Devam hakkı sona erdiğinde sohbet hemen kilitlenir: eski mesajlar okunamaz, yeni mesaj gönderilemez. İki saatlik kurtarma süresinde de kilit sürer; Premium yenilenince erişim açılır. İki saat dolması erişimin ilk kapandığı an değildir.
- Premium üyeliği sonradan bittiğinde de 2 saat kurtarma süresi verilir. Kullanıcının 2026-11-08 devam kararına göre karşı taraf hâlâ Premium olsa bile üyeliği biten kişi bu gerekçeyle devam edemez; kendi Premium üyeliğini yenilemesi gerekir. Üyelik bittiğinde sohbet erişimi hemen kilitlenir; iki saatte yenilenmezse kilit devam eder. Tekrar Premium olduğunda erişim geri verilir. Erişim kapatma veri silme değildir; saklama/silme politikası ayrıca belirlenir. Engelleme ve güvenlik kısıtları Premium ile aşılmaz.
- **Açık:** Oyunların kurtarma süresindeki durumu (son yanıt sohbet erişimini netleştirdi); ilk check-in bitişindeki kilidin de sonradan Premium ile açılıp açılmayacağı; sürenin kesin başlangıç olayı ve oyun durumunun korunması.

### Özel geçmiş ve yıl sonu özeti

- Kullanıcının check-in geçmişi yalnızca kendisine görünür. Yıl sonu özeti kafe ziyaretlerini, fal istatistiklerini ve tamamlanan ortak oyunları kapsar. Check-in uzatmak yeni ziyaret sayılmaz.
- Özet özeldir. Kullanıcı seçtiği kartı önizleyip sosyal akışta paylaşabilir.
- Tek bir check-in kaydı veya tüm geçmiş silinebilir. Özel özet kalan kayıtlardan yeniden hesaplanır. Silme sırasında “Bu kaydı kullanan paylaşımları da kaldır” seçeneği sunulur. Kullanıcı seçerse ilgili check-in paylaşımları ve özet kartları akıştan kaldırılır.

### Uygulama öncesinde netleştirilecekler

- Mesafe: Önceki kayıt 100 metre. Asistanın yeni önerisi 50 metre; kullanıcı henüz onaylamadı. Konum doğruluk eşiği ve komşu kafelerle saha doğrulaması birlikte ele alınacak.
- Harita ve mekân verisi sağlayıcısı, konum ölçümünün doğruluk eşiği ve QR/mekân kodu yönetimi.
- Check-in ve konum verilerinin saklama süreleri, tekrar eden davetlerin sınırları ve şikâyetlerin işlenmesi.
- Kafe deneyiminin sürüm kapsamı ve uygulama akışları.

## Dört fikrin birlikte oluşturabileceği deneyim

Bu bağlantı bir ürün önerisidir; dört fikrin tek özellik olarak uygulanması kararı değildir. Kimlikler bağımsız değerlendirme için korunur.

| Fikir | Ortak deneyimdeki rolü | Diğer fikirlerle bağlantısı |
|---|---|---|
| IDEA-001 — Faldan sohbete | Sohbeti başlatacak tema/soru | Ortak ritüelde veya kafedeki davette kullanıcı onaylı kart olarak kullanılabilir |
| IDEA-002 — Küçük ritüeller | İnsanları ortak bir deneyimde buluşturma | Örneğin pazar kahvesi, çevrimiçi toplulukta veya isteğe bağlı mekân buluşmasında yapılabilir |
| IDEA-003 — Fal arkadaşı | İki kişinin ortak fal/kart deneyimi | Mevcut arkadaşla veya karşılıklı kabul edilen kafe davetiyle başlayabilir |
| IDEA-004 — Kafede check-in | Aynı mekânda karşılaşma bağlamı | Sohbet kartına, ortak ritüele veya fal arkadaşlığına giriş olabilir |

Örnek birleşik yolculuk: Kullanıcı check-in sırasında etkileşim tercihlerini seçer → oyun daveti almaya açık bir kişiye ortak kart daveti gönderir → davet kabul edilirse birlikte oynarlar → karşılıklı eşleşme ve ilk mesaj izni varsa sohbet başlatılabilir. Bu örnek, yukarıdaki check-in ve etkileşim kurallarını birleştirir.

## IDEA-005 — Fincanda sen ne gördün?

- Durum: Fikir havuzunda. Ücretsiz ve Premium ayrımı taslak.
- Ücretsiz deneyim: Kullanıcı yorumdan önce fincan fotoğrafında bir şekli işaretler ve neye benzettiğini yazar. Fal yorumu bu şekilden başlar.
- Premium önerisi: Kullanıcı birden fazla şekli işaretleyebilir ve şekillerin aynı yorumda nasıl bağlandığını okuyabilir. Örneğin kuş ve yol tek bir hikâyede buluşur.

## IDEA-006 — Bir fincan, üç bakış

- Durum: Üç ekranlı prototip akışı seçildi. Ücretsiz ikinci bakış kullanıcı hesabı başına günde bir kez; yayın kapsamı ayrıca belirlenecek.
- Ücretsiz deneyim: Kullanıcı eğlenceli, sembolik veya düşündürücü tarzlardan birini seçer ve o tarzda tam bir fal yorumu okur.
- Premium önerisi: Kullanıcı aynı fincan için diğer iki bakışı da açabilir. İstisna: Günlük ücretsiz ikinci bakış hakkı varsa ikinci yorum ücretsizdir; bu hak ömür boyu yalnızca ilk deneme ile sınırlı değildir. [ADR-0005](decisions/ADR-0005-gunluk-ikinci-bakis.md).
- Teklif anı: Tam ücretsiz yorumdan sonra ikinci bakış seçeneği gösterilir. Günlük hakkı bulunan kullanıcı ücretsiz ikinci yorumu okuduktan sonra üçüncü bakışı seçerse Premium teklifi açılır. Günlük hak daha önce kullanıldıysa ikinci bakış düğmesinin davranışı ve teklif anı ayrıca netleştirilecek.

### Üç ekranlı prototip

| Ekran | Kullanıcının gördüğü | Eylemler |
|---|---|---|
| 1. Fal sonucu | Seçilen tarzda tam ücretsiz yorum. Örnekte sembolik bakış, fincandaki kuşu bir haberle ve açık yolu yeni bir seçenekle ilişkilendirir. | “Bu fincana başka bir gözle bak”, “Falı kaydet”. İkinci bakışın günde bir kez ücretsiz olduğu ve günlük hak durumu gösterilir. |
| 2. İkinci bakış | Aynı fincanın ikinci tarzda tam yorumu. Örnekte eğlenceli bakış, aynı kuşu sabırsız bir haberciye ve yolu kısa bir kaçamağa benzetir. | “Üçüncü bakışı gör”, “Falı kaydet ve çık”. |
| 3. Premium teklifi | Okunan iki bakış ve Premium ile açılacak üçüncü bakış gösterilir. Örnekte üçüncü bakış düşündürücüdür. | “Üçüncü bakışı Premium ile aç”, “Falı kaydet ve çık”. |

Üç tarz aynı fincandaki aynı sembol temelini korur; fark anlatım ve bakış açısıdır. Birbirini çürüten tahminler üretilmez ve hiçbiri kesin gelecek bilgisi olarak sunulmaz.

Açık: Günlük hakkın sıfırlanma saat dilimi/saati, tüketim anı, başarısız işlem telafisi ve önceden açılmış yorumun yeniden görüntülenmesi. Günlük hak hesap düzeyinde ele alındı; fincan başına yeni günlük hak verilmez.

İlk bakış kullanıcı tarafından seçilir. Ekran taslağındaki sembolik, eğlenceli ve düşündürücü sıralaması örnektir. İlk denemede ikinci bakışı kaç kişinin açtığı ve iki yorum arasındaki farkı anlamlı bulup bulmadığı değerlendirilir.

## IDEA-007 — Falıma geri dön

- Durum: Fikir havuzunda. Ücretsiz ve Premium ayrımı taslak.
- Ücretsiz deneyim: Kullanıcı ilgisini çeken yorumu kaydeder, bir hafta sonra isteğe bağlı hatırlatma alır ve özel bir not ekleyebilir.
- Premium önerisi: Kullanıcı kendi notlarında tekrar eden temaları aylık özel bir özette görür. Özet kullanıcının yazdıklarına dayanır; falda anlatılan olayların gerçekleştiğini varsaymaz. Not yoksa yaşanmış olay uydurulmaz. Örneğin “Bu ay üç notunda yeni başlangıçlardan bahsettin.”

## Üç fikrin ortak fal akışı

Kullanıcı fincandaki şekli işaretler → seçtiği tarzda tam yorumunu okur → isterse ikinci bakışı dener → ilgisini çeken yorumu kaydeder ve daha sonra not ekler. Günlük ücretsiz ikinci bakış hakkı varsa Premium teklifi bu yorumdan sonra, üçüncü bakış seçildiğinde gösterilir. Günlük hak tükenmişken teklif akışı açık kalır. Şekil işaretleme ve özel not yazma sırasında üyelik ekranı açılmaz. Bu akış bir ürün önerisidir.
