# TASK-0005 — Repo rehberi ve tüm değişikliklerin teslimi

- Durum: Tamamlandı
- Tarih: 2026-11-08
- Kaynak prompt: [Talep](../../prompts/development/2026-11-08-004-repo-rehberi.md)
- İlgili gereksinim/karar: project/WORKFLOW.md, project/REPOSITORY.md

## Amaç

Yeni gelen kişinin amaç, klasör ve kod sorumluluğuna göre dosya bulmasını sağlamak; tüm bekleyen kaynak değişikliklerini GitHub'a göndermek.

## Kapsam ve kapsam dışı

Kök rehber, README bağlantısı, proje kayıtları ve önceki kafe kararları dahil tam kaynak teslimi. Kod/ürün davranışı değişikliği, ignore edilen build/cache/artifacts ve gizli ortam dosyaları kapsam dışı.

## Bağımlılıklar ve açık konular

Güncel klasörler ve README'ler incelendi. Ürün kararlarındaki açık konular korunur; rehber yeni kapsam/teknoloji onayı vermez.

## Kabul kriterleri

- [x] İlk okuma sırası ve amaca göre dosya bulma tablosu var.
- [x] Tüm üst düzey sorumluluklar ve 25 docs belgesi dizinlendi.
- [x] Mobil giriş, tema, ortak bileşen, özellik ve test yolları listelendi.
- [x] Rehber kök README'den erişilebilir.
- [x] Yerel hedefler, doküman kapsaması ve Git farkı doğrulanır; sonuç oturumda.

## Doğrulama planı ve sonucu

Markdown hedefleri ve 25 belgenin rehberde bulunması kontrol edilir. git diff --check ve staged kapsam kontrolü sonrası push yapılır. Yalnızca belge değişikliği; Flutter testleri yeniden çalıştırılmaz.

## Değişen dosyalar ve oturum kaydı

REPO_GUIDE, README, STATUS, prompt, bu görev ve [oturum](../sessions/2026-11-08-013-repo-rehberi.md). Bekleyen IDEA_BACKLOG, ADR-0004, ürün fikirleri promptu ve 008–012 oturumları da tam teslim kapsamındadır.
