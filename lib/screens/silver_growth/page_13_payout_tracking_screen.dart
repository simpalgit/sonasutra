import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'page_01_programme_overview_screen.dart';
import 'page_14_collect_silver_screen.dart';

class Page13PayoutTrackingScreen extends StatefulWidget {
  const Page13PayoutTrackingScreen({super.key});

  @override
  State<Page13PayoutTrackingScreen> createState() =>
      _Page13PayoutTrackingScreenState();
}

class _Page13PayoutTrackingScreenState
    extends State<Page13PayoutTrackingScreen> {
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
          'Payout Tracking',
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
                const SnackBar(content: Text('Help: Track your physical silver payout status')),
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
                // Top Status Banner
                _buildSubmittedStatusBanner(),
                const SizedBox(height: 16),

                // Hero Card - Physical Silver
                _buildHeroCard(context),
                const SizedBox(height: 16),

                // Request Progress Timeline Card
                _buildRequestProgressCard(),
                const SizedBox(height: 16),

                // Notice Box
                _buildNoticeBox(),
                const SizedBox(height: 16),

                // Collection Details Card
                _buildCollectionDetailsCard(),
                const SizedBox(height: 16),

                // Benefit Balance Card
                _buildBenefitBalanceCard(),
                const SizedBox(height: 16),

                // Download Request Acknowledgement Card
                _buildDownloadAcknowledgementCard(context),
                const SizedBox(height: 16),

                // Primary Button -> Navigates directly to Page 14 (Collect Your Silver)
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B0D05),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Page14CollectSilverScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'View Collection Pass / Collect Silver',
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
                    'Illustrative data • As of 21 Dec 2026',
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

  Widget _buildSubmittedStatusBanner() {
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
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color(0xFF2E7D32),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Request Submitted',
                  style: TextStyle(
                    color: Color(0xFF1B5E20),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Your payout request has been received.',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Physical Silver',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'serif',
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                      'In Process',
                      style: TextStyle(
                        color: Color(0xFFFBBF24),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
          const Text('Reserved silver', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 11)),
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
          const SizedBox(height: 4),
          const Text(
            'Submitted 21 Dec 2026, 11:30 AM',
            style: TextStyle(color: Color(0xFFA38F7D), fontSize: 11),
          ),
        ],
      ),
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
            isCompleted: false,
            isCurrent: true,
            hasConnector: true,
          ),
          _buildTimelineItem(
            title: 'Ready for collection',
            subtitle: 'You will be notified',
            isCompleted: false,
            isCurrent: false,
            hasConnector: true,
          ),
          _buildTimelineItem(
            title: 'Silver handed over',
            subtitle: 'Payout completes after collection',
            isCompleted: false,
            isCurrent: false,
            hasConnector: false,
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

  Widget _buildNoticeBox() {
    return Container(
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
              'Please wait for Ready for Collection before visiting the outlet.',
              style: TextStyle(color: Color(0xFF786253), fontSize: 11.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollectionDetailsCard() {
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
            'Collection Details',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 12),
          _buildDetailRow('Collection outlet', 'Bhadohi Outlet'),
          const Divider(height: 14, color: Color(0xFFE8DCB9)),
          _buildDetailRow('Collection method', 'Store pickup'),
          const Divider(height: 14, color: Color(0xFFE8DCB9)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Total payable', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold)),
              Text('₹0.00', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
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

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF786253), fontSize: 12)),
        Text(value, style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 12.5, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildBenefitBalanceCard() {
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
            'Benefit Balance',
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
                child: _buildBalanceTile(
                  label: 'Total earned',
                  value: '20.000 g',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildBalanceTile(
                  label: 'Paid out',
                  value: '10.000 g',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildBalanceTile(
                  label: 'In process',
                  value: '10.000 g',
                  isHighlighted: true,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildBalanceTile(
                  label: 'Available',
                  value: '0.000 g',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Icon(Icons.info_outline_rounded, size: 13, color: Color(0xFF786253)),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Reserved silver cannot be requested again while this payout is in process.',
                  style: TextStyle(color: Color(0xFF786253), fontSize: 10.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceTile({
    required String label,
    required String value,
    bool isHighlighted = false,
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
          Text(label, style: const TextStyle(color: Color(0xFF786253), fontSize: 10.5)),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF1B0D05),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadAcknowledgementCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Downloading Request Acknowledgement PDF...')),
          );
        },
        child: Row(
          children: const [
            Icon(Icons.article_outlined, color: Color(0xFFC8801C), size: 20),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Download Request Acknowledgement',
                style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: Color(0xFF786253), size: 18),
          ],
        ),
      ),
    );
  }
}
