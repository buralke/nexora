import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../shared/widgets.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({super.key});
  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  final posts = <String>[
    'Bugün kahveme biraz daha zaman ayırdım. Sizin gününüzün küçük mutluluğu neydi?',
  ];
  final liked = <int>{};
  Future<void> compose() async {
    final result = await Navigator.of(
      context,
    ).push<String>(MaterialPageRoute(builder: (_) => const ComposePage()));
    if (result != null && mounted) setState(() => posts.add(result));
  }

  @override
  Widget build(BuildContext context) => PageBody(
    children: [
      const SectionTitle(
        'Bir hikâye de sen paylaş.',
        subtitle: 'Ortak meraklar, küçük anlar, yeni sohbetler.',
      ),
      FilledButton.icon(
        onPressed: compose,
        icon: const Icon(Icons.edit_outlined),
        label: const Text('Örnek gönderi oluştur'),
      ),
      const SizedBox(height: 24),
      for (var i = posts.length - 1; i >= 0; i--)
        SurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Palette.violet,
                    child: Icon(
                      Icons.person_outline,
                      color: Palette.background,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          i == 0
                              ? 'Deniz · Örnek profil'
                              : 'Sen · Demo profili',
                        ),
                        const Text(
                          'Örnek akış',
                          style: TextStyle(color: Palette.muted, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(posts[i], style: const TextStyle(height: 1.7, fontSize: 16)),
              const SizedBox(height: 14),
              TextButton.icon(
                onPressed: () => setState(() {
                  if (!liked.add(i)) liked.remove(i);
                }),
                icon: Icon(
                  liked.contains(i) ? Icons.favorite : Icons.favorite_border,
                ),
                label: Text(liked.contains(i) ? 'Beğenildi' : 'Beğen'),
              ),
            ],
          ),
        ),
      const Text(
        'Gönderiler yalnızca bu açık demo oturumunda tutulur; internette yayınlanmaz.',
        style: TextStyle(color: Palette.muted, height: 1.5),
      ),
    ],
  );
}

class ComposePage extends StatefulWidget {
  const ComposePage({super.key});
  @override
  State<ComposePage> createState() => _ComposePageState();
}

class _ComposePageState extends State<ComposePage> {
  final form = GlobalKey<FormState>();
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Örnek gönderi')),
    body: PageBody(
      children: [
        const SectionTitle(
          'Aklından ne geçiyor?',
          subtitle: 'Bu gönderi yalnızca demo akışında görünecek.',
        ),
        Form(
          key: form,
          child: TextFormField(
            controller: controller,
            autofocus: true,
            maxLines: 6,
            maxLength: 1000,
            decoration: const InputDecoration(
              labelText: 'Hikâyen',
              alignLabelWithHint: true,
            ),
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Paylaşmak için bir şeyler yaz.'
                : null,
          ),
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () {
            if (form.currentState!.validate()) {
              Navigator.pop(context, controller.text.trim());
            }
          },
          child: const Text('Demo akışına ekle'),
        ),
      ],
    ),
  );
}
