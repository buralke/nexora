# GitHub çalışma düzeni

- Repo: https://github.com/buralke/nexora
- Uzak depo: `origin` — `https://github.com/buralke/nexora.git`
- Ana dal: `main`

## Güncellik kontrolü

Her çalışma başında, teslim sonunda ve push öncesinde kökten `powershell -NoProfile -ExecutionPolicy Bypass -File scripts/check-repo.ps1` çalıştırılır. Komut uzak dal bilgilerini fetch eder, çalışma ağacını ve yerel/uzak commit farkını gösterir. Dosya değiştirmez, merge, commit veya push yapmaz. Kontrol ağ erişimi ve GitHub kimlik doğrulaması gerektirir.

- Uzak dal ilerideyse değişiklikleri inceleyin; temiz çalışma ağacında uygun olduğunda `git pull --ff-only` kullanın.
- Dallar ayrıştıysa geçmişi inceleyerek birleştirin; yerel işleri ezmeyin ve force push yapmayın.
- Yerel commitler ilerideyse doğrulama sonrası push edin; ilgisiz kullanıcı değişikliklerini sessizce commit etmeyin.
- Push sonrası `git fetch origin` ve `git status -sb` ile aynı committe olunduğunu doğrulayın.

Bu düzen aktif çalışma sırasında uygulanır. Arka planda kesintisiz izleme, zamanlanmış görev veya otomatik push kurulmuş değildir. Oturum dışında uzak değişiklikler kendiliğinden izlenmez.

Windows'un yerel script çalıştırma kısıtlaması nedeniyle komut yalnızca kendi PowerShell sürecinde `ExecutionPolicy Bypass` kullanır; sistemin kalıcı yürütme politikası değiştirilmez. Git sahiplik kontrolü için yalnızca bu repo yolu kullanıcı düzeyinde güvenilir olarak kaydedildi.

## Dosya kapsamı

Kaynak, doküman, prompt ve çalışma kayıtları sürüm kontrolündedir. Secret, bağımlılık, önbellek ve üretilen çıktılar `.gitignore` ile dışlanır. Yeni dosyaları eklerken `git status --short --untracked-files=all` ve gerektiğinde `git status --ignored --short` kontrol edilir.
