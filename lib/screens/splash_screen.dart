import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/footer_badges.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 1. Setup smooth entrance animations for the splash logo
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();

    // 2. Automatic navigation to LoginScreen after 2.8 seconds
    Timer(const Duration(milliseconds: 2800), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LoginScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF140B06),
      body: Stack(
        children: [
          // 1. Deep Luxury Ambient Gradient Background
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.0, -0.2),
                  radius: 1.1,
                  colors: [
                    Color(0xFF4A2B17), // Rich gold/chocolate core
                    Color(0xFF28140A),
                    Color(0xFF140804),
                    Color(0xFF0D0402),
                  ],
                ),
              ),
            ),
          ),

          // 2. Ambient Gold Glow Orbs
          Positioned(
            top: size.height * 0.25,
            left: size.width * 0.1,
            right: size.width * 0.1,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFE5B865).withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // 3. Subtle Floating Bokeh Lights
          Positioned.fill(
            child: CustomPaint(
              painter: SplashBokehPainter(),
            ),
          ),

          // 4. Center Logo with Fade & Scale Animation
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Sona Sutra Brand Logo (Large scale for splash)
                    const SonaSutraLogo(scale: 1.5),

                    const SizedBox(height: 36),

                    // Decorative Golden Lotus Accent
                    const GoldLotusIcon(size: 28),

                    const SizedBox(height: 24),

                    // Subtle Golden Circular Progress Indicator
                    SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          const Color(0xFFE5B864).withValues(alpha: 0.85),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 5. Bottom Footer Tagline
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                children: [
                  // Gold line divider with glow
                  Container(
                    width: 120,
                    height: 1,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Color(0xFFDCA148),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'PURE GOLD & SILVER • TIMELESS JEWELLERY',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFD6C5B3),
                      fontSize: 10,
                      letterSpacing: 2.2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Background Bokeh Light Spots Painter
class SplashBokehPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    void drawOrb(double x, double y, double radius, Color color) {
      paint.color = color;
      canvas.drawCircle(Offset(x, y), radius, paint);
    }

    final w = size.width;
    final h = size.height;

    drawOrb(w * 0.2, h * 0.18, 45, const Color(0xFFFFF0B8).withValues(alpha: 0.04));
    drawOrb(w * 0.8, h * 0.28, 55, const Color(0xFFE5B865).withValues(alpha: 0.05));
    drawOrb(w * 0.15, h * 0.75, 50, const Color(0xFFDCA148).withValues(alpha: 0.03));
    drawOrb(w * 0.85, h * 0.82, 40, const Color(0xFFFFF0B8).withValues(alpha: 0.04));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
