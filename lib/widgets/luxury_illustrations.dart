import 'dart:math' as math;
import 'package:flutter/material.dart';

/// 1. Top Header Banner Background with Glowing Bokeh, Stacked 3D Silver Bars & Coins
class LuxuryHeroBannerHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String stepTag;
  final Widget? bottomContent;

  const LuxuryHeroBannerHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.stepTag = '',
    this.bottomContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF1B0D05),
      ),
      child: Stack(
        children: [
          // Glowing Bokeh & Gold Sparkle Custom Painter
          Positioned.fill(
            child: CustomPaint(
              painter: _HeaderBokehPainter(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (stepTag.isNotEmpty) ...[
                        Text(
                          stepTag.toUpperCase(),
                          style: const TextStyle(
                            color: Color(0xFFE5B864),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFFFAF7F3),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'serif',
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Color(0xFFD4C2A8),
                          fontSize: 12.5,
                        ),
                      ),
                      if (bottomContent != null) ...[
                        const SizedBox(height: 12),
                        bottomContent!,
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Stacked 3D Silver Ingot Illustration
                const SizedBox(
                  width: 90,
                  height: 90,
                  child: CustomPaint(
                    painter: StackedSilverBarsPainter(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 2. Stacked 3D Silver Bars Painter (High-Definition 999 SILVER Ingot Pyramid)
class StackedSilverBarsPainter extends CustomPainter {
  const StackedSilverBarsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Golden Ambient Reflection Glow
    final glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFF59E0B).withValues(alpha: 0.35),
          const Color(0xFFE5B864).withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, w, h));
    canvas.drawCircle(Offset(w * 0.5, h * 0.5), w * 0.45, glowPaint);

    // Back Bar (Base Right)
    _drawSingleBar(canvas, Rect.fromLTWH(w * 0.35, h * 0.30, w * 0.55, h * 0.45), angle: -0.2);

    // Middle Bar (Base Left)
    _drawSingleBar(canvas, Rect.fromLTWH(w * 0.10, h * 0.38, w * 0.55, h * 0.45), angle: -0.15);

    // Front Main Standing Bar
    _drawSingleBar(canvas, Rect.fromLTWH(w * 0.22, h * 0.12, w * 0.52, h * 0.72), angle: 0.25, isMain: true);

    // Silver Coins at Base
    _drawSilverCoin(canvas, Offset(w * 0.18, h * 0.78), r: 12);
    _drawSilverCoin(canvas, Offset(w * 0.35, h * 0.82), r: 14);
    _drawSilverCoin(canvas, Offset(w * 0.80, h * 0.75), r: 11);
  }

  void _drawSingleBar(Canvas canvas, Rect rect, {required double angle, bool isMain = false}) {
    canvas.save();
    canvas.translate(rect.center.dx, rect.center.dy);
    canvas.rotate(angle);

    final localRect = Rect.fromCenter(center: Offset.zero, width: rect.width, height: rect.height);

    // Drop Shadow
    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.4)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawRRect(RRect.fromRectAndRadius(localRect.shift(const Offset(2, 4)), const Radius.circular(6)), shadowPaint);

    // Bevel Metallic Gradient Body
    final bodyPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFFFFFFF),
          Color(0xFFE2E8F0),
          Color(0xFFCBD5E1),
          Color(0xFF94A3B8),
          Color(0xFF64748B),
          Color(0xFFE2E8F0),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 0.2, 0.45, 0.7, 0.85, 1.0],
      ).createShader(localRect);

    canvas.drawRRect(RRect.fromRectAndRadius(localRect, const Radius.circular(6)), bodyPaint);

    // Gold Bevel Edge Frame
    final framePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = isMain ? 1.2 : 0.8
      ..shader = const LinearGradient(
        colors: [Color(0xFFF59E0B), Color(0xFFE5B864), Color(0xFFD97706)],
      ).createShader(localRect);

    canvas.drawRRect(RRect.fromRectAndRadius(localRect, const Radius.circular(6)), framePaint);

    if (isMain) {
      // Embossed "999 SILVER" Stamp
      final p1 = TextPainter(
        text: const TextSpan(
          text: '999',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontSize: 12,
            fontWeight: FontWeight.w900,
            fontFamily: 'serif',
            shadows: [Shadow(color: Colors.white, offset: Offset(0.5, 0.5))],
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      p1.paint(canvas, Offset(-p1.width / 2, -localRect.height * 0.25));

      final p2 = TextPainter(
        text: const TextSpan(
          text: 'SILVER',
          style: TextStyle(
            color: Color(0xFF334155),
            fontSize: 7.5,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.0,
            shadows: [Shadow(color: Colors.white, offset: Offset(0.5, 0.5))],
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      p2.paint(canvas, Offset(-p2.width / 2, localRect.height * 0.10));
    }

    canvas.restore();
  }

  void _drawSilverCoin(Canvas canvas, Offset center, {required double r}) {
    final coinPaint = Paint()
      ..shader = RadialGradient(
        colors: const [
          Color(0xFFFFFFFF),
          Color(0xFFE2E8F0),
          Color(0xFF94A3B8),
          Color(0xFF475569),
        ],
        center: const Alignment(-0.3, -0.3),
      ).createShader(Rect.fromCircle(center: center, radius: r));

    canvas.drawCircle(center, r, coinPaint);

    final rimPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8
      ..color = const Color(0xFFE5B864);
    canvas.drawCircle(center, r * 0.85, rimPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _HeaderBokehPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rng = math.Random(42);
    final p = Paint();

    for (int i = 0; i < 15; i++) {
      final x = rng.nextDouble() * size.width;
      final y = rng.nextDouble() * size.height;
      final radius = 10 + rng.nextDouble() * 25;
      final opacity = 0.03 + rng.nextDouble() * 0.08;

      p.color = (i % 2 == 0 ? const Color(0xFFE5B864) : Colors.white).withValues(alpha: opacity);
      canvas.drawCircle(Offset(x, y), radius, p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 3. Calendar & Silver Coins Illustration (For Monthly Payout Card)
class CalendarSilverIllustration extends StatelessWidget {
  const CalendarSilverIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85,
      height: 70,
      child: CustomPaint(
        painter: _CalendarSilverPainter(),
      ),
    );
  }
}

class _CalendarSilverPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Calendar Stand Base
    final calRect = Rect.fromLTWH(w * 0.25, h * 0.15, w * 0.65, h * 0.70);
    final calPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFAF7F2), Color(0xFFEFE0C9)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(calRect);

    canvas.drawRRect(RRect.fromRectAndRadius(calRect, const Radius.circular(6)), calPaint);

    final calBorder = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..color = const Color(0xFFC8801C);
    canvas.drawRRect(RRect.fromRectAndRadius(calRect, const Radius.circular(6)), calBorder);

    // Calendar Header Red Strip
    final headerRect = Rect.fromLTWH(w * 0.25, h * 0.15, w * 0.65, h * 0.20);
    canvas.drawRRect(
      RRect.fromRectAndCorners(headerRect, topLeft: const Radius.circular(6), topRight: const Radius.circular(6)),
      Paint()..color = const Color(0xFFC8801C),
    );

    // 999 Silver Bar resting beside calendar
    final barRect = Rect.fromLTWH(w * 0.05, h * 0.40, w * 0.40, h * 0.45);
    final barPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFFFFFF), Color(0xFFCBD5E1), Color(0xFF64748B)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(barRect);

    canvas.drawRRect(RRect.fromRectAndRadius(barRect, const Radius.circular(4)), barPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(barRect, const Radius.circular(4)), calBorder);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 4. Growth Arrow & Ascending Silver Bars Illustration (For Accumulate at Maturity Card)
class GrowthBarsIllustration extends StatelessWidget {
  const GrowthBarsIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85,
      height: 70,
      child: CustomPaint(
        painter: _GrowthBarsPainter(),
      ),
    );
  }
}

class _GrowthBarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // 3 Ascending Silver Bars
    _drawBar(canvas, Rect.fromLTWH(w * 0.05, h * 0.50, w * 0.22, h * 0.40));
    _drawBar(canvas, Rect.fromLTWH(w * 0.32, h * 0.35, w * 0.24, h * 0.55));
    _drawBar(canvas, Rect.fromLTWH(w * 0.60, h * 0.20, w * 0.26, h * 0.70));

    // Golden Growth Arrow Curve
    final path = Path()
      ..moveTo(w * 0.05, h * 0.45)
      ..quadraticBezierTo(w * 0.45, h * 0.35, w * 0.85, h * 0.08);

    final arrowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..shader = const LinearGradient(
        colors: [Color(0xFFF59E0B), Color(0xFFE5B864)],
      ).createShader(Rect.fromLTWH(0, 0, w, h));

    canvas.drawPath(path, arrowPaint);

    // Arrow Head
    final head = Path()
      ..moveTo(w * 0.88, h * 0.08)
      ..lineTo(w * 0.72, h * 0.08)
      ..lineTo(w * 0.82, h * 0.22)
      ..close();
    canvas.drawPath(head, Paint()..color = const Color(0xFFF59E0B));
  }

  void _drawBar(Canvas canvas, Rect rect) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFFFFFF), Color(0xFFCBD5E1), Color(0xFF64748B)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(rect);

    final border = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = const Color(0xFFE5B864);

    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(4)), paint);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(4)), border);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 5. Phone & Chat OTP Verification Illustration (For Page 5 Enter verification code)
class PhoneOtpIllustration extends StatelessWidget {
  const PhoneOtpIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3DB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5B864)),
      ),
      child: const Center(
        child: Icon(Icons.phonelink_ring_rounded, color: Color(0xFFC8801C), size: 28),
      ),
    );
  }
}
