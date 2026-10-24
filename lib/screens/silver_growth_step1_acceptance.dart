import 'package:flutter/material.dart';
import 'silver_growth_step2_plan.dart';

class SilverGrowthStep1AcceptanceScreen extends StatefulWidget {
  final int selectedTenureMonths;

  const SilverGrowthStep1AcceptanceScreen({
    super.key,
    required this.selectedTenureMonths,
  });

  @override
  State<SilverGrowthStep1AcceptanceScreen> createState() =>
      _SilverGrowthStep1AcceptanceScreenState();
}

class _SilverGrowthStep1AcceptanceScreenState
    extends State<SilverGrowthStep1AcceptanceScreen> {
  bool _isReviewedChecked = true;

  void _proceedToStep2() {
    if (!_isReviewedChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please check the box confirming you reviewed details.'),
        ),
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SilverGrowthStep2PlanScreen(
          selectedTenureMonths: widget.selectedTenureMonths,
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // 1. Header Stepper Banner
              _buildHeaderStepper(),

              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 2. Verification Status Card
                    _buildVerificationStatusCard(),

                    const SizedBox(height: 12),

                    // 3. Acceptance Record Card
                    _buildAcceptanceRecordCard(),

                    const SizedBox(height: 16),

                    // 4. Verified Silver Details Card
                    _buildVerifiedSilverDetailsCard(),

                    const SizedBox(height: 16),

                    // 5. Proposed Programme Principal Card
                    _buildProposedPrincipalCard(),

                    const SizedBox(height: 16),

                    // 6. References & Reports List
                    _buildReferencesCard(),

                    const SizedBox(height: 18),

                    // 7. Checklist Section
                    _buildChecklistSection(),

                    const SizedBox(height: 20),

                    // 8. Info Note & Action Button
                    _buildBottomActionSection(),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- 1. Header Stepper ---
  Widget _buildHeaderStepper() {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1B0D05),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SILVER GROWTH • STEP 1 OF 3',
            style: TextStyle(
              color: Color(0xFFE5B864),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Review Your Silver',
            style: TextStyle(
              color: Color(0xFFFAF7F3),
              fontSize: 28,
              fontWeight: FontWeight.w900,
              fontFamily: 'serif',
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Check the verified details before continuing.',
            style: TextStyle(
              color: Color(0xFFD4C2A8),
              fontSize: 12.5,
            ),
          ),
          const SizedBox(height: 20),

          // Stepper Circles Row
          Row(
            children: [
              _buildStepItem(1, 'Acceptance', isActive: true, isDone: false),
              _buildStepConnector(isDone: false),
              _buildStepItem(2, 'Plan & Benefit', isActive: false, isDone: false),
              _buildStepConnector(isDone: false),
              _buildStepItem(3, 'Agreement', isActive: false, isDone: false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(int stepNum, String label,
      {required bool isActive, required bool isDone}) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive || isDone
                ? const Color(0xFFE5B864)
                : Colors.transparent,
            border: Border.all(
              color: const Color(0xFFE5B864),
              width: 1.5,
            ),
          ),
          child: Center(
            child: isDone
                ? const Icon(Icons.check, color: Color(0xFF1B0D05), size: 16)
                : Text(
                    '$stepNum',
                    style: TextStyle(
                      color: isActive ? const Color(0xFF1B0D05) : Colors.white,
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
            color: isActive ? const Color(0xFFE5B864) : const Color(0xFFA08260),
            fontSize: 10,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildStepConnector({required bool isDone}) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(bottom: 16),
        color: isDone ? const Color(0xFFE5B864) : const Color(0xFF5A4435),
      ),
    );
  }

  // --- 2. Verification Status Card ---
  Widget _buildVerificationStatusCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
      ),
      child: Row(
        children: [
          // Left Complete Badge
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF1E8E3E),
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6F4EA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'VERIFICATION COMPLETE',
                          style: TextStyle(
                            color: Color(0xFF137333),
                            fontSize: 9.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Only technical verification is complete.',
                        style: TextStyle(
                          color: Color(0xFF1A73E8),
                          fontSize: 10.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Right Awaiting Badge
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF3DB),
                ),
                child: const Icon(Icons.access_time_rounded,
                    color: Color(0xFFC8801C), size: 16),
              ),
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Awaiting your\nconfirmation',
                    style: TextStyle(
                      color: Color(0xFF1E1007),
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  Text(
                    'Your programme\nis not active yet.',
                    style: TextStyle(
                      color: Color(0xFF786253),
                      fontSize: 9.5,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- 3. Acceptance Record Card ---
  Widget _buildAcceptanceRecordCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.assignment_outlined,
                      color: Color(0xFFC8801C), size: 18),
                  SizedBox(width: 6),
                  Text(
                    'Acceptance: SR0021 • Revision 01',
                    style: TextStyle(
                      color: Color(0xFF1E1007),
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3DB),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'Sample data',
                  style: TextStyle(
                    color: Color(0xFF8C5B21),
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xFFEFE0C9), height: 1),
          const SizedBox(height: 10),

          Row(
            children: [
              _buildRecordDetailItem(
                icon: Icons.person_outline,
                title: 'Chandan Soni',
                subtitle: 'Customer ID: CUST0021',
              ),
              _buildRecordDetailItem(
                icon: Icons.storefront_rounded,
                title: 'Bhadohi Showroom',
                subtitle: 'Branch',
              ),
              _buildRecordDetailItem(
                icon: Icons.calendar_month_rounded,
                title: '21 Oct 2026',
                subtitle: '6:30 PM Recorded',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecordDetailItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFC8801C), size: 18),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF1E1007),
                    fontSize: 11.5,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF786253),
                    fontSize: 9.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- 4. Verified Silver Details Card ---
  Widget _buildVerifiedSilverDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                'Verified Silver Details',
                style: TextStyle(
                  color: Color(0xFF2B1407),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'serif',
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Divider(color: Color(0xFFE5B864), thickness: 2),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 3D Silver Bar Image / Painter
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFEFE6D8), width: 1),
                ),
                padding: const EdgeInsets.all(8),
                child: CustomPaint(
                  painter: StepSilverBarPainter(),
                ),
              ),

              const SizedBox(width: 14),

              // Details Table
              Expanded(
                child: Column(
                  children: [
                    _buildDetailRow('Silver form', '1 silver bar'),
                    _buildDetailRow('Net silver weight', '1,000.000 g',
                        isBold: true),
                    _buildDetailRow(
                        'Verified purity', '999 / 1000 • 99.9%'),
                    _buildDetailRow('Fine silver content', '999.000 g',
                        isBold: true),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Bottom Sample basis note
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3DB),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Icon(Icons.info_outline_rounded,
                    color: Color(0xFFC8801C), size: 16),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Sample basis: 999-equivalent grams\nIllustration uses 999-equivalent grams.',
                    style: TextStyle(
                      color: Color(0xFF786253),
                      fontSize: 10,
                      height: 1.2,
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

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF786253),
              fontSize: 11,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: const Color(0xFF1E1007),
              fontSize: 12,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // --- 5. Proposed Programme Principal Card ---
  Widget _buildProposedPrincipalCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF3B1E0F),
            ),
            child: const Icon(Icons.scale_rounded,
                color: Color(0xFFE5B864), size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Row(
                  children: [
                    Text(
                      'Proposed Programme Principal',
                      style: TextStyle(
                        color: Color(0xFF1E1007),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                        child: Divider(color: Color(0xFFE5B864), thickness: 1)),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  '1,000.000 g',
                  style: TextStyle(
                    color: Color(0xFF1E1007),
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'serif',
                  ),
                ),
                Text(
                  '999-equivalent silver',
                  style: TextStyle(
                    color: Color(0xFF786253),
                    fontSize: 10.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 1,
            height: 50,
            color: const Color(0xFFEFE0C9),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 80,
            child: Row(
              children: const [
                Icon(Icons.info_outline_rounded,
                    color: Color(0xFFC8801C), size: 16),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'Calculation basis must match your final agreement.',
                    style: TextStyle(
                      color: Color(0xFF786253),
                      fontSize: 9,
                      height: 1.2,
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

  // --- 6. References & Reports Card ---
  Widget _buildReferencesCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Bar / Lot reference',
                  style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
              Text('SIL0021',
                  style: TextStyle(
                      color: Color(0xFF1E1007),
                      fontSize: 11.5,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Test reference',
                  style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
              Text('TEST0021',
                  style: TextStyle(
                      color: Color(0xFF1E1007),
                      fontSize: 11.5,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xFFEFE0C9), height: 1),
          const SizedBox(height: 8),

          _buildLinkRow('View weighing & purity report'),
          const SizedBox(height: 6),
          _buildLinkRow('View acceptance receipt'),
        ],
      ),
    );
  }

  Widget _buildLinkRow(String title) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3DB),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(Icons.article_outlined,
              color: Color(0xFFC8801C), size: 16),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF1E1007),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Icon(Icons.chevron_right_rounded,
            color: Color(0xFFC8801C), size: 18),
      ],
    );
  }

  // --- 7. Checklist Section ---
  Widget _buildChecklistSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Please check',
              style: TextStyle(
                color: Color(0xFF2B1407),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'serif',
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Divider(color: Color(0xFFE5B864), thickness: 2),
            ),
          ],
        ),

        const SizedBox(height: 10),

        _buildCheckItem('Your silver quantity and purity are correct.'),
        _buildCheckItem('The principal shown matches your acceptance record.'),

        const SizedBox(height: 8),

        // Interactive Checkbox
        GestureDetector(
          onTap: () {
            setState(() {
              _isReviewedChecked = !_isReviewedChecked;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFBF2),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
            ),
            child: Row(
              children: [
                Icon(
                  _isReviewedChecked
                      ? Icons.check_box_rounded
                      : Icons.check_box_outline_blank_rounded,
                  color: const Color(0xFFC8801C),
                  size: 22,
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'I have reviewed the silver details.',
                    style: TextStyle(
                      color: Color(0xFF1E1007),
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Warning Alert
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3DB),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFFBD38D), width: 1),
          ),
          child: Row(
            children: const [
              Icon(Icons.warning_amber_rounded,
                  color: Color(0xFFC8801C), size: 18),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Details do not match? Raise an issue',
                  style: TextStyle(
                    color: Color(0xFF786253),
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(Icons.chevron_right_rounded,
                  color: Color(0xFFC8801C), size: 18),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCheckItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFC8801C),
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 10),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF2B1407),
                fontSize: 11.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- 8. Bottom Action Section ---
  Widget _buildBottomActionSection() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFBF2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: const [
              Icon(Icons.info_outline_rounded,
                  color: Color(0xFFC8801C), size: 16),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Your programme is not active yet.\nChoose your plan and sign the agreement next; activation follows approval.',
                  style: TextStyle(
                    color: Color(0xFF786253),
                    fontSize: 10.5,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        InkWell(
          onTap: _proceedToStep2,
          borderRadius: BorderRadius.circular(24),
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3B1E0F), Color(0xFF220D04)],
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Confirm & Choose Plan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_rounded,
                    color: Color(0xFFE5B864), size: 18),
              ],
            ),
          ),
        ),

        const SizedBox(height: 6),
        const Text(
          'Only continue if these details are correct.',
          style: TextStyle(
            color: Color(0xFF8C715E),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

// --- Custom Painter for Step Silver Bar ---
class StepSilverBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final shader = const LinearGradient(
      colors: [
        Color(0xFFFFFFFF),
        Color(0xFFE2E8F0),
        Color(0xFFCBD5E1),
        Color(0xFF64748B),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, w, h));

    final path = Path();
    path.moveTo(w * 0.15, h * 0.15);
    path.lineTo(w * 0.85, h * 0.15);
    path.lineTo(w * 0.75, h * 0.9);
    path.lineTo(w * 0.05, h * 0.9);
    path.close();

    final paint = Paint()..shader = shader;
    canvas.drawPath(path, paint);

    final line = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawPath(path, line);

    final textPainter = TextPainter(
      text: const TextSpan(
        text: '999\nSILVER',
        style: TextStyle(
          color: Color(0xFF334155),
          fontSize: 9,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.8,
          height: 1.1,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(w * 0.35, h * 0.42));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
