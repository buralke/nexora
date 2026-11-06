# Oturum — GitHub bağlantısı

- Tarih: 2026-11-06
- Kaynak: [Kullanıcı talebi](../../prompts/development/2026-11-06-002-github-senkronizasyonu.md)

## Yapılanlar

Başlangıçta yerel Git deposu bulunmadığı, GitHub reposunun dal/commit içermediği doğrulandı. Mevcut dosyaları main dalından origin reposuna göndermek üzere Git bağlantısı hazırlandı. Repo çalışma düzeni, fetch ve durum kontrol scripti, asistan güncellik kontrol kuralları eklendi.

## Doğrulama

Push sonucu, yerel ve uzak commit kimlikleri ile temiz çalışma ağacı üzerinden teslimde doğrulanır. GitHub CLI kurulu olmadığından Git kullanılıyor. İlk ağ denemesi sandbox içinde başarısız oldu; izinli ağ erişimiyle uzak repo okundu.

## Devam

Her aktif çalışma başında ve push öncesi `scripts/check-repo.ps1` kullanılır. Kesintisiz arka plan izleme yoktur. Sonraki ürün adımı MVP kapsamı ve teknik başlangıç kararlarıdır.
