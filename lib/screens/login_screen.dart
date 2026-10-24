import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/quick_feature_card.dart';
import '../widgets/footer_badges.dart';
import 'gold_marketplace_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoginSelected = true;
  bool isPasswordObscured = true;
  String selectedLanguage = 'English';

  final TextEditingController _loginIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _navigateToMarketplace() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const GoldMarketplaceScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _loginIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF140B06), // Base dark luxury brown
      body: Stack(
        children: [
          // 1. Rich Luxury Dark Gradient Background with Bokeh Lights
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.4, -0.6),
                  radius: 1.2,
                  colors: [
                    Color(0xFF381F10), // Warm inner glow
                    Color(0xFF221108),
                    Color(0xFF120804),
                    Color(0xFF0A0402),
                  ],
                ),
              ),
            ),
          ),

          // Ambient Background Jewelry Glow / Light overlay
          Positioned(
            top: -50,
            right: -60,
            width: 320,
            height: 320,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFE5B865).withValues(alpha: 0.18),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Bokeh Light Particles Background Painter
          Positioned.fill(
            child: CustomPaint(
              painter: BokehBackgroundPainter(),
            ),
          ),

          // 2. Main Scrollable Content
          SafeArea(
            child: Column(
              children: [
                // Header Area with Language Switcher & Logo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                    children: [
                      // Top Row: Language Selector
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.35),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.2),
                              width: 0.8,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.language,
                                color: Colors.white,
                                size: 15,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                selectedLanguage,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Brand Logo (Heart SS + Diamond + ESTD 1988)
                      const SonaSutraLogo(scale: 0.95),
                      const SizedBox(height: 18),

                      // Welcome Back Heading
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'serif',
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Subtitle
                      const Text(
                        'Login to explore timeless jewellery,\nDigital Gold & Silver and exclusive offers.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFD6C8B9),
                          fontSize: 13,
                          height: 1.35,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Main Card & Footer Scrollable Section
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        // Off-White Main Login Card
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F2EB),
                              borderRadius: BorderRadius.circular(28),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.35),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Tab Bar (Login / Sign Up)
                                Container(
                                  height: 46,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEBE0D4),
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  child: Row(
                                    children: [
                                      // Login Tab
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isLoginSelected = true;
                                            });
                                          },
                                          child: Container(
                                            decoration: isLoginSelected
                                                ? BoxDecoration(
                                                    color: const Color(0xFF351A0C),
                                                    borderRadius: BorderRadius.circular(23),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black.withValues(alpha: 0.15),
                                                        blurRadius: 4,
                                                      ),
                                                    ],
                                                  )
                                                : null,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Login',
                                                  style: TextStyle(
                                                    color: isLoginSelected
                                                        ? Colors.white
                                                        : const Color(0xFF756252),
                                                    fontSize: 15,
                                                    fontWeight: isLoginSelected
                                                        ? FontWeight.bold
                                                        : FontWeight.w500,
                                                  ),
                                                ),
                                                if (isLoginSelected) ...[
                                                  const SizedBox(height: 3),
                                                  Container(
                                                    width: 22,
                                                    height: 2.2,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFFE5B864),
                                                      borderRadius: BorderRadius.circular(2),
                                                    ),
                                                  ),
                                                ],
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Sign Up Tab
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isLoginSelected = false;
                                            });
                                          },
                                          child: Container(
                                            decoration: !isLoginSelected
                                                ? BoxDecoration(
                                                    color: const Color(0xFF351A0C),
                                                    borderRadius: BorderRadius.circular(23),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black.withValues(alpha: 0.15),
                                                        blurRadius: 4,
                                                      ),
                                                    ],
                                                  )
                                                : null,
                                            child: Center(
                                              child: Text(
                                                'Sign Up',
                                                style: TextStyle(
                                                  color: !isLoginSelected
                                                      ? Colors.white
                                                      : const Color(0xFF756252),
                                                  fontSize: 15,
                                                  fontWeight: !isLoginSelected
                                                      ? FontWeight.bold
                                                      : FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // Mobile Number / Email Field
                                CustomInputField(
                                  hintText: 'Mobile Number / Email',
                                  prefixIcon: Icons.person_outline_rounded,
                                  controller: _loginIdController,
                                ),

                                const SizedBox(height: 14),

                                // Password Field
                                CustomInputField(
                                  hintText: 'Password',
                                  prefixIcon: Icons.lock_outline_rounded,
                                  isPassword: isPasswordObscured,
                                  controller: _passwordController,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isPasswordObscured
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: const Color(0xFF5A4030),
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isPasswordObscured = !isPasswordObscured;
                                      });
                                    },
                                  ),
                                ),

                                const SizedBox(height: 8),

                                // Forgot Password? Link
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: Color(0xFF3B2112),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 16),

                                // Main Login Button (Navigates directly to Gold Marketplace)
                                Container(
                                  height: 52,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF3B1E0F),
                                        Color(0xFF220D04),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(26),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.2),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: _navigateToMarketplace,
                                      borderRadius: BorderRadius.circular(26),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: Row(
                                          children: [
                                            const Expanded(
                                              child: Center(
                                                child: Text(
                                                  'Login',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // Golden Arrow Circle Icon on the right
                                            Container(
                                              width: 36,
                                              height: 36,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFFFFF0B8),
                                                    Color(0xFFE5B864),
                                                    Color(0xFFC48B22),
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                              ),
                                              child: const Icon(
                                                Icons.chevron_right_rounded,
                                                color: Color(0xFF2B1407),
                                                size: 24,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 18),

                                // OR Divider
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        color: const Color(0xFFDDD2C6),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 12),
                                      child: Text(
                                        'OR',
                                        style: TextStyle(
                                          color: Color(0xFF8A7767),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        color: const Color(0xFFDDD2C6),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 16),

                                // Login with Biometrics Button
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFAF6F0),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: const Color(0xFFDCD0C2),
                                      width: 1,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: _navigateToMarketplace,
                                    borderRadius: BorderRadius.circular(25),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 18),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.fingerprint_rounded,
                                            color: Color(0xFF331A0C),
                                            size: 24,
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              'Login with Biometrics',
                                              style: TextStyle(
                                                color: Color(0xFF331A0C),
                                                fontSize: 14.5,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.chevron_right_rounded,
                                            color: Color(0xFF331A0C),
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 22),

                                // 4 Quick Feature Cards (Digital Gold SIP, Silver SIP, etc.)
                                const QuickFeatureCardsSection(),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        // Curved Bottom Footer Section
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xFF1B0E07),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(28),
                              topRight: Radius.circular(28),
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                          child: const BottomFooterTrustSection(),
                        ),
                      ],
                    ),
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

// Painter for subtle background golden bokeh light spots
class BokehBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    void drawLight(double x, double y, double radius, Color color) {
      paint.color = color;
      canvas.drawCircle(Offset(x, y), radius, paint);
    }

    final w = size.width;
    final h = size.height;

    drawLight(w * 0.15, h * 0.1, 40, const Color(0xFFE5B864).withValues(alpha: 0.04));
    drawLight(w * 0.85, h * 0.2, 50, const Color(0xFFFFF2BD).withValues(alpha: 0.05));
    drawLight(w * 0.7, h * 0.08, 30, const Color(0xFFDCA148).withValues(alpha: 0.06));
    drawLight(w * 0.2, h * 0.35, 60, const Color(0xFFE5B864).withValues(alpha: 0.03));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
