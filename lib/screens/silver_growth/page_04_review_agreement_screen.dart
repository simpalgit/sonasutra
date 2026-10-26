import 'package:flutter/material.dart';
import 'page_05_verify_consent_screen.dart';
import 'pdf_viewer_screen.dart';

class Page04ReviewAgreementScreen extends StatefulWidget {
  final int tenureMonths;
  final String benefitOption;

  const Page04ReviewAgreementScreen({
    super.key,
    this.tenureMonths = 18,
    this.benefitOption = 'Monthly Payout',
  });

  @override
  State<Page04ReviewAgreementScreen> createState() =>
      _Page04ReviewAgreementScreenState();
}

class _Page04ReviewAgreementScreenState
    extends State<Page04ReviewAgreementScreen> {
  final List<bool> consents = [false, false, false, false];

  bool get allConsented => consents.every((e) => e);

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
        title: const Text(
          'Review Your Agreement',
          style: TextStyle(
            color: Color(0xFFFAF7F3),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'serif',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline_rounded,
                color: Color(0xFFE5B864), size: 22),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Help: Review terms and confirm consent')),
              );
            },
          ),
        ],
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
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Progress Stepper
                      _buildStepper(),
                      const SizedBox(height: 16),

                      // Agreement Meta Card
                      _buildAgreementMetaCard(),
                      const SizedBox(height: 16),

                      // Plan Summary Card
                      _buildPlanSummaryCard(),
                      const SizedBox(height: 16),

                      // Illustrative Schedule
                      _buildScheduleCard(),
                      const SizedBox(height: 16),

                      // Key Terms
                      _buildKeyTermsCard(),
                      const SizedBox(height: 16),

                      // Programme Agreement PDF Card
                      _buildAgreementPdfCard(context),
                      const SizedBox(height: 16),

                      // Your Consent Checkboxes
                      _buildConsentSection(),
                      const SizedBox(height: 20),

                      // Submit Button
                      _buildSubmitButton(),
                      const SizedBox(height: 12),

                      // Footer Notice
                      _buildFooterNotice(),
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

  Widget _buildHeaderBanner() {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1B0D05),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'SILVER GROWTH  •  STEP 3 OF 3',
            style: TextStyle(
              color: Color(0xFFE5B864),
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Review Your Agreement',
            style: TextStyle(
              color: Color(0xFFFAF7F3),
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Read your terms and confirm your consent.',
            style: TextStyle(
              color: Color(0xFFD4C2A8),
              fontSize: 13,
            ),
          ),
        ],
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
          _buildStepItem(2, 'Plan & Benefit', isDone: true),
          Container(width: 20, height: 1.5, color: const Color(0xFFC8801C)),
          _buildStepItem(3, 'Agreement', isCurrent: true),
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

  Widget _buildAgreementMetaCard() {
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
                  Text(
                    'Agreement: SG0021 • Revision 01',
                    style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3E4CD),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text('SAMPLE PREVIEW', style: TextStyle(color: Color(0xFF786253), fontSize: 9.5, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xFFE8DCB9), height: 1),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Chandan Soni', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 12, fontWeight: FontWeight.bold)),
                  Text('Customer ID: CUST0021', style: TextStyle(color: Color(0xFF786253), fontSize: 10)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SONASUTRA JEWELLERY PRIVATE LIMITED', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 10, fontWeight: FontWeight.bold)),
                  Text('Issuer', style: TextStyle(color: Color(0xFF786253), fontSize: 10)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlanSummaryCard() {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Plan Summary',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'serif',
                  color: Color(0xFF1B0D05),
                ),
              ),
              Text('View / Edit Selection >', style: TextStyle(color: Color(0xFFC8801C), fontSize: 11, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          _buildRow('Principal', '1,000.000 g'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Sample basis', '999-equivalent grams'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Purity', '999'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Tenure', '${widget.tenureMonths} months'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Benefit', widget.benefitOption),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Monthly benefit', '10.000 g'),
        ],
      ),
    );
  }

  Widget _buildScheduleCard() {
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
          const Text(
            'Illustrative schedule',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Start date', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
                  Text('21 Oct 2026', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('First monthly benefit date', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
                  Text('21 Nov 2026', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Maturity date', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
                  Text('21 Apr 2028', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.info_outline_rounded, size: 12, color: Color(0xFF786253)),
              SizedBox(width: 6),
              Expanded(
                child: Text('These dates are illustrative and must match your signed agreement.', style: TextStyle(color: Color(0xFF786253), fontSize: 10.5)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKeyTermsCard() {
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
          const Text(
            'Key Terms',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 12),
          _buildKeyTermRow(1, 'Principal is locked until maturity; mandatory legal rights remain protected.'),
          const Divider(height: 14, color: Color(0xFFE8DCB9)),
          _buildKeyTermRow(2, 'Monthly benefit is paid separately and does not compound automatically.'),
          const Divider(height: 14, color: Color(0xFFE8DCB9)),
          _buildKeyTermRow(3, 'Monthly dues and maturity may be taken as silver or bank amount; bank quotes require confirmation.'),
          const Divider(height: 14, color: Color(0xFFE8DCB9)),
          _buildKeyTermRow(4, 'Company may use the silver in its business; equivalent silver is due, not necessarily the same bars.'),
        ],
      ),
    );
  }

  Widget _buildKeyTermRow(int num, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Color(0xFFC8801C),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              num.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Color(0xFF786253), fontSize: 12, height: 1.3),
          ),
        ),
      ],
    );
  }

  Widget _buildAgreementPdfCard(BuildContext context) {
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
          const Text(
            'Programme Agreement',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3E4CD),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.picture_as_pdf_rounded, color: Color(0xFFC8801C), size: 28),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Full Programme Agreement', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold)),
                    SizedBox(height: 2),
                    Text('SG0021 • Revision 01', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B0D05),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PdfViewerScreen(
                          title: 'Silver Growth Agreement PDF',
                          documentNumber: 'SG0021 • Revision 01',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.visibility_outlined, size: 16, color: Color(0xFFE5B864)),
                  label: const Text('Read Full Agreement', style: TextStyle(color: Color(0xFFE5B864), fontSize: 11, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFC8801C)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PdfViewerScreen(
                          title: 'Silver Growth Agreement PDF',
                          documentNumber: 'SG0021 • Revision 01',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.download_rounded, size: 16, color: Color(0xFFC8801C)),
                  label: const Text('Download PDF', style: TextStyle(color: Color(0xFFC8801C), fontSize: 11, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConsentSection() {
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
          const Text(
            'Your Consent',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 10),
          _buildConsentCheckbox(0, 'I have read the full agreement and disclosed charges.'),
          _buildConsentCheckbox(1, 'I confirm the principal, tenure and Monthly Payout option.'),
          _buildConsentCheckbox(2, 'I understand the lock-in and silver utilisation terms.'),
          _buildConsentCheckbox(3, 'I consent to the terms in Agreement SG0021 Revision 01.'),
        ],
      ),
    );
  }

  Widget _buildConsentCheckbox(int index, String label) {
    return CheckboxListTile(
      value: consents[index],
      onChanged: (val) {
        setState(() {
          consents[index] = val ?? false;
        });
      },
      title: Text(label, style: const TextStyle(color: Color(0xFF786253), fontSize: 12)),
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      contentPadding: EdgeInsets.zero,
      activeColor: const Color(0xFFC8801C),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: allConsented ? const Color(0xFF1B0D05) : const Color(0xFFB0A090),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: allConsented
            ? () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Page05VerifyConsentScreen(
                      tenureMonths: widget.tenureMonths,
                      benefitOption: widget.benefitOption,
                    ),
                  ),
                );
              }
            : () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select all consent confirmations to continue.')),
                );
              },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Verify & Submit Consent',
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
    );
  }

  Widget _buildFooterNotice() {
    return Column(
      children: [
        Row(
          children: const [
            Icon(Icons.info_outline_rounded, size: 14, color: Color(0xFF786253)),
            SizedBox(width: 6),
            Expanded(
              child: Text(
                'Submission goes for company approval. Your programme is not active yet.',
                style: TextStyle(color: Color(0xFF786253), fontSize: 11),
              ),
            ),
            Text('Contact Support >', style: TextStyle(color: Color(0xFFC8801C), fontSize: 11, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF786253), fontSize: 12)),
        Text(value, style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 12.5, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
