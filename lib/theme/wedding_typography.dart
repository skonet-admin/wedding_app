import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/theme/theme_colors.dart';

class WeddingTypography {
  // Calligraphy Eyebrow (Great Vibes)
  static TextStyle calligraphyEyebrow({bool isDesktop = true}) => GoogleFonts.getFont(
        'Great Vibes',
        fontSize: isDesktop ? 48.0 : 32.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: WeddingColors.goldLeaf,
      );

  // Monogram Emblem Logo (Cinzel)
  static TextStyle monogramLogo({bool isDesktop = true}) => GoogleFonts.cinzel(
        fontSize: isDesktop ? 72.0 : 48.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 6.0,
        color: WeddingColors.champagneSilk,
      );

  // Couples Name Headline H1 (Playfair Display)
  static TextStyle couplesHeadline({bool isDesktop = true}) => GoogleFonts.playfairDisplay(
        fontSize: isDesktop ? 56.0 : 36.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 2.0,
        color: WeddingColors.warmIvory,
      );

  // Wedding Date Badge (Plus Jakarta Sans)
  static TextStyle dateBadge({bool isDesktop = true}) => GoogleFonts.plusJakartaSans(
        fontSize: isDesktop ? 16.0 : 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 4.0,
        color: WeddingColors.goldLeaf,
      );

  // Countdown Value Numbers (Cinzel)
  static TextStyle countdownNumbers({bool isDesktop = true}) => GoogleFonts.cinzel(
        fontSize: isDesktop ? 36.0 : 24.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.0,
        color: WeddingColors.champagneSilk,
      );

  // Countdown Unit Labels (Plus Jakarta Sans)
  static TextStyle countdownLabels({bool isDesktop = true}) => GoogleFonts.plusJakartaSans(
        fontSize: isDesktop ? 12.0 : 10.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 2.0,
        color: WeddingColors.antiqueBronze,
      );

  // Nav Bar Link Label (Plus Jakarta Sans)
  static TextStyle navLink({bool isDesktop = true}) => GoogleFonts.plusJakartaSans(
        fontSize: isDesktop ? 14.0 : 12.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
        color: WeddingColors.warmIvory,
      );
}