import 'package:flutter/material.dart';

class SonaSutraLogo extends StatelessWidget {
  final double scale;

  const SonaSutraLogo({super.key, this.scale = 1.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Top logo symbol with ESTD. 1988
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'ESTD.',
              style: TextStyle(
                color: Color(0xFFE5C07B),
                fontSize: 10,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 14),
            SizedBox(
              width: 70 * scale,
              height: 65 * scale,
              child: CustomPaint(
                painter: LogoSymbolPainter(),
              ),
            ),
            const SizedBox(width: 14),
            const Text(
              '1988',
              style: TextStyle(
                color: Color(0xFFE5C07B),
                fontSize: 10,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Brand Title
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color(0xFFFFF3D1),
              Color(0xFFE5B869),
              Color(0xFFD49A37),
              Color(0xFFF3D59B),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            'SONA SUTRA',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              letterSpacing: 3.5,
              color: Colors.white,
              fontFamily: 'serif',
            ),
          ),
        ),
        const SizedBox(height: 3),
        // Tagline
        const Text(
          'YOUR STORY IN EVERY SPARKLE',
          style: TextStyle(
            color: Color(0xFFD8B26E),
            fontSize: 8.5,
            letterSpacing: 2.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        // Star sparkle icon below logo
        const CustomSparkleStar(),
      ],
    );
  }
}

class CustomSparkleStar extends StatelessWidget {
  const CustomSparkleStar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12,
      height: 12,
      child: CustomPaint(
        painter: StarSparklePainter(),
      ),
    );
  }
}

class StarSparklePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFFF1C1), Color(0xFFDCA148)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final cx = size.width / 2;
    final cy = size.height / 2;
    final path = Path();

    path.moveTo(cx, 0);
    path.quadraticBezierTo(cx, cy, size.width, cy);
    path.quadraticBezierTo(cx, cy, cx, size.height);
    path.quadraticBezierTo(cx, cy, 0, cy);
    path.quadraticBezierTo(cx, cy, cx, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LogoSymbolPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final goldGradient = const LinearGradient(
      colors: [
        Color(0xFFFFF2C2),
        Color(0xFFE5B963),
        Color(0xFFB88225),
        Color(0xFFD8A849),
        Color(0xFFFFF2C2),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, w, h));

    final paint = Paint()
      ..shader = goldGradient
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Draw Left 'S' heart half
    final leftPath = Path();
    leftPath.moveTo(w * 0.5, h * 0.28);
    leftPath.cubicTo(
        w * 0.38, h * 0.02,
        w * 0.12, h * 0.05,
        w * 0.12, h * 0.28);
    leftPath.cubicTo(
        w * 0.12, h * 0.52,
        w * 0.48, h * 0.52,
        w * 0.48, h * 0.76);
    leftPath.cubicTo(
        w * 0.48, h * 0.92,
        w * 0.20, h * 0.94,
        w * 0.14, h * 0.82);
    // serif end
    leftPath.lineTo(w * 0.14, h * 0.72);
    leftPath.lineTo(w * 0.19, h * 0.72);
    leftPath.cubicTo(
        w * 0.24, h * 0.86,
        w * 0.38, h * 0.84,
        w * 0.38, h * 0.75);
    leftPath.cubicTo(
        w * 0.38, h * 0.58,
        w * 0.02, h * 0.56,
        w * 0.02, h * 0.28);
    leftPath.cubicTo(
        w * 0.02, h * 0.0,
        w * 0.38, -h * 0.05,
        w * 0.5, h * 0.20);
    leftPath.close();

    // Draw Right 'S' heart half (symmetrical mirror)
    final rightPath = Path();
    rightPath.moveTo(w * 0.5, h * 0.28);
    rightPath.cubicTo(
        w * 0.62, h * 0.02,
        w * 0.88, h * 0.05,
        w * 0.88, h * 0.28);
    rightPath.cubicTo(
        w * 0.88, h * 0.52,
        w * 0.52, h * 0.52,
        w * 0.52, h * 0.76);
    rightPath.cubicTo(
        w * 0.52, h * 0.92,
        w * 0.80, h * 0.94,
        w * 0.86, h * 0.82);
    // serif end
    rightPath.lineTo(w * 0.86, h * 0.72);
    rightPath.lineTo(w * 0.81, h * 0.72);
    rightPath.cubicTo(
        w * 0.76, h * 0.86,
        w * 0.62, h * 0.84,
        w * 0.62, h * 0.75);
    rightPath.cubicTo(
        w * 0.62, h * 0.58,
        w * 0.98, h * 0.56,
        w * 0.98, h * 0.28);
    rightPath.cubicTo(
        w * 0.98, h * 0.0,
        w * 0.62, -h * 0.05,
        w * 0.5, h * 0.20);
    rightPath.close();

    canvas.drawPath(leftPath, paint);
    canvas.drawPath(rightPath, paint);

    // Draw Diamond in top center of heart
    _drawDiamond(canvas, size, goldGradient);
  }

  void _drawDiamond(Canvas canvas, Size size, Shader goldShader) {
    final cx = size.width * 0.5;
    final cy = size.height * 0.38;
    final dw = size.width * 0.16;
    final dh = size.height * 0.16;

    final diamondPaint = Paint()
      ..shader = goldShader
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = const Color(0xFF4A2E05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    // Diamond polygon outer
    final diamondPath = Path();
    diamondPath.moveTo(cx, cy - dh * 0.5); // top
    diamondPath.lineTo(cx + dw * 0.5, cy - dh * 0.15); // upper right
    diamondPath.lineTo(cx, cy + dh * 0.5); // bottom tip
    diamondPath.lineTo(cx - dw * 0.5, cy - dh * 0.15); // upper left
    diamondPath.close();

    canvas.drawPath(diamondPath, diamondPaint);

    // Diamond facet inner lines
    final facetPath = Path();
    facetPath.moveTo(cx - dw * 0.5, cy - dh * 0.15);
    facetPath.lineTo(cx + dw * 0.5, cy - dh * 0.15);

    facetPath.moveTo(cx - dw * 0.25, cy - dh * 0.5);
    facetPath.lineTo(cx - dw * 0.25, cy - dh * 0.15);
    facetPath.lineTo(cx, cy + dh * 0.5);

    facetPath.moveTo(cx + dw * 0.25, cy - dh * 0.5);
    facetPath.lineTo(cx + dw * 0.25, cy - dh * 0.15);
    facetPath.lineTo(cx, cy + dh * 0.5);

    canvas.drawPath(facetPath, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
