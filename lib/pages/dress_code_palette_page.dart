import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/theme/theme_colors.dart';

typedef ThemeColors = WeddingColors;

class DressCodePalettePage extends StatefulWidget {
  const DressCodePalettePage({super.key});

  @override
  State<DressCodePalettePage> createState() => _DressCodePalettePageState();
}

class _DressCodePalettePageState extends State<DressCodePalettePage> {
  final List<Map<String, dynamic>> _colorSwatches = [
    {
      'code': '#C5A059',
      'label': 'EGO GOOLU',
      'title': 'Royal Imperial Gold',
      'description': 'Shimmering gold embroidery, coral bead accessories, and royal George wrapper trimmings.',
      'bestFor': 'Bridal Party Aso-ebi accents, jewellery, & chief titles',
      'color': const Color(0xFFC5A059),
    },
    {
      'code': '#F5EFEB',
      'label': 'OJI WHITE / CHAMPAGNE',
      'title': 'Silken Ivory Beige',
      'description': 'Luminous ivory gele headwraps, crisp linen agbada shirts, and soft elegant contrast layering.',
      'bestFor': 'Gele headwraps, caps, shirt underlays & family ensembles',
      'color': const Color(0xFFF5EFEB),
      'isLight': true,
    },
    {
      'code': '#2B1015',
      'label': 'MMIRI MANYA WINE',
      'title': 'Deep Luxury Burgundy Wine',
      'description': 'Rich wine velvet Isiagu coats, ceremonial wrapper canvas, and royal clan evening attire.',
      'bestFor': 'Main Aso-ebi body, Isiagu velvet jackets & George wrappers',
      'color': const Color(0xFF2B1015),
    },
    {
      'code': '#4A2E1B',
      'label': 'ALA IGBO TEAK',
      'title': 'Warm Igbo Earth Brown',
      'description': 'Warm earth mahogany tone, traditional carved staff highlights, and rich leather footwear.',
      'bestFor': 'Isiagu traditional caps, leather footwear, & staff accents',
      'color': const Color(0xFF4A2E1B),
    },
  ];

  void _copyHexCode(BuildContext context, String hexCode) {
    Clipboard.setData(ClipboardData(text: hexCode));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Copied $hexCode to clipboard!',
          style: GoogleFonts.plusJakartaSans(color: const Color(0xFFFFF6D6)),
        ),
        backgroundColor: const Color(0xFF2B1C2F),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: ThemeColors.goldLeaf.withOpacity(0.6), width: 1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        color: ThemeColors.midnightVelvet,
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Section Header Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: ThemeColors.goldLeaf, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.palette_outlined, color: ThemeColors.goldLeaf, size: 14),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      'DRESS CODE & PALETTE',
                      style: GoogleFonts.plusJakartaSans(
                        color: ThemeColors.goldLeaf,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Main Title
            RichText(
              text: TextSpan(
                style: GoogleFonts.playfairDisplay(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFFF6D6),
                  height: 1.15,
                ),
                children: const [
                  TextSpan(text: 'Attire & Official Colour\n'),
                  TextSpan(
                    text: 'Swatches.',
                    style: TextStyle(
                      color: ThemeColors.goldLeaf,
                      decoration: TextDecoration.underline,
                      decorationColor: ThemeColors.goldLeaf,
                      decorationThickness: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Subtitle Description
            Text(
              'Guests are warmly invited to join the traditional celebration in customary Igbo splendor.',
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white70,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),

            // Attire Guideline Cards
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: ThemeColors.midnightVelvet,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: ThemeColors.goldLeaf.withOpacity(0.5),
                  width: 1.2,
                ),
              ),
              child: Column(
                children: [
                  _buildAttireChip(Icons.checkroom, 'Attire: Aso-ebi, Gele & Isiagu'),
                  const SizedBox(height: 10),
                  _buildAttireChip(Icons.military_tech_outlined, 'Accessories: Coral Beads & George Wrappers'),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Color Swatches Header
            Text(
              'Official Color Palettes',
              style: GoogleFonts.playfairDisplay(
                color: const Color(0xFFFFF6D6),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Color Swatch Cards List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _colorSwatches.length,
              itemBuilder: (context, index) {
                final swatch = _colorSwatches[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ThemeColors.midnightVelvet,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: ThemeColors.goldLeaf.withOpacity(0.5),
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Color Box Display with Hex Badge
                        Container(
                          height: 110,
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: swatch['color'] as Color,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: ThemeColors.goldLeaf.withOpacity(0.3),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: ThemeColors.goldLeaf.withOpacity(0.4)),
                            ),
                            child: Text(
                              swatch['code']!,
                              style: GoogleFonts.plusJakartaSans(
                                color: const Color(0xFFFFF6D6),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Category Label
                        Text(
                          swatch['label']!,
                          style: GoogleFonts.plusJakartaSans(
                            color: ThemeColors.goldLeaf,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Color Name Title
                        Text(
                          swatch['title']!,
                          style: GoogleFonts.playfairDisplay(
                            color: const Color(0xFFFFF6D6),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Description
                        Text(
                          swatch['description']!,
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.white70,
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Divider(color: Color(0x30C5A059), height: 1),
                        ),

                        // Best For Detail
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 12,
                              height: 1.3,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Best For: ',
                                style: TextStyle(
                                  color: ThemeColors.goldLeaf,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: swatch['bestFor']!,
                                style: const TextStyle(
                                  color: Colors.white60,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Copy Swatch Button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () => _copyHexCode(context, swatch['code']!),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              side: BorderSide(
                                color: ThemeColors.goldLeaf.withOpacity(0.7),
                                width: 1.2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              backgroundColor: ThemeColors.midnightVelvet,
                            ),
                            icon: const Icon(
                              Icons.copy_rounded,
                              color: ThemeColors.goldLeaf,
                              size: 16,
                            ),
                            label: Text(
                              'Copy Swatch ${swatch['code']}',
                              style: GoogleFonts.plusJakartaSans(
                                color: ThemeColors.goldLeaf,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // SECTION DEMARCATION DIVIDER LINE
            const SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      ThemeColors.goldLeaf.withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ThemeColors.goldLeaf.withOpacity(0.2),
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
    );
  }

  Widget _buildAttireChip(IconData icon, String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: ThemeColors.midnightVelvet,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ThemeColors.goldLeaf.withOpacity(0.6),
          width: 1.1,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: ThemeColors.goldLeaf, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.playfairDisplay(
                color: const Color(0xFFFFF6D6),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}