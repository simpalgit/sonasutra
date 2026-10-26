import 'package:flutter/material.dart';
import '../../widgets/silver_bar_graphic.dart';
import 'page_01_programme_overview_screen.dart';
import 'page_09_payout_request_screen.dart';

class Page08PlanDetailsScreen extends StatefulWidget {
  const Page08PlanDetailsScreen({super.key});

  @override
  State<Page08PlanDetailsScreen> createState() => _Page08PlanDetailsScreenState();
}

class _Page08PlanDetailsScreenState extends State<Page08PlanDetailsScreen> {
  int _currentIndex = 1;

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
          'Plan Details',
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
                const SnackBar(content: Text('Help: Plan Details & Payout options')),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
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
                // Top Hero Card
                _buildHeroCard(),
                const SizedBox(height: 16),

                // Plan Timeline Card
                _buildPlanTimelineCard(),
                const SizedBox(height: 16),

                // Silver Earnings Card
                _buildSilverEarningsCard(context),
                const SizedBox(height: 16),

                // Plan Services Card
                _buildPlanServicesCard(context),
                const SizedBox(height: 18),

                // Footer note
                const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.info_outline_rounded, size: 14, color: Color(0xFF786253)),
                      SizedBox(width: 6),
                      Text(
                        'All silver quantities shown in grams.',
                        style: TextStyle(fontSize: 11, color: Color(0xFF786253)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFFC8801C),
        unselectedItemColor: const Color(0xFF786253),
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Page01ProgrammeOverviewScreen(),
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

  Widget _buildHeroCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2C160B),
            Color(0xFF4A2613),
            Color(0xFF1B0D05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: const Color(0xFFE5B864), width: 1),
        boxShadow: const [
          BoxShadow(color: Color(0x22000000), blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0x3322C55E),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF22C55E)),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.circle, color: Color(0xFF4ADE80), size: 8),
                    SizedBox(width: 6),
                    Text(
                      'Active',
                      style: TextStyle(color: Color(0xFF4ADE80), fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Plan ID  SG0021',
                style: TextStyle(color: Color(0xFFD4C2A8), fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Principal Silver', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 11)),
                  SizedBox(height: 2),
                  Text(
                    '1,000.000 g',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold, fontFamily: 'serif'),
                  ),
                ],
              ),
              const SilverBarGraphic(width: 75, height: 75),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Row(
                children: [
                  const Icon(Icons.schedule_rounded, color: Color(0xFFE5B864), size: 16),
                  const SizedBox(width: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Tenure', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 10)),
                      Text('18 months', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 32),
              Row(
                children: [
                  const Icon(Icons.layers_rounded, color: Color(0xFFE5B864), size: 16),
                  const SizedBox(width: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Benefit option', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 10)),
                      Text('Monthly Payout', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(color: Color(0xFF634123), height: 1),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('As of 21 Dec 2026', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 10)),
              Text('Illustrative data', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlanTimelineCard() {
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
            'Plan Timeline',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded, color: Color(0xFFC8801C), size: 20),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Start Date', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
                        Text('21 Oct 2026', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13.5, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(width: 1, height: 32, color: const Color(0xFFE8DCB9)),
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded, color: Color(0xFFC8801C), size: 20),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('End Date', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
                        Text('21 Apr 2028', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13.5, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '2 of 18 months completed',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1B0D05)),
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const LinearProgressIndicator(
              value: 2 / 18,
              minHeight: 8,
              backgroundColor: Color(0xFFE8DCB9),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFC8801C)),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF7E7),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE5B864), width: 0.5),
            ),
            child: Row(
              children: const [
                Icon(Icons.lock_rounded, color: Color(0xFFC8801C), size: 18),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Principal locked until maturity',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5, color: Color(0xFF1B0D05)),
                      ),
                      Text(
                        'Your principal silver cannot be withdrawn until the end date.',
                        style: TextStyle(fontSize: 10.5, color: Color(0xFF786253)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSilverEarningsCard(BuildContext context) {
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
            'Silver Earnings',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _buildMetricTile(
                  icon: Icons.layers_rounded,
                  label: 'Total earned',
                  value: '20.000 g',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildMetricTile(
                  icon: Icons.check_circle_outline_rounded,
                  label: 'Paid out',
                  value: '10.000 g',
                  isPaid: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildMetricTile(
                  icon: Icons.hourglass_empty_rounded,
                  label: 'In process',
                  value: '0.000 g',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildMetricTile(
                  icon: Icons.eco_outlined,
                  label: 'Available payout',
                  value: '10.000 g',
                  isHighlighted: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE0D5C5)),
            ),
            child: Row(
              children: const [
                Icon(Icons.calendar_today_rounded, color: Color(0xFFC8801C), size: 18),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Next benefit date', style: TextStyle(color: Color(0xFF786253), fontSize: 10.5)),
                    Text('21 Jan 2027', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B0D05),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Page09PayoutRequestScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.layers_rounded, color: Color(0xFFE5B864), size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Request Monthly Payout',
                    style: TextStyle(color: Color(0xFFE5B864), fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.chevron_right_rounded, color: Color(0xFFE5B864), size: 18),
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),
          const Center(
            child: Text(
              'Choose physical silver or bank amount in the next step.',
              style: TextStyle(color: Color(0xFF786253), fontSize: 10.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricTile({
    required IconData icon,
    required String label,
    required String value,
    bool isHighlighted = false,
    bool isPaid = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFFFFF3DB) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isHighlighted ? const Color(0xFFC8801C) : const Color(0xFFE0D5C5),
          width: isHighlighted ? 1.5 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: isHighlighted ? const Color(0xFFC8801C) : const Color(0xFF786253), size: 18),
              if (isPaid) const Icon(Icons.check_circle_rounded, color: Color(0xFF2E7D32), size: 14),
            ],
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Color(0xFF786253), fontSize: 10.5)),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              color: const Color(0xFF1B0D05),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: isHighlighted ? 'serif' : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanServicesCard(BuildContext context) {
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
            'Plan Services',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 12),
          _buildServiceRow(Icons.receipt_long_rounded, 'Earnings & Payout History'),
          const Divider(height: 16, color: Color(0xFFE8DCB9)),
          _buildServiceRow(Icons.file_download_rounded, 'Download Statement'),
          const Divider(height: 16, color: Color(0xFFE8DCB9)),
          _buildServiceRow(Icons.assignment_outlined, 'View Signed Agreement'),
        ],
      ),
    );
  }

  Widget _buildServiceRow(IconData icon, String title) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFC8801C), size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Color(0xFF786253), size: 18),
          ],
        ),
      ),
    );
  }
}
