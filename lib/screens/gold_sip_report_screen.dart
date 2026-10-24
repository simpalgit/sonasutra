import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import 'gold_sip_loading_screen.dart';

class GoldSipReportScreen extends StatefulWidget {
  const GoldSipReportScreen({super.key});

  @override
  State<GoldSipReportScreen> createState() => _GoldSipReportScreenState();
}

class _GoldSipReportScreenState extends State<GoldSipReportScreen> {
  String _selectedPeriod = '01 Jul 2026 - 14 Oct 2026';

  final List<Map<String, String>> _transactions = [
    {
      'date': '14 Oct 2026',
      'type': 'SIP Purchase',
      'amount': '₹10',
      'goldQty': '0.0013 g',
      'buyingPrice': '₹7,518.46',
      'totalValue': '₹10.00',
      'status': 'Completed',
      'paymentMode': 'UPI AutoPay',
    },
    {
      'date': '13 Oct 2026',
      'type': 'SIP Purchase',
      'amount': '₹10',
      'goldQty': '0.0013 g',
      'buyingPrice': '₹7,476.72',
      'totalValue': '₹10.00',
      'status': 'Completed',
      'paymentMode': 'UPI AutoPay',
    },
    {
      'date': '12 Oct 2026',
      'type': 'SIP Purchase',
      'amount': '₹10',
      'goldQty': '0.0013 g',
      'buyingPrice': '₹7,529.65',
      'totalValue': '₹10.00',
      'status': 'Completed',
      'paymentMode': 'UPI AutoPay',
    },
    {
      'date': '11 Oct 2026',
      'type': 'SIP Purchase',
      'amount': '₹10',
      'goldQty': '0.0013 g',
      'buyingPrice': '₹7,612.18',
      'totalValue': '₹10.00',
      'status': 'Completed',
      'paymentMode': 'UPI AutoPay',
    },
    {
      'date': '10 Oct 2026',
      'type': 'SIP Purchase',
      'amount': '₹10',
      'goldQty': '0.0013 g',
      'buyingPrice': '₹7,580.96',
      'totalValue': '₹10.00',
      'status': 'Completed',
      'paymentMode': 'UPI AutoPay',
    },
    {
      'date': '09 Oct 2026',
      'type': 'SIP Purchase',
      'amount': '₹10',
      'goldQty': '0.0013 g',
      'buyingPrice': '₹7,548.35',
      'totalValue': '₹10.00',
      'status': 'Completed',
      'paymentMode': 'UPI AutoPay',
    },
    {
      'date': '08 Oct 2026',
      'type': 'SIP Purchase',
      'amount': '₹10',
      'goldQty': '0.0013 g',
      'buyingPrice': '₹7,421.90',
      'totalValue': '₹10.00',
      'status': 'Completed',
      'paymentMode': 'UPI AutoPay',
    },
    {
      'date': '07 Oct 2026',
      'type': 'SIP Purchase',
      'amount': '₹10',
      'goldQty': '0.0013 g',
      'buyingPrice': '₹7,389.22',
      'totalValue': '₹10.00',
      'status': 'Completed',
      'paymentMode': 'UPI AutoPay',
    },
    {
      'date': '06 Oct 2026',
      'type': 'SIP Purchase',
      'amount': '₹10',
      'goldQty': '0.0013 g',
      'buyingPrice': '₹7,352.18',
      'totalValue': '₹10.00',
      'status': 'Completed',
      'paymentMode': 'UPI AutoPay',
    },
    {
      'date': '05 Oct 2026',
      'type': 'SIP Purchase',
      'amount': '₹10',
      'goldQty': '0.0014 g',
      'buyingPrice': '₹7,318.45',
      'totalValue': '₹10.00',
      'status': 'Completed',
      'paymentMode': 'UPI AutoPay',
    },
  ];

  void _showDownloadSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF2B1407),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Row(
          children: const [
            Icon(Icons.check_circle_rounded, color: Color(0xFFE5B864)),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Gold SIP Account Statement PDF downloaded successfully!',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2027),
      initialDateRange: DateTimeRange(
        start: DateTime(2026, 7, 1),
        end: DateTime(2026, 10, 14),
      ),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF3B1E0F),
              onPrimary: Colors.white,
              surface: Color(0xFFFFFBF2),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedPeriod =
            '${picked.start.day.toString().padLeft(2, '0')} ${_getMonthAbbr(picked.start.month)} ${picked.start.year} - ${picked.end.day.toString().padLeft(2, '0')} ${_getMonthAbbr(picked.end.month)} ${picked.end.year}';
      });
    }
  }

  String _getMonthAbbr(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F2), // Premium warm cream background
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1007),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Color(0xFFE5B864), size: 20),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'Gold SIP Account Statement',
          style: TextStyle(
            color: Color(0xFFFAF7F3),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded, color: Color(0xFFE5B864)),
            tooltip: 'Re-generate Statement',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const GoldSipLoadingScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.file_download_outlined,
                color: Color(0xFFE5B864)),
            tooltip: 'Download Statement PDF',
            onPressed: _showDownloadSuccess,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDF9),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFEFE6D8), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Statement Top Banner Section
                _buildStatementBanner(context),

                const SizedBox(height: 14),

                // 2. User & Generation Info Row
                _buildUserInfoRow(),

                const SizedBox(height: 16),

                // 3. Gold SIP Summary
                _buildGoldSipSummarySection(),

                const SizedBox(height: 16),

                // 4. Holdings & Investment Summary Cards Row
                _buildHoldingsAndInvestmentRow(),

                const SizedBox(height: 18),

                // 5. Transaction History Table
                _buildTransactionHistorySection(),

                const SizedBox(height: 18),

                // 6. Important Information & Footer Branding
                _buildImportantInformationSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- 1. Statement Banner ---
  Widget _buildStatementBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2C48E), width: 1),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFFDF8),
            Color(0xFFFFF7E3),
            Color(0xFFFBEFCF),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background Golden Bar & Mountain Art Graphics
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 190,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: CustomPaint(
                painter: HeaderGoldBarGraphicPainter(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Brand Logo & Report Period Pill
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SonaSutra Logo Left
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 30,
                                height: 26,
                                child: CustomPaint(
                                  painter: LogoSymbolPainter(),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'SONASUTRA',
                                    style: TextStyle(
                                      color: Color(0xFF2B1407),
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.0,
                                      fontFamily: 'serif',
                                    ),
                                  ),
                                  Text(
                                    'ESTD. 1988',
                                    style: TextStyle(
                                      color: Color(0xFF8C5B21),
                                      fontSize: 7.5,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.6,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'YOUR STORY IN EVERY SPARKLE',
                            style: TextStyle(
                              color: Color(0xFF8C5B21),
                              fontSize: 6.5,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 6),

                    // Report Period Pill Right
                    GestureDetector(
                      onTap: _selectDateRange,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.95),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: const Color(0xFFE5C07B), width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.calendar_month_rounded,
                                color: Color(0xFF8C5B21), size: 13),
                            const SizedBox(width: 4),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Report Period',
                                  style: TextStyle(
                                    color: Color(0xFF8C5B21),
                                    fontSize: 7.5,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  _selectedPeriod,
                                  style: const TextStyle(
                                    color: Color(0xFF2B1407),
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Center Title & Subtitle
                SizedBox(
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Gold SIP',
                        style: TextStyle(
                          color: Color(0xFF1E1007),
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'serif',
                          height: 1.0,
                        ),
                      ),
                      Text(
                        'Account Statement',
                        style: TextStyle(
                          color: Color(0xFF2B1407),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'serif',
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Track, manage and grow your gold wealth',
                        style: TextStyle(
                          color: Color(0xFF6B513E),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
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

  // --- 2. User Info Row ---
  Widget _buildUserInfoRow() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isNarrow = constraints.maxWidth < 480;
        return Flex(
          direction: isNarrow ? Axis.vertical : Axis.horizontal,
          children: [
            // User Details Card
            Expanded(
              flex: isNarrow ? 0 : 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBF2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFE2A64B),
                      ),
                      child: const Icon(Icons.person, color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Chandan Soni',
                            style: TextStyle(
                              color: Color(0xFF1E1007),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'serif',
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Customer ID: SS100458',
                            style: TextStyle(
                              color: Color(0xFF786253),
                              fontSize: 10.5,
                            ),
                          ),
                          Text(
                            'Mobile: +91 98765 43210',
                            style: TextStyle(
                              color: Color(0xFF786253),
                              fontSize: 10.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (isNarrow) const SizedBox(height: 8) else const SizedBox(width: 10),

            // Generation Info Card
            Expanded(
              flex: isNarrow ? 0 : 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBF2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFC8801C),
                      ),
                      child: const Icon(Icons.article_rounded,
                          color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Statement Generated On',
                            style: TextStyle(
                              color: Color(0xFF786253),
                              fontSize: 10.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '14 Oct 2026, 10:30 AM',
                            style: TextStyle(
                              color: Color(0xFF1E1007),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'All amounts are inclusive of GST.',
                            style: TextStyle(
                              color: Color(0xFF8C715E),
                              fontSize: 9.5,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // --- 3. Gold SIP Summary ---
  Widget _buildGoldSipSummarySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Row
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3DB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.monetization_on_rounded,
                  color: Color(0xFFC8801C), size: 18),
            ),
            const SizedBox(width: 8),
            const Text(
              'Gold SIP Summary',
              style: TextStyle(
                color: Color(0xFF2B1407),
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'serif',
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // Summary Metric Cards Grid
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              // 1. SIP Status
              _buildSummaryPillCard(
                label: 'SIP Status',
                content: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2F3E7),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: const Color(0xFFBBF7D0).withValues(alpha: 0.6),
                        width: 0.8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.check_circle_rounded,
                          color: Color(0xFF16A34A), size: 13),
                      SizedBox(width: 4),
                      Text(
                        'Active',
                        style: TextStyle(
                          color: Color(0xFF15803D),
                          fontSize: 10.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // 2. SIP Amount
              _buildSummaryPillCard(
                label: 'SIP Amount',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '₹100',
                      style: TextStyle(
                        color: Color(0xFF1E1007),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Per Day',
                      style: TextStyle(
                        color: Color(0xFF8C715E),
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // 3. Frequency
              _buildSummaryPillCard(
                label: 'Frequency',
                content: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3DB),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.calendar_month_rounded,
                          color: Color(0xFFC8801C), size: 13),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Daily',
                      style: TextStyle(
                        color: Color(0xFF1E1007),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // 4. Start Date
              _buildSummaryPillCard(
                label: 'Start Date',
                content: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3DB),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.calendar_month_rounded,
                          color: Color(0xFFC8801C), size: 13),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      '14 Oct 2026',
                      style: TextStyle(
                        color: Color(0xFF1E1007),
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // 5. Live Gold Rate
              _buildSummaryPillCard(
                label: 'Live Gold Rate',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.trending_up_rounded,
                            color: Color(0xFFC8801C), size: 15),
                        SizedBox(width: 3),
                        Text(
                          '₹7,518.60/g',
                          style: TextStyle(
                            color: Color(0xFF1E1007),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF1E8E3E),
                          ),
                        ),
                        const SizedBox(width: 3),
                        const Text(
                          'Live Market Price',
                          style: TextStyle(
                            color: Color(0xFF137333),
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryPillCard({
    required String label,
    required Widget content,
  }) {
    return Container(
      constraints: const BoxConstraints(minWidth: 110),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF8),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF8C715E),
              fontSize: 9.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          content,
        ],
      ),
    );
  }

  // --- 4. Holdings & Investment Cards Row ---
  Widget _buildHoldingsAndInvestmentRow() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isNarrow = constraints.maxWidth < 540;
        return Flex(
          direction: isNarrow ? Axis.vertical : Axis.horizontal,
          children: [
            // Your Gold Holdings Card
            Expanded(
              flex: isNarrow ? 0 : 1,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBF2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF3DB),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.savings_rounded,
                              color: Color(0xFFC8801C), size: 16),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Your Gold Holdings',
                          style: TextStyle(
                            color: Color(0xFF2B1407),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'serif',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        // Stack of Gold Coins & Bars 3D Illustration
                        SizedBox(
                          width: 85,
                          height: 75,
                          child: CustomPaint(
                            painter: YourHoldingsGoldCoinsPainter(),
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Values Column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Current Value',
                                style: TextStyle(
                                  color: Color(0xFF8C715E),
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '₹15,036',
                                style: TextStyle(
                                  color: Color(0xFF1E1007),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'serif',
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Total Gold Accumulated',
                                style: TextStyle(
                                  color: Color(0xFF8C715E),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '0.0266 g',
                                style: TextStyle(
                                  color: Color(0xFF1E1007),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'serif',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            if (isNarrow) const SizedBox(height: 10) else const SizedBox(width: 10),

            // Investment Summary Card
            Expanded(
              flex: isNarrow ? 0 : 1,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBF2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF3DB),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.work_history_rounded,
                              color: Color(0xFFC8801C), size: 16),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Investment Summary',
                          style: TextStyle(
                            color: Color(0xFF2B1407),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'serif',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // 2x2 Grid of details
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Col: Total Invested & Avg Buying Price
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Total Invested',
                                style: TextStyle(
                                  color: Color(0xFF8C715E),
                                  fontSize: 10.5,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '₹200',
                                style: TextStyle(
                                  color: Color(0xFF1E1007),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Average Buying Price',
                                style: TextStyle(
                                  color: Color(0xFF8C715E),
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '₹7,518.42/g',
                                style: TextStyle(
                                  color: Color(0xFF1E1007),
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Right Col: Total Gain & Current Value
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Total Gain',
                                style: TextStyle(
                                  color: Color(0xFF8C715E),
                                  fontSize: 10.5,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: const [
                                  Text(
                                    '₹57 ',
                                    style: TextStyle(
                                      color: Color(0xFF1E1007),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '+14.30%',
                                    style: TextStyle(
                                      color: Color(0xFF137333),
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Current Value',
                                style: TextStyle(
                                  color: Color(0xFF8C715E),
                                  fontSize: 10,
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                '₹15,036',
                                style: TextStyle(
                                  color: Color(0xFF1E1007),
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                '0.0266 g',
                                style: TextStyle(
                                  color: Color(0xFF8C715E),
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // --- 5. Transaction History Table ---
  Widget _buildTransactionHistorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title & Totals Summary Row (Wrap to avoid right overflow on mobile!)
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 12,
          runSpacing: 6,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3DB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.access_time_filled_rounded,
                      color: Color(0xFFC8801C), size: 16),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Transaction History',
                  style: TextStyle(
                    color: Color(0xFF2B1407),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif',
                  ),
                ),
              ],
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: Color(0xFF786253),
                  fontSize: 10.5,
                ),
                children: [
                  TextSpan(text: 'Total Purchases: '),
                  TextSpan(
                    text: '₹200',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFF1E1007)),
                  ),
                  TextSpan(text: '  |  Total Gold: '),
                  TextSpan(
                    text: '0.0266 g',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFF1E1007)),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // Scrollable Styled Table
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFEFE6D8), width: 1),
            ),
            child: DataTable(
              headingRowColor:
                  WidgetStateProperty.all(const Color(0xFFFFF3DB)),
              headingTextStyle: const TextStyle(
                color: Color(0xFF8C5B21),
                fontSize: 10.5,
                fontWeight: FontWeight.bold,
              ),
              dataRowMinHeight: 36,
              dataRowMaxHeight: 38,
              horizontalMargin: 10,
              columnSpacing: 14,
              columns: const [
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Type')),
                DataColumn(label: Text('Amount')),
                DataColumn(label: Text('Gold Quantity')),
                DataColumn(label: Text('Buying Price (₹/g)')),
                DataColumn(label: Text('Total Value')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Payment Mode')),
              ],
              rows: _transactions.map((tx) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        tx['date']!,
                        style: const TextStyle(
                          color: Color(0xFF2B1407),
                          fontSize: 11,
                        ),
                      ),
                    ),
                    DataCell(
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CustomPaint(
                              painter: TableGoldCoinIconPainter(),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            tx['type']!,
                            style: const TextStyle(
                              color: Color(0xFF2B1407),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DataCell(
                      Text(
                        tx['amount']!,
                        style: const TextStyle(
                          color: Color(0xFF2B1407),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        tx['goldQty']!,
                        style: const TextStyle(
                          color: Color(0xFF2B1407),
                          fontSize: 11,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        tx['buyingPrice']!,
                        style: const TextStyle(
                          color: Color(0xFF2B1407),
                          fontSize: 11,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        tx['totalValue']!,
                        style: const TextStyle(
                          color: Color(0xFF2B1407),
                          fontSize: 11,
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3.5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2F3E7),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: const Color(0xFFBBF7D0).withValues(alpha: 0.6),
                              width: 0.8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.check_circle_rounded,
                                color: Color(0xFF16A34A), size: 12),
                            const SizedBox(width: 4),
                            Text(
                              tx['status']!,
                              style: const TextStyle(
                                color: Color(0xFF15803D),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        tx['paymentMode']!,
                        style: const TextStyle(
                          color: Color(0xFF5A4435),
                          fontSize: 10.5,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  // --- 6. Important Information & Footer ---
  Widget _buildImportantInformationSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isNarrow = constraints.maxWidth < 480;
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFBF2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF3E4CD), width: 1),
          ),
          child: isNarrow
              ? Column(
                  children: [
                    // Info Badge & Bullet points
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFC8801C),
                              ),
                              child: const Icon(Icons.info_outline_rounded,
                                  color: Colors.white, size: 16),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Important Information',
                              style: TextStyle(
                                color: Color(0xFF2B1407),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'serif',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        _buildBulletPoint(
                            'This statement shows all your Gold SIP purchases for the selected period.'),
                        _buildBulletPoint(
                            'Gold quantity is calculated based on the live market rate at the time of purchase.'),
                        _buildBulletPoint('GST is included in all amounts.'),
                        _buildBulletPoint(
                            'This is a system generated statement and does not require a signature.'),
                      ],
                    ),

                    const SizedBox(height: 14),
                    const Divider(color: Color(0xFFEFE0C9), height: 1),
                    const SizedBox(height: 12),

                    // SonaSutra Footer Logo & Branding
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40,
                          height: 35,
                          child: CustomPaint(
                            painter: LogoSymbolPainter(),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'SONASUTRA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF2B1407),
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'serif',
                            letterSpacing: 1.0,
                          ),
                        ),
                        const Text(
                          'ESTD. 1988',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF8C5B21),
                            fontSize: 8,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'YOUR STORY IN EVERY SPARKLE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF8C5B21),
                            fontSize: 7,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Info Badge & Bullet points
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFC8801C),
                                ),
                                child: const Icon(Icons.info_outline_rounded,
                                    color: Colors.white, size: 16),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Important Information',
                                style: TextStyle(
                                  color: Color(0xFF2B1407),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'serif',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          _buildBulletPoint(
                              'This statement shows all your Gold SIP purchases for the selected period.'),
                          _buildBulletPoint(
                              'Gold quantity is calculated based on the live market rate at the time of purchase.'),
                          _buildBulletPoint('GST is included in all amounts.'),
                          _buildBulletPoint(
                              'This is a system generated statement and does not require a signature.'),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Divider Line
                    Container(
                      width: 1,
                      height: 110,
                      color: const Color(0xFFEFE0C9),
                    ),

                    const SizedBox(width: 12),

                    // SonaSutra Footer Logo & Branding
                    SizedBox(
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 40,
                            height: 35,
                            child: CustomPaint(
                              painter: LogoSymbolPainter(),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'SONASUTRA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF2B1407),
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'serif',
                              letterSpacing: 1.0,
                            ),
                          ),
                          const Text(
                            'ESTD. 1988',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF8C5B21),
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'YOUR STORY IN EVERY SPARKLE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF8C5B21),
                              fontSize: 7,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '•  ',
            style: TextStyle(
              color: Color(0xFF8C5B21),
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF6B513E),
                fontSize: 10,
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- 1. Custom Painter for Gold Bar, Coin & Mountain Graphic in Header (Blue Circle 1) ---
class HeaderGoldBarGraphicPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Golden Mountain Backdrop
    final mountainGradient1 = const LinearGradient(
      colors: [Color(0xFFFBE5AD), Color(0xFFE2B258), Color(0xFFB8821C)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(Rect.fromLTWH(0, 0, w, h));

    final mountainPaint1 = Paint()..shader = mountainGradient1;

    final path1 = Path();
    path1.moveTo(w * 0.1, h);
    path1.lineTo(w * 0.45, h * 0.12);
    path1.lineTo(w * 0.85, h);
    path1.close();
    canvas.drawPath(path1, mountainPaint1);

    final path2 = Path();
    path2.moveTo(w * 0.35, h);
    path2.lineTo(w * 0.72, h * 0.05);
    path2.lineTo(w, h);
    path2.close();
    final mountainPaint2 = Paint()
      ..color = const Color(0xFFD89B31).withValues(alpha: 0.85);
    canvas.drawPath(path2, mountainPaint2);

    // Background Coin Stacks
    _drawCoinStack(canvas, Offset(w * 0.25, h * 0.6), coinRadius: 11, stackCount: 5);
    _drawCoinStack(canvas, Offset(w * 0.9, h * 0.5), coinRadius: 10, stackCount: 6);

    // 3D Fine Gold Bar 999.9
    final barRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.38, h * 0.22, w * 0.48, h * 0.42),
      const Radius.circular(6),
    );

    final barShader = const LinearGradient(
      colors: [
        Color(0xFFFFF7DB),
        Color(0xFFF9D889),
        Color(0xFFE5B864),
        Color(0xFFB8821C),
        Color(0xFF8C5B21),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(w * 0.38, h * 0.22, w * 0.48, h * 0.42));

    final barPaint = Paint()..shader = barShader;
    canvas.drawRRect(barRect, barPaint);

    final highlightPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    canvas.drawRRect(barRect, highlightPaint);

    // Stamp text on gold bar
    final stampTextPaint = TextPainter(
      text: const TextSpan(
        text: 'SONASUTRA\nFINE GOLD\n999.9',
        style: TextStyle(
          color: Color(0xFF52330F),
          fontSize: 6.5,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.5,
          height: 1.1,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    stampTextPaint.layout();
    stampTextPaint.paint(canvas, Offset(w * 0.45, h * 0.3));

    // Foreground 3D Gold Coin
    final coinCenter = Offset(w * 0.78, h * 0.58);
    final coinRadius = h * 0.28;

    final coinShader = const RadialGradient(
      colors: [
        Color(0xFFFFFDF2),
        Color(0xFFFDE6A4),
        Color(0xFFE5B864),
        Color(0xFF9E6D18),
      ],
      stops: [0.0, 0.3, 0.7, 1.0],
    ).createShader(Rect.fromCircle(center: coinCenter, radius: coinRadius));

    final coinPaint = Paint()..shader = coinShader;
    canvas.drawCircle(coinCenter, coinRadius, coinPaint);

    final rimPaint = Paint()
      ..color = const Color(0xFFFFF5D6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;
    canvas.drawCircle(coinCenter, coinRadius * 0.86, rimPaint);

    final innerRimPaint = Paint()
      ..color = const Color(0xFF7A4E11)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawCircle(coinCenter, coinRadius * 0.75, innerRimPaint);

    final diamondPath = Path();
    diamondPath.moveTo(coinCenter.dx, coinCenter.dy - 6);
    diamondPath.lineTo(coinCenter.dx + 6, coinCenter.dy);
    diamondPath.lineTo(coinCenter.dx, coinCenter.dy + 7);
    diamondPath.lineTo(coinCenter.dx - 6, coinCenter.dy);
    diamondPath.close();

    final diamondPaint = Paint()
      ..color = const Color(0xFF52330F)
      ..style = PaintingStyle.fill;
    canvas.drawPath(diamondPath, diamondPaint);
  }

  void _drawCoinStack(Canvas canvas, Offset base, {required double coinRadius, required int stackCount}) {
    for (int i = 0; i < stackCount; i++) {
      final center = Offset(base.dx, base.dy - (i * 3.5));
      final coinShader = const LinearGradient(
        colors: [Color(0xFFFFF2C2), Color(0xFFE5B864), Color(0xFFB8821C)],
      ).createShader(Rect.fromCircle(center: center, radius: coinRadius));

      final paint = Paint()..shader = coinShader;
      canvas.drawOval(
        Rect.fromCenter(center: center, width: coinRadius * 2, height: coinRadius * 0.9),
        paint,
      );

      final rim = Paint()
        ..color = Colors.white.withValues(alpha: 0.6)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.6;
      canvas.drawOval(
        Rect.fromCenter(center: center, width: coinRadius * 2, height: coinRadius * 0.9),
        rim,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// --- 2. Custom Painter for Gold Coin Stacks & Bar in Holdings Card (Pink Circle 2) ---
class YourHoldingsGoldCoinsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Draw 4 realistic coin stacks
    _drawCoinStack(canvas, Offset(w * 0.18, h * 0.78), radius: 11, count: 6);
    _drawCoinStack(canvas, Offset(w * 0.38, h * 0.78), radius: 12, count: 8);
    _drawCoinStack(canvas, Offset(w * 0.58, h * 0.78), radius: 11, count: 5);
    _drawCoinStack(canvas, Offset(w * 0.78, h * 0.78), radius: 10, count: 7);

    // Foreground Gold Bar resting in front
    final barPath = Path();
    barPath.moveTo(w * 0.18, h * 0.82);
    barPath.lineTo(w * 0.76, h * 0.82);
    barPath.lineTo(w * 0.70, h * 0.94);
    barPath.lineTo(w * 0.12, h * 0.94);
    barPath.close();

    final barShader = const LinearGradient(
      colors: [
        Color(0xFFFFF9E3),
        Color(0xFFE5B864),
        Color(0xFFC48B22),
        Color(0xFF8C5B21),
      ],
    ).createShader(Rect.fromLTWH(w * 0.12, h * 0.82, w * 0.64, h * 0.12));

    final barPaint = Paint()..shader = barShader;
    canvas.drawPath(barPath, barPaint);

    final linePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;
    canvas.drawPath(barPath, linePaint);
  }

  void _drawCoinStack(Canvas canvas, Offset base, {required double radius, required int count}) {
    for (int i = 0; i < count; i++) {
      final center = Offset(base.dx, base.dy - (i * 4.0));

      final edgeRect = Rect.fromCenter(
        center: Offset(center.dx, center.dy + 1.2),
        width: radius * 2.1,
        height: radius * 0.75,
      );
      final edgePaint = Paint()..color = const Color(0xFF8C5B21);
      canvas.drawOval(edgeRect, edgePaint);

      final topRect = Rect.fromCenter(
        center: center,
        width: radius * 2.1,
        height: radius * 0.75,
      );

      final topShader = const LinearGradient(
        colors: [
          Color(0xFFFFFDF0),
          Color(0xFFF9D889),
          Color(0xFFE5B864),
          Color(0xFFB8821C),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(topRect);

      final topPaint = Paint()..shader = topShader;
      canvas.drawOval(topRect, topPaint);

      final rimPaint = Paint()
        ..color = Colors.white.withValues(alpha: 0.75)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.7;
      canvas.drawOval(topRect, rimPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// --- 3. Custom Painter for 3D Gold Coin Icon in Table (Green Circle 3) ---
class TableGoldCoinIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final coinShader = const RadialGradient(
      colors: [
        Color(0xFFFFFDF0),
        Color(0xFFF9D889),
        Color(0xFFE5B864),
        Color(0xFF9E6D18),
      ],
      stops: [0.0, 0.35, 0.7, 1.0],
    ).createShader(Rect.fromCircle(center: center, radius: radius));

    final coinPaint = Paint()..shader = coinShader;
    canvas.drawCircle(center, radius, coinPaint);

    final rimPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;
    canvas.drawCircle(center, radius * 0.85, rimPaint);

    final textPainter = TextPainter(
      text: const TextSpan(
        text: '₹',
        style: TextStyle(
          color: Color(0xFF4A2B0F),
          fontSize: 8.5,
          fontWeight: FontWeight.w900,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
        canvas, Offset(center.dx - textPainter.width / 2, center.dy - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
