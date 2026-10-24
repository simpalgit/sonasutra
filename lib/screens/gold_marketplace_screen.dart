import 'package:flutter/material.dart';
import 'gold_sip_loading_screen.dart';
import 'silver_growth_screen.dart';

class GoldMarketplaceScreen extends StatefulWidget {
  const GoldMarketplaceScreen({super.key});

  @override
  State<GoldMarketplaceScreen> createState() => _GoldMarketplaceScreenState();
}

class _GoldMarketplaceScreenState extends State<GoldMarketplaceScreen> {
  int _selectedBottomNavIndex = 3; // 'eGold' active tab as in screenshot

  void _openGoldSip() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const GoldSipLoadingScreen(),
      ),
    );
  }

  void _openSilverGrowth() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SilverGrowthScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F5), // Light cream warm background
      body: SafeArea(
        child: Column(
          children: [
            // 1. Top App Bar (Header)
            _buildHeader(context),

            // 2. Scrollable Body
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner 1: Pure Gold Pure Possibilities
                    _buildPureGoldBanner(),

                    const SizedBox(height: 14),

                    // Banner 2: Locker Summary (Hi ANAND KUMAR)
                    _buildLockerSummaryCard(),

                    const SizedBox(height: 16),

                    // 4 Action Feature Cards Grid (Buy Gold, Gold SIP, Withdraw, Gold Locker)
                    _buildFourActionCards(),

                    const SizedBox(height: 18),

                    // Gold SIP Detailed Promo Card (NEW Invest in Gold)
                    _buildGoldSipPromoCard(),

                    const SizedBox(height: 22),

                    // "Why Gold SIP?" Section
                    _buildWhyGoldSipSection(),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // 3. Bottom Navigation Bar
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  // --- 1. Top Header ---
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: Colors.white,
      child: Row(
        children: [
          // Back Button
          GestureDetector(
            onTap: () {
              Navigator.of(context).maybePop();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7EA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.chevron_left_rounded,
                color: Color(0xFF3B2110),
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Title & Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Sonasutra Gold',
                  style: TextStyle(
                    color: Color(0xFF1E2838),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Gold & silver marketplace',
                  style: TextStyle(
                    color: Color(0xFF718096),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Live Price Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF8EE),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFF3E2C8),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: Colors.redAccent,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'LIVE PRICE',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Text(
                  '₹7518.60/g',
                  style: TextStyle(
                    color: Color(0xFF1E2838),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '24K • Per g',
                  style: TextStyle(
                    color: Color(0xFFA0AEC0),
                    fontSize: 9.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- 2. Pure Gold Hero Banner ---
  Widget _buildPureGoldBanner() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF23140A),
            Color(0xFF382010),
            Color(0xFF1B0E07),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PURE GOLD',
                      style: TextStyle(
                        color: Color(0xFFE5B864),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        fontFamily: 'serif',
                      ),
                    ),
                    const Text(
                      'PURE POSSIBILITIES',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        fontFamily: 'serif',
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Start your gold journey\nwith Sonasutra',
                      style: TextStyle(
                        color: Color(0xFFD6C8B8),
                        fontSize: 12.5,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // 3 Feature Badges
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        _buildBannerBadge(Icons.view_in_ar_rounded, '24K 999\nPure Gold'),
                        _buildBannerBadge(Icons.security_rounded, 'Secure\nVault'),
                        _buildBannerBadge(Icons.groups_rounded, 'Trusted\nby Thousands'),
                      ],
                    ),
                  ],
                ),
              ),

              // Gold Bullion Stack Illustration
              SizedBox(
                width: 90,
                height: 90,
                child: CustomPaint(
                  painter: GoldIngotsPainter(),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Explore Gold Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFFF0B8), Color(0xFFE5B864), Color(0xFFC48B22)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Explore Gold',
                  style: TextStyle(
                    color: Color(0xFF220D04),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 6),
                Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFF220D04),
                  size: 18,
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 6, height: 6, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white38)),
              const SizedBox(width: 4),
              Container(width: 6, height: 6, decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE5B864))),
              const SizedBox(width: 4),
              Container(width: 6, height: 6, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white38)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBannerBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white12, width: 0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFFE5B864), size: 14),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 9,
              height: 1.1,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // --- 3. Locker Summary Card ---
  Widget _buildLockerSummaryCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF1F1008),
            Color(0xFF331B0D),
            Color(0xFF180A04),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: User Greeting & Augmont Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text(
                    'Hi ANAND KUMAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text('👋', style: TextStyle(fontSize: 14)),
                ],
              ),

              // Augmont Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white24, width: 0.8),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.verified_rounded, color: Color(0xFFE5B864), size: 12),
                    SizedBox(width: 4),
                    Text(
                      'Secured by AUGMONT LABS',
                      style: TextStyle(
                        color: Color(0xFFE2D6C8),
                        fontSize: 8.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          const Text(
            'Your gold in locker',
            style: TextStyle(
              color: Color(0xFFB5A698),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 2),

          // Main Balance
          const Text(
            '4.4987203g',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 2),

          const Text(
            'Value: ₹33,77,256.43',
            style: TextStyle(
              color: Color(0xFFE5B864),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          // Invested & Returns Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white12, width: 0.8),
            ),
            child: Row(
              children: [
                // Invested
                const Icon(Icons.account_balance_wallet_outlined, color: Color(0xFFE5B864), size: 20),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Invested', style: TextStyle(color: Color(0xFFA09284), fontSize: 11)),
                    SizedBox(height: 1),
                    Text('₹28,45,678.90', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),

                const Spacer(),

                // Divider
                Container(width: 1, height: 26, color: Colors.white24),

                const Spacer(),

                // Returns
                const Icon(Icons.show_chart_rounded, color: Color(0xFF48BB78), size: 20),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Returns', style: TextStyle(color: Color(0xFFA09284), fontSize: 11)),
                    SizedBox(height: 1),
                    Text(
                      '+₹5,31,577.53 (+22.96%)',
                      style: TextStyle(color: Color(0xFF48BB78), fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(width: 6),
                const Icon(Icons.chevron_right_rounded, color: Colors.white70, size: 18),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Bottom Green Order Status Pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1C3A27),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF276749), width: 1),
            ),
            child: Row(
              children: const [
                Icon(Icons.trending_up_rounded, color: Color(0xFF48BB78), size: 18),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '21.3Cr Successful gold orders on Sonasutra',
                    style: TextStyle(
                      color: Color(0xFF68D391),
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(Icons.chevron_right_rounded, color: Color(0xFF68D391), size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- 4. 4 Feature Grid Cards ---
  Widget _buildFourActionCards() {
    return Row(
      children: [
        _buildActionCardItem(
          iconWidget: _buildGoldCircleIcon('GOLD'),
          title: 'Buy Gold',
          subtitle: 'At best rate >',
          isSelected: false,
        ),
        const SizedBox(width: 8),
        _buildActionCardItem(
          iconWidget: const Icon(Icons.calendar_month_rounded, color: Color(0xFFDCA148), size: 26),
          title: 'Gold SIP',
          subtitle: 'Start from ₹10 >',
          isSelected: true, // Highlighted warm border
          subtitleColor: Colors.redAccent,
          onTap: _openGoldSip,
        ),
        const SizedBox(width: 8),
        _buildActionCardItem(
          iconWidget: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF3182CE)),
            child: const Icon(Icons.arrow_upward_rounded, color: Colors.white, size: 18),
          ),
          title: 'Withdraw',
          subtitle: 'Get cash or coin >',
          isSelected: false,
        ),
        const SizedBox(width: 8),
        _buildActionCardItem(
          iconWidget: const Icon(Icons.key_outlined, color: Color(0xFFDCA148), size: 26),
          title: 'Gold Locker',
          subtitle: 'Safe & Secure >',
          isSelected: false,
        ),
      ],
    );
  }

  Widget _buildActionCardItem({
    required Widget iconWidget,
    required String title,
    required String subtitle,
    bool isSelected = false,
    Color? subtitleColor,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFFF9EE) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? const Color(0xFFF6AD55) : const Color(0xFFEDF2F7),
              width: isSelected ? 1.5 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 32, child: Center(child: iconWidget)),
              const SizedBox(height: 6),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF1A202C),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  color: subtitleColor ?? const Color(0xFF718096),
                  fontSize: 9.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoldCircleIcon(String text) {
    return Container(
      width: 28,
      height: 28,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFFFFF0B8), Color(0xFFE5B864), Color(0xFFC48B22)],
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF331A0C),
            fontSize: 7.5,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  // --- 5. Gold SIP Promo Card ---
  Widget _buildGoldSipPromoCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFBD38D), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NEW Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFF331B0D),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'NEW',
              style: TextStyle(
                color: Color(0xFFE5B864),
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 6),

          const Text(
            'Invest in Gold, A Little Every Day',
            style: TextStyle(
              color: Color(0xFF744210),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Text(
            'Gold SIP',
            style: TextStyle(
              color: Color(0xFF2B1407),
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),

          const Text(
            'Small steps. A brighter future.',
            style: TextStyle(
              color: Color(0xFF2B1407),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),

          const Text(
            'Start investing in gold regularly\nfrom just ₹10 and build wealth with ease.',
            style: TextStyle(
              color: Color(0xFF718096),
              fontSize: 11.5,
              height: 1.3,
            ),
          ),

          const SizedBox(height: 16),

          // 4 Grid Bullet Items
          Row(
            children: [
              _buildSipFeaturePoint(Icons.currency_rupee_rounded, 'Start from\n₹10 only'),
              _buildSipFeaturePoint(Icons.calendar_today_rounded, 'Daily / Weekly /\nMonthly options'),
              _buildSipFeaturePoint(Icons.settings_suggest_rounded, 'Auto investment\nas per your choice'),
              _buildSipFeaturePoint(Icons.verified_user_outlined, 'Safe & secure\nwith Augmont'),
            ],
          ),

          const SizedBox(height: 18),

          // Action Button
          InkWell(
            onTap: _openGoldSip,
            borderRadius: BorderRadius.circular(24),
            child: Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3B1E0F), Color(0xFF220D04)],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Start Gold SIP Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.chevron_right_rounded, color: Color(0xFFE5B864), size: 22),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSipFeaturePoint(IconData icon, String label) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFFF2BD),
            ),
            child: Icon(icon, color: const Color(0xFFB7791F), size: 16),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF2D3748),
              fontSize: 9.5,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  // --- 6. "Why Gold SIP?" Section ---
  Widget _buildWhyGoldSipSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Why Gold SIP?',
              style: TextStyle(
                color: Color(0xFF1A202C),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'View All Benefits >',
              style: TextStyle(
                color: Color(0xFF3182CE),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            _buildBenefitItem(Icons.paid_outlined, 'Small Amount', 'Start from ₹10'),
            const SizedBox(width: 8),
            _buildBenefitItem(Icons.bar_chart_rounded, 'Build Wealth', 'Long term growth'),
            const SizedBox(width: 8),
            _buildBenefitItem(Icons.currency_rupee_rounded, 'No Market Worry', 'Rupee cost averaging'),
            const SizedBox(width: 8),
            _buildBenefitItem(Icons.workspace_premium_rounded, 'Pure & Secure', 'Stored in certified vaults'),
          ],
        ),
      ],
    );
  }

  Widget _buildBenefitItem(IconData icon, String title, String subtitle) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFEDF2F7), width: 1),
        ),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFFDCA148), size: 22),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF2D3748),
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFA0AEC0),
                fontSize: 8.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 7. Bottom Navigation Bar ---
  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFEDF2F7), width: 1)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, Icons.home_outlined, 'Home'),
          _buildNavItem(1, Icons.opacity_rounded, 'eSilver', onTap: _openSilverGrowth),
          _buildNavItem(2, Icons.auto_awesome_outlined, 'Dazzle'),
          _buildNavItem(3, Icons.star_rounded, 'eGold', isHighlighted: true),
          _buildNavItem(4, Icons.person_outline_rounded, 'You'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label,
      {bool isHighlighted = false, VoidCallback? onTap}) {
    final isSelected = _selectedBottomNavIndex == index;

    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        } else {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: isHighlighted
            ? BoxDecoration(
                color: const Color(0xFFFFF5E5),
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFFB7791F) : const Color(0xFFA0AEC0),
              size: 22,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? const Color(0xFFB7791F) : const Color(0xFFA0AEC0),
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Gold Ingots Custom Painter for Hero Banner
class GoldIngotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFFF2BD), Color(0xFFE5B864), Color(0xFFB7791F)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, w, h));

    // Draw stylized 3D gold bar stack
    final path = Path()
      ..moveTo(w * 0.2, h * 0.4)
      ..lineTo(w * 0.8, h * 0.4)
      ..lineTo(w * 0.9, h * 0.8)
      ..lineTo(w * 0.1, h * 0.8)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
