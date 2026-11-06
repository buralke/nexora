# Geliştirme ve bakım komutları

Tekrarlanabilir kurulum, kontrol, veri hazırlama ve bakım komutları burada tutulur. Uygulama iş mantığı burada tutulmaz.

`powershell -NoProfile -File scripts/check-repo.ps1`: Git ve ağ erişimi gerektirir; origin bilgilerini fetch eder ve çalışma ağacı ile yerel/uzak commit farkını gösterir. Merge veya push yapmaz. Çalışma alanının herhangi bir klasöründen script yolu verilerek kullanılabilir.
