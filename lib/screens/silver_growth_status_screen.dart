import 'package:flutter/material.dart';

class SilverGrowthStatusScreen extends StatefulWidget {
  final int tenureMonths;
  final String benefitType;

  const SilverGrowthStatusScreen({
    super.key,
    required this.tenureMonths,
    required this.benefitType,
  });

  @override
  State<SilverGrowthStatusScreen> createState() =>
      _SilverGrowthStatusScreenState();
}

class _SilverGrowthStatusScreenState extends State<SilverGrowthStatusScreen> {
  int _bottomNavIndex = 1; // 'My Plans' active

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
                    // 1. Header Banner
                    _buildHeaderBanner(),

                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 2. Mobile Verification & Status Banner Card
                          _buildStatusBannerCard(),

                          const SizedBox(height: 14),

                          // 3. Application Details Card
                          _buildApplicationDetailsCard(),

                          const SizedBox(height: 16),

                          // 4. Your Submitted Plan Summary
                          _buildSubmittedPlanSummaryCard(),

                          const SizedBox(height: 16),

                          // 5. Track Your Application Timeline
                          _buildApplicationTimelineCard(),

                          const SizedBox(height: 16),

                          // 6. Your Documents Card
                          _buildYourDocumentsCard(),

                          const SizedBox(height: 14),

                          // 7. If Changes Required Alert
                          _buildIfChangesRequiredAlert(),

                          const SizedBox(height: 18),

                          // 8. Action Buttons
                          _buildActionButtons(),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Navigation
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  // --- 1. Header Banner ---
  Widget _buildHeaderBanner() {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1B0D05),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'SILVERGROWTH • AGREEMENTSTATUS',
            style: TextStyle(
              color: Color(0xFFE5B864),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Consent Submitted',
            style: TextStyle(
              color: Color(0xFFFAF7F3),
              fontSize: 28,
              fontWeight: FontWeight.w900,
              fontFamily: 'serif',
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Your request is awaiting company approval.',
            style: TextStyle(
              color: Color(0xFFD4C2A8),
              fontSize: 12.5,
            ),
          ),
        ],
      ),
    );
  }

  // --- 2. Status Banner Card ---
  Widget _buildStatusBannerCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
      ),
      child: Row(
        children: [
          // Left Verified Check
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF1E8E3E),
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 10),

          // Message
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Mobile verification complete',
                  style: TextStyle(
                    color: Color(0xFF1E1007),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif',
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Your consent has been recorded.',
                  style: TextStyle(
                    color: Color(0xFF1A73E8),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Right Awaiting Approval Pill
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3DB),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFFBD38D), width: 1),
                ),
                child: const Text(
                  'AWAITING COMPANY\nAPPROVAL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFC8801C),
                    fontSize: 8.5,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Your programme is not active yet.',
                style: TextStyle(
                  color: Color(0xFF786253),
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- 3. Application Details Card ---
  Widget _buildApplicationDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
      ),
      child: Row(
        children: [
          // User
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF3DB),
                ),
                child: const Icon(Icons.person_outline,
                    color: Color(0xFFC8801C), size: 20),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Chandan Soni',
                    style: TextStyle(
                      color: Color(0xFF1E1007),
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Customer ID: CUST0021',
                    style: TextStyle(
                      color: Color(0xFF1A73E8),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(width: 10),
          Container(
            width: 1,
            height: 40,
            color: const Color(0xFFEFE0C9),
          ),
          const SizedBox(width: 10),

          // Details List
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Application:',
                        style: TextStyle(color: Color(0xFF786253), fontSize: 10)),
                    Row(
                      children: [
                        const Text('APP0021  ',
                            style: TextStyle(
                                color: Color(0xFF1E1007),
                                fontSize: 10.5,
                                fontWeight: FontWeight.bold)),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 1),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF3DB),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'SAMPLE DATA',
                            style: TextStyle(
                              color: Color(0xFF8C5B21),
                              fontSize: 7.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                _buildAppDetailLine(
                    'Agreement:', 'SG0021 • Revision 01'),
                _buildAppDetailLine(
                    'Acceptance:', 'SR0021 • Revision 01'),
                _buildAppDetailLine(
                    'Submitted:', '21 Oct 2026 6:45 PM'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppDetailLine(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(color: Color(0xFF786253), fontSize: 10)),
        Text(value,
            style: const TextStyle(
                color: Color(0xFF1E1007),
                fontSize: 10.5,
                fontWeight: FontWeight.bold)),
      ],
    );
  }

  // --- 4. Your Submitted Plan Summary ---
  Widget _buildSubmittedPlanSummaryCard() {
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
              Icon(Icons.inventory_2_outlined,
                  color: Color(0xFFC8801C), size: 18),
              SizedBox(width: 6),
              Text(
                'Your Submited Plan',
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

          _buildPlanSummaryLine('Principal', '1,000.000 g', isBold: true),
          _buildPlanSummaryLine('Sample basis', '999-equivalent grams'),
          _buildPlanSummaryLine('Purity', '999'),
          _buildPlanSummaryLine('Tenure', '${widget.tenureMonths} months'),
          _buildPlanSummaryLine('Benefit', widget.benefitType),
          _buildPlanSummaryLine('Scheduled monthly benefit', '10.000 g',
              isBold: true),

          const SizedBox(height: 8),
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
                    'Benefit servicing follows the approved agreement schedule; this is not a payable balance.',
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

  Widget _buildPlanSummaryLine(String label, String value,
      {bool isBold = false}) {
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

  // --- 5. Track Your Application Timeline ---
  Widget _buildApplicationTimelineCard() {
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
              Icon(Icons.assignment_turned_in_outlined,
                  color: Color(0xFFC8801C), size: 18),
              SizedBox(width: 6),
              Text(
                'Track Your Application',
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

          const SizedBox(height: 12),

          // Timeline Step 1
          _buildTimelineStep(
            status: 'done',
            title: 'Silver details confirmed',
            subtitle: 'Your silver details have been confirmed.',
            isLast: false,
          ),

          // Timeline Step 2
          _buildTimelineStep(
            status: 'done',
            title: 'Plan & benefit selected',
            subtitle: 'You have selected your plan and benefit options.',
            isLast: false,
          ),

          // Timeline Step 3
          _buildTimelineStep(
            status: 'done',
            title: 'Consent verified & submitted',
            subtitle: 'Your consent has been verified and submitted.',
            timeStr: '21 Oct 2026 6:45 PM',
            isLast: false,
          ),

          // Timeline Step 4
          _buildTimelineStep(
            status: 'in_progress',
            title: 'Company review',
            subtitle:
                'Company checks the acceptance record, selected plan and consent.',
            isLast: false,
          ),

          // Timeline Step 5
          _buildTimelineStep(
            status: 'pending',
            title: 'Programme activation',
            subtitle:
                'You will see activation and the approved schedule in My Plans.',
            isLast: true,
          ),

          const SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.refresh_rounded, color: Color(0xFF1A73E8), size: 16),
                SizedBox(width: 4),
                Text(
                  'Refresh status',
                  style: TextStyle(
                    color: Color(0xFF1A73E8),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineStep({
    required String status,
    required String title,
    required String subtitle,
    String? timeStr,
    required bool isLast,
  }) {
    Color iconColor;
    Widget iconWidget;

    if (status == 'done') {
      iconColor = const Color(0xFF1E8E3E);
      iconWidget = Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: iconColor,
        ),
        child: const Icon(Icons.check, color: Colors.white, size: 12),
      );
    } else if (status == 'in_progress') {
      iconColor = const Color(0xFFC8801C);
      iconWidget = Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: iconColor,
        ),
        child: const Icon(Icons.access_time_filled_rounded,
            color: Colors.white, size: 12),
      );
    } else {
      iconColor = const Color(0xFFCBD5E1);
      iconWidget = Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: iconColor,
        ),
      );
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              iconWidget,
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: status == 'done'
                        ? const Color(0xFF1E8E3E)
                        : const Color(0xFFE2E8F0),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: const Color(0xFF1E1007),
                            fontSize: 12,
                            fontWeight: status == 'done' || status == 'in_progress'
                                ? FontWeight.bold
                                : FontWeight.w500,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            color: Color(0xFF786253),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (timeStr != null)
                    Text(
                      timeStr,
                      style: const TextStyle(
                        color: Color(0xFF786253),
                        fontSize: 9.5,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- 6. Your Documents Card ---
  Widget _buildYourDocumentsCard() {
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
              Icon(Icons.description_outlined,
                  color: Color(0xFFC8801C), size: 18),
              SizedBox(width: 6),
              Text(
                'Your Documents',
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

          // Document 1
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Submitted agreement',
                      style: TextStyle(
                        color: Color(0xFF1E1007),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'The agreement you submitted for company review.',
                      style: TextStyle(
                        color: Color(0xFF786253),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'View  |  Download',
                style: TextStyle(
                  color: Color(0xFF1A73E8),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          const Divider(color: Color(0xFFEFE0C9), height: 1),
          const SizedBox(height: 8),

          // Document 2
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Silver acceptance receipt',
                      style: TextStyle(
                        color: Color(0xFF1E1007),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Your acceptance receipt for this application.',
                      style: TextStyle(
                        color: Color(0xFF786253),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'View',
                style: TextStyle(
                  color: Color(0xFF1A73E8),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- 7. If Changes Required Alert ---
  Widget _buildIfChangesRequiredAlert() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3DB),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFFBD38D), width: 1),
      ),
      child: Row(
        children: const [
          Icon(Icons.info_outline_rounded,
              color: Color(0xFFC8801C), size: 18),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'If changes are required: Material changes will be shown for your fresh review and consent.',
              style: TextStyle(
                color: Color(0xFF786253),
                fontSize: 10.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- 8. Action Buttons ---
  Widget _buildActionButtons() {
    return Column(
      children: [
        Container(
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
                'View Application in My Plans',
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

        const SizedBox(height: 10),

        Container(
          width: double.infinity,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFFE5C07B), width: 1),
          ),
          child: const Center(
            child: Text(
              'Contact Support',
              style: TextStyle(
                color: Color(0xFF8C5B21),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // --- Bottom Navigation Bar ---
  Widget _buildBottomNavigationBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, Icons.bar_chart_rounded, 'Explore Programme'),
          _buildNavItem(1, Icons.assignment_outlined, 'My Plans'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
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
            color: isSelected
                ? const Color(0xFFC8801C)
                : const Color(0xFF94A3B8),
            size: 22,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xFF2B1407)
                  : const Color(0xFF94A3B8),
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
