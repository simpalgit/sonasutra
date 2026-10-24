import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import 'gold_sip_report_screen.dart';

class GoldSipLoadingScreen extends StatefulWidget {
  const GoldSipLoadingScreen({super.key});

  @override
  State<GoldSipLoadingScreen> createState() => _GoldSipLoadingScreenState();
}

class _GoldSipLoadingScreenState extends State<GoldSipLoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;

  double _progress = 0.0;
  String _statusText = 'Connecting to SonaSutra Gold Ledger...';
  Timer? _timer;

  final List<Map<String, dynamic>> _loadingSteps = [
    {'progress': 0.25, 'text': 'Connecting to SonaSutra Gold Ledger...'},
    {'progress': 0.55, 'text': 'Fetching live gold market rate (₹7,518.60/g)...'},
    {'progress': 0.82, 'text': 'Auditing SIP transactions & GST records...'},
    {'progress': 1.00, 'text': 'Generating Gold SIP Account Statement...'},
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.92, end: 1.08).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _startLoadingProcess();
  }

  void _startLoadingProcess() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted) return;

      setState(() {
        _progress += 0.08;
        if (_progress > 1.0) _progress = 1.0;

        for (var step in _loadingSteps) {
          if (_progress <= (step['progress'] as double)) {
            _statusText = step['text'] as String;
            break;
          }
        }
      });

      if (_progress >= 1.0) {
        _timer?.cancel();
        Future.delayed(const Duration(milliseconds: 400), () {
          if (!mounted) return;
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const GoldSipReportScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 600),
            ),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF140B06), // Rich luxury brown dark background
      body: Stack(
        children: [
          // Background Gradient Glow
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0, -0.2),
                  radius: 1.1,
                  colors: [
                    Color(0xFF3D210F),
                    Color(0xFF221108),
                    Color(0xFF120804),
                    Color(0xFF090402),
                  ],
                ),
              ),
            ),
          ),

          // Ambient Golden Light Orb
          Center(
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFE5B864).withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Main Loading Content
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),

                    // Animated Logo & Gold Orb
                    ScaleTransition(
                      scale: _pulseAnimation,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Outer glowing ring
                          Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFFE5B864).withValues(alpha: 0.3),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFE5B864).withValues(alpha: 0.2),
                                  blurRadius: 30,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                          ),

                          // Inner circular badge
                          Container(
                            width: 120,
                            height: 120,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF381F10),
                                  Color(0xFF200F06),
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              width: 70,
                              height: 65,
                              child: CustomPaint(
                                painter: LogoSymbolPainter(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 36),

                    // Title
                    const Text(
                      'Gold SIP Account Statement',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFAF7F3),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'serif',
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 8),

                    const Text(
                      'Generating your official gold investment report...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFCBB6A4),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Gold Shimmer Progress Bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 8,
                        width: double.infinity,
                        color: const Color(0xFF2E1B10),
                        child: Stack(
                          children: [
                            FractionallySizedBox(
                              widthFactor: _progress,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFC48B22),
                                      Color(0xFFF9D889),
                                      Color(0xFFE5B864),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Progress Percentage & Dynamic Status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            _statusText,
                            style: const TextStyle(
                              color: Color(0xFFE5B864),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${(_progress * 100).toInt()}%',
                          style: const TextStyle(
                            color: Color(0xFFFAF7F3),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // Skip / Immediate View Link
                    TextButton(
                      onPressed: () {
                        _timer?.cancel();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const GoldSipReportScreen(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'View Statement Immediately',
                            style: TextStyle(
                              color: Color(0xFFA08260),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 14,
                            color: Color(0xFFA08260),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
