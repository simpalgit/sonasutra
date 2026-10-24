import 'package:flutter/material.dart';
import 'silver_growth_status_screen.dart';

class SilverGrowthStep3AgreementScreen extends StatefulWidget {
  final int tenureMonths;
  final String benefitType;

  const SilverGrowthStep3AgreementScreen({
    super.key,
    this.tenureMonths = 18,
    this.benefitType = 'Monthly Payout',
  });

  @override
  State<SilverGrowthStep3AgreementScreen> createState() =>
      _SilverGrowthStep3AgreementScreenState();
}

class _SilverGrowthStep3AgreementScreenState
    extends State<SilverGrowthStep3AgreementScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  int _resendSeconds = 30;
  int _bottomNavIndex = 0;

  bool get _isOtpComplete =>
      _otpControllers.every((controller) => controller.text.isNotEmpty);

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _verifyAndSubmit() {
    if (!_isOtpComplete) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter all 6 digits of the verification code.'),
        ),
      );
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SilverGrowthStatusScreen(
          tenureMonths: widget.tenureMonths,
          benefitType: widget.benefitType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B0D05),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Color(0xFFE5B864), size: 20),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline_rounded,
                color: Color(0xFFE5B864), size: 22),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // 1. Dark Banner Header
                    _buildDarkHeader(),

                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 2. Top Summary Card
                          _buildTopSummaryCard(),

                          const SizedBox(height: 14),

                          // 3. Enter Verification Code Card
                          _buildOtpVerificationCard(),

                          const SizedBox(height: 16),

                          // 4. What Happens Next Section
                          _buildWhatHappensNextCard(),

                          const SizedBox(height: 20),

                          // 5. Action Buttons & Security Note
                          _buildActionButtons(),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 6. Bottom Navigation Bar
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  // --- 1. Dark Banner Header ---
  Widget _buildDarkHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF1B0D05),
        gradient: LinearGradient(
          colors: [
            Color(0xFF28150A),
            Color(0xFF1B0D05),
            Color(0xFF120804),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'AGREEMENT • VERIFICATION',
            style: TextStyle(
              color: Color(0xFFE5B864),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Verify Your Consent',
            style: TextStyle(
              color: Color(0xFFFAF7F3),
              fontSize: 28,
              fontWeight: FontWeight.w900,
              fontFamily: 'serif',
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Confirm the agreement using the code sent to your registered mobile.',
            style: TextStyle(
              color: Color(0xFFD4C2A8),
              fontSize: 12.5,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 20),

          // Stepper Items
          Row(
            children: [
              _buildStepItem('1', 'Acceptance', isDone: true, isActive: false),
              _buildStepConnector(),
              _buildStepItem('2', 'Agreement', isDone: true, isActive: false),
              _buildStepConnector(),
              _buildStepItem('3', 'Verification', isDone: false, isActive: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(String step, String label,
      {required bool isDone, required bool isActive}) {
    return Column(
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive || isDone
                ? const Color(0xFFE5B864)
                : Colors.transparent,
            border: Border.all(color: const Color(0xFFE5B864), width: 1.5),
          ),
          child: Center(
            child: isDone
                ? const Icon(Icons.check, color: Color(0xFF1B0D05), size: 15)
                : Text(
                    step,
                    style: TextStyle(
                      color: isActive ? const Color(0xFF1B0D05) : const Color(0xFFE5B864),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive || isDone
                ? const Color(0xFFE5B864)
                : const Color(0xFF8C7A6B),
            fontSize: 11,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildStepConnector() {
    return Expanded(
      child: Container(
        height: 1.5,
        margin: const EdgeInsets.only(bottom: 16, left: 4, right: 4),
        color: const Color(0xFFE5B864),
      ),
    );
  }

  // --- 2. Top Summary Card ---
  Widget _buildTopSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF0E4D4), width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Row 1: Document Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF2DC),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.description_outlined,
                    color: Color(0xFFC8801C), size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      'Agreement: SG0021 • Revision 01',
                      style: TextStyle(
                        color: Color(0xFF1F2937),
                        fontSize: 12.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF7EA),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: const Color(0xFFE5C07B), width: 0.8),
                      ),
                      child: const Text(
                        'SAMPLE PREVIEW',
                        style: TextStyle(
                          color: Color(0xFF8C5B21),
                          fontSize: 8.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Review Agreement >',
                style: TextStyle(
                  color: Color(0xFF3182CE),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: Color(0xFFF0E4D4), height: 1),
          ),

          // Row 2: Customer & Terms Breakdown
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFFF5E5),
                      ),
                      child: const Icon(Icons.person_outline_rounded,
                          color: Color(0xFFC8801C), size: 20),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Chandan Soni',
                            style: TextStyle(
                              color: Color(0xFF1F2937),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Customer ID: CUST0021',
                            style: TextStyle(
                              color: Color(0xFF3182CE),
                              fontSize: 10.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: 1,
                height: 50,
                color: const Color(0xFFF0E4D4),
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),

              // Store / Plan details
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    _buildSummaryDetailRow('Principal', '1,000.000 g'),
                    _buildSummaryDetailRow('Sample basis', '999-equivalent grams'),
                    _buildSummaryDetailRow('Tenure', '${widget.tenureMonths} months'),
                    _buildSummaryDetailRow('Benefit', widget.benefitType),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 11,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF1E293B),
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // --- 3. Enter Verification Code Card ---
  Widget _buildOtpVerificationCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF0E4D4), width: 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF2DC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.mark_chat_unread_outlined,
                    color: Color(0xFFC8801C), size: 28),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Enter verification code',
                    style: TextStyle(
                      color: Color(0xFF1E293B),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'serif',
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Code sent to +91 ••••••• 7284',
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // 6 OTP Digit Inputs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              6,
              (index) => SizedBox(
                width: 46,
                height: 54,
                child: TextField(
                  controller: _otpControllers[index],
                  focusNode: _focusNodes[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  style: const TextStyle(
                    color: Color(0xFF1E293B),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    filled: true,
                    fillColor: const Color(0xFFFAF7F2),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFD97706), width: 2),
                    ),
                  ),
                  onChanged: (val) {
                    if (val.isNotEmpty && index < 5) {
                      _focusNodes[index + 1].requestFocus();
                    } else if (val.isEmpty && index > 0) {
                      _focusNodes[index - 1].requestFocus();
                    }
                    setState(() {});
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Resend Code timer & Contact support
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Resend code in ',
                style: TextStyle(color: Color(0xFF64748B), fontSize: 12),
              ),
              Text(
                '00:${_resendSeconds.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  color: Color(0xFFD97706),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Need to update your mobile? ',
                style: TextStyle(color: Color(0xFF64748B), fontSize: 11.5),
              ),
              Text(
                'Contact Support >',
                style: TextStyle(
                  color: Color(0xFF3182CE),
                  fontSize: 11.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(color: Color(0xFFF1F5F9), height: 1),
          ),

          // Bottom Info Note
          Row(
            children: const [
              Icon(Icons.info_outline_rounded, color: Color(0xFFD97706), size: 16),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'This code confirms your consent to SG0021 Revision 01.',
                  style: TextStyle(
                    color: Color(0xFF475569),
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- 4. What Happens Next Section ---
  Widget _buildWhatHappensNextCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF5E6D3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.info_outline_rounded, color: Color(0xFFD97706), size: 20),
              SizedBox(width: 8),
              Text(
                'What happens next?',
                style: TextStyle(
                  color: Color(0xFF1E293B),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'serif',
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          _buildNextStepTimelineItem(
            stepNumber: '1',
            title: 'Verify code',
            subtitle: 'Enter the 6-digit code sent to your registered mobile.',
            isLast: false,
          ),
          _buildNextStepTimelineItem(
            stepNumber: '2',
            title: 'Submit consent',
            subtitle: 'Your consent for SG0021 Revision 01 will be recorded.',
            isLast: false,
          ),
          _buildNextStepTimelineItem(
            stepNumber: '3',
            title: 'Await company approval',
            subtitle: 'Your programme becomes active only after company approval.',
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildNextStepTimelineItem({
    required String stepNumber,
    required String title,
    required String subtitle,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFD97706),
              ),
              child: Center(
                child: Text(
                  stepNumber,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 1.5,
                height: 32,
                color: const Color(0xFFE2E8F0),
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF1E293B),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: 11,
                  height: 1.3,
                ),
              ),
              if (!isLast) const SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }

  // --- 5. Action Buttons & Security Note ---
  Widget _buildActionButtons() {
    return Column(
      children: [
        // Main Action Button
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _isOtpComplete
                  ? const Color(0xFFC8801C)
                  : const Color(0xFFA3A3A3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: _isOtpComplete ? 2 : 0,
            ),
            onPressed: _verifyAndSubmit,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Verify & Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 18),
              ],
            ),
          ),
        ),

        const SizedBox(height: 6),

        Text(
          _isOtpComplete ? 'Ready to submit!' : 'Enter all 6 digits to continue.',
          style: const TextStyle(
            color: Color(0xFF64748B),
            fontSize: 11,
          ),
        ),

        const SizedBox(height: 14),

        // Back Button
        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFE5C07B), width: 1.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.white,
            ),
            onPressed: () => Navigator.of(context).maybePop(),
            child: const Text(
              'Back to agreement',
              style: TextStyle(
                color: Color(0xFFC8801C),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 14),

        // Lock Security Disclaimer
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.lock_outline_rounded, color: Color(0xFF64748B), size: 14),
            SizedBox(width: 6),
            Text(
              'Never share your verification code with anyone.',
              style: TextStyle(
                color: Color(0xFF64748B),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // --- 6. Bottom Navigation Bar ---
  Widget _buildBottomNavigationBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(0, Icons.bar_chart_rounded, 'Explore Programme'),
          _buildBottomNavItem(1, Icons.assignment_outlined, 'My Plans'),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(int index, IconData icon, String label) {
    bool isSelected = _bottomNavIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _bottomNavIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFFC8801C) : const Color(0xFF94A3B8),
            size: 22,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFF2B1407) : const Color(0xFF94A3B8),
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 32,
              height: 3,
              decoration: BoxDecoration(
                color: const Color(0xFFC8801C),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }
}
