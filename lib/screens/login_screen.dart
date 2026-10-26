import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/quick_feature_card.dart';
import '../widgets/footer_badges.dart';
import 'gold_marketplace_screen.dart';
import 'signup_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordObscured = true;
  String selectedLanguage = 'English';

  final TextEditingController _loginIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _navigateToMarketplace() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const GoldMarketplaceScreen()),
    );
  }

  void _navigateToSignup() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  void _navigateToForgotPassword() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
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

          // Bokeh Light Particles Background Painter
          Positioned.fill(
            child: CustomPaint(painter: BokehBackgroundPainter()),
          ),

          // 2. Main Content
          SafeArea(
            child: Column(
              children: [
                // Header Area
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Column(
                    children: [
                      // Top Row: Language Selector
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.35),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.language,
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                selectedLanguage,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const SonaSutraLogo(scale: 0.9),
                      const SizedBox(height: 20),
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Georgia',
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Login to explore timeless jewellery,\nDigital Gold & Silver and exclusive offers.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFD6C8B9),
                          fontSize: 13.5,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F2EB),
                              borderRadius: BorderRadius.circular(28),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.4),
                                  blurRadius: 25,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CustomInputField(
                                  hintText: 'Mobile Number / Email',
                                  prefixIcon: Icons.person_outline_rounded,
                                  controller: _loginIdController,
                                ),
                                const SizedBox(height: 16),
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
                                    onPressed: () => setState(
                                      () => isPasswordObscured =
                                          !isPasswordObscured,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: _navigateToForgotPassword,
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: Color(0xFF3B2112),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Container(
                                  height: 58,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF3B1E0F),
                                        Color(0xFF220D04),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(29),
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: _navigateToMarketplace,
                                      borderRadius: BorderRadius.circular(29),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Row(
                                          children: [
                                            const Expanded(
                                              child: Center(
                                                child: Text(
                                                  'Login',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
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
                                                size: 28,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: const Color(0xFFDDD2C6),
                                        thickness: 1,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      child: Text(
                                        'OR',
                                        style: TextStyle(
                                          color: Color(0xFF8A7767),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        color: const Color(0xFFDDD2C6),
                                        thickness: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  height: 54,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFAF6F0),
                                    borderRadius: BorderRadius.circular(27),
                                    border: Border.all(
                                      color: const Color(0xFFDCD0C2),
                                      width: 1,
                                    ),
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {},
                                      borderRadius: BorderRadius.circular(27),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.fingerprint_rounded,
                                              color: Color(0xFF331A0C),
                                              size: 26,
                                            ),
                                            SizedBox(width: 12),
                                            Expanded(
                                              child: Text(
                                                'Login with Biometrics',
                                                style: TextStyle(
                                                  color: Color(0xFF331A0C),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.chevron_right_rounded,
                                              color: Color(0xFF331A0C),
                                              size: 22,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 28),
                                const QuickFeatureCardsSection(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Color(0xFFD6C8B9),
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: _navigateToSignup,
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Color(0xFFE5B864),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
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

  Widget _buildFeatureIcon(String label, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFEBE0D4)),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF3B2112),
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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

    drawLight(
      w * 0.15,
      h * 0.1,
      40,
      const Color(0xFFE5B864).withValues(alpha: 0.04),
    );
    drawLight(
      w * 0.85,
      h * 0.2,
      50,
      const Color(0xFFFFF2BD).withValues(alpha: 0.05),
    );
    drawLight(
      w * 0.7,
      h * 0.08,
      30,
      const Color(0xFFDCA148).withValues(alpha: 0.06),
    );
    drawLight(
      w * 0.2,
      h * 0.35,
      60,
      const Color(0xFFE5B864).withValues(alpha: 0.03),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
