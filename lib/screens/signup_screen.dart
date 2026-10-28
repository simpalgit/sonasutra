import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/custom_text_field.dart';
import 'gold_marketplace_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();

  bool _isPasswordObscured = true;
  bool _acceptTerms = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _referralController.dispose();
    super.dispose();
  }

  void _createAccount() {
    if (_fullNameController.text.trim().isEmpty ||
        _mobileController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields.')),
      );
      return;
    }

    if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept Terms & Conditions to proceed.')),
      );
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const GoldMarketplaceScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF140B06),
      body: Stack(
        children: [
          // Background Gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.4, -0.6),
                  radius: 1.2,
                  colors: [
                    Color(0xFF381F10),
                    Color(0xFF221108),
                    Color(0xFF120804),
                    Color(0xFF0A0402),
                  ],
                ),
              ),
            ),
          ),

          // Bokeh Background
          Positioned.fill(
            child: CustomPaint(
              painter: BokehBackgroundPainter(),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // Header with Back Button and Logo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFFE5B864)),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const SonaSutraLogo(scale: 0.8),
                      const SizedBox(width: 48), // Spacer for symmetry
                    ],
                  ),
                ),

                const Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Georgia',
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Join Sona Sutra for pure 24K Gold & Silver investments.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFD6C8B9), fontSize: 13),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        Container(
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
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomInputField(
                                controller: _fullNameController,
                                hintText: 'Full Name',
                                prefixIcon: Icons.person_outline_rounded,
                              ),
                              const SizedBox(height: 14),
                              CustomInputField(
                                controller: _mobileController,
                                hintText: 'Mobile Number',
                                prefixIcon: Icons.phone_android_rounded,
                                keyboardType: TextInputType.phone,
                              ),
                              const SizedBox(height: 14),
                              CustomInputField(
                                controller: _emailController,
                                hintText: 'Email Address (Optional)',
                                prefixIcon: Icons.email_outlined,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 14),
                              CustomInputField(
                                controller: _passwordController,
                                hintText: 'Password',
                                prefixIcon: Icons.lock_outline_rounded,
                                isPassword: _isPasswordObscured,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordObscured
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: const Color(0xFF5A4030),
                                    size: 20,
                                  ),
                                  onPressed: () => setState(() => _isPasswordObscured = !_isPasswordObscured),
                                ),
                              ),
                              const SizedBox(height: 14),
                              CustomInputField(
                                controller: _referralController,
                                hintText: 'Referral Code (Optional)',
                                prefixIcon: Icons.card_giftcard_rounded,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Checkbox(
                                      value: _acceptTerms,
                                      activeColor: const Color(0xFF3B2112),
                                      onChanged: (val) => setState(() => _acceptTerms = val ?? false),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Expanded(
                                    child: Text(
                                      'I agree to Sona Sutra Terms of Service and Privacy Policy.',
                                      style: TextStyle(color: Color(0xFF3B2112), fontSize: 11.5),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Container(
                                height: 56,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFF3B1E0F), Color(0xFF220D04)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                child: InkWell(
                                  onTap: _createAccount,
                                  borderRadius: BorderRadius.circular(28),
                                  child: const Center(
                                    child: Text(
                                      'Register & Continue',
                                      style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account? ',
                              style: TextStyle(color: Color(0xFFD6C8B9), fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: const Text(
                                'Sign In',
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
}

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
