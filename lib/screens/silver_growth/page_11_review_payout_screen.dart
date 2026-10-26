import 'package:flutter/material.dart';
import 'page_01_programme_overview_screen.dart';
import 'page_10_my_plans_screen.dart';
import 'page_12_confirm_payout_screen.dart';

class Page11ReviewPayoutScreen extends StatefulWidget {
  const Page11ReviewPayoutScreen({super.key});

  @override
  State<Page11ReviewPayoutScreen> createState() =>
      _Page11ReviewPayoutScreenState();
}

class _Page11ReviewPayoutScreenState extends State<Page11ReviewPayoutScreen> {
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
          'Review Payout',
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
            onPressed: () {},
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
                // Stepper
                _buildStepper(),
                const SizedBox(height: 16),

                // Hero Card - Requested Benefit
                _buildHeroCard(),
                const SizedBox(height: 16),

                // Silver Summary Card
                _buildSilverSummaryCard(),
                const SizedBox(height: 16),

                // Collection Details Card
                _buildCollectionDetailsCard(),
                const SizedBox(height: 16),

                // Charges Card
                _buildChargesCard(),
                const SizedBox(height: 16),

                // Locked Principal Notice
                _buildLockedNoticeCard(),
                const SizedBox(height: 20),

                // Continue to Confirmation Button
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
                          builder: (context) => const Page12ConfirmPayoutScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Continue to Confirmation',
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
                const SizedBox(height: 12),

                // Back to payout mode Link
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    child: const Text(
                      'Back to payout mode',
                      style: TextStyle(color: Color(0xFFC8801C), fontSize: 13, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                const SizedBox(height: 4),

                // Footer Text
                const Center(
                  child: Text(
                    'No request has been submitted yet. • Illustrative data • 21 Dec 2026',
                    style: TextStyle(color: Color(0xFF9E8B78), fontSize: 10.5),
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
          } else if (index == 1) {
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

  Widget _buildStepper() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStepItem(1, 'Choose mode', isDone: true),
          Container(width: 20, height: 1.5, color: const Color(0xFF2E7D32)),
          _buildStepItem(2, 'Review', isCurrent: true),
          Container(width: 20, height: 1.5, color: const Color(0xFFDCD0C0)),
          _buildStepItem(3, 'Confirm'),
        ],
      ),
    );
  }

  Widget _buildStepItem(int num, String label, {bool isDone = false, bool isCurrent = false}) {
    return Row(
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: isDone ? const Color(0xFF2E7D32) : (isCurrent ? const Color(0xFFC8801C) : Colors.transparent),
            shape: BoxShape.circle,
            border: Border.all(color: isDone ? const Color(0xFF2E7D32) : (isCurrent ? const Color(0xFFC8801C) : const Color(0xFFB0A090))),
          ),
          child: Center(
            child: isDone
                ? const Icon(Icons.check, size: 12, color: Colors.white)
                : Text(num.toString(), style: TextStyle(color: isCurrent ? Colors.white : const Color(0xFF786253), fontSize: 11, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: isDone || isCurrent ? const Color(0xFF1B0D05) : const Color(0xFF786253),
            fontSize: 11.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildHeroCard() {
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0x33E5B864),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFE5B864), width: 0.8),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.info_outline_rounded, size: 12, color: Color(0xFFE5B864)),
                    SizedBox(width: 4),
                    Text('Illustrative preview', style: TextStyle(color: Color(0xFFE5B864), fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const Text('Plan ID  SG0021', style: TextStyle(color: Color(0xFFD4C2A8), fontSize: 12, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 14),
          const Text('Requested benefit', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 11)),
          const SizedBox(height: 2),
          const Text(
            '10.000 g',
            style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'serif'),
          ),
          const SizedBox(height: 14),
          const Divider(color: Color(0xFF634123), height: 1),
          const SizedBox(height: 12),
          Row(
            children: const [
              Icon(Icons.layers_rounded, color: Color(0xFFE5B864), size: 16),
              SizedBox(width: 6),
              Text(
                'Physical Silver  •  Monthly Payout',
                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSilverSummaryCard() {
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
            'Silver Summary',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 12),
          _buildRow('Available benefit', '10.000 g'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Benefit used', '10.000 g'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Purity', '999'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Physical silver weight', '10.000 g'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Remaining benefit', '0.000 g'),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.info_outline_rounded, size: 12, color: Color(0xFF786253)),
              SizedBox(width: 6),
              Text('Illustration uses 999-equivalent gram balances.', style: TextStyle(color: Color(0xFF786253), fontSize: 10.5)),
            ],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3E4CD),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text('Sample collection option', style: TextStyle(color: Color(0xFF786253), fontSize: 9.5, fontWeight: FontWeight.bold)),
              ),
            ],
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
                    Text('Bhadohi Outlet', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 2),
                    Text('Store pickup', style: TextStyle(color: Color(0xFF786253), fontSize: 11.5)),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Change', style: TextStyle(color: Color(0xFFC8801C), fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF7E7),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE5B864), width: 0.5),
            ),
            child: Row(
              children: const [
                Icon(Icons.info_outline_rounded, color: Color(0xFFC8801C), size: 16),
                SizedBox(width: 8),
                Expanded(
                  child: Text('Visit only after receiving a Ready for Collection notification.', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChargesCard() {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Charges',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'serif',
                  color: Color(0xFF1B0D05),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3E4CD),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text('Sample quote', style: TextStyle(color: Color(0xFF786253), fontSize: 9.5, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildRow('Fulfilment charges', '₹0.00'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Applicable taxes on charges', '₹0.00'),
          const Divider(height: 14, color: Color(0xFFE8DCB9)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Total payable', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 14, fontWeight: FontWeight.bold)),
              Text('₹0.00', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.info_outline_rounded, size: 12, color: Color(0xFF786253)),
              SizedBox(width: 6),
              Expanded(
                child: Text('Actual charges and collection options will appear before confirmation.\nThis is a demonstrative zero-charge scenario, not a promise.', style: TextStyle(color: Color(0xFF786253), fontSize: 10, height: 1.2)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLockedNoticeCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF7E7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5B864), width: 0.5),
      ),
      child: Row(
        children: const [
          Icon(Icons.lock_rounded, color: Color(0xFFC8801C), size: 18),
          SizedBox(width: 10),
          Expanded(
            child: Text('Only earned benefits are used. Your principal silver remains unchanged.', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 11.5, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF786253), fontSize: 12)),
        Text(value, style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 12.5, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
