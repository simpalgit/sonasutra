import 'package:flutter/material.dart';
import '../../widgets/luxury_illustrations.dart';
import '../../widgets/silver_bar_graphic.dart';
import 'page_02_review_silver_screen.dart';
import 'page_10_my_plans_screen.dart';

class Page01ProgrammeOverviewScreen extends StatefulWidget {
  const Page01ProgrammeOverviewScreen({super.key});

  @override
  State<Page01ProgrammeOverviewScreen> createState() =>
      _Page01ProgrammeOverviewScreenState();
}

class _Page01ProgrammeOverviewScreenState
    extends State<Page01ProgrammeOverviewScreen> {
  String selectedTenure = '18 Months';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B0D05),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B0D05),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFFE5B864), size: 20),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline_rounded, color: Color(0xFFE5B864), size: 22),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Top Luxury Hero Banner Header
            LuxuryHeroBannerHeader(
              title: 'Silver Growth\nProgramme',
              subtitle: 'Your silver. A choice of benefits.',
              bottomContent: Row(
                children: [
                  _buildHeaderIconTile(Icons.grid_view_rounded, '999\nSilver'),
                  const SizedBox(width: 12),
                  _buildHeaderIconTile(Icons.calendar_today_rounded, '18 & 36\nmonths'),
                  const SizedBox(width: 12),
                  _buildHeaderIconTile(Icons.settings_suggest_rounded, 'Two benefit\noptions'),
                ],
              ),
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
                      // Tenure Selector Card
                      _buildTenureCard(),
                      const SizedBox(height: 18),

                      // Choose Your Benefit Header
                      const Text(
                        'Choose Your Benefit',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'serif',
                          color: Color(0xFF1B0D05),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Select your option when you sign the agreement.',
                        style: TextStyle(color: Color(0xFF786253), fontSize: 12.5),
                      ),
                      const SizedBox(height: 14),

                      // Monthly Payout Card with Calendar Illustration
                      _buildMonthlyPayoutCard(),
                      const SizedBox(height: 14),

                      // Accumulate at Maturity Card with Growth Illustration
                      _buildAccumulateMaturityCard(),
                      const SizedBox(height: 20),

                      // Receive It Your Way Header
                      const Text(
                        'Receive It Your Way',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'serif',
                          color: Color(0xFF1B0D05),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'For monthly dues and maturity settlement.',
                        style: TextStyle(color: Color(0xFF786253), fontSize: 12),
                      ),
                      const SizedBox(height: 12),

                      // Options Row: Physical Silver & Bank Amount
                      Row(
                        children: [
                          Expanded(child: _buildPayoutOptionTile('Physical Silver', const SilverBarGraphic(width: 45, height: 45))),
                          const SizedBox(width: 12),
                          Expanded(child: _buildPayoutOptionTile('Bank Amount', const Icon(Icons.account_balance_rounded, color: Color(0xFFC8801C), size: 28), subtitle: 'Bank payout uses an applicable settlement-rate quote.')),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Terms Card
                      _buildTermsNoticeCard(),
                      const SizedBox(height: 20),

                      // Review Silver Acceptance Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1B0D05),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Page02ReviewSilverScreen(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Review Silver Acceptance',
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
                          'Verification, consent and approval required.',
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFFC8801C),
        unselectedItemColor: const Color(0xFF786253),
        backgroundColor: Colors.white,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Page10MyPlansScreen(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Explore Programme',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_rounded),
            label: 'My Plans',
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderIconTile(IconData icon, String text) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: const Color(0x33E5B864),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFE5B864), width: 1),
          ),
          child: Icon(icon, color: const Color(0xFFE5B864), size: 14),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(color: Color(0xFFD4C2A8), fontSize: 10, height: 1.1),
        ),
      ],
    );
  }

  Widget _buildTenureCard() {
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
              color: const Color(0xFFF3E4CD),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.calendar_month_rounded, color: Color(0xFFC8801C), size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Choose your tenure', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildTenureChip('18 Months'),
                    const SizedBox(width: 8),
                    _buildTenureChip('36 Months'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF7E7),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE5B864), width: 0.5),
            ),
            child: Row(
              children: const [
                Icon(Icons.lock_rounded, size: 12, color: Color(0xFFC8801C)),
                SizedBox(width: 4),
                Text('Principal stays\nlocked until\nmaturity.', style: TextStyle(color: Color(0xFF786253), fontSize: 9.5, height: 1.1)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTenureChip(String label) {
    bool isSelected = selectedTenure == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTenure = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1B0D05) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFFE5B864) : const Color(0xFFE0D5C5),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFFE5B864) : const Color(0xFF1B0D05),
            fontSize: 11.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildMonthlyPayoutCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1B0D05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.calendar_today_rounded, color: Color(0xFFE5B864), size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Monthly Payout', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'serif')),
                const SizedBox(height: 2),
                const Text('1 g per 100 eligible g for each completed month.', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
                const SizedBox(height: 6),
                Row(
                  children: const [
                    Icon(Icons.check_circle_rounded, size: 13, color: Color(0xFFC8801C)),
                    SizedBox(width: 4),
                    Text('Collect due benefit monthly', style: TextStyle(color: Color(0xFF786253), fontSize: 10.5)),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.check_circle_rounded, size: 13, color: Color(0xFFC8801C)),
                    SizedBox(width: 4),
                    Text('Principal remains locked', style: TextStyle(color: Color(0xFF786253), fontSize: 10.5)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const CalendarSilverIllustration(),
          const Icon(Icons.chevron_right_rounded, color: Color(0xFFC8801C), size: 22),
        ],
      ),
    );
  }

  Widget _buildAccumulateMaturityCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1B0D05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.trending_up_rounded, color: Color(0xFFE5B864), size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Accumulate at Maturity', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'serif')),
                const SizedBox(height: 2),
                const Text('Let your benefit build through the term.', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
                const SizedBox(height: 6),
                Row(
                  children: const [
                    Icon(Icons.check_circle_rounded, size: 13, color: Color(0xFFC8801C)),
                    SizedBox(width: 4),
                    Text('Benefit compounds every 6 months', style: TextStyle(color: Color(0xFF786253), fontSize: 10.5)),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.check_circle_rounded, size: 13, color: Color(0xFFC8801C)),
                    SizedBox(width: 4),
                    Text('Principal + accumulated benefit at maturity', style: TextStyle(color: Color(0xFF786253), fontSize: 10.5)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const GrowthBarsIllustration(),
          const Icon(Icons.chevron_right_rounded, color: Color(0xFFC8801C), size: 22),
        ],
      ),
    );
  }

  Widget _buildPayoutOptionTile(String title, Widget graphic, {String? subtitle}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              graphic,
              const SizedBox(width: 8),
              Expanded(child: Text(title, style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold))),
              const Icon(Icons.chevron_right_rounded, color: Color(0xFFC8801C), size: 18),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 6),
            Text(subtitle, style: const TextStyle(color: Color(0xFF786253), fontSize: 9.5, height: 1.2)),
          ],
        ],
      ),
    );
  }

  Widget _buildTermsNoticeCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline_rounded, color: Color(0xFFC8801C), size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Programme Terms & Lock-in', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 12.5, fontWeight: FontWeight.bold)),
                Text('No ordinary early withdrawal of principal.', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: Color(0xFFC8801C), size: 18),
        ],
      ),
    );
  }
}
