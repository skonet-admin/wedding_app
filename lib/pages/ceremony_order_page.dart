import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/theme/theme_colors.dart';

class CeremonyOrderPage extends StatefulWidget {
  const CeremonyOrderPage({super.key});

  @override
  State<CeremonyOrderPage> createState() => _CeremonyOrderPageState();
}

class _CeremonyOrderPageState extends State<CeremonyOrderPage> {
  late final PageController _pageController;
  int _currentIndex = 0;

  final List<Map<String, String>> _ceremonySteps = [
    {
      'subtitle': 'IKU AKA / IKU EZE',
      'number': '01',
      'title': 'The Knock & Enquiry',
      'description': 'The Ekuma family formally knocks on the Okafor door, declaring intent and seeking the father\'s blessing to proceed.',
      'footer': 'Formally opening communication between clans with kola nut and palm wine traditions.',
    },
    {
      'subtitle': 'IME EGO',
      'number': '02',
      'title': 'The Dowry',
      'description': 'The two families negotiate and honour the bride price as a symbolic exchange of gratitude, never a sale of a daughter.',
      'footer': 'Uniting lineage elders, celebrating trust, and bestowing traditional symbolic bride gifts.',
    },
    {
      'subtitle': 'IGO OGO / WINE CARRYING',
      'number': '03',
      'title': 'The Search',
      'description': 'Amid dancing kinswomen, the bride searches the crowd for her groom, cup of palm wine in hand, to find him amidst cheers.',
      'footer': 'The archaic moment of public declaration as she presents the guard cup exclusively to her husband.',
    },
    {
      'subtitle': 'IGBA NKWU',
      'number': '04',
      'title': 'Tying the Wrapper',
      'description': 'He receives the wine, they drink as one, and before the gathered clan he ties the George wrapper around her waist. Wife and husband, sealed.',
      'footer': 'The final covenant under traditional Igbo law, sealed with prayer, dance, and clan blessings.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WeddingColors.midnightVelvet,
      child: Stack(
        children: [
          // 1. Background Image Fill with Velvet Overlay
          Positioned.fill(
            child: Image.asset(
              'assets/images/ceremony_scrol.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: WeddingColors.midnightVelvet.withValues(alpha: 0.75),
            ),
          ),

          // 2. Main Body Content using safe bounds inside Column
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Header Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: WeddingColors.goldLeaf.withValues(alpha: 0.8), width: 1),
                        borderRadius: BorderRadius.circular(30),
                        color: WeddingColors.midnightVelvet.withValues(alpha: 0.4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.auto_awesome, color: WeddingColors.goldLeaf, size: 13),
                          const SizedBox(width: 8),
                          Text(
                            'THE CEREMONY',
                            style: GoogleFonts.plusJakartaSans(
                              color: WeddingColors.goldLeaf,
                              fontSize: 10.5,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Main Title
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFFF6D6),
                          height: 1.1,
                        ),
                        children: const [
                          TextSpan(text: 'The royal order of\n'),
                          TextSpan(
                            text: 'Igba Nkwu.',
                            style: TextStyle(
                              color: WeddingColors.goldLeaf,
                              decoration: TextDecoration.underline,
                              decorationColor: WeddingColors.goldLeaf,
                              decorationThickness: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Intro Quote Container (Enhanced Liquid Glass)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                WeddingColors.midnightVelvet.withValues(alpha: 0.50),
                                WeddingColors.midnightVelvet.withValues(alpha: 0.25),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: WeddingColors.goldLeaf.withValues(alpha: 0.5), width: 1.2),
                          ),
                          child: Text(
                            '“An Igbo wedding is not a single moment but a procession. Here is the rhythm of the day so you may dance at the right drum.”',
                            style: GoogleFonts.playfairDisplay(
                              fontStyle: FontStyle.italic,
                              color: const Color(0xFFFFF6D6),
                              fontSize: 13,
                              height: 1.3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Strictly contained PageView sizing for the card carousel
                    SizedBox(
                      height: 345,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _ceremonySteps.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return _buildLiquidGlassCard(_ceremonySteps[index]);
                        },
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Pagination Dots Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _ceremonySteps.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 5,
                          width: _currentIndex == index ? 22 : 6,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? WeddingColors.goldLeaf
                                : WeddingColors.goldLeaf.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // True Liquid Glass Frosted Card Style
  Widget _buildLiquidGlassCard(Map<String, String> step) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  WeddingColors.midnightVelvet.withValues(alpha: 0.55),
                  WeddingColors.midnightVelvet.withValues(alpha: 0.25),
                ],
              ),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: WeddingColors.goldLeaf.withValues(alpha: 0.8),
                width: 1.3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.35),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: CustomPaint(
                    size: const Size(18, 18),
                    painter: CornerBracketPainter(isTopRight: true),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: CustomPaint(
                    size: const Size(18, 18),
                    painter: CornerBracketPainter(isTopRight: false),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          step['subtitle']!,
                          style: GoogleFonts.plusJakartaSans(
                            color: WeddingColors.goldLeaf,
                            fontSize: 10.5,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Text(
                          step['number']!,
                          style: GoogleFonts.playfairDisplay(
                            color: WeddingColors.goldLeaf,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      step['title']!,
                      style: GoogleFonts.playfairDisplay(
                        color: const Color(0xFFFFF6D6),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      step['description']!,
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white70,
                        fontSize: 12.5,
                        height: 1.35,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    const Divider(color: Color(0x40C5A059), height: 10, thickness: 1),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.auto_awesome, color: WeddingColors.goldLeaf, size: 11),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            step['footer']!,
                            style: GoogleFonts.playfairDisplay(
                              fontStyle: FontStyle.italic,
                              color: WeddingColors.goldLeaf,
                              fontSize: 10.5,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (_currentIndex > 0) {
                                  _pageController.previousPage(
                                    duration: const Duration(milliseconds: 350),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: WeddingColors.goldLeaf, width: 1),
                                  color: WeddingColors.midnightVelvet.withValues(alpha: 0.5),
                                ),
                                child: const Icon(Icons.chevron_left, color: WeddingColors.goldLeaf, size: 15),
                              ),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                if (_currentIndex < _ceremonySteps.length - 1) {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 350),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: WeddingColors.goldLeaf, width: 1),
                                  color: WeddingColors.midnightVelvet.withValues(alpha: 0.5),
                                ),
                                child: const Icon(Icons.chevron_right, color: WeddingColors.goldLeaf, size: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CornerBracketPainter extends CustomPainter {
  final bool isTopRight;

  CornerBracketPainter({required this.isTopRight});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = WeddingColors.goldLeaf.withValues(alpha: 0.8)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final path = Path();
    if (isTopRight) {
      path.moveTo(0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
    } else {
      path.moveTo(size.width, 0);
      path.lineTo(0, 0);
      path.lineTo(0, size.height);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}