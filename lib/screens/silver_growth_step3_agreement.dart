import 'package:flutter/material.dart';
import 'silver_growth_status_screen.dart';

class SilverGrowthStep3AgreementScreen extends StatefulWidget {
  final int tenureMonths;
  final String benefitType;

  const SilverGrowthStep3AgreementScreen({
    super.key,
    required this.tenureMonths,
    required this.benefitType,
  });

  @override
  State<SilverGrowthStep3AgreementScreen> createState() =>
      _SilverGrowthStep3AgreementScreenState();
}

class _SilverGrowthStep3AgreementScreenState
    extends State<SilverGrowthStep3AgreementScreen> {
  bool _consent1 = true;
  bool _consent2 = true;
  bool _consent3 = true;
  bool _consent4 = true;

  bool get _allConsentChecked =>
      _consent1 && _consent2 && _consent3 && _consent4;

  void _submitConsent() {
    if (!_allConsentChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please check all consent boxes to continue.'),
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // 1. Header Stepper
              _buildHeaderStepper(),

              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 2. Agreement Top Reference Card
                    _buildAgreementHeaderCard(),

                    const SizedBox(height: 14),

                    // 3. Plan Summary Card
                    _buildPlanSummaryCard(),

                    const SizedBox(height: 16),

                    // 4. Illustrative Schedule Card
                    _buildIllustrativeScheduleCard(),

                    const SizedBox(height: 16),

                    // 5. Key Terms Section
                    _buildKeyTermsSection(),

                    const SizedBox(height: 18),

                    // 6. Programme Agreement Document Box
                    _buildProgrammeAgreementDocCard(),

                    const SizedBox(height: 18),

                    // 7. Your Consent Checkboxes
                    _buildYourConsentSection(),

                    const SizedBox(height: 20),

                    // 8. Action Button & Disclaimer Footer
                    _buildSubmitActionSection(),

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
            'SILVER GROWTH • STEP 3 OF 3',
            style: TextStyle(
              color: Color(0xFFE5B864),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Review Your Agreement',
            style: TextStyle(
              color: Color(0xFFFAF7F3),
              fontSize: 28,
              fontWeight: FontWeight.w900,
              fontFamily: 'serif',
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Read your terms and confirm your consent.',
            style: TextStyle(
              color: Color(0xFFD4C2A8),
              fontSize: 12.5,
            ),
          ),
          const SizedBox(height: 20),

          // Stepper Circles Row
          Row(
            children: [
              _buildStepItem(1, 'Acceptance', isActive: false, isDone: true),
              _buildStepConnector(isDone: true),
              _buildStepItem(2, 'Plan & Benefit', isActive: false, isDone: true),
              _buildStepConnector(isDone: true),
              _buildStepItem(3, 'Agreement', isActive: true, isDone: false),
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

  // --- 2. Agreement Header Card ---
  Widget _buildAgreementHeaderCard() {
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
                    'Agreement: SG0021 • Revision 01',
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
          const SizedBox(height: 10),
          const Divider(color: Color(0xFFEFE0C9), height: 1),
          const SizedBox(height: 10),

          Row(
            children: [
              _buildAgreementDetailItem(
                icon: Icons.person_outline,
                title: 'Chandan Soni',
                subtitle: 'Customer ID: CUST0021',
              ),
              _buildAgreementDetailItem(
                icon: Icons.business_rounded,
                title: 'SONASUTRA JEWELLERY PRIVATE LIMITED',
                subtitle: 'Issuer',
              ),
              _buildAgreementDetailItem(
                icon: Icons.link_rounded,
                title: 'Linked to Acceptance:',
                subtitle: 'SR0021 • Revision 01',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAgreementDetailItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFC8801C), size: 16),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF1E1007),
                    fontSize: 10.5,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF1A73E8),
                    fontSize: 9.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- 3. Plan Summary Card ---
  Widget _buildPlanSummaryCard() {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text(
                    'Plan Summary',
                    style: TextStyle(
                      color: Color(0xFF2B1407),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'serif',
                    ),
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                      width: 80,
                      child: Divider(color: Color(0xFFE5B864), thickness: 2)),
                ],
              ),
              const Text(
                'View / Edit Selection >',
                style: TextStyle(
                  color: Color(0xFF1A73E8),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              // 3D Silver Bar Image
              Container(
                width: 100,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFEFE6D8), width: 1),
                ),
                padding: const EdgeInsets.all(6),
                child: CustomPaint(
                  painter: AgreementSilverBarPainter(),
                ),
              ),

              const SizedBox(width: 14),

              // Summary Lines
              Expanded(
                child: Column(
                  children: [
                    _buildSummaryRow('Principal', '1,000.000 g', isBold: true),
                    _buildSummaryRow('Sample basis', '999-equivalent grams'),
                    _buildSummaryRow('Purity', '999'),
                    _buildSummaryRow('Tenure', '${widget.tenureMonths} months'),
                    _buildSummaryRow('Benefit', widget.benefitType),
                    _buildSummaryRow('Monthly benefit', '10.000 g',
                        isBold: true),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
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
              fontSize: 11.5,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // --- 4. Illustrative Schedule Card ---
  Widget _buildIllustrativeScheduleCard() {
    return Container(
      padding: const EdgeInsets.all(12),
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
                'Illustrative schedule',
                style: TextStyle(
                  color: Color(0xFF2B1407),
                  fontSize: 17,
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

          const SizedBox(height: 12),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3DB),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.calendar_month_rounded,
                    color: Color(0xFFC8801C), size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildScheduleDateCol('Start date', '21 Oct 2026'),
                    _buildScheduleDateCol(
                        'First monthly benefit date', '21 Nov 2026'),
                    _buildScheduleDateCol('Maturity date', '21 Apr 2028'),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3DB),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Icon(Icons.info_outline_rounded,
                    color: Color(0xFFC8801C), size: 15),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'These dates are illustrative and must match your signed agreement.',
                    style: TextStyle(
                      color: Color(0xFF786253),
                      fontSize: 10,
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

  Widget _buildScheduleDateCol(String label, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF786253),
            fontSize: 9.5,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          date,
          style: const TextStyle(
            color: Color(0xFF1E1007),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // --- 5. Key Terms Section ---
  Widget _buildKeyTermsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Key Terms',
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

        const SizedBox(height: 10),

        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFBF2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
          ),
          child: Column(
            children: [
              _buildKeyTermRow(1,
                  'Principal is locked until maturity; mandatory legal rights remain protected.'),
              _buildKeyTermRow(2,
                  'Monthly benefit is paid separately and does not compound automatically.'),
              _buildKeyTermRow(3,
                  'Monthly dues and maturity may be taken as silver or bank amount; bank quotes require confirmation.'),
              _buildKeyTermRow(4,
                  'Company may use the silver in its business; equivalent silver is due, not necessarily the same bars.'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildKeyTermRow(int number, String term) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFC8801C),
            ),
            child: Center(
              child: Text(
                '$number',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              term,
              style: const TextStyle(
                color: Color(0xFF2B1407),
                fontSize: 11,
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- 6. Programme Agreement Document Box ---
  Widget _buildProgrammeAgreementDocCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Programme Agreement',
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

        const SizedBox(height: 10),

        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFBF2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // PDF Icon
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEE2E2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'PDF',
                      style: TextStyle(
                        color: Color(0xFFDC2626),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Agreement Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Full Programme Agreement',
                          style: TextStyle(
                            color: Color(0xFF1E1007),
                            fontSize: 13.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'SG0021 • Revision 01',
                          style: TextStyle(
                            color: Color(0xFF786253),
                            fontSize: 10.5,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Read the complete terms, including delivery terms and disclosed charges.',
                          style: TextStyle(
                            color: Color(0xFF786253),
                            fontSize: 10,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Action Buttons Right
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3B1E0F),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.remove_red_eye_outlined,
                                color: Color(0xFFE5B864), size: 14),
                            SizedBox(width: 4),
                            Text(
                              'Read Full Agreement',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3DB),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color: const Color(0xFFE5C07B), width: 1),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.file_download_outlined,
                                color: Color(0xFFC8801C), size: 14),
                            SizedBox(width: 4),
                            Text(
                              'Download PDF',
                              style: TextStyle(
                                color: Color(0xFF8C5B21),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'View delivery terms & disclosed charges >',
                  style: TextStyle(
                    color: Color(0xFF1A73E8),
                    fontSize: 10.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- 7. Your Consent Checkboxes ---
  Widget _buildYourConsentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Your Consent',
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

        const SizedBox(height: 10),

        _buildConsentCheckbox(
          value: _consent1,
          label: 'I have read the full agreement and disclosed charges.',
          onChanged: (val) => setState(() => _consent1 = val!),
        ),
        _buildConsentCheckbox(
          value: _consent2,
          label:
              'I confirm the principal, tenure and Monthly Payout option.',
          onChanged: (val) => setState(() => _consent2 = val!),
        ),
        _buildConsentCheckbox(
          value: _consent3,
          label: 'I understand the lock-in and silver utilisation terms.',
          onChanged: (val) => setState(() => _consent3 = val!),
        ),
        _buildConsentCheckbox(
          value: _consent4,
          label: 'I consent to the terms in Agreement SG0021 Revision 01.',
          onChanged: (val) => setState(() => _consent4 = val!),
        ),

        const SizedBox(height: 6),
        Row(
          children: const [
            Icon(Icons.info_outline_rounded,
                color: Color(0xFFC8801C), size: 14),
            SizedBox(width: 6),
            Text(
              'Changes to material terms require your fresh consent.',
              style: TextStyle(
                color: Color(0xFF786253),
                fontSize: 10.5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildConsentCheckbox({
    required bool value,
    required String label,
    required ValueChanged<bool?> onChanged,
  }) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          children: [
            Icon(
              value
                  ? Icons.check_box_rounded
                  : Icons.check_box_outline_blank_rounded,
              color: const Color(0xFFC8801C),
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF2B1407),
                  fontSize: 11.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 8. Submit Action Section ---
  Widget _buildSubmitActionSection() {
    return Column(
      children: [
        InkWell(
          onTap: _submitConsent,
          borderRadius: BorderRadius.circular(24),
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              gradient: _allConsentChecked
                  ? const LinearGradient(
                      colors: [Color(0xFF3B1E0F), Color(0xFF220D04)],
                    )
                  : const LinearGradient(
                      colors: [Color(0xFF94A3B8), Color(0xFF64748B)],
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
                  'Verify & Submit Consent',
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
          'Select the confirmations to continue.',
          style: TextStyle(
            color: Color(0xFF8C715E),
            fontSize: 11,
          ),
        ),

        const SizedBox(height: 12),

        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3DB),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Icon(Icons.info_outline_rounded,
                  color: Color(0xFFC8801C), size: 16),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Submission goes for company approval. Your programme is not active yet.',
                  style: TextStyle(
                    color: Color(0xFF786253),
                    fontSize: 10.5,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'Need clarification?',
                    style: TextStyle(
                      color: Color(0xFF786253),
                      fontSize: 9.5,
                    ),
                  ),
                  Text(
                    'Contact Support >',
                    style: TextStyle(
                      color: Color(0xFF1A73E8),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// --- Custom Painter for Agreement Silver Bar ---
class AgreementSilverBarPainter extends CustomPainter {
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
          fontSize: 8.5,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.8,
          height: 1.1,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(w * 0.3, h * 0.42));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
