import 'package:flutter/material.dart';
import '../../widgets/luxury_illustrations.dart';
import '../../widgets/silver_bar_graphic.dart';
import 'page_03_choose_plan_screen.dart';

class Page02ReviewSilverScreen extends StatefulWidget {
  const Page02ReviewSilverScreen({super.key});

  @override
  State<Page02ReviewSilverScreen> createState() => _Page02ReviewSilverScreenState();
}

class _Page02ReviewSilverScreenState extends State<Page02ReviewSilverScreen> {
  bool isQuantityCorrect = true;
  bool isPrincipalMatches = true;
  bool isDetailsReviewed = true;

  bool get allChecked => isQuantityCorrect && isPrincipalMatches && isDetailsReviewed;

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
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Top Luxury Banner
            const LuxuryHeroBannerHeader(
              stepTag: 'Silver Growth • Step 1 of 3',
              title: 'Review Your Silver',
              subtitle: 'Check the verified details before continuing.',
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

                      // Verification Complete Row
                      _buildVerificationCompleteCard(),
                      const SizedBox(height: 16),

                      // Acceptance Metadata Card
                      _buildAcceptanceMetaCard(),
                      const SizedBox(height: 16),

                      // Verified Silver Details Card with 3D Silver Ingot
                      _buildVerifiedSilverDetailsCard(),
                      const SizedBox(height: 16),

                      // Proposed Programme Principal Card
                      _buildProposedPrincipalCard(),
                      const SizedBox(height: 16),

                      // References List Card
                      _buildReferencesCard(),
                      const SizedBox(height: 16),

                      // Please Check Section
                      _buildPleaseCheckCard(),
                      const SizedBox(height: 16),

                      // Issue Notice Box
                      _buildRaiseIssueCard(),
                      const SizedBox(height: 16),

                      // Programme Not Active Notice
                      _buildNotActiveNoticeCard(),
                      const SizedBox(height: 20),

                      // Confirm & Choose Plan Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: allChecked ? const Color(0xFF1B0D05) : const Color(0xFFB0A090),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: allChecked
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Page03ChoosePlanScreen(),
                                    ),
                                  );
                                }
                              : null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Confirm & Choose Plan',
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
                          'Only continue if these details are correct.',
                          style: TextStyle(color: Color(0xFF9E8B78), fontSize: 11),
                        ),
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
          _buildStepItem(1, 'Acceptance', isCurrent: true),
          Container(width: 20, height: 1.5, color: const Color(0xFFDCD0C0)),
          _buildStepItem(2, 'Plan & Benefit'),
          Container(width: 20, height: 1.5, color: const Color(0xFFDCD0C0)),
          _buildStepItem(3, 'Agreement'),
        ],
      ),
    );
  }

  Widget _buildStepItem(int num, String label, {bool isCurrent = false}) {
    return Row(
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: isCurrent ? const Color(0xFFC8801C) : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: isCurrent ? const Color(0xFFC8801C) : const Color(0xFFB0A090)),
          ),
          child: Center(
            child: Text(
              num.toString(),
              style: TextStyle(color: isCurrent ? Colors.white : const Color(0xFF786253), fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: isCurrent ? const Color(0xFF1B0D05) : const Color(0xFF786253),
            fontSize: 11.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildVerificationCompleteCard() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF4EC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFC7E2CE)),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle_rounded, color: Color(0xFF2E7D32), size: 22),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('VERIFICATION COMPLETE', style: TextStyle(color: Color(0xFF1B5E20), fontSize: 10.5, fontWeight: FontWeight.bold)),
                      Text('Only technical verification is complete.', style: TextStyle(color: Color(0xFF388E3C), fontSize: 11)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFBEB),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFDE68A)),
            ),
            child: Row(
              children: [
                const Icon(Icons.access_time_rounded, color: Color(0xFFD97706), size: 22),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Awaiting your confirmation', style: TextStyle(color: Color(0xFF92400E), fontSize: 11, fontWeight: FontWeight.bold)),
                      Text('Your programme is not active yet.', style: TextStyle(color: Color(0xFFB45309), fontSize: 10)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAcceptanceMetaCard() {
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
                  Text('Acceptance: SR0021 • Revision 01', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 12.5, fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3E4CD),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text('Sample data', style: TextStyle(color: Color(0xFF786253), fontSize: 9.5, fontWeight: FontWeight.bold)),
              ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Bhadohi Showroom', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 11.5, fontWeight: FontWeight.bold)),
                  Text('Branch', style: TextStyle(color: Color(0xFF786253), fontSize: 9.5)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('21 Oct 2026', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 11.5, fontWeight: FontWeight.bold)),
                  Text('6:30 PM Recorded', style: TextStyle(color: Color(0xFF786253), fontSize: 9.5)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVerifiedSilverDetailsCard() {
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
            'Verified Silver Details',
            style: TextStyle(
              color: Color(0xFF1B0D05),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const SilverBarGraphic(width: 80, height: 80),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  children: [
                    _buildRow('Silver form', '1 silver bar'),
                    const Divider(height: 10, color: Color(0xFFE8DCB9)),
                    _buildRow('Net silver weight', '1,000.000 g'),
                    const Divider(height: 10, color: Color(0xFFE8DCB9)),
                    _buildRow('Verified purity', '999 / 1000 • 99.9%'),
                    const Divider(height: 10, color: Color(0xFFE8DCB9)),
                    _buildRow('Fine silver content', '999.000 g'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
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
                  child: Text(
                    'Sample basis: 999-equivalent grams\nIllustration uses 999-equivalent grams.',
                    style: TextStyle(color: Color(0xFF786253), fontSize: 11, height: 1.2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProposedPrincipalCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Proposed Programme Principal', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'serif')),
              SizedBox(height: 4),
              Text('1,000.000 g', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'serif')),
              Text('999-equivalent silver', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.info_outline_rounded, size: 12, color: Color(0xFF786253)),
              SizedBox(width: 4),
              Text('Calculation basis\nmust match your\nfinal agreement.', style: TextStyle(color: Color(0xFF786253), fontSize: 9.5, height: 1.1)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReferencesCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: Column(
        children: [
          _buildRow('Bar / Lot reference', 'SIL0021'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Test reference', 'TEST0021'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildActionRow(Icons.description_outlined, 'View weighing & purity report'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildActionRow(Icons.picture_as_pdf_outlined, 'View acceptance receipt'),
        ],
      ),
    );
  }

  Widget _buildPleaseCheckCard() {
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
          const Text('Please check', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'serif')),
          const SizedBox(height: 10),
          CheckboxListTile(
            value: isQuantityCorrect,
            onChanged: (val) => setState(() => isQuantityCorrect = val ?? false),
            title: const Text('Your silver quantity and purity are correct.', style: TextStyle(color: Color(0xFF786253), fontSize: 11.5)),
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            contentPadding: EdgeInsets.zero,
            activeColor: const Color(0xFFC8801C),
          ),
          CheckboxListTile(
            value: isPrincipalMatches,
            onChanged: (val) => setState(() => isPrincipalMatches = val ?? false),
            title: const Text('The principal shown matches your acceptance record.', style: TextStyle(color: Color(0xFF786253), fontSize: 11.5)),
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            contentPadding: EdgeInsets.zero,
            activeColor: const Color(0xFFC8801C),
          ),
          CheckboxListTile(
            value: isDetailsReviewed,
            onChanged: (val) => setState(() => isDetailsReviewed = val ?? false),
            title: const Text('I have reviewed the silver details.', style: TextStyle(color: Color(0xFF786253), fontSize: 11.5)),
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            contentPadding: EdgeInsets.zero,
            activeColor: const Color(0xFFC8801C),
          ),
        ],
      ),
    );
  }

  Widget _buildRaiseIssueCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: Row(
        children: const [
          Icon(Icons.warning_amber_rounded, color: Color(0xFFC8801C), size: 20),
          SizedBox(width: 10),
          Expanded(child: Text('Details do not match? Raise an issue', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 12.5, fontWeight: FontWeight.bold))),
          Icon(Icons.chevron_right_rounded, color: Color(0xFFC8801C), size: 18),
        ],
      ),
    );
  }

  Widget _buildNotActiveNoticeCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: Row(
        children: const [
          Icon(Icons.info_outline_rounded, color: Color(0xFFC8801C), size: 18),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your programme is not active yet.', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 12.5, fontWeight: FontWeight.bold)),
                Text('Choose your plan and sign the agreement next; activation follows approval.', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
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

  Widget _buildActionRow(IconData icon, String title) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFC8801C), size: 18),
          const SizedBox(width: 10),
          Expanded(child: Text(title, style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 12.5, fontWeight: FontWeight.bold))),
          const Icon(Icons.chevron_right_rounded, color: Color(0xFFC8801C), size: 18),
        ],
      ),
    );
  }
}
