import 'dart:ui';
import 'package:flutter/material.dart';
import '../app/theme.dart';

/// A clipped backdrop blur, tinted for readable content over the aurora.
class GlassPanel extends StatelessWidget {
  const GlassPanel({
    super.key,
    required this.child,
    this.radius = 28,
    this.padding = EdgeInsets.zero,
    this.tint = Palette.glass,
  });
  final Widget child;
  final double radius;
  final EdgeInsetsGeometry padding;
  final Color tint;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .18),
          blurRadius: 28,
          offset: const Offset(0, 12),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.alphaBlend(Colors.white.withValues(alpha: .065), tint),
                tint,
                Color.alphaBlend(Palette.violet.withValues(alpha: .035), tint),
              ],
              stops: const [0, .55, 1],
            ),
            border: Border.all(color: Palette.edge),
          ),
          child: Padding(padding: padding, child: child),
        ),
      ),
    ),
  );
}

class AuroraBackground extends StatelessWidget {
  const AuroraBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: [
      const DecoratedBox(decoration: BoxDecoration(color: Palette.background)),
      const Positioned.fill(
        child: IgnorePointer(
          child: RepaintBoundary(child: CustomPaint(painter: _AuroraPainter())),
        ),
      ),
      child,
    ],
  );
}

class _AuroraPainter extends CustomPainter {
  const _AuroraPainter();
  @override
  void paint(Canvas canvas, Size size) {
    void glow(Offset center, double radius, Color color) {
      final rect = Rect.fromCircle(center: center, radius: radius);
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..shader = RadialGradient(
            colors: [color, color.withValues(alpha: 0)],
          ).createShader(rect),
      );
    }

    glow(
      Offset(size.width * .1, size.height * .12),
      size.width * .95,
      const Color(0x694D5FAD),
    );
    glow(
      Offset(size.width * 1.05, size.height * .47),
      size.width * .9,
      const Color(0x4F318E92),
    );
    glow(
      Offset(size.width * .2, size.height * .95),
      size.width * .85,
      const Color(0x494E3C87),
    );
  }

  @override
  bool shouldRepaint(_AuroraPainter oldDelegate) => false;
}

/// Decorative orbital seal, drawn locally with no downloaded image assets.
class OrbitalSeal extends StatelessWidget {
  const OrbitalSeal({super.key});
  @override
  Widget build(BuildContext context) => ExcludeSemantics(
    child: SizedBox(
      height: 174,
      width: 174,
      child: CustomPaint(
        painter: const _OrbitPainter(),
        child: Center(
          child: Container(
            width: 94,
            height: 94,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0x857F8DC4), Color(0x33364164)],
              ),
              border: Border.all(color: Palette.edge),
              boxShadow: [
                BoxShadow(
                  color: Palette.violet.withValues(alpha: .16),
                  blurRadius: 38,
                ),
              ],
            ),
            child: const Icon(
              Icons.coffee_outlined,
              color: Palette.ink,
              size: 44,
            ),
          ),
        ),
      ),
    ),
  );
}

class _OrbitPainter extends CustomPainter {
  const _OrbitPainter();
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = .8
      ..color = Palette.edge;
    canvas.drawCircle(center, 72, paint);
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(-.45);
    canvas.drawOval(
      Rect.fromCenter(center: Offset.zero, width: 171, height: 89),
      paint..color = Palette.mint.withValues(alpha: .45),
    );
    canvas.restore();
    canvas.drawCircle(
      center + const Offset(64, -34),
      4,
      Paint()..color = Palette.mint,
    );
    canvas.drawCircle(
      center + const Offset(-60, 44),
      2.5,
      Paint()..color = Palette.violet,
    );
    canvas.drawCircle(
      center + const Offset(-32, -65),
      2,
      Paint()..color = Palette.gold,
    );
  }

  @override
  bool shouldRepaint(_OrbitPainter oldDelegate) => false;
}
