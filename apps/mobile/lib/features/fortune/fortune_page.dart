import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../shared/widgets.dart';

class FortunePage extends StatelessWidget {
  const FortunePage({super.key});
  @override
  Widget build(BuildContext context) => PageBody(
    children: [
      const SectionTitle(
        'Bugün neyi merak ediyorsun?',
        subtitle: 'Bir deneyim seç. Kendine yeni bir açıdan bak.',
      ),
      for (final item in const [
        (
          Icons.coffee_outlined,
          'Kahve falı',
          'Fincanındaki sembollerle küçük bir yolculuk.',
        ),
        (
          Icons.style_outlined,
          'Tarot',
          'Kartların çağrıştırdığı temaları keşfet.',
        ),
        (
          Icons.nights_stay_outlined,
          'Rüya yorumu',
          'Aklında kalan rüyaya birlikte bakalım.',
        ),
      ])
        SurfaceCard(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(item.$1, size: 36, color: Palette.gold),
            title: Text(item.$2),
            subtitle: Text(item.$3),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () =>
                openPage(context, item.$2, FortuneInputPage(kind: item.$2)),
          ),
        ),
      const SizedBox(height: 12),
      const Text(
        'Bu türler tasarım örnekleridir. İlk sürümde sunulacak türler ve kullanım limitleri henüz belirlenmedi.',
        style: TextStyle(color: Palette.muted, height: 1.5),
      ),
    ],
  );
}

class FortuneInputPage extends StatefulWidget {
  const FortuneInputPage({super.key, required this.kind});
  final String kind;
  @override
  State<FortuneInputPage> createState() => _FortuneInputPageState();
}

class _FortuneInputPageState extends State<FortuneInputPage> {
  final form = GlobalKey<FormState>();
  final input = TextEditingController();
  bool samplePhoto = false;
  bool busy = false;

  @override
  void dispose() {
    input.dispose();
    super.dispose();
  }

  Future<void> preview() async {
    if (!form.currentState!.validate()) return;
    if (widget.kind == 'Kahve falı' && !samplePhoto) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Önce örnek fincanı seç.')));
      return;
    }
    setState(() => busy = true);
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;
    setState(() => busy = false);
    openPage(context, 'Örnek fal sonucu', FortuneResultPage(kind: widget.kind));
  }

  @override
  Widget build(BuildContext context) => PageBody(
    children: [
      SectionTitle(
        '${widget.kind} için bir an ayır',
        subtitle:
            'Sonuç yalnızca örnek bir metindir. AI isteği gönderilmez ve veriler saklanmaz.',
      ),
      if (widget.kind == 'Kahve falı') ...[
        SurfaceCard(
          child: Column(
            children: [
              Icon(
                Icons.coffee,
                size: 64,
                color: samplePhoto ? Palette.gold : Palette.muted,
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: busy
                    ? null
                    : () => setState(() => samplePhoto = !samplePhoto),
                icon: Icon(
                  samplePhoto
                      ? Icons.check_circle_outline
                      : Icons.add_photo_alternate_outlined,
                ),
                label: Text(
                  samplePhoto ? 'Örnek fincan seçildi' : 'Örnek fincan kullan',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Gerçek fotoğraf yükleme sonraki adımda bağlanacak.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Palette.muted),
              ),
            ],
          ),
        ),
      ],
      Form(
        key: form,
        child: TextFormField(
          controller: input,
          maxLines: 5,
          enabled: !busy,
          maxLength: 1000,
          decoration: InputDecoration(
            labelText: widget.kind == 'Rüya yorumu'
                ? 'Rüyanı anlat'
                : 'Aklındaki tema (isteğe bağlı)',
            alignLabelWithHint: true,
            hintText: 'Örneğin yeni başlangıçlar…',
          ),
          validator: (value) =>
              widget.kind == 'Rüya yorumu' && (value?.trim().isEmpty ?? true)
              ? 'Rüyanı birkaç kelimeyle anlat.'
              : null,
        ),
      ),
      const SizedBox(height: 20),
      FilledButton.icon(
        onPressed: busy ? null : preview,
        icon: busy
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.auto_awesome),
        label: Text(busy ? 'Örnek hazırlanıyor…' : 'Örnek sonucu görüntüle'),
      ),
      const SizedBox(height: 20),
      const Text(
        'Özel sonuçların kendiliğinden paylaşılmaz. Fal, uzman tavsiyesi veya kesin gelecek tahmini değildir.',
        style: TextStyle(color: Palette.muted, height: 1.5),
      ),
    ],
  );
}

class FortuneResultPage extends StatelessWidget {
  const FortuneResultPage({super.key, required this.kind});
  final String kind;
  @override
  Widget build(BuildContext context) => PageBody(
    children: [
      const Icon(Icons.auto_awesome, color: Palette.gold, size: 48),
      SectionTitle(
        'Yeni başlangıçlara yer aç',
        subtitle: '$kind · Örnek yorum · Sana özel görünüm',
      ),
      const SurfaceCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Küçük bir adımın hikâyesi', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text(
              'Bir yol sembolünü, ertelediğin küçük bir adımı düşünmek için davet olarak ele alabilirsin. Bugün kendine hangi yeni deneyim için alan açmak istersin?',
              style: TextStyle(height: 1.8, color: Palette.muted),
            ),
            SizedBox(height: 20),
            Text('Kendine bir soru', style: TextStyle(color: Palette.gold)),
            SizedBox(height: 8),
            Text(
              'Sana iyi gelen bir başlangıç nasıl görünürdü?',
              style: TextStyle(height: 1.6),
            ),
          ],
        ),
      ),
      const Text(
        'Bu sabit örnek AI tarafından bu oturumda üretilmedi. Kayıt, ücretlendirme ve paylaşım yapılmadı.',
        style: TextStyle(color: Palette.muted, height: 1.5),
      ),
      const SizedBox(height: 24),
      OutlinedButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Girdiye dön'),
      ),
    ],
  );
}
