import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/custom_text_field.dart';
import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int _currentStep = 1;
  final TextEditingController _identifierController = TextEditingController();
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isObscureNew = true;
  bool _isObscureConfirm = true;

  @override
  void dispose() {
    _identifierController.dispose();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _sendOtp() {
    if (_identifierController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter registered Mobile Number or Email ID.')),
      );
      return;
    }

    setState(() {
      _currentStep = 2;
    });
  }

  void _verifyOtp() {
    String otp = _otpControllers.map((c) => c.text).join();
    if (otp.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter 6-digit verification code.')),
      );
      return;
    }

    setState(() {
      _currentStep = 3;
    });
  }

  void _resetPassword() {
    if (_newPasswordController.text.isEmpty ||
        _newPasswordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match or field is empty.')),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1007),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: const [
              Icon(Icons.check_circle_rounded, color: Color(0xFFE5B864), size: 28),
              SizedBox(width: 10),
              Text(
                'Password Reset!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          content: const Text(
            'Your Sona Sutra account password has been updated successfully. Please sign in with your new password.',
            style: TextStyle(color: Color(0xFFD6C5B3), fontSize: 13),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE5B864),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('Sign In Now', style: TextStyle(color: Color(0xFF2B1407))),
            ),
          ],
        );
      },
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

                Text(
                  _currentStep == 1
                      ? 'Forgot Password?'
                      : _currentStep == 2
                          ? 'Verify OTP Code'
                          : 'Set New Password',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Georgia',
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    _currentStep == 1
                        ? 'Enter your registered Mobile Number or Email to receive a 6-digit reset code.'
                        : _currentStep == 2
                            ? 'Enter the 6-digit code sent to ${_identifierController.text.isEmpty ? "your mobile" : _identifierController.text}.'
                            : 'Create a strong new password for your Sona Sutra account.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFFD6C8B9),
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

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
                              if (_currentStep == 1) _buildStep1Form(),
                              if (_currentStep == 2) _buildStep2Otp(),
                              if (_currentStep == 3) _buildStep3NewPassword(),
                            ],
                          ),
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

  Widget _buildStep1Form() {
    return Column(
      children: [
        CustomInputField(
          controller: _identifierController,
          hintText: 'Mobile Number or Email ID',
          prefixIcon: Icons.person_outline_rounded,
        ),
        const SizedBox(height: 32),
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
            onTap: _sendOtp,
            borderRadius: BorderRadius.circular(28),
            child: const Center(
              child: Text(
                'Send Verification Code',
                style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStep2Otp() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            6,
            (index) => SizedBox(
              width: 42,
              height: 56,
              child: TextField(
                controller: _otpControllers[index],
                focusNode: _focusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 1,
                style: const TextStyle(
                  color: Color(0xFF331D10),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: const Color(0xFFFAF6F0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE4D8C9)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF3B1E0F), width: 1.5),
                  ),
                ),
                onChanged: (val) {
                  if (val.isNotEmpty && index < 5) {
                    _focusNodes[index + 1].requestFocus();
                  } else if (val.isEmpty && index > 0) {
                    _focusNodes[index - 1].requestFocus();
                  }
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
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
            onTap: _verifyOtp,
            borderRadius: BorderRadius.circular(28),
            child: const Center(
              child: Text(
                'Verify & Continue',
                style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStep3NewPassword() {
    return Column(
      children: [
        CustomInputField(
          controller: _newPasswordController,
          hintText: 'New Password',
          prefixIcon: Icons.lock_outline_rounded,
          isPassword: _isObscureNew,
          suffixIcon: IconButton(
            icon: Icon(
              _isObscureNew ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: const Color(0xFF5A4030),
              size: 20,
            ),
            onPressed: () => setState(() => _isObscureNew = !_isObscureNew),
          ),
        ),
        const SizedBox(height: 16),
        CustomInputField(
          controller: _confirmPasswordController,
          hintText: 'Confirm New Password',
          prefixIcon: Icons.lock_clock_outlined,
          isPassword: _isObscureConfirm,
          suffixIcon: IconButton(
            icon: Icon(
              _isObscureConfirm ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: const Color(0xFF5A4030),
              size: 20,
            ),
            onPressed: () => setState(() => _isObscureConfirm = !_isObscureConfirm),
          ),
        ),
        const SizedBox(height: 32),
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
            onTap: _resetPassword,
            borderRadius: BorderRadius.circular(28),
            child: const Center(
              child: Text(
                'Update Password',
                style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
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
