import 'package:flutter/material.dart';
import 'page_07_application_details_screen.dart';
import 'pdf_viewer_screen.dart';

class Page06ConsentSubmittedScreen extends StatefulWidget {
  const Page06ConsentSubmittedScreen({super.key});

  @override
  State<Page06ConsentSubmittedScreen> createState() =>
      _Page06ConsentSubmittedScreenState();
}

class _Page06ConsentSubmittedScreenState
    extends State<Page06ConsentSubmittedScreen> {
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
          'Consent Submitted',
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
                const SnackBar(content: Text('Help: Consent submitted and awaiting approval')),
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
                // Status Banner
                _buildVerificationCompleteBanner(),
                const SizedBox(height: 16),

                // Customer Meta Card
                _buildCustomerMetaCard(),
                const SizedBox(height: 16),

                // Submitted Plan Card
                _buildSubmittedPlanCard(),
                const SizedBox(height: 16),

                // Track Application Progress Card
                _buildTrackApplicationCard(),
                const SizedBox(height: 16),

                // Your Documents Card
                _buildYourDocumentsCard(context),
                const SizedBox(height: 20),

                // View Application Button
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
                          builder: (context) => const Page07ApplicationDetailsScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'View Application in My Plans',
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
                const SizedBox(height: 14),

                // Contact Support Button
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFC8801C), width: 1.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Opening Support Chat...')),
                      );
                    },
                    child: const Text(
                      'Contact Support',
                      style: TextStyle(
                        color: Color(0xFF1B0D05),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
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

  Widget _buildVerificationCompleteBanner() {
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
                      'Mobile verification complete',
                      style: TextStyle(
                        color: Color(0xFF1B0D05),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Your consent has been recorded.',
                      style: TextStyle(color: Color(0xFF786253), fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFFE8DCB9), height: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBEB),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFDE68A)),
                ),
                child: const Text(
                  'AWAITING COMPANY APPROVAL',
                  style: TextStyle(color: Color(0xFF92400E), fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                'Your programme is not active yet.',
                style: TextStyle(color: Color(0xFF786253), fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerMetaCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF3E4CD)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF3E4CD),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.person_rounded, color: Color(0xFFC8801C), size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Chandan Soni', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 14, fontWeight: FontWeight.bold)),
                Text('Customer ID: CUST0021', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text('Application: APP0021', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 11, fontWeight: FontWeight.bold)),
              Text('Agreement: SG0021 • Revision 01', style: TextStyle(color: Color(0xFF786253), fontSize: 10)),
              Text('Submitted: 21 Oct 2026', style: TextStyle(color: Color(0xFF786253), fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubmittedPlanCard() {
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
            'Your Submitted Plan',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 12),
          _buildRow('Principal', '1,000.000 g'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Sample basis', '999-equivalent grams'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Purity', '999'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Tenure', '18 months'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Benefit', 'Monthly Payout'),
          const Divider(height: 12, color: Color(0xFFE8DCB9)),
          _buildRow('Scheduled monthly benefit', '10.000 g'),
        ],
      ),
    );
  }

  Widget _buildTrackApplicationCard() {
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
            'Track Your Application',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 14),
          _buildTimelineStep('Silver details confirmed', 'Your silver details have been confirmed.', isCompleted: true, hasLine: true),
          _buildTimelineStep('Plan & benefit selected', 'You have selected your plan and benefit options.', isCompleted: true, hasLine: true),
          _buildTimelineStep('Consent verified & submitted', 'Your consent has been verified and submitted.', isCompleted: true, hasLine: true),
          _buildTimelineStep('Company review', 'Company checks the acceptance record, selected plan and consent.', isCurrent: true, hasLine: true),
          _buildTimelineStep('Programme activation', 'You will see activation and the approved schedule in My Plans.', isPending: true, hasLine: false),
        ],
      ),
    );
  }

  Widget _buildTimelineStep(String title, String subtitle, {bool isCompleted = false, bool isCurrent = false, bool isPending = false, required bool hasLine}) {
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
            if (hasLine)
              Container(width: 2, height: 28, color: isCompleted ? const Color(0xFF2E7D32) : const Color(0xFFDCD0C0)),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: isCompleted || isCurrent ? const Color(0xFF1B0D05) : const Color(0xFF786253), fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text(subtitle, style: const TextStyle(color: Color(0xFF786253), fontSize: 11)),
              if (hasLine) const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildYourDocumentsCard(BuildContext context) {
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
            'Your Documents',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              color: Color(0xFF1B0D05),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Submitted agreement', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold)),
                  Text('The agreement you submitted for company review.', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PdfViewerScreen(
                            title: 'Submitted Agreement PDF',
                            documentNumber: 'SG0021 • Revision 01',
                          ),
                        ),
                      );
                    },
                    child: const Text('View', style: TextStyle(color: Color(0xFFC8801C), fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  const Text('  |  ', style: TextStyle(color: Color(0xFFB0A090), fontSize: 12)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PdfViewerScreen(
                            title: 'Submitted Agreement PDF',
                            documentNumber: 'SG0021 • Revision 01',
                          ),
                        ),
                      );
                    },
                    child: const Text('Download', style: TextStyle(color: Color(0xFFC8801C), fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
          const Divider(height: 20, color: Color(0xFFE8DCB9)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Silver acceptance receipt', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold)),
                  Text('Your acceptance receipt for this application.', style: TextStyle(color: Color(0xFF786253), fontSize: 11)),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PdfViewerScreen(
                        title: 'Silver Acceptance Receipt',
                        documentNumber: 'SR0021 • Revision 01',
                      ),
                    ),
                  );
                },
                child: const Text('View', style: TextStyle(color: Color(0xFFC8801C), fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ],
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
