import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'page_01_programme_overview_screen.dart';
import 'page_08_plan_details_screen.dart';

class Page14CollectSilverScreen extends StatefulWidget {
  const Page14CollectSilverScreen({super.key});

  @override
  State<Page14CollectSilverScreen> createState() =>
      _Page14CollectSilverScreenState();
}

class _Page14CollectSilverScreenState extends State<Page14CollectSilverScreen> {
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
          'Collect Your Silver',
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
                const SnackBar(content: Text('Help: Store pickup instructions & reference')),
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
                // Top Ready Banner
                _buildReadyBanner(),
                const SizedBox(height: 16),

                // Hero Card - Awaiting Pickup
                _buildHeroCard(context),
                const SizedBox(height: 16),

                // Collection Outlet Card
                _buildCollectionOutletCard(context),
                const SizedBox(height: 16),

                // Collection Reference Card
                _buildCollectionReferenceCard(context),
                const SizedBox(height: 16),

                // At the Outlet Card
                _buildAtTheOutletCard(),
                const SizedBox(height: 16),

                // Request Progress Timeline Card
                _buildRequestProgressCard(),
                const SizedBox(height: 20),

                // Back to Plan Details Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B0D05),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const Page08PlanDetailsScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Back to Plan Details',
                          style: TextStyle(
                            color: Color(0xFFE5B864),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.chevron_right_rounded, color: Color(0xFFE5B864), size: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Contact Support Link
                Center(
                  child: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Opening Support Chat...')),
                      );
                    },
                    child: const Text(
                      'Contact Support',
                      style: TextStyle(
                        color: Color(0xFFC8801C),
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),

                // Footer
                const Center(
                  child: Text(
                    'Illustrative data • As of 22 Dec 2026',
                    style: TextStyle(color: Color(0xFF9E8B78), fontSize: 11),
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

  Widget _buildReadyBanner() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF4EC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFC7E2CE)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF2E7D32),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.store_rounded, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Ready for Collection',
                  style: TextStyle(
                    color: Color(0xFF1B5E20),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Your silver is ready at the selected outlet.',
                  style: TextStyle(
                    color: Color(0xFF388E3C),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2C160B),
            Color(0xFF4A2613),
            Color(0xFF1B0D05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5B864), width: 1),
        boxShadow: const [
          BoxShadow(color: Color(0x22000000), blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Awaiting Pickup',
            style: TextStyle(
              color: Color(0xFFE5B864),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                'Request ID  PR0021',
                style: TextStyle(color: Color(0xFFD4C2A8), fontSize: 12),
              ),
              const SizedBox(width: 6),
              InkWell(
                onTap: () {
                  Clipboard.setData(const ClipboardData(text: 'PR0021'));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Request ID PR0021 copied!')),
                  );
                },
                child: const Icon(Icons.copy_rounded, color: Color(0xFFE5B864), size: 14),
              ),
            ],
          ),
          const SizedBox(height: 2),
          const Text(
            'Plan ID  SG0021',
            style: TextStyle(color: Color(0xFFD4C2A8), fontSize: 12),
          ),
          const SizedBox(height: 14),
          const Text('Silver to collect', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 11)),
          const SizedBox(height: 2),
          const Text(
            '10.000 g',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),
          const SizedBox(height: 14),
          const Divider(color: Color(0xFF634123), height: 1),
          const SizedBox(height: 12),
          Row(
            children: const [
              Icon(Icons.layers_rounded, color: Color(0xFFE5B864), size: 16),
              SizedBox(width: 6),
              Text(
                'Physical Silver  •  999 purity',
                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCollectionOutletCard(BuildContext context) {
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
            'Collection Outlet',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3E4CD),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.location_on_rounded, color: Color(0xFFC8801C), size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Bhadohi Outlet',
                      style: TextStyle(
                        color: Color(0xFF1B0D05),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Store pickup',
                      style: TextStyle(
                        color: Color(0xFF786253),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFC8801C)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  onPressed: () {
                    _showOutletDetailsDialog(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.receipt_long_rounded, size: 16, color: Color(0xFFC8801C)),
                      SizedBox(width: 6),
                      Text(
                        'View Outlet Details >',
                        style: TextStyle(color: Color(0xFF1B0D05), fontSize: 12.5, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFC8801C)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Connecting to Bhadohi Outlet (+91 98765 43210)...')),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.phone_rounded, size: 16, color: Color(0xFFC8801C)),
                      SizedBox(width: 6),
                      Text(
                        'Contact Outlet >',
                        style: TextStyle(color: Color(0xFF1B0D05), fontSize: 12.5, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, color: Color(0xFFE8DCB9)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Amount payable', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold)),
              Text('₹0.00', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: const [
              Icon(Icons.info_outline_rounded, size: 12, color: Color(0xFF786253)),
              SizedBox(width: 6),
              Text('Illustrative zero-charge example.', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCollectionReferenceCard(BuildContext context) {
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
            'Collection Reference',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                'PR0021',
                style: TextStyle(
                  color: Color(0xFF1B0D05),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'serif',
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Clipboard.setData(const ClipboardData(text: 'PR0021'));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Collection Reference PR0021 copied!')),
                  );
                },
                child: const Icon(Icons.copy_rounded, color: Color(0xFFC8801C), size: 20),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            'Show this request at the collection counter.',
            style: TextStyle(color: Color(0xFF786253), fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildAtTheOutletCard() {
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
            'At the Outlet',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 12),
          _buildStepRow(1, 'Show your request and complete identity verification.'),
          const Divider(height: 18, color: Color(0xFFE8DCB9)),
          _buildStepRow(2, 'Check the silver weight and purity.'),
          const Divider(height: 18, color: Color(0xFFE8DCB9)),
          _buildStepRow(3, 'Acknowledge receipt after the silver is handed over.'),
        ],
      ),
    );
  }

  Widget _buildStepRow(int num, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: const Color(0xFFF3E4CD),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFC8801C)),
          ),
          child: Center(
            child: Text(
              num.toString(),
              style: const TextStyle(
                color: Color(0xFFC8801C),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Color(0xFF786253), fontSize: 12.5),
          ),
        ),
      ],
    );
  }

  Widget _buildRequestProgressCard() {
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
            'Request Progress',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 14),
          _buildTimelineItem(
            title: 'Request submitted',
            subtitle: '21 Dec 2026, 11:30 AM',
            isCompleted: true,
            isCurrent: false,
            hasConnector: true,
          ),
          _buildTimelineItem(
            title: 'Processing',
            subtitle: 'Awaiting fulfilment',
            isCompleted: true,
            isCurrent: false,
            hasConnector: true,
          ),
          _buildTimelineItem(
            title: 'Ready for collection',
            subtitle: 'Your silver is ready at the selected outlet.',
            isCompleted: false,
            isCurrent: true,
            hasConnector: true,
          ),
          _buildTimelineItem(
            title: 'Silver handed over',
            subtitle: 'Pending',
            isCompleted: false,
            isCurrent: false,
            hasConnector: false,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF7E7),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE5B864), width: 0.5),
            ),
            child: Row(
              children: const [
                Icon(Icons.info_rounded, color: Color(0xFFC8801C), size: 16),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '10.000 g remains In Process until handover is completed.',
                    style: TextStyle(color: Color(0xFF786253), fontSize: 11.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String subtitle,
    required bool isCompleted,
    required bool isCurrent,
    required bool hasConnector,
  }) {
    Color iconColor;
    Color borderColor;
    Widget? iconWidget;

    if (isCompleted) {
      iconColor = const Color(0xFF2E7D32);
      borderColor = const Color(0xFF2E7D32);
      iconWidget = const Icon(Icons.check, size: 12, color: Colors.white);
    } else if (isCurrent) {
      iconColor = const Color(0xFFC8801C);
      borderColor = const Color(0xFFC8801C);
      iconWidget = Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: Color(0xFFC8801C),
          shape: BoxShape.circle,
        ),
      );
    } else {
      iconColor = Colors.transparent;
      borderColor = const Color(0xFFB0A090);
      iconWidget = null;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isCompleted ? iconColor : (isCurrent ? const Color(0xFFFFFBF2) : Colors.transparent),
                shape: BoxShape.circle,
                border: Border.all(color: borderColor, width: 2),
              ),
              child: Center(child: iconWidget),
            ),
            if (hasConnector)
              Container(
                width: 2,
                height: 32,
                color: isCompleted ? const Color(0xFF2E7D32) : const Color(0xFFDCD0C0),
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isCompleted || isCurrent ? const Color(0xFF1B0D05) : const Color(0xFF786253),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFF786253),
                  fontSize: 11,
                ),
              ),
              if (hasConnector) const SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }

  void _showOutletDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFFFFBF2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Bhadohi Outlet Details',
          style: TextStyle(color: Color(0xFF1B0D05), fontFamily: 'serif', fontSize: 18),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Address:', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC8801C), fontSize: 13)),
            SizedBox(height: 2),
            Text('Sonasutra Gold & Silver Hub, Main Station Road, Bhadohi, Uttar Pradesh - 221401', style: TextStyle(color: Color(0xFF786253), fontSize: 12)),
            SizedBox(height: 12),
            Text('Timings:', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC8801C), fontSize: 13)),
            SizedBox(height: 2),
            Text('Monday - Saturday: 10:00 AM – 7:00 PM (Sunday Closed)', style: TextStyle(color: Color(0xFF786253), fontSize: 12)),
            SizedBox(height: 12),
            Text('Contact:', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC8801C), fontSize: 13)),
            SizedBox(height: 2),
            Text('+91 98765 43210 / support@sonasutra.com', style: TextStyle(color: Color(0xFF786253), fontSize: 12)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close', style: TextStyle(color: Color(0xFFC8801C), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
