import 'package:flutter/material.dart';
import 'silver_growth_screen.dart';

class MyPlansPortfolioScreen extends StatefulWidget {
  const MyPlansPortfolioScreen({super.key});

  @override
  State<MyPlansPortfolioScreen> createState() => _MyPlansPortfolioScreenState();
}

class _MyPlansPortfolioScreenState extends State<MyPlansPortfolioScreen> {
  int _bottomNavIndex = 1;

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
                child: _buildPortfolioBody(),
              ),
            ),

            // Bottom Navigation Bar
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dark Header Banner
        Container(
          width: double.infinity,
          color: const Color(0xFF1B0D05),
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'My Plans',
                style: TextStyle(
                  color: Color(0xFFFAF7F3),
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'serif',
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Your Silver Growth portfolio',
                style: TextStyle(
                  color: Color(0xFFD4C2A8),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title & Subtitle Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Your plans',
                        style: TextStyle(
                          color: Color(0xFF1E1007),
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'serif',
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '3 active • 1 pending',
                        style: TextStyle(
                          color: Color(0xFF786253),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'As of 21 Dec 2026',
                    style: TextStyle(
                      color: Color(0xFF8C7A6B),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // CARD 1: Pending Approval (SG0024)
              _buildPlanCard(
                isPending: true,
                statusLabel: 'Pending Approval',
                idLabel: 'Application ID SG0024',
                weightGrams: '750.000 g',
                tenure: '18 months',
                benefitOption: 'Monthly Payout',
                startDateLabel: 'Submitted on
21 Dec 2026',
                middleLabel: 'Start Date
—
Awaiting activation',
                endDateLabel: 'End Date
—
Set on activation',
                footerText: 'Awaiting company approval',
                actionText: 'View application details >',
              ),

              const SizedBox(height: 14),

              // CARD 2: Active (SG0021)
              _buildPlanCard(
                isPending: false,
                statusLabel: 'Active',
                idLabel: 'Plan ID SG0021',
                weightGrams: '1,000.000 g',
                tenure: '18 months',
                benefitOption: 'Monthly Payout',
                startDateLabel: 'Start Date
21 Oct 2026',
                middleLabel: '',
                endDateLabel: 'End Date
21 Apr 2028',
                earnedSilverGrams: '20.000 g',
                actionText: 'View plan details >',
              ),

              const SizedBox(height: 14),

              // CARD 3: Active (SG0022)
              _buildPlanCard(
                isPending: false,
                statusLabel: 'Active',
                idLabel: 'Plan ID SG0022',
                weightGrams: '500.000 g',
                tenure: '36 months',
                benefitOption: 'Accumulate at Maturity',
                startDateLabel: 'Start Date
21 Oct 2026',
                middleLabel: '',
                endDateLabel: 'End Date
21 Oct 2029',
                earnedSilverGrams: '10.000 g',
                actionText: 'View plan details >',
              ),

              const SizedBox(height: 14),

              // CARD 4: Active (SG0023)
              _buildPlanCard(
                isPending: false,
                statusLabel: 'Active',
                idLabel: 'Plan ID SG0023',
                weightGrams: '500.000 g',
                tenure: '18 months',
                benefitOption: 'Monthly Payout',
                startDateLabel: 'Start Date
21 Nov 2026',
                middleLabel: '',
                endDateLabel: 'End Date
21 May 2028',
                earnedSilverGrams: '5.000 g',
                actionText: 'View plan details >',
              ),

              const SizedBox(height: 16),

              // Footnote
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.info_outline_rounded, color: Color(0xFF8C7A6B), size: 14),
                      SizedBox(width: 6),
                      Text(
                        'Earned Silver includes paid and unpaid benefits.',
                        style: TextStyle(color: Color(0xFF8C7A6B), fontSize: 10.5),
                      ),
                    ],
                  ),
                  Text(
                    'Illustrative data',
                    style: TextStyle(color: Color(0xFF8C7A6B), fontSize: 10.5),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlanCard({
    required bool isPending,
    required String statusLabel,
    required String idLabel,
    required String weightGrams,
    required String tenure,
    required String benefitOption,
    required String startDateLabel,
    required String middleLabel,
    required String endDateLabel,
    String? earnedSilverGrams,
    String? footerText,
    required String actionText,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF381F10),
            Color(0xFF221006),
            Color(0xFF140803),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
        border: Border.all(color: const Color(0xFF634123), width: 1),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isPending ? const Color(0x33D97706) : const Color(0x3316A34A),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isPending ? const Color(0xFFF59E0B) : const Color(0xFF22C55E),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isPending ? Icons.access_time_rounded : Icons.circle,
                          color: isPending ? const Color(0xFFFBBF24) : const Color(0xFF4ADE80),
                          size: isPending ? 13 : 8,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          statusLabel,
                          style: TextStyle(
                            color: isPending ? const Color(0xFFFBBF24) : const Color(0xFF4ADE80),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    idLabel,
                    style: const TextStyle(
                      color: Color(0xFFD4C2A8),
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.view_in_ar_rounded, color: Color(0xFFE5B864), size: 28),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isPending ? 'Submitted Silver' : 'Principal Silver',
                      style: const TextStyle(
                        color: Color(0xFFA38F7D),
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      weightGrams,
                      style: const TextStyle(
                        color: Color(0xFFFAF7F3),
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'serif',
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: 1,
                height: 40,
                color: const Color(0xFF4A2F1A),
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),

              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.access_time, color: Color(0xFFE5B864), size: 14),
                        const SizedBox(width: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Tenure', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 9.5)),
                            Text(tenure, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.savings_outlined, color: Color(0xFFE5B864), size: 14),
                        const SizedBox(width: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Benefit option', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 9.5)),
                            Text(benefitOption, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: Color(0xFF4A2F1A), height: 1),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_month_outlined, color: Color(0xFFE5B864), size: 18),
                  const SizedBox(width: 6),
                  Text(
                    startDateLabel,
                    style: const TextStyle(color: Color(0xFFD4C2A8), fontSize: 10, height: 1.2),
                  ),
                ],
              ),

              if (middleLabel.isNotEmpty)
                Text(
                  middleLabel,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xFFA38F7D), fontSize: 9.5, height: 1.2),
                ),

              Row(
                children: [
                  const Icon(Icons.event_available_outlined, color: Color(0xFFE5B864), size: 18),
                  const SizedBox(width: 6),
                  Text(
                    endDateLabel,
                    style: const TextStyle(color: Color(0xFFD4C2A8), fontSize: 10, height: 1.2),
                  ),
                ],
              ),

              if (earnedSilverGrams != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0x33E5B864),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFE5B864), width: 0.8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.eco_rounded, color: Color(0xFFE5B864), size: 14),
                      const SizedBox(width: 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Earned Silver', style: TextStyle(color: Color(0xFFD4C2A8), fontSize: 8)),
                          Text(
                            earnedSilverGrams,
                            style: const TextStyle(
                              color: Color(0xFFE5B864),
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),

          if (footerText != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time_rounded, color: Color(0xFFFBBF24), size: 13),
                const SizedBox(width: 6),
                Text(
                  footerText,
                  style: const TextStyle(color: Color(0xFFFBBF24), fontSize: 10.5),
                ),
              ],
            ),
          ],

          const SizedBox(height: 10),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              actionText,
              style: const TextStyle(
                color: Color(0xFFE5B864),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

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
        if (index == 0) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SilverGrowthScreen()),
          );
        } else {
          setState(() {
            _bottomNavIndex = index;
          });
        }
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
