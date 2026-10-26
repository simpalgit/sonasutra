import 'package:flutter/material.dart';

/// High-definition, realistic 3D Metallic Silver Bar Ingot Widget
/// Renders 100% offline with zero network dependencies.
class SilverBarGraphic extends StatelessWidget {
  final double width;
  final double height;
  final String purity;
  final String label;
  final bool showGoldGlow;

  const SilverBarGraphic({
    super.key,
    this.width = 90,
    this.height = 90,
    this.purity = '999',
    this.label = 'SILVER',
    this.showGoldGlow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 10,
            offset: const Offset(2, 4),
          ),
          if (showGoldGlow)
            BoxShadow(
              color: const Color(0xFFE5B864).withValues(alpha: 0.25),
              blurRadius: 12,
              spreadRadius: 1,
            ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CustomPaint(
          painter: _SilverBarPainter(purity: purity, label: label),
          child: Container(),
        ),
      ),
    );
  }
}

class _SilverBarPainter extends CustomPainter {
  final String purity;
  final String label;

  _SilverBarPainter({required this.purity, required this.label});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    // Outer Bevel Metallic Gradient
    final outerPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFF1F5F9),
          Color(0xFFCBD5E1),
          Color(0xFF94A3B8),
          Color(0xFF64748B),
          Color(0xFF334155),
          Color(0xFFE2E8F0),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 0.25, 0.5, 0.75, 0.9, 1.0],
      ).createShader(rect);

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(12)),
      outerPaint,
    );

    // Inner Face Inset
    final innerMargin = size.width * 0.08;
    final innerRect = Rect.fromLTRB(
      innerMargin,
      innerMargin,
      size.width - innerMargin,
      size.height - innerMargin,
    );

    final innerPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFFFFFFF),
          Color(0xFFE2E8F0),
          Color(0xFFCBD5E1),
          Color(0xFF94A3B8),
          Color(0xFFF8FAFC),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(innerRect);

    canvas.drawRRect(
      RRect.fromRectAndRadius(innerRect, const Radius.circular(8)),
      innerPaint,
    );

    // Gold Accent Frame
    final goldFramePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..shader = const LinearGradient(
        colors: [Color(0xFFF59E0B), Color(0xFFE5B864), Color(0xFFD97706)],
      ).createShader(innerRect);

    canvas.drawRRect(
      RRect.fromRectAndRadius(innerRect, const Radius.circular(8)),
      goldFramePaint,
    );

    // Embossed Purity & Label Text
    final textPainterPurity = TextPainter(
      text: TextSpan(
        text: purity,
        style: TextStyle(
          color: const Color(0xFF1E293B),
          fontSize: size.width * 0.22,
          fontWeight: FontWeight.w900,
          fontFamily: 'serif',
          letterSpacing: 1.5,
          shadows: const [
            Shadow(color: Colors.white, offset: Offset(0.5, 0.5), blurRadius: 0.5),
            Shadow(color: Color(0xFF475569), offset: Offset(-0.5, -0.5), blurRadius: 0.5),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainterPurity.layout();
    textPainterPurity.paint(
      canvas,
      Offset(
        (size.width - textPainterPurity.width) / 2,
        size.height * 0.25,
      ),
    );

    final textPainterLabel = TextPainter(
      text: TextSpan(
        text: label,
        style: TextStyle(
          color: const Color(0xFF334155),
          fontSize: size.width * 0.12,
          fontWeight: FontWeight.w800,
          letterSpacing: 2.0,
          shadows: const [
            Shadow(color: Colors.white, offset: Offset(0.5, 0.5), blurRadius: 0.5),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainterLabel.layout();
    textPainterLabel.paint(
      canvas,
      Offset(
        (size.width - textPainterLabel.width) / 2,
        size.height * 0.55,
      ),
    );

    // Diagonal Metallic Specular Shine Highlight Overlay
    final shinePath = Path()
      ..moveTo(0, size.height * 0.3)
      ..lineTo(size.width * 0.3, 0)
      ..lineTo(size.width * 0.6, 0)
      ..lineTo(0, size.height * 0.6)
      ..close();

    final shinePaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.white.withValues(alpha: 0.45),
          Colors.white.withValues(alpha: 0.0),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(rect);

    canvas.drawPath(shinePath, shinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
