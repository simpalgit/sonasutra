import 'package:flutter/material.dart';

// 1. Digital Gold SIP - 3D Gold Bars / Bullion
class GoldBarsIcon extends StatelessWidget {
  final double size;

  const GoldBarsIcon({super.key, this.size = 38});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: GoldBarsPainter(),
      ),
    );
  }
}

class GoldBarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Shader gradients for gold bar facets
    final topGradient = const LinearGradient(
      colors: [Color(0xFFFFF2BD), Color(0xFFE8BD65), Color(0xFFC79332)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, w, h));

    final frontGradient = const LinearGradient(
      colors: [Color(0xFFE2A83E), Color(0xFFB57C1C), Color(0xFF88570E)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(Rect.fromLTWH(0, 0, w, h));

    final sideGradient = const LinearGradient(
      colors: [Color(0xFF9E6D15), Color(0xFF6E4807)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(Rect.fromLTWH(0, 0, w, h));

    void drawSingleBar(double dx, double dy, double barW, double barH) {
      final topP = Paint()..shader = topGradient;
      final frontP = Paint()..shader = frontGradient;
      final sideP = Paint()..shader = sideGradient;

      // Top face
      final topPath = Path()
        ..moveTo(dx + barW * 0.2, dy)
        ..lineTo(dx + barW * 0.8, dy)
        ..lineTo(dx + barW, dy + barH * 0.35)
        ..lineTo(dx, dy + barH * 0.35)
        ..close();
      canvas.drawPath(topPath, topP);

      // Front face
      final frontPath = Path()
        ..moveTo(dx, dy + barH * 0.35)
        ..lineTo(dx + barW, dy + barH * 0.35)
        ..lineTo(dx + barW * 0.9, dy + barH)
        ..lineTo(dx + barW * 0.1, dy + barH)
        ..close();
      canvas.drawPath(frontPath, frontP);

      // Side face
      final sidePath = Path()
        ..moveTo(dx + barW * 0.8, dy)
        ..lineTo(dx + barW * 1.05, dy + barH * 0.15)
        ..lineTo(dx + barW, dy + barH * 0.35)
        ..close();
      canvas.drawPath(sidePath, sideP);
    }

    // Stack of 3 Gold Bars
    drawSingleBar(w * 0.05, h * 0.45, w * 0.5, h * 0.45);
    drawSingleBar(w * 0.45, h * 0.45, w * 0.5, h * 0.45);
    drawSingleBar(w * 0.25, h * 0.1, w * 0.5, h * 0.45);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// 2. Digital Silver SIP - 3D Silver Bars / Bullion
class SilverBarsIcon extends StatelessWidget {
  final double size;

  const SilverBarsIcon({super.key, this.size = 38});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: SilverBarsPainter(),
      ),
    );
  }
}

class SilverBarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final topGradient = const LinearGradient(
      colors: [Color(0xFFFFFFFF), Color(0xFFD6DCDD), Color(0xFFA2AAAC)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, w, h));

    final frontGradient = const LinearGradient(
      colors: [Color(0xFFB5BCBD), Color(0xFF81898B), Color(0xFF535A5C)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(Rect.fromLTWH(0, 0, w, h));

    final sideGradient = const LinearGradient(
      colors: [Color(0xFF687072), Color(0xFF424849)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(Rect.fromLTWH(0, 0, w, h));

    void drawSingleBar(double dx, double dy, double barW, double barH) {
      final topP = Paint()..shader = topGradient;
      final frontP = Paint()..shader = frontGradient;
      final sideP = Paint()..shader = sideGradient;

      // Top face
      final topPath = Path()
        ..moveTo(dx + barW * 0.2, dy)
        ..lineTo(dx + barW * 0.8, dy)
        ..lineTo(dx + barW, dy + barH * 0.35)
        ..lineTo(dx, dy + barH * 0.35)
        ..close();
      canvas.drawPath(topPath, topP);

      // Front face
      final frontPath = Path()
        ..moveTo(dx, dy + barH * 0.35)
        ..lineTo(dx + barW, dy + barH * 0.35)
        ..lineTo(dx + barW * 0.9, dy + barH)
        ..lineTo(dx + barW * 0.1, dy + barH)
        ..close();
      canvas.drawPath(frontPath, frontP);

      // Side face
      final sidePath = Path()
        ..moveTo(dx + barW * 0.8, dy)
        ..lineTo(dx + barW * 1.05, dy + barH * 0.15)
        ..lineTo(dx + barW, dy + barH * 0.35)
        ..close();
      canvas.drawPath(sidePath, sideP);
    }

    // Stack of 3 Silver Bars
    drawSingleBar(w * 0.05, h * 0.45, w * 0.5, h * 0.45);
    drawSingleBar(w * 0.45, h * 0.45, w * 0.5, h * 0.45);
    drawSingleBar(w * 0.25, h * 0.1, w * 0.5, h * 0.45);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// 3. Shop Jewellery - 3D Gold Necklace
class GoldNecklaceIcon extends StatelessWidget {
  final double size;

  const GoldNecklaceIcon({super.key, this.size = 38});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: GoldNecklacePainter(),
      ),
    );
  }
}

class GoldNecklacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final goldGradient = const LinearGradient(
      colors: [Color(0xFFFFF1C1), Color(0xFFE5B963), Color(0xFFC48E28)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, w, h));

    final paint = Paint()
      ..shader = goldGradient
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..shader = goldGradient
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    // Necklace main U-curve
    final path = Path()
      ..moveTo(w * 0.2, h * 0.15)
      ..quadraticBezierTo(w * 0.1, h * 0.5, w * 0.5, h * 0.85)
      ..quadraticBezierTo(w * 0.9, h * 0.5, w * 0.8, h * 0.15);

    canvas.drawPath(path, strokePaint);

    // Decorative gold pearls/beads along the necklace curve
    for (double t = 0.1; t <= 0.9; t += 0.12) {
      final dx = w * 0.5 + (t - 0.5) * w * 0.7;
      final dy = h * 0.35 + (0.5 - (t - 0.5).abs()) * h * 0.8;
      canvas.drawCircle(Offset(dx, dy), 2.2, paint);
    }

    // Center pendant / gemstone drops
    final centerPendant = Path()
      ..moveTo(w * 0.5, h * 0.85)
      ..lineTo(w * 0.44, h * 0.95)
      ..lineTo(w * 0.5, h * 1.0)
      ..lineTo(w * 0.56, h * 0.95)
      ..close();
    canvas.drawPath(centerPendant, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// 4. Buy Coins & Bars - 3D Gold Coin with ₹ symbol
class GoldCoinIcon extends StatelessWidget {
  final double size;

  const GoldCoinIcon({super.key, this.size = 38});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: GoldCoinPainter(),
      ),
    );
  }
}

class GoldCoinPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final center = Offset(w / 2, h / 2);
    final radius = w * 0.42;

    // Outer edge shadow
    final edgePaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF88570E), Color(0xFFC79332), Color(0xFF5E3905)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, w, h));

    // Outer Coin Circle
    canvas.drawCircle(center, radius, edgePaint);

    // Inner Shiny Face
    final facePaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFFFF2BD),
          Color(0xFFF0CA73),
          Color(0xFFDCA148),
          Color(0xFFB88225),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, w, h));

    canvas.drawCircle(center, radius * 0.88, facePaint);

    // Inner rim line
    final rimPaint = Paint()
      ..color = const Color(0xFF7A4B06)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawCircle(center, radius * 0.72, rimPaint);

    // ₹ Rupee symbol on coin face
    final textPainter = TextPainter(
      text: const TextSpan(
        text: '₹',
        style: TextStyle(
          color: Color(0xFF4A2B02),
          fontSize: 19,
          fontWeight: FontWeight.w900,
          fontFamily: 'serif',
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(center.dx - textPainter.width / 2, center.dy - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
