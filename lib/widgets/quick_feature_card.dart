import 'package:flutter/material.dart';
import 'icons_3d.dart';
import '../screens/gold_sip_loading_screen.dart';
import '../screens/silver_growth_screen.dart';

class QuickFeatureCardsSection extends StatelessWidget {
  const QuickFeatureCardsSection({super.key});

  void _openGoldSip(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const GoldSipLoadingScreen(),
      ),
    );
  }

  void _openSilverGrowth(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SilverGrowthScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FeatureCardItem(
            icon: const GoldBarsIcon(size: 34),
            line1: 'Digital',
            line2: 'Gold SIP',
            onTap: () => _openGoldSip(context),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: FeatureCardItem(
            icon: const SilverBarsIcon(size: 34),
            line1: 'Digital',
            line2: 'Silver SIP',
            onTap: () => _openSilverGrowth(context),
          ),
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: FeatureCardItem(
            icon: GoldNecklaceIcon(size: 34),
            line1: 'Shop',
            line2: 'Jewellery',
          ),
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: FeatureCardItem(
            icon: GoldCoinIcon(size: 34),
            line1: 'Buy',
            line2: 'Coins & Bars',
          ),
        ),
      ],
    );
  }
}

class FeatureCardItem extends StatelessWidget {
  final Widget icon;
  final String line1;
  final String line2;
  final VoidCallback? onTap;

  const FeatureCardItem({
    super.key,
    required this.icon,
    required this.line1,
    required this.line2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFFAF7F3),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: const Color(0xFFEBE0D4),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 38,
              child: Center(child: icon),
            ),
            const SizedBox(height: 6),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3B2011),
                  height: 1.25,
                ),
                children: [
                  TextSpan(text: '$line1\n'),
                  TextSpan(text: '$line2 '),
                  const TextSpan(
                    text: '>',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8C5B21),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
