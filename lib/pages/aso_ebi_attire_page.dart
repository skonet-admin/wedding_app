import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/theme/theme_colors.dart';

/// FlutterFlow Page: AsoEbiAttirePage (Upgraded Luminous Glow Theme with Brightened Cultural Background Motif)
class AsoEbiAttirePage extends StatelessWidget {
  const AsoEbiAttirePage({super.key});

  final List<Map<String, dynamic>> swatches = const [
    {
      'title': 'Royal Wine',
      'role': 'For the bride\'s kinswomen',
      'hex': '#4A0D18',
      'color': Color(0xFF4A0D18),
    },
    {
      'title': 'Antique Gold',
      'role': 'For the groom\'s family',
      'hex': '#DFB76E',
      'color': Color(0xFFDFB76E),
    },
    {
      'title': 'Warm Beige',
      'role': 'For honoured elders',
      'hex': '#E3BC9A',
      'color': Color(0xFFE3BC9A),
    },
    {
      'title': 'Cocoa Brown',
      'role': 'For the wedding party',
      'hex': '#5C4033',
      'color': Color(0xFF5C4033),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: CustomPaint(
        painter: TraditionalMotifPainter(),
        child: Container(
          color: ThemeColors.midnightVelvet.withValues(alpha: 0.70), // Reduced opacity to let the gold cultural lines shine brightly
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. Overview & Section Header Tag with Gold Dividers
              Row(
                children: [
                  const Expanded(child: Divider(color: ThemeColors.goldLeaf, thickness: 1.0)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'ASO-EBI & ATTIRE',
                        style: GoogleFonts.montserrat(
                          color: ThemeColors.goldLeaf,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(color: ThemeColors.goldLeaf, thickness: 1.0)),
                ],
              ),

              const SizedBox(height: 32.0),

              // Responsive Layout Split
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 768;
                  return isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 5, child: _buildEditorialHeader(context)),
                            const SizedBox(width: 32.0),
                            Expanded(flex: 7, child: _buildSwatchGrid(context)),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildEditorialHeader(context),
                            const SizedBox(height: 32.0),
                            _buildSwatchGrid(context),
                          ],
                        );
                },
              ),
              
              // SECTION DEMARCATION DIVIDER LINE
              const SizedBox(height: 24.0),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        ThemeColors.goldLeaf.withValues(alpha: 0.6),
                        Colors.transparent,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: ThemeColors.goldLeaf.withValues(alpha: 0.2),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditorialHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.playfairDisplay(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFFFDF4),
              height: 1.25,
            ),
            children: const [
              TextSpan(text: 'Come clothed in the '),
              TextSpan(
                text: 'colours ',
                style: TextStyle(
                  color: ThemeColors.goldLeaf,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(text: 'of our day.'),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          'Each family wears its wrapper. If you march with the bride, wine and beige will suit; if you dance with the groom, gold and cocoa brown will do you proud. Gele, okpu agu and coral beads warmly encouraged.',
          style: GoogleFonts.montserrat(
            fontSize: 14.0,
            color: const Color(0xFFFFFDF4).withValues(alpha: 0.9),
            height: 1.6,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 24.0),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: [
            _buildFeatureBadge(Icons.checkroom, 'Gele & Okpu Agu'),
            _buildFeatureBadge(Icons.military_tech_outlined, 'Coral Beads & Isiagu'),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureBadge(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: ThemeColors.goldLeaf, width: 1.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: ThemeColors.goldLeaf, size: 14.0),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              label,
              style: GoogleFonts.montserrat(
                color: const Color(0xFFFFFDF4),
                fontSize: 11.0,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwatchGrid(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double aspectRatio = screenWidth < 400 ? 0.82 : 0.90;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: screenWidth > 600 ? 2 : 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        childAspectRatio: aspectRatio,
      ),
      itemCount: swatches.length,
      itemBuilder: (context, index) {
        final item = swatches[index];
        return ColorSwatchCard(
          cardTitle: item['title']!,
          cardRole: item['role']!,
          swatchColor: item['color'] as Color,
          hexCode: item['hex']!,
        );
      },
    );
  }
}

/// Custom Painter with brightened, clearly visible gold traditional lines & diamond motifs
class TraditionalMotifPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ThemeColors.goldLeaf.withValues(alpha: 0.28) // Increased brightness/opacity
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    const double spacing = 80.0;

    // Draw background geometric traditional weave lines clearly
    for (double i = -size.height; i < size.width + size.height; i += spacing) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        paint,
      );
      canvas.drawLine(
        Offset(i, size.height),
        Offset(i - size.height, 0),
        paint,
      );
    }

    // High-visibility accent traditional diamond motifs
    final accentPaint = Paint()
      ..color = ThemeColors.goldLeaf.withValues(alpha: 0.40) // Prominent gold contrast
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;

    for (double x = 40; x < size.width; x += 160) {
      for (double y = 60; y < size.height; y += 160) {
        _drawDiamondMotif(canvas, Offset(x, y), 26.0, accentPaint);
      }
    }
  }

  void _drawDiamondMotif(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path()
      ..moveTo(center.dx, center.dy - radius)
      ..lineTo(center.dx + radius, center.dy)
      ..lineTo(center.dx, center.dy + radius)
      ..lineTo(center.dx - radius, center.dy)
      ..close();
    canvas.drawPath(path, paint);

    // Inner concentric diamond element
    final innerPath = Path()
      ..moveTo(center.dx, center.dy - radius * 0.5)
      ..lineTo(center.dx + radius * 0.5, center.dy)
      ..lineTo(center.dx, center.dy + radius * 0.5)
      ..lineTo(center.dx - radius * 0.5, center.dy)
      ..close();
    canvas.drawPath(innerPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ColorSwatchCard extends StatefulWidget {
  final String cardTitle;
  final String cardRole;
  final Color swatchColor;
  final String hexCode;

  const ColorSwatchCard({
    super.key,
    required this.cardTitle,
    required this.cardRole,
    required this.swatchColor,
    required this.hexCode,
  });

  @override
  State<ColorSwatchCard> createState() => _ColorSwatchCardState();
}

class _ColorSwatchCardState extends State<ColorSwatchCard> {
  bool _isHovered = false;

  void _copyHexCode(BuildContext context) {
    Clipboard.setData(ClipboardData(text: widget.hexCode));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied ${widget.hexCode} to clipboard!'),
        backgroundColor: ThemeColors.midnightVelvet,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            color: widget.swatchColor,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: _isHovered ? const Color(0xFFFFFDF4) : ThemeColors.goldLeaf,
              width: _isHovered ? 1.5 : 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered ? ThemeColors.goldLeaf.withValues(alpha: 0.56) : const Color(0x60000000),
                blurRadius: _isHovered ? 16.0 : 12.0,
                offset: Offset(0, _isHovered ? 8 : 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xFFD4AF37), width: 2.0),
                      right: BorderSide(color: Color(0xFFD4AF37), width: 2.0),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                                border: Border.all(color: ThemeColors.goldLeaf, width: 1.2),
                              ),
                              child: const Center(
                                child: Icon(Icons.palette, size: 10, color: Color(0xFFFFFDF4)),
                              ),
                            ),
                            const SizedBox(width: 6.0),
                            Flexible(
                              child: Text(
                                widget.hexCode,
                                style: GoogleFonts.montserrat(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFFFFDF4),
                                  letterSpacing: 0.8,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => _copyHexCode(context),
                        borderRadius: BorderRadius.circular(6.0),
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: ThemeColors.goldLeaf, width: 1.0),
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.black.withValues(alpha: 0.2),
                          ),
                          child: const Icon(
                            Icons.copy_rounded,
                            color: Color(0xFFFFFDF4),
                            size: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cardTitle,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFFFDF4),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        widget.cardRole,
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          color: const Color(0xFFFFFDF4).withValues(alpha: 0.9),
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}