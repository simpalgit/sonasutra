import 'package:flutter/material.dart';
import 'page_06_consent_submitted_screen.dart';

class Page05VerifyConsentScreen extends StatefulWidget {
  final int tenureMonths;
  final String benefitOption;

  const Page05VerifyConsentScreen({
    super.key,
    this.tenureMonths = 18,
    this.benefitOption = 'Monthly Payout',
  });

  @override
  State<Page05VerifyConsentScreen> createState() =>
      _Page05VerifyConsentScreenState();
}

class _Page05VerifyConsentScreenState
    extends State<Page05VerifyConsentScreen> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onDigitEntered(int index, String value) {
    if (value.isNotEmpty) {
      if (value.length > 1) {
        _controllers[index].text = value.characters.last;
        _controllers[index].selection = TextSelection.fromPosition(
          TextPosition(offset: _controllers[index].text.length),
        );
      }
      if (index < 5) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    } else {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }
    setState(() {});
  }

  bool _isOtpComplete() {
    return _controllers.every((c) => c.text.trim().isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    bool isComplete = _isOtpComplete();

    return Scaffold(
      backgroundColor: const Color(0xFF1B0D05),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B0D05),
        elevation: 0,
        title: const Text(
          'Verify Your Consent',
          style: TextStyle(
            color: Color(0xFFFAF7F3),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'serif',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Color(0xFFE5B864), size: 20),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeaderBanner(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFAF7F2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildAgreementSummaryCard(),
                        const SizedBox(height: 16),
                        _buildOtpVerificationCard(),
                        const SizedBox(height: 16),
                        _buildWhatHappensNextCard(),
                        const SizedBox(height: 22),
                        _buildActionButton(isComplete),
                        const SizedBox(height: 12),
                        _buildBackToAgreementButton(),
                        const SizedBox(height: 16),
                        const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.lock_outline_rounded, color: Color(0xFF5C4033), size: 14),
                              SizedBox(width: 6),
                              Text(
                                'Never share your verification code with anyone.',
                                style: TextStyle(color: Color(0xFF5C4033), fontSize: 11.5, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderBanner() {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1B0D05),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'AGREEMENT  •  VERIFICATION',
            style: TextStyle(
              color: Color(0xFFE5B864),
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Verify Your Consent',
            style: TextStyle(
              color: Color(0xFFFAF7F3),
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Confirm the agreement using the code sent to your registered mobile.',
            style: TextStyle(
              color: Color(0xFFE5D5BC),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgreementSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5B864), width: 1.2),
        boxShadow: const [
          BoxShadow(color: Color(0x11000000), blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.description_outlined, color: Color(0xFFC8801C), size: 18),
                  SizedBox(width: 6),
                  Text(
                    'Agreement: SG0021 • Revision 01',
                    style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13.5, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(50, 20)),
                onPressed: () {},
                child: const Text('Review Agreement >', style: TextStyle(color: Color(0xFFC8801C), fontSize: 11.5, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xFFE5D5BC), height: 1),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Chandan Soni', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 12.5, fontWeight: FontWeight.bold)),
                  Text('Customer ID: CUST0021', style: TextStyle(color: Color(0xFF5C4033), fontSize: 11, fontWeight: FontWeight.w500)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Principal: 1,000.000 g', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 12.5, fontWeight: FontWeight.bold)),
                  Text('Tenure: 18 months', style: TextStyle(color: Color(0xFF5C4033), fontSize: 11, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOtpVerificationCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5B864), width: 1.2),
        boxShadow: const [
          BoxShadow(color: Color(0x11000000), blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.phone_android_rounded, color: Color(0xFFC8801C), size: 20),
              SizedBox(width: 8),
              Text(
                'Enter verification code',
                style: TextStyle(
                  color: Color(0xFF1B0D05),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'serif',
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text('Code sent to +91 ****** 7284', style: TextStyle(color: Color(0xFF5C4033), fontSize: 12.5, fontWeight: FontWeight.w500)),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              6,
              (index) => SizedBox(
                width: 46,
                height: 56,
                child: TextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B0D05),
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFD4C2A8), width: 1.2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFD4C2A8), width: 1.2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFC8801C), width: 2.2),
                    ),
                  ),
                  onTap: () {
                    if (_controllers[index].text.isNotEmpty) {
                      _controllers[index].selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: _controllers[index].text.length,
                      );
                    }
                  },
                  onChanged: (val) => _onDigitEntered(index, val),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Resend code in ', style: TextStyle(color: Color(0xFF5C4033), fontSize: 12.5, fontWeight: FontWeight.w500)),
              const Text(
                '00:30',
                style: TextStyle(color: Color(0xFFC8801C), fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Center(
            child: TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('OTP code resent successfully!')),
                );
              },
              child: const Text(
                'Need to update your mobile? Contact Support >',
                style: TextStyle(color: Color(0xFFC8801C), fontSize: 12.5, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF7E7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE5B864), width: 1),
            ),
            child: Row(
              children: const [
                Icon(Icons.info_outline_rounded, color: Color(0xFFC8801C), size: 18),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'This code confirms your consent to SG0021 Revision 01.',
                    style: TextStyle(color: Color(0xFF5C4033), fontSize: 11.5, fontWeight: FontWeight.w500, height: 1.3),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhatHappensNextCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5B864), width: 1.2),
        boxShadow: const [
          BoxShadow(color: Color(0x11000000), blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'What happens next?',
            style: TextStyle(
              color: Color(0xFF1B0D05),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),
          const SizedBox(height: 12),
          _buildStepItem(1, 'Verify code', 'Enter the 6-digit code sent to your registered mobile.'),
          const Divider(height: 16, color: Color(0xFFE5D5BC)),
          _buildStepItem(2, 'Submit consent', 'Your consent for SG0021 Revision 01 will be recorded.'),
          const Divider(height: 16, color: Color(0xFFE5D5BC)),
          _buildStepItem(3, 'Await company approval', 'Your programme becomes active only after company approval.'),
        ],
      ),
    );
  }

  Widget _buildStepItem(int num, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            color: const Color(0xFFF3E4CD),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFC8801C)),
          ),
          child: Center(
            child: Text(
              num.toString(),
              style: const TextStyle(
                color: Color(0xFFC8801C),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 13.5, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text(subtitle, style: const TextStyle(color: Color(0xFF5C4033), fontSize: 11.5, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(bool isComplete) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isComplete ? const Color(0xFF1B0D05) : const Color(0xFFB0A090),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: isComplete ? 4 : 0,
        ),
        onPressed: isComplete
            ? () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Page06ConsentSubmittedScreen(),
                  ),
                );
              }
            : () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter all 6 digits of the verification code.')),
                );
              },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Verify & Submit',
              style: TextStyle(
                color: Color(0xFFE5B864),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward_rounded, color: Color(0xFFE5B864), size: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildBackToAgreementButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFFC8801C), width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        onPressed: () => Navigator.of(context).maybePop(),
        child: const Text(
          'Back to agreement',
          style: TextStyle(
            color: Color(0xFF1B0D05),
            fontSize: 14.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
