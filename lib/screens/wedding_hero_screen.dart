import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/theme/theme_colors.dart';

class WeddingHeroScreen extends StatefulWidget {
  final VoidCallback onOpenRsvpModal;
  final VoidCallback onOpenDrawer; // Added callback for opening the drawer

  const WeddingHeroScreen({
    super.key,
    required this.onOpenRsvpModal,
    required this.onOpenDrawer, // Required in constructor
  });

  @override
  State<WeddingHeroScreen> createState() => _WeddingHeroScreenState();
}

class _WeddingHeroScreenState extends State<WeddingHeroScreen> {
  bool _isCrestHovered = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      color: ThemeColors.midnightVelvet,
      child: Stack(
        children: [
          // 1. Background Image using hero_screen.jpg from assets/images/
          Positioned.fill(
            child: Image.asset(
              'assets/images/hero_screen.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: ThemeColors.midnightVelvet.withValues(alpha: 0.25),
            ),
          ),

          // 2. Main Scrollable Content (Sits under the absolute sticky glass header from homepage)
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16.0 : 48.0,
                vertical: 16.0,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 880.0),
                child: Padding(
                  // Extra top padding so content scrolls gracefully underneath the floating header
                  padding: const EdgeInsets.only(top: 90.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Liquid Glass Container matching the rest of the application's rich frosted look
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 24.0, sigmaY: 24.0),
                          child: Container(
                            padding: const EdgeInsets.all(28.0),
                            decoration: BoxDecoration(
                              color: ThemeColors.midnightVelvet.withValues(alpha: 0.70),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  ThemeColors.imperialBurgundySolid.withValues(alpha: 0.55),
                                  ThemeColors.midnightVelvet.withValues(alpha: 0.75),
                                  Colors.black.withValues(alpha: 0.65),
                                ],
                                stops: const [0.0, 0.5, 1.0],
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                              border: Border.all(
                                color: ThemeColors.goldLeaf.withValues(alpha: 0.35),
                                width: 1.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.4),
                                  blurRadius: 24.0,
                                  spreadRadius: -2.0,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Monogram Crest with Hover Effect
                                MouseRegion(
                                  onEnter: (_) => setState(() => _isCrestHovered = true),
                                  onExit: (_) => setState(() => _isCrestHovered = false),
                                  child: AnimatedScale(
                                    scale: _isCrestHovered ? 1.06 : 1.0,
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeOut,
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 250),
                                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30.0),
                                        border: Border.all(
                                          color: _isCrestHovered ? ThemeColors.champagneSilk : ThemeColors.goldLeaf.withValues(alpha: 0.65), 
                                          width: _isCrestHovered ? 1.8 : 1.2,
                                        ),
                                        color: ThemeColors.imperialBurgundySolid.withValues(alpha: 0.4),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ThemeColors.goldLeaf.withValues(alpha: _isCrestHovered ? 0.35 : 0.15),
                                            blurRadius: _isCrestHovered ? 24.0 : 16.0,
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        'V ♥ N',
                                        style: GoogleFonts.cinzel(
                                          fontSize: isMobile ? 32.0 : 48.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 4.0,
                                          color: ThemeColors.champagneSilk,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20.0),

                                // Eyebrow Text
                                Text(
                                  'THE ROYAL UNION',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: isMobile ? 12.0 : 15.0,
                                    fontWeight: FontWeight.w700,
                                    color: ThemeColors.goldLeaf,
                                    letterSpacing: 3.5,
                                  ),
                                ),
                                const SizedBox(height: 12.0),

                                // Headline H1
                                Text(
                                  'Victor & Naza',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: isMobile ? 32.0 : 44.0,
                                    fontWeight: FontWeight.w600,
                                    color: ThemeColors.warmIvory,
                                    height: 1.15,
                                  ),
                                ),
                                const SizedBox(height: 8.0),

                                // Subtitle
                                Text(
                                  'EKUMA × OKAFOR',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: isMobile ? 11.0 : 13.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2.0,
                                    color: ThemeColors.champagneSilk.withValues(alpha: 0.8),
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  '#VictorWedsNaza',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: isMobile ? 11.0 : 13.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    color: ThemeColors.goldLeaf,
                                  ),
                                ),
                                const SizedBox(height: 16.0),

                                // Ornamental Divider
                                Row(
                                  children: [
                                    Expanded(child: Container(height: 1, color: ThemeColors.goldLeaf.withValues(alpha: 0.4))),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Icon(Icons.auto_awesome, size: 14.0, color: ThemeColors.goldLeaf),
                                    ),
                                    Expanded(child: Container(height: 1, color: ThemeColors.goldLeaf.withValues(alpha: 0.4))),
                                  ],
                                ),
                                const SizedBox(height: 16.0),

                                // Date Badge (Frosted Pill)
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                                  decoration: BoxDecoration(
                                    color: ThemeColors.imperialBurgundySolid.withValues(alpha: 0.35),
                                    borderRadius: BorderRadius.circular(30.0),
                                    border: Border.all(color: ThemeColors.goldLeaf.withValues(alpha: 0.5), width: 1.0),
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.calendar_today, size: 14.0, color: ThemeColors.goldLeaf),
                                        const SizedBox(width: 8.0),
                                        Text(
                                          'DECEMBER 04 & 05, 2026 · LAGOS, NIGERIA',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.plusJakartaSans(
                                            fontSize: isMobile ? 10.5 : 12.5,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.5,
                                            color: ThemeColors.goldLeaf,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24.0),

                                // Countdown Timer Boxes (Translucent Glass Cards)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildCountdownBox('118', 'DAYS', isMobile),
                                    const SizedBox(width: 8.0),
                                    _buildCountdownBox('07', 'HOURS', isMobile),
                                    const SizedBox(width: 8.0),
                                    _buildCountdownBox('13', 'MINUTES', isMobile),
                                    const SizedBox(width: 8.0),
                                    _buildCountdownBox('17', 'SECONDS', isMobile),
                                  ],
                                ),
                                const SizedBox(height: 24.0),

                                // Primary Neon Glowing CTA Button
                                NeonGlowingButton(
                                  text: 'KINDLY RSVP ATTENDANCE',
                                  onPressed: widget.onOpenRsvpModal,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownBox(String value, String label, bool isMobile) {
    return Container(
      width: isMobile ? 62.0 : 74.0,
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        color: ThemeColors.imperialBurgundySolid.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: ThemeColors.goldLeaf.withValues(alpha: 0.5), width: 1.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: GoogleFonts.playfairDisplay(
              fontSize: isMobile ? 18.0 : 22.0,
              fontWeight: FontWeight.bold,
              color: ThemeColors.champagneSilk,
            ),
          ),
          const SizedBox(height: 2.0),
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: isMobile ? 8.5 : 9.5,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
              color: ThemeColors.goldLeaf,
            ),
          ),
        ],
      ),
    );
  }
}

/// Standalone NeonGlowingButton Widget Class
class NeonGlowingButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color primaryColor;
  final Color glowColor;
  final double height;

  const NeonGlowingButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.primaryColor = ThemeColors.goldLeaf,
    this.glowColor = const Color(0xFFFFD700),
    this.height = 50.0,
  });

  @override
  State<NeonGlowingButton> createState() => _NeonGlowingButtonState();
}

class _NeonGlowingButtonState extends State<NeonGlowingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 2.0, end: 8.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                color: widget.glowColor.withValues(alpha: 0.5),
                blurRadius: _animation.value * 2,
                spreadRadius: _animation.value / 2,
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.primaryColor,
              foregroundColor: ThemeColors.imperialBurgundySolid,
              elevation: 6.0,
              shadowColor: widget.glowColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(
                  color: Colors.white.withValues(alpha: 0.6),
                  width: 1.2,
                ),
              ),
            ),
            onPressed: widget.onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.favorite, size: 16.0, color: ThemeColors.imperialBurgundySolid),
                const SizedBox(width: 8.0),
                Text(
                  widget.text,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: ThemeColors.imperialBurgundySolid,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}