import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/pages/aso_ebi_attire_page.dart';
import 'package:wedding_app/theme/theme_colors.dart';

/// FlutterFlow Page: Gifts & Blessings Page
/// Dedicated page for registry, general blessings, and bank transfer details.
class GiftsAndFooterWidget extends StatefulWidget {
  const GiftsAndFooterWidget({super.key});

  @override
  State<GiftsAndFooterWidget> createState() => _GiftsAndFooterWidgetState();
}

class _GiftsAndFooterWidgetState extends State<GiftsAndFooterWidget> {
  void _copyToClipboard(String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label account number copied!'),
        backgroundColor: ThemeColors.imperialBurgundySolid,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Scaffold(
      backgroundColor: ThemeColors.midnightVelvet,
      appBar: AppBar(
        backgroundColor: ThemeColors.imperialBurgundySolid,
        elevation: 0,
        iconTheme: const IconThemeData(color: ThemeColors.goldLeaf),
        title: Text(
          'GIFTS & BLESSINGS',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: ThemeColors.champagneSilk,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: ThemeColors.goldLeaf.withValues(alpha: 0.3),
            height: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16.0 : 48.0,
            vertical: 24.0,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 780.0),
              child: Column(
                children: [
                  // --- GIFTS & BLESSINGS CONTAINER ---
                  Container(
                    padding: EdgeInsets.all(isMobile ? 20.0 : 36.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2B1015),
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(color: ThemeColors.goldLeaf, width: 1.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(child: Divider(color: ThemeColors.goldLeaf, thickness: 1.0)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'GIFTS & BLESSINGS',
                                style: GoogleFonts.montserrat(
                                  color: ThemeColors.goldLeaf,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3.0,
                                ),
                              ),
                            ),
                            const Expanded(child: Divider(color: ThemeColors.goldLeaf, thickness: 1.0)),
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        Text(
                          '"your presence is our present."',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: isMobile ? 26.0 : 34.0,
                            fontStyle: FontStyle.italic,
                            color: ThemeColors.warmIvory,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          'Should you wish to honour us further, contributions toward the new home are warmly received.',
                          style: GoogleFonts.montserrat(
                            fontSize: 13.0,
                            color: ThemeColors.champagneSilk.withValues(alpha: 0.85),
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32.0),

                        // Bank Cards Grid
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final isWide = constraints.maxWidth > 700;
                            return Flex(
                              direction: isWide ? Axis.horizontal : Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: isWide ? 1 : 0,
                                  child: _buildBankCard(
                                    bankTag: 'FIRST BANK OF NIGERIA',
                                    name: 'Naza Okafor',
                                    accountNumber: '0123456789',
                                    onCopy: () => _copyToClipboard('0123456789', 'Naza Okafor (First Bank)'),
                                  ),
                                ),
                                SizedBox(width: isWide ? 16.0 : 0, height: isWide ? 0 : 16.0),
                                Expanded(
                                  flex: isWide ? 1 : 0,
                                  child: _buildBankCard(
                                    bankTag: 'GTBANK',
                                    name: 'Victor Ekuma',
                                    accountNumber: '9876543210',
                                    onCopy: () => _copyToClipboard('9876543210', 'Victor Ekuma (GTBank)'),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBankCard({
    required String bankTag,
    required String name,
    required String accountNumber,
    required VoidCallback onCopy,
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: ThemeColors.midnightVelvet,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: ThemeColors.goldLeaf, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bankTag,
            style: GoogleFonts.montserrat(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              color: ThemeColors.goldLeaf,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            name,
            style: GoogleFonts.playfairDisplay(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: ThemeColors.warmIvory,
            ),
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                accountNumber,
                style: GoogleFonts.robotoMono(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.goldLeaf,
                  letterSpacing: 2.0,
                ),
              ),
              InkWell(
                onTap: onCopy,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: ThemeColors.goldLeaf),
                    color: ThemeColors.imperialBurgundySolid,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.copy, color: ThemeColors.goldLeaf, size: 14.0),
                      const SizedBox(width: 4.0),
                      Text(
                        'Copy',
                        style: GoogleFonts.montserrat(
                          fontSize: 11.0,
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.goldLeaf,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}