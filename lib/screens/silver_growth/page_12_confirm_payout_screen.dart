import 'package:flutter/material.dart';
import 'page_01_programme_overview_screen.dart';
import 'page_10_my_plans_screen.dart';
import 'page_13_payout_tracking_screen.dart';

class Page12ConfirmPayoutScreen extends StatefulWidget {
  const Page12ConfirmPayoutScreen({super.key});

  @override
  State<Page12ConfirmPayoutScreen> createState() =>
      _Page12ConfirmPayoutScreenState();
}

class _Page12ConfirmPayoutScreenState extends State<Page12ConfirmPayoutScreen> {
  bool isConfirmed = false;
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
          'Confirm Payout',
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

                // Hero Card - Physical Silver
                _buildHeroCard(),
                const SizedBox(height: 16),

                // Final Request Summary Card
                _buildFinalRequestSummaryCard(),
                const SizedBox(height: 16),

                // What Happens After Submission Card
                _buildWhatHappensAfterSubmissionCard(),
                const SizedBox(height: 16),

                // Your Confirmation Section
                _buildYourConfirmationSection(),
                const SizedBox(height: 20),

                // Back to Review Link
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    child: const Text(
                      'Back to Review',
                      style: TextStyle(color: Color(0xFFC8801C), fontSize: 13, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                const SizedBox(height: 4),

                // Footer Text
                const Center(
                  child: Text(
                    'Illustrative data • 21 Dec 2026',
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
          _buildStepItem(2, 'Review', isDone: true),
          Container(width: 20, height: 1.5, color: const Color(0xFF2E7D32)),
          _buildStepItem(3, 'Confirm', isCurrent: true),
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
          const Text(
            'Physical Silver',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),
          const SizedBox(height: 2),
          const Text('Plan ID  SG0021', style: TextStyle(color: Color(0xFFD4C2A8), fontSize: 12)),
          const SizedBox(height: 12),
          const Text('Silver to collect', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 11)),
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
                '999 purity  •  Monthly benefit',
                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFinalRequestSummaryCard() {
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
            'Final Request Summary',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 12),
          _buildRow('Benefit to reserve', '10.000 g'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Collection method', 'Store pickup'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Collection outlet', 'Bhadohi Outlet'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Charges including taxes', '₹0.00'),
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
              Text('Illustrative zero-charge example.', style: TextStyle(color: Color(0xFF786253), fontSize: 10.5)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWhatHappensAfterSubmissionCard() {
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
            'What happens after submission',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 14),
          _buildTimelineStep('10.000 g moves to In Process', 'Your payout request will be created and the benefit will be marked for collection.', hasLine: true),
          _buildTimelineStep('Company prepares your silver for collection', 'We will arrange and prepare your silver for collection at the selected outlet.', hasLine: true),
          _buildTimelineStep('Visit after Ready for Collection notification', 'You will receive a notification when your silver is ready for collection. Visit the outlet to collect.', hasLine: false),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.info_outline_rounded, size: 12, color: Color(0xFF786253)),
              SizedBox(width: 6),
              Text('Payout completes only after silver handover.', style: TextStyle(color: Color(0xFF786253), fontSize: 10.5)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineStep(String title, String subtitle, {required bool hasLine}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: const Color(0xFFF3E4CD),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFC8801C)),
              ),
              child: const Center(
                child: Icon(Icons.description_outlined, size: 12, color: Color(0xFFC8801C)),
              ),
            ),
            if (hasLine) Container(width: 2, height: 32, color: const Color(0xFFDCD0C0)),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text(subtitle, style: const TextStyle(color: Color(0xFF786253), fontSize: 11)),
              if (hasLine) const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildYourConfirmationSection() {
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
            'Your Confirmation',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 10),
          CheckboxListTile(
            value: isConfirmed,
            onChanged: (val) => setState(() => isConfirmed = val ?? false),
            title: const Text('I confirm the silver quantity, collection outlet and charges, and authorise this payout request.', style: TextStyle(color: Color(0xFF786253), fontSize: 11.5)),
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            contentPadding: EdgeInsets.zero,
            activeColor: const Color(0xFFC8801C),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: const [
                Icon(Icons.article_outlined, size: 14, color: Color(0xFFC8801C)),
                SizedBox(width: 6),
                Text('Read payout terms', style: TextStyle(color: Color(0xFFC8801C), fontSize: 11.5, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isConfirmed ? const Color(0xFF1B0D05) : const Color(0xFFB0A090),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: isConfirmed
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Page13PayoutTrackingScreen(),
                        ),
                      );
                    }
                  : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.lock_outline_rounded, color: Color(0xFFE5B864), size: 16),
                  SizedBox(width: 8),
                  Text(
                    'Confirm & Submit Request',
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
              'Tick the confirmation above to enable submission.',
              style: TextStyle(color: Color(0xFF786253), fontSize: 10.5),
            ),
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
