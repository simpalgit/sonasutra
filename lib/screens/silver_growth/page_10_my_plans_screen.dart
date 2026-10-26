import 'package:flutter/material.dart';
import '../../widgets/silver_bar_graphic.dart';
import 'page_01_programme_overview_screen.dart';
import 'page_11_review_payout_screen.dart';

class Page10MyPlansScreen extends StatefulWidget {
  const Page10MyPlansScreen({super.key});

  @override
  State<Page10MyPlansScreen> createState() => _Page10MyPlansScreenState();
}

class _Page10MyPlansScreenState extends State<Page10MyPlansScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B0D05),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Banner
            Container(
              width: double.infinity,
              color: const Color(0xFF1B0D05),
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Column(
                children: const [
                  Text(
                    'My Plans',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'serif',
                      color: Color(0xFFFAF7F3),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Your Silver Growth portfolio',
                    style: TextStyle(fontSize: 13, color: Color(0xFFD4C2A8)),
                  ),
                ],
              ),
            ),

            // Main Content Area
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
                      // Subtitle Row
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
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'serif',
                                  color: Color(0xFF1B0D05),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '3 active • 1 pending',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF786253),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'As of 21 Dec 2026',
                            style: TextStyle(
                              fontSize: 11.5,
                              color: Color(0xFF9E8B78),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),

                      // Card 1: SG0024 (Pending Approval)
                      _buildPendingPlanCard(
                        context,
                        applicationId: 'SG0024',
                        submittedSilver: '750.000 g',
                        tenure: '18 months',
                        benefitOption: 'Monthly Payout',
                        submittedDate: '21 Dec 2026',
                      ),
                      const SizedBox(height: 16),

                      // Card 2: SG0021 (Active)
                      _buildActivePlanCard(
                        context,
                        planId: 'SG0021',
                        principalSilver: '1,000.000 g',
                        tenure: '18 months',
                        benefitOption: 'Monthly Payout',
                        startDate: '21 Oct 2026',
                        endDate: '21 Apr 2028',
                        earnedSilver: '20.000 g',
                      ),
                      const SizedBox(height: 16),

                      // Card 3: SG0022 (Active)
                      _buildActivePlanCard(
                        context,
                        planId: 'SG0022',
                        principalSilver: '500.000 g',
                        tenure: '36 months',
                        benefitOption: 'Accumulate at Maturity',
                        startDate: '21 Oct 2026',
                        endDate: '21 Oct 2029',
                        earnedSilver: '10.000 g',
                      ),
                      const SizedBox(height: 16),

                      // Card 4: SG0023 (Active)
                      _buildActivePlanCard(
                        context,
                        planId: 'SG0023',
                        principalSilver: '500.000 g',
                        tenure: '18 months',
                        benefitOption: 'Monthly Payout',
                        startDate: '21 Nov 2026',
                        endDate: '21 May 2028',
                        earnedSilver: '5.000 g',
                      ),
                      const SizedBox(height: 18),

                      // Footer text
                      Row(
                        children: const [
                          Icon(Icons.info_outline_rounded, size: 14, color: Color(0xFF9E8B78)),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              'Earned Silver includes paid and unpaid benefits.',
                              style: TextStyle(fontSize: 11, color: Color(0xFF9E8B78)),
                            ),
                          ),
                          Text(
                            'Illustrative data',
                            style: TextStyle(fontSize: 11, color: Color(0xFF9E8B78)),
                          ),
                        ],
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

  Widget _buildActivePlanCard(
    BuildContext context, {
    required String planId,
    required String principalSilver,
    required String tenure,
    required String benefitOption,
    required String startDate,
    required String endDate,
    required String earnedSilver,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Page11ReviewPayoutScreen(),
          ),
        );
      },
      child: Container(
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
            // Top Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    const SizedBox(width: 10),
                    Text(
                      'Plan ID  $planId',
                      style: const TextStyle(color: Color(0xFFD4C2A8), fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const Icon(Icons.chevron_right_rounded, color: Color(0xFFE5B864), size: 20),
              ],
            ),
            const SizedBox(height: 12),

            // Principal & Tenure/Benefit Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Principal Silver', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 11)),
                    const SizedBox(height: 2),
                    Text(
                      principalSilver,
                      style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'serif'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.schedule_rounded, color: Color(0xFFE5B864), size: 13),
                            const SizedBox(width: 4),
                            Text('Tenure\n$tenure', textAlign: TextAlign.right, style: const TextStyle(color: Colors.white, fontSize: 11, height: 1.1)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.layers_rounded, color: Color(0xFFE5B864), size: 13),
                            const SizedBox(width: 4),
                            Text('Benefit option\n$benefitOption', textAlign: TextAlign.right, style: const TextStyle(color: Color(0xFFE5B864), fontSize: 10, height: 1.1)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    const SilverBarGraphic(width: 55, height: 55),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 14),
            const Divider(color: Color(0xFF634123), height: 1),
            const SizedBox(height: 12),

            // Dates & Earned Silver Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded, color: Color(0xFFE5B864), size: 13),
                    const SizedBox(width: 6),
                    Text('Start Date\n$startDate', style: const TextStyle(color: Colors.white70, fontSize: 11, height: 1.2)),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded, color: Color(0xFFE5B864), size: 13),
                    const SizedBox(width: 6),
                    Text('End Date\n$endDate', style: const TextStyle(color: Colors.white70, fontSize: 11, height: 1.2)),
                  ],
                ),
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
                      const SizedBox(width: 6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Earned Silver', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 9)),
                          Text(earnedSilver, style: const TextStyle(color: Color(0xFFE5B864), fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Text(
                  'View plan details',
                  style: TextStyle(color: Color(0xFFE5B864), fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 4),
                Icon(Icons.chevron_right_rounded, color: Color(0xFFE5B864), size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPendingPlanCard(
    BuildContext context, {
    required String applicationId,
    required String submittedSilver,
    required String tenure,
    required String benefitOption,
    required String submittedDate,
  }) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0x33F59E0B),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFF59E0B)),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.access_time_rounded, color: Color(0xFFFBBF24), size: 12),
                        SizedBox(width: 4),
                        Text(
                          'Pending Approval',
                          style: TextStyle(color: Color(0xFFFBBF24), fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Application ID  $applicationId',
                    style: const TextStyle(color: Color(0xFFD4C2A8), fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Icon(Icons.chevron_right_rounded, color: Color(0xFFE5B864), size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Submitted Silver', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 11)),
                  const SizedBox(height: 2),
                  Text(
                    submittedSilver,
                    style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'serif'),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.schedule_rounded, color: Color(0xFFE5B864), size: 13),
                          const SizedBox(width: 4),
                          Text('Tenure\n$tenure', textAlign: TextAlign.right, style: const TextStyle(color: Colors.white, fontSize: 11, height: 1.1)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.layers_rounded, color: Color(0xFFE5B864), size: 13),
                          const SizedBox(width: 4),
                          Text('Benefit option\n$benefitOption', textAlign: TextAlign.right, style: const TextStyle(color: Color(0xFFE5B864), fontSize: 10, height: 1.1)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  const SilverBarGraphic(width: 55, height: 55),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(color: Color(0xFF634123), height: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today_rounded, color: Color(0xFFE5B864), size: 13),
                  const SizedBox(width: 6),
                  Text('Submitted on\n$submittedDate', style: const TextStyle(color: Colors.white70, fontSize: 11, height: 1.2)),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_today_rounded, color: Color(0xFFE5B864), size: 13),
                  const SizedBox(width: 6),
                  Text('Start Date\n—\nAwaiting activation', style: const TextStyle(color: Colors.white70, fontSize: 11, height: 1.2)),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_today_rounded, color: Color(0xFFE5B864), size: 13),
                  const SizedBox(width: 6),
                  Text('End Date\n—\nSet on activation', style: const TextStyle(color: Colors.white70, fontSize: 11, height: 1.2)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.access_time_rounded, color: Color(0xFFFBBF24), size: 14),
                  SizedBox(width: 6),
                  Text('Awaiting company approval', style: TextStyle(color: Color(0xFFFBBF24), fontSize: 11)),
                ],
              ),
              Row(
                children: const [
                  Text('View application details', style: TextStyle(color: Color(0xFFE5B864), fontSize: 11, fontWeight: FontWeight.bold)),
                  SizedBox(width: 4),
                  Icon(Icons.chevron_right_rounded, color: Color(0xFFE5B864), size: 14),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
