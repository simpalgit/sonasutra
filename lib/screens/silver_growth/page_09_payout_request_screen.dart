import 'package:flutter/material.dart';
import '../../widgets/silver_bar_graphic.dart';
import 'page_10_my_plans_screen.dart';

class Page09PayoutRequestScreen extends StatefulWidget {
  const Page09PayoutRequestScreen({super.key});

  @override
  State<Page09PayoutRequestScreen> createState() =>
      _Page09PayoutRequestScreenState();
}

class _Page09PayoutRequestScreenState extends State<Page09PayoutRequestScreen> {
  String selectedMethod = 'Physical Silver';

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
          'Request Payout',
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
                // Available Balance Hero Banner
                _buildAvailableBalanceCard(),
                const SizedBox(height: 18),

                // Choose Payout Method Section
                const Text(
                  'Choose Payout Method',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif',
                    color: Color(0xFF1B0D05),
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Select how you would like to receive your monthly benefit.',
                  style: TextStyle(color: Color(0xFF786253), fontSize: 12.5),
                ),
                const SizedBox(height: 14),

                // Physical Silver Option
                _buildMethodOptionCard(
                  title: 'Physical Silver',
                  desc: 'Receive 999 purity silver coins or bars.',
                  extra: 'Collection from Bhadohi Showroom',
                  icon: Icons.workspace_premium_rounded,
                  isSelected: selectedMethod == 'Physical Silver',
                  onTap: () => setState(() => selectedMethod = 'Physical Silver'),
                ),
                const SizedBox(height: 12),

                // Bank Amount Option
                _buildMethodOptionCard(
                  title: 'Bank Amount',
                  desc: 'Direct transfer to your registered bank account.',
                  extra: 'Current rate: ₹7,450 / 10g',
                  icon: Icons.account_balance_rounded,
                  isSelected: selectedMethod == 'Bank Amount',
                  onTap: () => setState(() => selectedMethod = 'Bank Amount'),
                ),
                const SizedBox(height: 16),

                // Summary Card
                _buildSummaryCard(),
                const SizedBox(height: 16),

                // Processing Notice Box
                _buildNoticeBox(),
                const SizedBox(height: 20),

                // Primary Button -> Navigates to Page 10 (My Plans)
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
                          builder: (context) => const Page10MyPlansScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Continue to My Plans',
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
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvailableBalanceCard() {
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
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Available for Payout', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 12)),
              SizedBox(height: 4),
              Text(
                '10.000 g',
                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'serif'),
              ),
              SizedBox(height: 2),
              Text('999 Purity Silver', style: TextStyle(color: Color(0xFFE5B864), fontSize: 11, fontWeight: FontWeight.bold)),
            ],
          ),
          const SilverBarGraphic(width: 75, height: 75),
        ],
      ),
    );
  }

  Widget _buildMethodOptionCard({
    required String title,
    required String desc,
    required String extra,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF3DB) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? const Color(0xFFC8801C) : const Color(0xFFE0D5C5),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? const Color(0xFFC8801C) : const Color(0xFF786253),
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 14.5, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text(desc, style: const TextStyle(color: Color(0xFF786253), fontSize: 11.5)),
                  const SizedBox(height: 4),
                  Text(extra, style: const TextStyle(color: Color(0xFFC8801C), fontSize: 11, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Icon(icon, color: const Color(0xFFC8801C), size: 26),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
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
            'Request Summary',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'serif', color: Color(0xFF1B0D05)),
          ),
          const SizedBox(height: 12),
          _buildRow('Payout Quantity', '10.000 g'),
          const Divider(height: 14, color: Color(0xFFE8DCB9)),
          _buildRow('Method', selectedMethod),
          if (selectedMethod == 'Bank Amount') ...[
            const Divider(height: 14, color: Color(0xFFE8DCB9)),
            _buildRow('Estimated Amount', '₹7,450.00'),
          ],
        ],
      ),
    );
  }

  Widget _buildNoticeBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF7E7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5B864), width: 0.5),
      ),
      child: Row(
        children: const [
          Icon(Icons.info_outline_rounded, color: Color(0xFFC8801C), size: 18),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Payouts are processed within 2-3 working days after request submission.',
              style: TextStyle(color: Color(0xFF786253), fontSize: 11.5),
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
        Text(value, style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
