# ADR-0005 — Günlük ikinci bakış ve yorum tutarlılığı

- Tarih: 2026-11-08
- Tür: Ürün
- Durum: Onaylandı; uygulama ve yayın kapsamı açık
- Kaynak: [Kullanıcı devamı](../../prompts/development/2026-11-08-003-urun-fikirleri.md)
- Onaylayan ve dayanak talimat: Kullanıcı ücretsiz ikinci bakış için “günde bir kere” dedi; tarz tutarlılığını ve not temelli özeti kabul etti.

## Problem ve bağlam

IDEA-006'daki tek seferlik denemenin sınırı belirsizdi; Premium açıklaması ikinci bakışın ücretsiz olmasını açıkça ayırmıyordu.

## Seçenekler ve gerekçeleri

Hesap ömründe bir kez veya fincan başına bir kez yerine kullanıcı günde bir kez seçti. Hesap başına günlük hak olarak kaydedildi; saat dilimi ve teknik hak yönetimi açık.

## Seçilen yaklaşım

Günlük bir ücretsiz ikinci bakış. Premium'un diğer bakışları açma kuralına günlük hak istisnası eklenir; eski “yalnızca ilk deneme” yaklaşımının yerini alır. Üç tarz aynı sembolleri farklı anlatır, birbirini çürüten tahminler üretmez. IDEA-007 aylık özeti kullanıcının notlarına dayanır; olayların gerçekleştiğini varsaymaz.

## Sonuçlar, maliyetler ve sınırlamalar

İkinci yorum üretimi için günlük maliyet doğabilir; sağlayıcı, ücret ve limit altyapısı seçilmedi. Sıfırlanma saati/saat dilimi, tüketim/telafi ve günlük hak tükendiğinde teklif akışı açık. Bu karar kodun veya MVP kapsamının tamamlandığı anlamına gelmez.

## Güncellenecek belgeler ve yerine geçtiği karar

IDEA_BACKLOG, STATUS, prompt ve oturum güncellendi. Prototipteki ömür boyu tek seferlik ikinci bakış notunun yerini alır. Yayına alınacaksa ilgili docs gereksinimleri ayrıca hedefli güncellenecek.
