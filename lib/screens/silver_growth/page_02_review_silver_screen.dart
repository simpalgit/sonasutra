import 'package:flutter/material.dart';
import 'page_03_choose_plan_screen.dart';

class Page02ReviewSilverScreen extends StatefulWidget {
  const Page02ReviewSilverScreen({super.key});

  @override
  State<Page02ReviewSilverScreen> createState() =>
      _Page02ReviewSilverScreenState();
}

class _Page02ReviewSilverScreenState extends State<Page02ReviewSilverScreen> {
  bool check1 = true;
  bool check2 = true;
  bool check3 = true;

  @override
  Widget build(BuildContext context) {
    bool isAllChecked = check1 && check2 && check3;

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
          'Review Your Silver',
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
            onPressed: () {},
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

                      // Verification Complete & Awaiting Confirmation Row
                      _buildVerificationStatusRow(),
                      const SizedBox(height: 16),

                      // Acceptance Metadata Card
                      _buildAcceptanceMetaCard(),
                      const SizedBox(height: 16),

                      // Verified Silver Details Card
                      _buildVerifiedSilverDetailsCard(),
                      const SizedBox(height: 16),

                      // Proposed Programme Principal Card
                      _buildProposedPrincipalCard(),
                      const SizedBox(height: 16),

                      // Reference Rows Card
                      _buildReferenceRowsCard(),
                      const SizedBox(height: 16),

                      // Please Check Section
                      _buildPleaseCheckSection(),
                      const SizedBox(height: 16),

                      // Raise An Issue Notice
                      _buildRaiseIssueNotice(),
                      const SizedBox(height: 12),

                      // Programme Not Active Notice
                      _buildNotActiveNotice(),
                      const SizedBox(height: 22),

                      // Confirm & Choose Plan Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isAllChecked ? const Color(0xFF1B0D05) : const Color(0xFFB0A090),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: isAllChecked
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

  Widget _buildHeaderBanner() {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1B0D05),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'SILVER GROWTH  •  STEP 1 OF 3',
            style: TextStyle(
              color: Color(0xFFE5B864),
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Review Your Silver',
            style: TextStyle(
              color: Color(0xFFFAF7F3),
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Check the verified details before continuing.',
            style: TextStyle(color: Color(0xFFD4C2A8), fontSize: 13),
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
              style: TextStyle(
                color: isCurrent ? Colors.white : const Color(0xFF786253),
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
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

  Widget _buildVerificationStatusRow() {
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
                const Icon(Icons.check_circle_rounded, color: Color(0xFF2E7D32), size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'VERIFICATION COMPLETE',
                        style: TextStyle(color: Color(0xFF1B5E20), fontSize: 10.5, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Only technical verification is complete.',
                        style: TextStyle(color: Color(0xFF388E3C), fontSize: 10),
                      ),
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
                const Icon(Icons.schedule_rounded, color: Color(0xFFD97706), size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Awaiting your confirmation',
                        style: TextStyle(color: Color(0xFF92400E), fontSize: 10.5, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Your programme is not active yet.',
                        style: TextStyle(color: Color(0xFFB45309), fontSize: 10),
                      ),
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
                  Text(
                    'Acceptance: SR0021 • Revision 01',
                    style: TextStyle(color: Color(0xFF1B0D05), fontSize: 12.5, fontWeight: FontWeight.bold),
                  ),
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Chandan Soni', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 11.5, fontWeight: FontWeight.bold)),
                    Text('Customer ID: CUST0021', style: TextStyle(color: Color(0xFF786253), fontSize: 9.5)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Bhadohi Showroom', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 11.5, fontWeight: FontWeight.bold)),
                    Text('Branch', style: TextStyle(color: Color(0xFF786253), fontSize: 9.5)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('21 Oct 2026', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 11.5, fontWeight: FontWeight.bold)),
                    Text('6:30 PM Recorded', style: TextStyle(color: Color(0xFF786253), fontSize: 9.5)),
                  ],
                ),
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
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF1B0D05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE5B864)),
                ),
                child: const Center(
                  child: Icon(Icons.workspace_premium_rounded, color: Color(0xFFE5B864), size: 42),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  children: [
                    _buildRow('Silver form', '1 silver bar'),
                    const Divider(color: Color(0xFFE8DCB9), height: 10),
                    _buildRow('Net silver weight', '1,000.000 g'),
                    const Divider(color: Color(0xFFE8DCB9), height: 10),
                    _buildRow('Verified purity', '999 / 1000 • 99.9%'),
                    const Divider(color: Color(0xFFE8DCB9), height: 10),
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
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF1B0D05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.scale_rounded, color: Color(0xFFE5B864), size: 26),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Proposed Programme Principal', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
                SizedBox(height: 2),
                Text(
                  '1,000.000 g',
                  style: TextStyle(color: Color(0xFF1B0D05), fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'serif'),
                ),
                SizedBox(height: 2),
                Text('999-equivalent silver', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
              ],
            ),
          ),
          const Icon(Icons.info_outline_rounded, color: Color(0xFF786253), size: 18),
        ],
      ),
    );
  }

  Widget _buildReferenceRowsCard() {
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
          const Divider(color: Color(0xFFE8DCB9), height: 14),
          _buildRow('Test reference', 'TEST0021'),
          const Divider(color: Color(0xFFE8DCB9), height: 14),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('View weighing & purity report', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold)),
                Icon(Icons.chevron_right_rounded, color: Color(0xFFC8801C)),
              ],
            ),
          ),
          const Divider(color: Color(0xFFE8DCB9), height: 14),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('View acceptance receipt', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold)),
                Icon(Icons.chevron_right_rounded, color: Color(0xFFC8801C)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPleaseCheckSection() {
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
            'Please check',
            style: TextStyle(
              color: Color(0xFF1B0D05),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),
          const SizedBox(height: 8),
          CheckboxListTile(
            value: check1,
            onChanged: (val) => setState(() => check1 = val ?? false),
            title: const Text('Your silver quantity and purity are correct.', style: TextStyle(color: Color(0xFF786253), fontSize: 12)),
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            contentPadding: EdgeInsets.zero,
            activeColor: const Color(0xFFC8801C),
          ),
          CheckboxListTile(
            value: check2,
            onChanged: (val) => setState(() => check2 = val ?? false),
            title: const Text('The principal shown matches your acceptance record.', style: TextStyle(color: Color(0xFF786253), fontSize: 12)),
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            contentPadding: EdgeInsets.zero,
            activeColor: const Color(0xFFC8801C),
          ),
          CheckboxListTile(
            value: check3,
            onChanged: (val) => setState(() => check3 = val ?? false),
            title: const Text('I have reviewed the silver details.', style: TextStyle(color: Color(0xFF786253), fontSize: 12)),
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            contentPadding: EdgeInsets.zero,
            activeColor: const Color(0xFFC8801C),
          ),
        ],
      ),
    );
  }

  Widget _buildRaiseIssueNotice() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: Color(0xFFD97706), size: 18),
                SizedBox(width: 8),
                Text('Details do not match? Raise an issue', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 12.5, fontWeight: FontWeight.bold)),
              ],
            ),
            Icon(Icons.chevron_right_rounded, color: Color(0xFFC8801C)),
          ],
        ),
      ),
    );
  }

  Widget _buildNotActiveNotice() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBEB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFDE68A)),
      ),
      child: Row(
        children: const [
          Icon(Icons.info_outline_rounded, color: Color(0xFFD97706), size: 18),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Your programme is not active yet.\nChoose your plan and sign the agreement next; activation follows approval.',
              style: TextStyle(color: Color(0xFF92400E), fontSize: 11, height: 1.3),
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
}
