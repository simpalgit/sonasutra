import 'package:flutter/material.dart';

class BottomFooterTrustSection extends StatelessWidget {
  const BottomFooterTrustSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Lotus Flourish Divider
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Color(0xFFC89547)],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GoldLotusIcon(size: 24),
            ),
            Expanded(
              child: Container(
                height: 1,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFC89547), Colors.transparent],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        // 4 Badges Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: FooterBadgeItem(
                icon: Icons.verified_user_outlined,
                title: 'BIS Hallmarked\nJewellery',
              ),
            ),
            _buildVerticalDivider(),
            const Expanded(
              child: FooterBadgeItem(
                icon: Icons.diamond_outlined,
                title: 'Assured\nPurity',
              ),
            ),
            _buildVerticalDivider(),
            const Expanded(
              child: FooterBadgeItem(
                icon: Icons.local_shipping_outlined,
                title: 'Secure\nDelivery',
              ),
            ),
            _buildVerticalDivider(),
            const Expanded(
              child: FooterBadgeItem(
                icon: Icons.headset_mic_outlined,
                title: '24x7\nSupport',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      width: 1,
      height: 28,
      color: const Color(0xFF422818),
    );
  }
}

class FooterBadgeItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const FooterBadgeItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Gold outline icon with subtle golden circle
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFDCA148),
              width: 1.1,
            ),
          ),
          child: Icon(
            icon,
            size: 15,
            color: const Color(0xFFF0CA73),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFFE8D7C8),
            fontSize: 9.5,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

// Gold Lotus Flower Icon
class GoldLotusIcon extends StatelessWidget {
  final double size;

  const GoldLotusIcon({super.key, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: LotusPainter(),
      ),
    );
  }
}

class LotusPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final goldGradient = const LinearGradient(
      colors: [Color(0xFFFFF2BD), Color(0xFFE5B864), Color(0xFFC48B22)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(Rect.fromLTWH(0, 0, w, h));

    final paint = Paint()
      ..shader = goldGradient
      ..style = PaintingStyle.fill;

    // Center petal
    final centerPetal = Path()
      ..moveTo(w * 0.5, h * 0.1)
      ..quadraticBezierTo(w * 0.65, h * 0.4, w * 0.5, h * 0.8)
      ..quadraticBezierTo(w * 0.35, h * 0.4, w * 0.5, h * 0.1)
      ..close();
    canvas.drawPath(centerPetal, paint);

    // Left petal
    final leftPetal = Path()
      ..moveTo(w * 0.5, h * 0.8)
      ..quadraticBezierTo(w * 0.15, h * 0.35, w * 0.1, h * 0.5)
      ..quadraticBezierTo(w * 0.25, h * 0.75, w * 0.5, h * 0.8)
      ..close();
    canvas.drawPath(leftPetal, paint);

    // Right petal
    final rightPetal = Path()
      ..moveTo(w * 0.5, h * 0.8)
      ..quadraticBezierTo(w * 0.85, h * 0.35, w * 0.9, h * 0.5)
      ..quadraticBezierTo(w * 0.75, h * 0.75, w * 0.5, h * 0.8)
      ..close();
    canvas.drawPath(rightPetal, paint);

    // Bottom base curve
    final base = Path()
      ..moveTo(w * 0.2, h * 0.8)
      ..quadraticBezierTo(w * 0.5, h * 0.95, w * 0.8, h * 0.8)
      ..quadraticBezierTo(w * 0.5, h * 0.85, w * 0.2, h * 0.8)
      ..close();
    canvas.drawPath(base, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
