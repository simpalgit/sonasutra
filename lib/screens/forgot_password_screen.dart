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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            children: [
              const SonaSutraLogo(scale: 1.2),
              const SizedBox(height: 24),

              Text(
                _currentStep == 1
                    ? 'Forgot Password?'
                    : _currentStep == 2
                        ? 'Verify OTP Code'
                        : 'Set New Password',
                style: const TextStyle(
                  color: Color(0xFFFAF7F2),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                _currentStep == 1
                    ? 'Enter your registered Mobile Number or Email to receive a 6-digit reset code.'
                    : _currentStep == 2
                        ? 'Enter the 6-digit code sent to ${_identifierController.text.isEmpty ? "your mobile" : _identifierController.text}.'
                        : 'Create a strong new password for your Sona Sutra account.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFA0AEC0),
                  fontSize: 12.5,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),

              if (_currentStep == 1) _buildStep1Form(),
              if (_currentStep == 2) _buildStep2Otp(),
              if (_currentStep == 3) _buildStep3NewPassword(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep1Form() {
    return Column(
      children: [
        CustomTextField(
          controller: _identifierController,
          hintText: 'Mobile Number or Email ID',
          prefixIcon: Icons.person_outline_rounded,
        ),
        const SizedBox(height: 28),

        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE5B864),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            onPressed: _sendOtp,
            child: const Text(
              'Send Verification Code',
              style: TextStyle(
                color: Color(0xFF1B0D05),
                fontSize: 15,
                fontWeight: FontWeight.bold,
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
              width: 44,
              height: 52,
              child: TextField(
                controller: _otpControllers[index],
                focusNode: _focusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 1,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: const Color(0xFF28150A),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF4A2B17)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE5B864), width: 1.5),
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
        const SizedBox(height: 28),

        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE5B864),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            onPressed: _verifyOtp,
            child: const Text(
              'Verify & Continue',
              style: TextStyle(
                color: Color(0xFF1B0D05),
                fontSize: 15,
                fontWeight: FontWeight.bold,
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
        CustomTextField(
          controller: _newPasswordController,
          hintText: 'New Password',
          prefixIcon: Icons.lock_outline_rounded,
          obscureText: _isObscureNew,
          suffixIcon: IconButton(
            icon: Icon(
              _isObscureNew ? Icons.visibility_off_rounded : Icons.visibility_rounded,
              color: const Color(0xFFE5B864),
            ),
            onPressed: () => setState(() => _isObscureNew = !_isObscureNew),
          ),
        ),
        const SizedBox(height: 16),

        CustomTextField(
          controller: _confirmPasswordController,
          hintText: 'Confirm New Password',
          prefixIcon: Icons.lock_clock_outlined,
          obscureText: _isObscureConfirm,
          suffixIcon: IconButton(
            icon: Icon(
              _isObscureConfirm ? Icons.visibility_off_rounded : Icons.visibility_rounded,
              color: const Color(0xFFE5B864),
            ),
            onPressed: () => setState(() => _isObscureConfirm = !_isObscureConfirm),
          ),
        ),
        const SizedBox(height: 28),

        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE5B864),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            onPressed: _resetPassword,
            child: const Text(
              'Update Password',
              style: TextStyle(
                color: Color(0xFF1B0D05),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
