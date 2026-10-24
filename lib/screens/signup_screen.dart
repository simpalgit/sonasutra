import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/custom_text_field.dart';
import 'login_screen.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFFE5B864)),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: SonaSutraLogo(scale: 1.1)),
              const SizedBox(height: 20),

              const Text(
                'Create Account',
                style: TextStyle(
                  color: Color(0xFFFAF7F2),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Join Sona Sutra for pure 24K Gold & Silver investments.',
                style: TextStyle(color: Color(0xFFA0AEC0), fontSize: 13),
              ),
              const SizedBox(height: 24),

              CustomTextField(
                controller: _fullNameController,
                hintText: 'Full Name',
                prefixIcon: Icons.person_outline_rounded,
              ),
              const SizedBox(height: 14),

              CustomTextField(
                controller: _mobileController,
                hintText: 'Mobile Number',
                prefixIcon: Icons.phone_android_rounded,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 14),

              CustomTextField(
                controller: _emailController,
                hintText: 'Email Address (Optional)',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 14),

              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock_outline_rounded,
                obscureText: _isPasswordObscured,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordObscured
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    color: const Color(0xFFE5B864),
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordObscured = !_isPasswordObscured;
                    });
                  },
                ),
              ),
              const SizedBox(height: 14),

              CustomTextField(
                controller: _referralController,
                hintText: 'Referral Code (Optional)',
                prefixIcon: Icons.card_giftcard_rounded,
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    activeColor: const Color(0xFFE5B864),
                    checkColor: const Color(0xFF140B06),
                    onChanged: (val) {
                      setState(() {
                        _acceptTerms = val ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      'I agree to Sona Sutra Terms of Service and Privacy Policy.',
                      style: TextStyle(color: Color(0xFFD6C5B3), fontSize: 11.5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE5B864),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: _createAccount,
                  child: const Text(
                    'Register & Continue',
                    style: TextStyle(
                      color: Color(0xFF140B06),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(color: Color(0xFFA0AEC0), fontSize: 13),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color(0xFFE5B864),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
