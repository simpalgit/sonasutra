import 'package:flutter/material.dart';
import 'page_04_review_agreement_screen.dart';

class Page03ChoosePlanScreen extends StatefulWidget {
  final int tenureMonths;
  final String benefitOption;

  const Page03ChoosePlanScreen({
    super.key,
    this.tenureMonths = 18,
    this.benefitOption = 'Monthly Payout',
  });

  @override
  State<Page03ChoosePlanScreen> createState() =>
      _Page03ChoosePlanScreenState();
}

class _Page03ChoosePlanScreenState extends State<Page03ChoosePlanScreen> {
  late int selectedTenure;
  late String selectedBenefit;
  bool isAgreed = true;

  @override
  void initState() {
    super.initState();
    selectedTenure = widget.tenureMonths;
    selectedBenefit = widget.benefitOption;
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
        title: const Text(
          'Choose Your Plan',
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

                      // Acceptance Meta Card
                      _buildAcceptanceMetaCard(),
                      const SizedBox(height: 16),

                      // Accepted Principal Card
                      _buildAcceptedPrincipalCard(),
                      const SizedBox(height: 16),

                      // Choose Tenure Section
                      _buildChooseTenureSection(),
                      const SizedBox(height: 16),

                      // Choose Benefit Section
                      _buildChooseBenefitSection(),
                      const SizedBox(height: 16),

                      // Your Selection Summary Card
                      _buildYourSelectionSummaryCard(),
                      const SizedBox(height: 16),

                      // Lock Agreement Checkbox
                      _buildLockAgreementCheckbox(),
                      const SizedBox(height: 20),

                      // Continue to Agreement Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isAgreed ? const Color(0xFF1B0D05) : const Color(0xFFB0A090),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: isAgreed
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Page04ReviewAgreementScreen(
                                        tenureMonths: selectedTenure,
                                        benefitOption: selectedBenefit,
                                      ),
                                    ),
                                  );
                                }
                              : null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Continue to Agreement',
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
                          'Your programme activates only after consent and approval.',
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
            'SILVER GROWTH  •  STEP 2 OF 3',
            style: TextStyle(
              color: Color(0xFFE5B864),
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Choose Your Plan',
            style: TextStyle(
              color: Color(0xFFFAF7F3),
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Select your tenure and benefit option.',
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
          _buildStepItem(1, 'Acceptance', isDone: true),
          Container(width: 20, height: 1.5, color: const Color(0xFF2E7D32)),
          _buildStepItem(2, 'Plan & Benefit', isCurrent: true),
          Container(width: 20, height: 1.5, color: const Color(0xFFDCD0C0)),
          _buildStepItem(3, 'Agreement'),
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
            border: Border.all(color: isDone ? const Color(0xFF2E7D32) : (isCurrent ? const Color(0xFFC8801C) : const Color(0xFFB0A090))),
          ),
          child: Center(
            child: isDone
                ? const Icon(Icons.check, size: 12, color: Colors.white)
                : Text(num.toString(), style: TextStyle(color: isCurrent ? Colors.white : const Color(0xFF786253), fontSize: 11, fontWeight: FontWeight.bold)),
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

  Widget _buildAcceptedPrincipalCard() {
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
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFF1B0D05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE5B864)),
                ),
                child: const Center(
                  child: Icon(Icons.workspace_premium_rounded, color: Color(0xFFE5B864), size: 38),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Accepted Principal', style: TextStyle(color: Color(0xFF786253), fontSize: 12, fontWeight: FontWeight.bold)),
                    SizedBox(height: 2),
                    Text('1,000.000 g', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'serif')),
                    SizedBox(height: 2),
                    Text('999 purity', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
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
                    'Sample basis: 999-equivalent grams\nLinked to acceptance: SR0021 • Revision 01',
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

  Widget _buildChooseTenureSection() {
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
            'Choose your tenure',
            style: TextStyle(
              color: Color(0xFF1B0D05),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildTenureOption(18, '18 Months')),
              const SizedBox(width: 12),
              Expanded(child: _buildTenureOption(36, '36 Months')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.calendar_today_rounded, size: 13, color: Color(0xFF786253)),
              SizedBox(width: 6),
              Text('Principal stays locked until the selected maturity date.', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTenureOption(int months, String label) {
    bool isSelected = selectedTenure == months;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTenure = months;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF3DB) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFC8801C) : const Color(0xFFE0D5C5),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? const Color(0xFFC8801C) : const Color(0xFF786253),
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: const Color(0xFF1B0D05),
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChooseBenefitSection() {
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
            'Choose your benefit',
            style: TextStyle(
              color: Color(0xFF1B0D05),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),
          const SizedBox(height: 12),

          // Monthly Payout Option
          _buildBenefitCard(
            title: 'Monthly Payout',
            badgeText: 'Selected',
            rateText: '1 g per 100 eligible g each completed month.',
            payoutText: '10.000 g / month',
            noteText: 'Principal returned at maturity.',
            icon: Icons.calendar_today_rounded,
            isSelected: selectedBenefit == 'Monthly Payout',
            onTap: () => setState(() => selectedBenefit = 'Monthly Payout'),
          ),
          const SizedBox(height: 12),

          // Accumulate at Maturity Option
          _buildBenefitCard(
            title: 'Accumulate at Maturity',
            badgeText: null,
            rateText: 'Benefit capitalises every 6 months.',
            payoutText: '1,191.016 g at 18 months',
            noteText: 'Includes principal + accumulated benefit.',
            icon: Icons.trending_up_rounded,
            isSelected: selectedBenefit == 'Accumulate at Maturity',
            onTap: () => setState(() => selectedBenefit = 'Accumulate at Maturity'),
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.info_outline_rounded, size: 12, color: Color(0xFF786253)),
              SizedBox(width: 6),
              Expanded(
                child: Text('Illustrations use the sample basis above; final terms appear in your agreement.', style: TextStyle(color: Color(0xFF786253), fontSize: 10.5)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitCard({
    required String title,
    required String? badgeText,
    required String rateText,
    required String payoutText,
    required String noteText,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF3DB) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFC8801C) : const Color(0xFFE0D5C5),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? const Color(0xFFC8801C) : const Color(0xFF786253),
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(title, style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 14, fontWeight: FontWeight.bold)),
                      if (badgeText != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3E4CD),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(badgeText, style: const TextStyle(color: Color(0xFFC8801C), fontSize: 9.5, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(rateText, style: const TextStyle(color: Color(0xFF786253), fontSize: 11)),
                  const SizedBox(height: 6),
                  Text(payoutText, style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'serif')),
                  const SizedBox(height: 2),
                  Text(noteText, style: const TextStyle(color: Color(0xFF786253), fontSize: 10.5)),
                ],
              ),
            ),
            Icon(icon, color: const Color(0xFFC8801C), size: 28),
          ],
        ),
      ),
    );
  }

  Widget _buildYourSelectionSummaryCard() {
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
            'Your selection',
            style: TextStyle(
              color: Color(0xFF1B0D05),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),
          const SizedBox(height: 12),
          _buildRow('Tenure', '$selectedTenure months'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Benefit', selectedBenefit),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Monthly benefit', '10.000 g'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Scheduled benefit over term', '180.000 g'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Principal at maturity', '1,000.000 g'),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.info_outline_rounded, size: 12, color: Color(0xFF786253)),
              SizedBox(width: 6),
              Text('Any unpaid monthly benefit is also due at maturity.', style: TextStyle(color: Color(0xFF786253), fontSize: 10.5)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLockAgreementCheckbox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: Row(
        children: [
          Checkbox(
            value: isAgreed,
            onChanged: (val) => setState(() => isAgreed = val ?? false),
            activeColor: const Color(0xFFC8801C),
          ),
          const Expanded(
            child: Text(
              'I understand that my principal is locked until maturity.',
              style: TextStyle(color: Color(0xFF1B0D05), fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Programme Terms >', style: TextStyle(color: Color(0xFFC8801C), fontSize: 11, fontWeight: FontWeight.bold)),
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
