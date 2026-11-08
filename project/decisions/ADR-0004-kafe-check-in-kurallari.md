# ADR-0004 — Kafe check-in kuralları

- Tarih: 2026-11-08
- Tür: Ürün
- Durum: Ürün davranışları netleştirildi. Geliştirme sırası ve MVP kapsamı açık.
- Kaynak: [Kullanıcı görüşmesi](../../prompts/development/2026-11-08-003-urun-fikirleri.md)

## Karar

Aynı kafedeki kullanıcılar ortak sohbet ve bire bir etkileşim için ayrı izinler kullanır. Check-in, konum yakınlığıyla doğrulanır ve süreyle sınırlıdır. Kafe alanı ve etkileşim kurallarının ayrıntıları [IDEA-004](../IDEA_BACKLOG.md) içinde tutulur.

Check-in sonrasında iki kişiden en az birinin Premium üyeliği mevcut etkileşimlerin devamını sağlar. Bu karar, Premium durumundan bağımsız sohbet devamı ve bekleyen isteklerin koşulsuz kapanması yönündeki önceki görüşlerin yerini alır. 2026-11-08 yeni kullanıcı talimatıyla kurtarma süresi 2 saat olarak güncellendi; önceki 24 saat ve manuel bitişte anında kapanma kuralı geçersizdir. Yeni devam talimatıyla sohbet, devam hakkı sona erdiği anda kilitlenir; iki saatlik kurtarma süresinde de okuma ve mesaj gönderme kapalıdır. Premium yenilenince açılır. Premium sonradan biterse yine 2 saat tanınır; sohbet erişimi hemen kilitlenir, yenilenmezse kilit sürer; yeniden Premium olduğunda açılır. Şikâyete mesaj içeriği eklenebilir. Ayrıntılar ve kalan belirsizlikler IDEA-004 içinde belirtilmiştir.

## Açık konular

Harita sağlayıcısı, konum verisinin saklanması ve geliştirme kapsamı ayrıca kararlaştırılacak.

Mesafe için 50 metre yeni öneridir, kullanıcı onayı yoktur; mevcut 100 metre kararı henüz değiştirilmedi. İki saat içindeki sohbet erişimi netleşti: Hemen kilitlenir, Premium yenilenince açılır. Oyun durumu ayrıca netleştirilecek. Kullanıcının sonraki açıklamasıyla karşı tarafın Premium olmasının etkisi netleşti: Üyeliği biten kişi diğer taraf Premium olsa da devam edemez, kendi üyeliğini yenilemelidir. Bu istisna, check-in bitişinde tek Premium ile iki tarafa devam hakkı kuralından önceliklidir.
