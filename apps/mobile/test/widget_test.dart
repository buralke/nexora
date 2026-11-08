import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nexora_mobile/app/app.dart';

void main() {
  testWidgets('Sample fortune requires input and returns to shell', (
    tester,
  ) async {
    await tester.pumpWidget(const NexoraApp());
    await tester.ensureVisible(find.text('Fal deneyimlerini keşfet'));
    await tester.tap(find.text('Fal deneyimlerini keşfet'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Kahve falı'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Örnek sonucu görüntüle'));
    await tester.tap(find.text('Örnek sonucu görüntüle'));
    await tester.pumpAndSettle();
    expect(find.text('Önce örnek fincanı seç.'), findsOneWidget);
    await tester.ensureVisible(find.text('Örnek fincan kullan'));
    await tester.tap(find.text('Örnek fincan kullan'));
    await tester.ensureVisible(find.text('Örnek sonucu görüntüle'));
    await tester.tap(find.text('Örnek sonucu görüntüle'));
    await tester.pumpAndSettle();
    expect(find.text('Yeni başlangıçlara yer aç'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Örnek fincan seçildi'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.byType(NavigationBar), findsOneWidget);
  });
  testWidgets('Social draft validates and persists across tabs', (
    tester,
  ) async {
    await tester.pumpWidget(const NexoraApp());
    await tester.tap(find.text('Sosyal'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Örnek gönderi oluştur'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Demo akışına ekle'));
    await tester.tap(find.text('Demo akışına ekle'));
    await tester.pumpAndSettle();
    expect(find.text('Paylaşmak için bir şeyler yaz.'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'Bir fincan mola.');
    await tester.ensureVisible(find.text('Demo akışına ekle'));
    await tester.tap(find.text('Demo akışına ekle'));
    await tester.pumpAndSettle();
    expect(find.text('Bir fincan mola.'), findsOneWidget);
    await tester.tap(find.text('Beğen').first);
    await tester.pumpAndSettle();
    expect(find.text('Beğenildi'), findsOneWidget);
    await tester.tap(find.text('Profil'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sosyal'));
    await tester.pumpAndSettle();
    expect(find.text('Bir fincan mola.'), findsOneWidget);
  });
  testWidgets('Small viewport supports large text without overflow', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 780);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(textScaler: TextScaler.linear(1.5)),
          child: const AppShell(),
        ),
      ),
    );
    for (final label in ['Fal', 'Keşfet', 'Sosyal', 'Profil', 'Ana Sayfa']) {
      await tester.tap(find.text(label).last);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    }
  });
}
