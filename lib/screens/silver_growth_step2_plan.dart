import 'package:flutter/material.dart';
import 'silver_growth_step1_acceptance.dart';
import 'silver_growth_step3_agreement.dart';

class SilverGrowthStep2PlanScreen extends StatefulWidget {
  final int selectedTenureMonths;

  const SilverGrowthStep2PlanScreen({
    super.key,
    required this.selectedTenureMonths,
  });

  @override
  State<SilverGrowthStep2PlanScreen> createState() =>
      _SilverGrowthStep2PlanScreenState();
}

class _SilverGrowthStep2PlanScreenState
    extends State<SilverGrowthStep2PlanScreen> {
  late int _tenureMonths;
  String _selectedBenefit = 'Monthly Payout';
  bool _isLockInUnderstood = true;

  @override
  void initState() {
    super.initState();
    _tenureMonths = widget.selectedTenureMonths;
  }

  void _proceedToStep3() {
    if (!_isLockInUnderstood) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please check the box confirming lock-in terms.'),
        ),
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SilverGrowthStep3AgreementScreen(
          tenureMonths: _tenureMonths,
          benefitType: _selectedBenefit,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double monthlyGrams = 10.000;
    double totalTermGrams = monthlyGrams * _tenureMonths;

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
                    // 2. Acceptance Reference Card
                    _buildAcceptanceRecordCard(),

                    const SizedBox(height: 14),

                    // 3. Accepted Principal Card
                    _buildAcceptedPrincipalCard(),

                    const SizedBox(height: 18),

                    // 4. Choose Your Tenure Section
                    _buildChooseTenureSection(),

                    const SizedBox(height: 18),

                    // 5. Choose Your Benefit Section
                    _buildChooseBenefitSection(),

                    const SizedBox(height: 18),

                    // 6. Your Selection Summary
                    _buildSelectionSummaryCard(monthlyGrams, totalTermGrams),

                    const SizedBox(height: 16),

                    // 7. Receive Payouts Info Box
                    _buildPayoutInfoBox(),

                    const SizedBox(height: 16),

                    // 8. Lock-in Checkbox & Action Button
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
            'SILVER GROWTH • STEP 2 OF 3',
            style: TextStyle(
              color: Color(0xFFE5B864),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Choose Your Plan',
            style: TextStyle(
              color: Color(0xFFFAF7F3),
              fontSize: 28,
              fontWeight: FontWeight.w900,
              fontFamily: 'serif',
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Select your tenure and benefit option.',
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
              _buildStepItem(2, 'Plan & Benefit', isActive: true, isDone: false),
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

  // --- 2. Acceptance Record Card ---
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

  // --- 3. Accepted Principal Card ---
  Widget _buildAcceptedPrincipalCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFEFE6D8), width: 1),
                ),
                padding: const EdgeInsets.all(4),
                child: CustomPaint(
                  painter: StepSilverBarPainter(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      children: [
                        Text(
                          'Accepted Principal',
                          style: TextStyle(
                            color: Color(0xFF1E1007),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6),
                        Expanded(
                            child:
                                Divider(color: Color(0xFFE5B864), thickness: 1)),
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
                      '999 purity',
                      style: TextStyle(
                        color: Color(0xFF786253),
                        fontSize: 11,
                      ),
                    ),
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
                    color: Color(0xFFC8801C), size: 16),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Sample basis: 999-equivalent grams\nLinked to acceptance: SR0021 • Revision 01',
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

  // --- 4. Choose Your Tenure Section ---
  Widget _buildChooseTenureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Choose your tenure',
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

        Row(
          children: [
            _buildTenureRadioOption(18, '18 Months'),
            const SizedBox(width: 12),
            _buildTenureRadioOption(36, '36 Months'),
          ],
        ),

        const SizedBox(height: 6),
        Row(
          children: const [
            Icon(Icons.calendar_month_rounded,
                color: Color(0xFFC8801C), size: 14),
            SizedBox(width: 6),
            Text(
              'Principal stays locked until the selected maturity date.',
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

  Widget _buildTenureRadioOption(int months, String label) {
    bool isSelected = _tenureMonths == months;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _tenureMonths = months;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFFF9EE) : const Color(0xFFFFFBF2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFFF6AD55)
                  : const Color(0xFFF3E4CD),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                isSelected
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_unchecked_rounded,
                color: isSelected
                    ? const Color(0xFFC8801C)
                    : const Color(0xFF94A3B8),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? const Color(0xFF1E1007)
                      : const Color(0xFF6B513E),
                  fontSize: 13,
                  fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- 5. Choose Your Benefit Section ---
  Widget _buildChooseBenefitSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Choose your benefit',
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

        // Option 1: Monthly Payout
        _buildBenefitRadioOption(
          type: 'Monthly Payout',
          subtitle: '1 g per 100 eligible g each completed month.',
          highlightValue: '10.000 g / month',
          footerNote: 'Principal returned at maturity.',
        ),

        const SizedBox(height: 10),

        // Option 2: Accumulate at Maturity
        _buildBenefitRadioOption(
          type: 'Accumulate at Maturity',
          subtitle: 'Benefit capitalises every 6 months.',
          highlightValue:
              _tenureMonths == 18 ? '1,191.016 g at 18 months' : '1,418.520 g at 36 months',
          footerNote: 'Includes principal + accumulated benefit.',
        ),

        const SizedBox(height: 6),
        const Text(
          'Illustrations use the sample basis above; final terms appear in your agreement.',
          style: TextStyle(
            color: Color(0xFF8C715E),
            fontSize: 10.5,
          ),
        ),
      ],
    );
  }

  Widget _buildBenefitRadioOption({
    required String type,
    required String subtitle,
    required String highlightValue,
    required String footerNote,
  }) {
    bool isSelected = _selectedBenefit == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedBenefit = type;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF9EE) : const Color(0xFFFFFBF2),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFF6AD55)
                : const Color(0xFFF3E4CD),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_unchecked_rounded,
              color: isSelected
                  ? const Color(0xFFC8801C)
                  : const Color(0xFF94A3B8),
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        type,
                        style: const TextStyle(
                          color: Color(0xFF1E1007),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'serif',
                        ),
                      ),
                      if (isSelected)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF3DB),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Selected',
                            style: TextStyle(
                              color: Color(0xFFC8801C),
                              fontSize: 9.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF786253),
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    highlightValue,
                    style: const TextStyle(
                      color: Color(0xFF1E1007),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'serif',
                    ),
                  ),
                  Text(
                    footerNote,
                    style: const TextStyle(
                      color: Color(0xFF8C715E),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 6. Your Selection Summary Card ---
  Widget _buildSelectionSummaryCard(double monthlyGrams, double totalTermGrams) {
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
                'Your selection',
                style: TextStyle(
                  color: Color(0xFF2B1407),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'serif',
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Divider(color: Color(0xFFE5B864), thickness: 1.5),
              ),
            ],
          ),

          const SizedBox(height: 10),

          _buildSummaryLine('Tenure', '$_tenureMonths months'),
          _buildSummaryLine('Benefit', _selectedBenefit),
          _buildSummaryLine('Monthly benefit', '${monthlyGrams.toStringAsFixed(3)} g'),
          _buildSummaryLine(
              'Scheduled benefit over term', '${totalTermGrams.toStringAsFixed(3)} g'),
          _buildSummaryLine('Principal at maturity', '1,000.000 g',
              isBold: true),

          const SizedBox(height: 6),
          Row(
            children: const [
              Icon(Icons.info_outline_rounded,
                  color: Color(0xFFC8801C), size: 14),
              SizedBox(width: 6),
              Text(
                'Any unpaid monthly benefit is also due at maturity.',
                style: TextStyle(
                  color: Color(0xFF786253),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryLine(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
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

  // --- 7. Receive Payouts Info Box ---
  Widget _buildPayoutInfoBox() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3DB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: const [
          Icon(Icons.account_balance_rounded,
              color: Color(0xFF3B1E0F), size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Receive due payouts as silver or bank amount.\nChoose the mode when requesting a payout; confirm the applicable rate for bank amount.',
              style: TextStyle(
                color: Color(0xFF2B1407),
                fontSize: 10.5,
                height: 1.25,
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
        GestureDetector(
          onTap: () {
            setState(() {
              _isLockInUnderstood = !_isLockInUnderstood;
            });
          },
          child: Row(
            children: [
              Icon(
                _isLockInUnderstood
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank_rounded,
                color: const Color(0xFFC8801C),
                size: 20,
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'I understand that my principal is locked until maturity.',
                  style: TextStyle(
                    color: Color(0xFF1E1007),
                    fontSize: 11.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                'Programme Terms >',
                style: TextStyle(
                  color: Color(0xFF1A73E8),
                  fontSize: 10.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        InkWell(
          onTap: _proceedToStep3,
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
                  'Continue to Agreement',
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
          'Your programme activates only after consent and approval.',
          style: TextStyle(
            color: Color(0xFF8C715E),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
