import 'package:flutter/material.dart';
import 'page_01_programme_overview_screen.dart';
import 'page_08_plan_details_screen.dart';

class Page07ApplicationDetailsScreen extends StatefulWidget {
  const Page07ApplicationDetailsScreen({super.key});

  @override
  State<Page07ApplicationDetailsScreen> createState() =>
      _Page07ApplicationDetailsScreenState();
}

class _Page07ApplicationDetailsScreenState
    extends State<Page07ApplicationDetailsScreen> {
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
          'Application Details',
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
                const SnackBar(content: Text('Help: Quote application ID SG0024 for assistance.')),
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

                // Awaiting Company Approval Notice
                _buildAwaitingApprovalNotice(),
                const SizedBox(height: 16),

                // Application Progress Timeline
                _buildApplicationProgressCard(),
                const SizedBox(height: 16),

                // Activation Details Card
                _buildActivationDetailsCard(),
                const SizedBox(height: 16),

                // Application Documents Card
                _buildApplicationDocumentsCard(),
                const SizedBox(height: 16),

                // Contact Support Tile
                _buildContactSupportCard(context),
                const SizedBox(height: 18),

                // Footer note
                const Center(
                  child: Text(
                    'Illustrative data • As of 21 Dec 2026.',
                    style: TextStyle(fontSize: 11, color: Color(0xFF786253)),
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
              const Text(
                'Application ID  SG0024',
                style: TextStyle(color: Color(0xFFD4C2A8), fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Text('Submitted Silver', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 11)),
          const SizedBox(height: 2),
          const Text(
            '750.000 g',
            style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'serif'),
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
          const SizedBox(height: 12),
          const Text('Submitted on 21 Dec 2026', style: TextStyle(color: Color(0xFFA38F7D), fontSize: 10.5)),
        ],
      ),
    );
  }

  Widget _buildAwaitingApprovalNotice() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBEB),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFFDE68A)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFF59E0B),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.access_time_rounded, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Awaiting company approval',
                  style: TextStyle(color: Color(0xFF92400E), fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  'Your application has been submitted.\nNo action is needed right now.',
                  style: TextStyle(color: Color(0xFFB45309), fontSize: 11.5, height: 1.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplicationProgressCard() {
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
            'Application Progress',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 14),
          _buildProgressStep('Application submitted', '21 Dec 2026', isCompleted: true, hasLine: true),
          _buildProgressStep('Company approval', 'Pending', isCurrent: true, hasLine: true),
          _buildProgressStep('Plan activation', 'After approval', isPending: true, hasLine: false),
        ],
      ),
    );
  }

  Widget _buildProgressStep(String title, String status, {bool isCompleted = false, bool isCurrent = false, bool isPending = false, required bool hasLine}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isCompleted ? const Color(0xFF2E7D32) : (isCurrent ? const Color(0xFFFFFBF2) : Colors.transparent),
                shape: BoxShape.circle,
                border: Border.all(color: isCompleted ? const Color(0xFF2E7D32) : (isCurrent ? const Color(0xFFC8801C) : const Color(0xFFB0A090)), width: 2),
              ),
              child: Center(
                child: isCompleted
                    ? const Icon(Icons.check, size: 12, color: Colors.white)
                    : (isCurrent ? Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFFC8801C), shape: BoxShape.circle)) : null),
              ),
            ),
            if (hasLine) Container(width: 2, height: 28, color: isCompleted ? const Color(0xFF2E7D32) : const Color(0xFFDCD0C0)),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: isCompleted || isCurrent ? const Color(0xFF1B0D05) : const Color(0xFF786253), fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text(status, style: TextStyle(color: isCurrent ? const Color(0xFFC8801C) : const Color(0xFF786253), fontSize: 11, fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal)),
              if (hasLine) const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivationDetailsCard() {
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
            'Activation Details',
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
              Expanded(child: _buildDetailTile(Icons.calendar_today_rounded, 'Start Date', 'Awaiting activation')),
              const SizedBox(width: 10),
              Expanded(child: _buildDetailTile(Icons.calendar_month_rounded, 'End Date', 'Set on activation')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _buildDetailTile(Icons.layers_rounded, 'Earned Silver', 'Not started')),
              const SizedBox(width: 10),
              Expanded(child: _buildDetailTile(Icons.eco_rounded, 'First Benefit Date', 'Set on activation')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.info_outline_rounded, size: 12, color: Color(0xFF786253)),
              SizedBox(width: 6),
              Expanded(child: Text('Dates and earnings begin from the confirmed activation date.', style: TextStyle(color: Color(0xFF786253), fontSize: 10.5))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailTile(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0D5C5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFC8801C), size: 18),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: Color(0xFF786253), fontSize: 10)),
          Text(value, style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 11.5, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildApplicationDocumentsCard() {
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
            'Application Documents',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 12),
          _buildDocumentRow(Icons.description_outlined, 'View Submitted Agreement'),
          const Divider(height: 16, color: Color(0xFFE8DCB9)),
          _buildDocumentRow(Icons.assignment_outlined, 'View Silver Receipt'),
        ],
      ),
    );
  }

  Widget _buildDocumentRow(IconData icon, String title) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFC8801C), size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: const TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold))),
          const Icon(Icons.chevron_right_rounded, color: Color(0xFF786253), size: 18),
        ],
      ),
    );
  }

  Widget _buildContactSupportCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Page08PlanDetailsScreen()),
          );
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF3E4CD),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.headset_mic_rounded, color: Color(0xFFC8801C), size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Contact Support', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13.5, fontWeight: FontWeight.bold)),
                  Text('Quote application ID SG0024 for assistance.', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Color(0xFF786253), size: 18),
          ],
        ),
      ),
    );
  }
}
