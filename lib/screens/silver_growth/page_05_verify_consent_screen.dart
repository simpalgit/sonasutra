import 'package:flutter/material.dart';
import '../../widgets/luxury_illustrations.dart';
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

  bool get isOtpComplete =>
      _controllers.every((c) => c.text.trim().isNotEmpty);

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B0D05),
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
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Help: Enter the 6-digit code sent to your registered mobile.')),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Top Luxury Banner
            const LuxuryHeroBannerHeader(
              stepTag: 'AGREEMENT • VERIFICATION',
              title: 'Verify Your Consent',
              subtitle: 'Confirm the agreement using the code sent to your registered mobile.',
            ),
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
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Progress Stepper
                      _buildStepper(),
                      const SizedBox(height: 16),

                      // Agreement Preview Card
                      _buildAgreementPreviewCard(),
                      const SizedBox(height: 16),

                      // Enter Verification Code Card
                      _buildOtpCard(),
                      const SizedBox(height: 16),

                      // What Happens Next Card
                      _buildWhatHappensNextCard(),
                      const SizedBox(height: 20),

                      // Verify & Submit Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isOtpComplete ? const Color(0xFF1B0D05) : const Color(0xFFB0A090),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: isOtpComplete
                              ? () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const Page06ConsentSubmittedScreen(),
                                    ),
                                  );
                                }
                              : null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Verify & Submit',
                                style: TextStyle(
                                  color: Color(0xFFE5B864),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(Icons.arrow_forward_rounded, color: Color(0xFFE5B864), size: 18),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Center(
                        child: Text(
                          'Enter all 6 digits to continue.',
                          style: TextStyle(color: Color(0xFF9E8B78), fontSize: 11),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Back to Agreement Button
                      SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFC8801C)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.lock_rounded, size: 12, color: Color(0xFF786253)),
                          SizedBox(width: 6),
                          Text(
                            'Never share your verification code with anyone.',
                            style: TextStyle(color: Color(0xFF786253), fontSize: 11),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStepItem(1, 'Acceptance', isDone: true),
          Container(width: 20, height: 1.5, color: const Color(0xFF2E7D32)),
          _buildStepItem(2, 'Agreement', isDone: true),
          Container(width: 20, height: 1.5, color: const Color(0xFFC8801C)),
          _buildStepItem(3, 'Verification', isCurrent: true),
        ],
      ),
    );
  }

  Widget _buildStepItem(int num, String label, {bool isDone = false, bool isCurrent = false}) {
    return Row(
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: isDone ? const Color(0xFF2E7D32) : (isCurrent ? const Color(0xFFC8801C) : Colors.transparent),
            shape: BoxShape.circle,
            border: Border.all(color: isDone ? const Color(0xFF2E7D32) : const Color(0xFFC8801C)),
          ),
          child: Center(
            child: isDone
                ? const Icon(Icons.check, size: 12, color: Colors.white)
                : Text(num.toString(), style: TextStyle(color: isCurrent ? Colors.white : const Color(0xFFC8801C), fontSize: 11, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: isDone || isCurrent ? const Color(0xFF1B0D05) : const Color(0xFF786253),
            fontSize: 11.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildAgreementPreviewCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.description_outlined, color: Color(0xFFC8801C), size: 18),
                  SizedBox(width: 6),
                  Text('Agreement: SG0021 • Revision 01', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 12.5, fontWeight: FontWeight.bold)),
                ],
              ),
              const Text('Review Agreement >', style: TextStyle(color: Color(0xFFC8801C), fontSize: 11, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xFFE8DCB9), height: 1),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Chandan Soni', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 11.5, fontWeight: FontWeight.bold)),
                  Text('Customer ID: CUST0021', style: TextStyle(color: Color(0xFF786253), fontSize: 9.5)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('Principal: 1,000.000 g', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 11, fontWeight: FontWeight.bold)),
                  Text('Tenure: 18 months', style: TextStyle(color: Color(0xFF786253), fontSize: 9.5)),
                  Text('Benefit: Monthly Payout', style: TextStyle(color: Color(0xFF786253), fontSize: 9.5)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOtpCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const PhoneOtpIllustration(),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Enter verification code', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'serif')),
                    SizedBox(height: 2),
                    Text('Code sent to +91 ••••••• 7284', style: TextStyle(color: Color(0xFF786253), fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(6, (index) => _buildOtpBox(index)),
          ),
          const SizedBox(height: 14),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Resend code in ', style: TextStyle(color: Color(0xFF786253), fontSize: 12)),
                Text('00:30', style: TextStyle(color: Color(0xFFC8801C), fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text('Need to update your mobile? Contact Support >', style: TextStyle(color: Color(0xFFC8801C), fontSize: 11, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF7E7),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE5B864), width: 0.5),
            ),
            child: Row(
              children: const [
                Icon(Icons.info_outline_rounded, color: Color(0xFFC8801C), size: 16),
                SizedBox(width: 8),
                Expanded(
                  child: Text('This code confirms your consent to SG0021 Revision 01.', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpBox(int index) {
    return Container(
      width: 42,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: _focusNodes[index].hasFocus || _controllers[index].text.isNotEmpty ? const Color(0xFFC8801C) : const Color(0xFFE0D5C5),
          width: 1.5,
        ),
      ),
      child: Center(
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 18, fontWeight: FontWeight.bold),
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
          onChanged: (val) {
            setState(() {});
            if (val.isNotEmpty && index < 5) {
              _focusNodes[index + 1].requestFocus();
            } else if (val.isEmpty && index > 0) {
              _focusNodes[index - 1].requestFocus();
            }
          },
        ),
      ),
    );
  }

  Widget _buildWhatHappensNextCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('What happens next?', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'serif')),
          const SizedBox(height: 12),
          _buildTimelineStep(1, 'Verify code', 'Enter the 6-digit code sent to your registered mobile.', isCurrent: true, hasLine: true),
          _buildTimelineStep(2, 'Submit consent', 'Your consent for SG0021 Revision 01 will be recorded.', hasLine: true),
          _buildTimelineStep(3, 'Await company approval', 'Your programme becomes active only after company approval.', hasLine: false),
        ],
      ),
    );
  }

  Widget _buildTimelineStep(int num, String title, String subtitle, {bool isCurrent = false, required bool hasLine}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: isCurrent ? const Color(0xFFC8801C) : const Color(0xFFE0D5C5),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(num.toString(), style: TextStyle(color: isCurrent ? Colors.white : const Color(0xFF786253), fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ),
            if (hasLine) Container(width: 2, height: 28, color: const Color(0xFFDCD0C0)),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text(subtitle, style: const TextStyle(color: Color(0xFF786253), fontSize: 11)),
              if (hasLine) const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
