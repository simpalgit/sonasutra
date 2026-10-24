import 'package:flutter/material.dart';
import 'silver_growth_step1_acceptance.dart';

class SilverGrowthScreen extends StatefulWidget {
  const SilverGrowthScreen({super.key});

  @override
  State<SilverGrowthScreen> createState() => _SilverGrowthScreenState();
}

class _SilverGrowthScreenState extends State<SilverGrowthScreen> {
  int _selectedTenureMonths = 18;
  int _bottomNavIndex = 0;

  void _proceedToStep1() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SilverGrowthStep1AcceptanceScreen(
          selectedTenureMonths: _selectedTenureMonths,
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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // 1. Hero Header Banner
                    _buildHeroHeader(),

                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 2. Choose Your Tenure Card
                          _buildTenureSelectorCard(),

                          const SizedBox(height: 20),

                          // 3. Choose Your Benefit Section
                          _buildChooseYourBenefitSection(),

                          const SizedBox(height: 22),

                          // 4. Receive It Your Way Section
                          _buildReceiveItYourWaySection(),

                          const SizedBox(height: 18),

                          // 5. Programme Terms & Lock-in Card
                          _buildTermsAndLockInCard(),

                          const SizedBox(height: 20),

                          // 6. Action Button
                          _buildActionButton(),

                          const SizedBox(height: 6),
                          const Center(
                            child: Text(
                              'Verification, consent and approval required.',
                              style: TextStyle(
                                color: Color(0xFF8C715E),
                                fontSize: 11,
                              ),
                            ),
                          ),
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

  // --- 1. Hero Header ---
  Widget _buildHeroHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF1B0D05),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Stack(
        children: [
          // Background Silver Bar Art
          Positioned(
            right: -10,
            top: 0,
            bottom: 0,
            width: 170,
            child: CustomPaint(
              painter: HeaderSilverStackPainter(),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Silver Growth\nProgramme',
                style: TextStyle(
                  color: Color(0xFFFAF7F3),
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'serif',
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Your silver. A choice of benefits.',
                style: TextStyle(
                  color: Color(0xFFD4C2A8),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),

              // 3 Feature Badges
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildHeaderBadge(Icons.layers_outlined, '999\nSilver'),
                  _buildHeaderBadge(
                      Icons.calendar_month_rounded, '18 & 36\nmonths'),
                  _buildHeaderBadge(
                      Icons.settings_suggest_outlined, 'Two benefit\noptions'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: const Color(0xFFE5B864).withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFFE5B864), size: 16),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  // --- 2. Tenure Selector Card ---
  Widget _buildTenureSelectorCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3DB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.calendar_month_rounded,
                color: Color(0xFFC8801C), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose your tenure',
                  style: TextStyle(
                    color: Color(0xFF1E1007),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildTenurePill(18, '18 Months'),
                    const SizedBox(width: 8),
                    _buildTenurePill(36, '36 Months'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 1,
            height: 45,
            color: const Color(0xFFEFE0C9),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 90,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFF3DB),
                  ),
                  child: const Icon(Icons.lock_rounded,
                      color: Color(0xFFC8801C), size: 14),
                ),
                const SizedBox(width: 6),
                const Expanded(
                  child: Text(
                    'Principal stays locked until maturity.',
                    style: TextStyle(
                      color: Color(0xFF786253),
                      fontSize: 9.5,
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

  Widget _buildTenurePill(int months, String label) {
    bool isSelected = _selectedTenureMonths == months;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTenureMonths = months;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFFF7E3) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFFE5B864)
                  : const Color(0xFFE2D8C8),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xFF2B1407)
                  : const Color(0xFF6B513E),
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  // --- 3. Choose Your Benefit Section ---
  Widget _buildChooseYourBenefitSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Choose Your Benefit',
              style: TextStyle(
                color: Color(0xFF2B1407),
                fontSize: 22,
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
        const SizedBox(height: 4),
        const Text(
          'Select your option when you sign the agreement.',
          style: TextStyle(
            color: Color(0xFF786253),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 14),

        // Option 1: Monthly Payout Card
        _buildBenefitCard(
          iconBgColor: const Color(0xFF3B1E0F),
          icon: Icons.calendar_month_rounded,
          title: 'Monthly Payout',
          subtitle: '1 g per 100 eligible g for\neach completed month.',
          bullets: [
            'Collect due benefit monthly',
            'Principal remains locked',
          ],
          artType: 'coins',
        ),

        const SizedBox(height: 12),

        // Option 2: Accumulate at Maturity Card
        _buildBenefitCard(
          iconBgColor: const Color(0xFF3B1E0F),
          icon: Icons.trending_up_rounded,
          title: 'Accumulate at Maturity',
          subtitle: 'Let your benefit build\nthrough the term.',
          bullets: [
            'Benefit compounds every 6 months',
            'Principal + accumulated benefit at maturity',
          ],
          artType: 'bars',
        ),
      ],
    );
  }

  Widget _buildBenefitCard({
    required Color iconBgColor,
    required IconData icon,
    required String title,
    required String subtitle,
    required List<String> bullets,
    required String artType,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Icon
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconBgColor,
                ),
                child: Icon(icon, color: const Color(0xFFE5B864), size: 24),
              ),
              const SizedBox(width: 12),

              // Title & Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF1E1007),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'serif',
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFF6B513E),
                        fontSize: 11.5,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...bullets.map((b) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFC8801C),
                                ),
                                child: const Icon(Icons.check,
                                    color: Colors.white, size: 10),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  b,
                                  style: const TextStyle(
                                    color: Color(0xFF2B1407),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),

          // Arrow Right
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(Icons.chevron_right_rounded,
                  color: Color(0xFF3B1E0F), size: 20),
            ),
          ),
        ],
      ),
    );
  }

  // --- 4. Receive It Your Way Section ---
  Widget _buildReceiveItYourWaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Receive It Your Way',
              style: TextStyle(
                color: Color(0xFF2B1407),
                fontSize: 22,
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
        const SizedBox(height: 4),
        const Text(
          'For monthly dues and maturity settlement.',
          style: TextStyle(
            color: Color(0xFF786253),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            // Card 1: Physical Silver
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBF2),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 45,
                      height: 38,
                      child: CustomPaint(
                        painter: MiniSilverBarPainter(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Physical Silver',
                        style: TextStyle(
                          color: Color(0xFF1E1007),
                          fontSize: 12.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(Icons.chevron_right_rounded,
                        color: Color(0xFFC8801C), size: 18),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 10),

            // Card 2: Bank Amount
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBF2),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3DB),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.account_balance_rounded,
                          color: Color(0xFF3B1E0F), size: 20),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Bank Amount',
                        style: TextStyle(
                          color: Color(0xFF1E1007),
                          fontSize: 12.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(Icons.chevron_right_rounded,
                        color: Color(0xFFC8801C), size: 18),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 6),
        const Text(
          'Bank payout uses an applicable settlement-rate quote you review and confirm.',
          style: TextStyle(
            color: Color(0xFF8C715E),
            fontSize: 10.5,
          ),
        ),
      ],
    );
  }

  // --- 5. Programme Terms & Lock-in Card ---
  Widget _buildTermsAndLockInCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFC8801C),
            ),
            child: const Icon(Icons.info_outline_rounded,
                color: Colors.white, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Programme Terms & Lock-in',
                  style: TextStyle(
                    color: Color(0xFF1E1007),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'No ordinary early withdrawal of principal.',
                  style: TextStyle(
                    color: Color(0xFF786253),
                    fontSize: 10.5,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded,
              color: Color(0xFFC8801C), size: 22),
        ],
      ),
    );
  }

  // --- 6. Action Button ---
  Widget _buildActionButton() {
    return InkWell(
      onTap: _proceedToStep1,
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
              'Review Silver Acceptance',
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

// --- Custom Painter for Header Silver Stack ---
class HeaderSilverStackPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final silverShader = const LinearGradient(
      colors: [
        Color(0xFFFFFFFF),
        Color(0xFFE2E8F0),
        Color(0xFFCBD5E1),
        Color(0xFF64748B),
      ],
    ).createShader(Rect.fromLTWH(0, 0, w, h));

    final paint = Paint()..shader = silverShader;

    // Background Silver Bar
    final bar1 = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.3, h * 0.15, w * 0.65, h * 0.5),
      const Radius.circular(8),
    );
    canvas.drawRRect(bar1, paint);

    final line = Paint()
      ..color = Colors.white.withValues(alpha: 0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawRRect(bar1, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// --- Custom Painter for Mini Silver Bar ---
class MiniSilverBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final shader = const LinearGradient(
      colors: [
        Color(0xFFFFFFFF),
        Color(0xFFE2E8F0),
        Color(0xFF94A3B8),
      ],
    ).createShader(Rect.fromLTWH(0, 0, w, h));

    final path = Path();
    path.moveTo(w * 0.1, h * 0.2);
    path.lineTo(w * 0.9, h * 0.2);
    path.lineTo(w * 0.8, h * 0.9);
    path.lineTo(w * 0.0, h * 0.9);
    path.close();

    final paint = Paint()..shader = shader;
    canvas.drawPath(path, paint);

    final line = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;
    canvas.drawPath(path, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
