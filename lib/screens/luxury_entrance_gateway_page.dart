import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// -----------------------------------------------------------------------------
// LUXURY ROYAL ENTRANCE GATEWAY PAGE (VICTOR & NAZA · DEC 2026)
// -----------------------------------------------------------------------------

class LuxuryEntranceGatewayPage extends StatefulWidget {
  final VoidCallback onUnlock;

  const LuxuryEntranceGatewayPage({super.key, required this.onUnlock});

  @override
  State<LuxuryEntranceGatewayPage> createState() =>
      _LuxuryEntranceGatewayPageState();
}

class _LuxuryEntranceGatewayPageState extends State<LuxuryEntranceGatewayPage>
    with TickerProviderStateMixin {
  late AnimationController _doorController;
  late AnimationController _knockController;
  late Animation<double> _leftDoorAngle;
  late Animation<double> _rightDoorAngle;
  late Animation<double> _doorShadow;
  late Animation<double> _lightBeamWidth;
  late Animation<double> _knockerBounce;

  bool _isUnlocked = false;
  int _knockCount = 0;

  @override
  void initState() {
    super.initState();

    // 1. Door Swing Animation (Smooth Cubic Outward Swing)
    _doorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _leftDoorAngle = Tween<double>(begin: 0.0, end: -1.35).animate(
      CurvedAnimation(parent: _doorController, curve: Curves.easeInOutCubic),
    );

    _rightDoorAngle = Tween<double>(begin: 0.0, end: 1.35).animate(
      CurvedAnimation(parent: _doorController, curve: Curves.easeInOutCubic),
    );

    _doorShadow = Tween<double>(begin: 0.2, end: 0.85).animate(
      CurvedAnimation(parent: _doorController, curve: Curves.easeInOutCubic),
    );

    _lightBeamWidth = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _doorController, curve: Curves.easeInQuad),
    );

    // 2. Knocker Physical Bounce Animation
    _knockController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _knockerBounce = Tween<double>(begin: 0.0, end: -12.0).animate(
      CurvedAnimation(parent: _knockController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _doorController.dispose();
    _knockController.dispose();
    super.dispose();
  }

  void _handleKnock() async {
    if (_isUnlocked) return;

    // Haptic vibration feedback on tap
    HapticFeedback.mediumImpact();

    // Animate knocker bounce
    await _knockController.forward();
    await _knockController.reverse();

    _knockCount++;

    // Unlock on 2 knocks or double-tap
    if (_knockCount >= 2) {
      _triggerUnlock();
    }
  }

  void _triggerUnlock() {
    if (_isUnlocked) return;
    HapticFeedback.heavyImpact();

    setState(() {
      _isUnlocked = true;
    });

    _doorController.forward().then((_) {
      widget.onUnlock();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Corrected Team Color Tokens matching your application theme
    const Color midnightVelvet = Color(0xFF0D0B0A);
    const Color regalGoldLeaf = Color(0xFFD4AF37);
    const Color champagneSilk = Color(0xFFFFF6D6);

    return Scaffold(
      backgroundColor: midnightVelvet,
      body: GestureDetector(
        onTap: _handleKnock,
        onDoubleTap: _triggerUnlock,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // =================================================================
            // LAYER 1: REVEALED SANCTUARY (BACKGROUND BEHIND DOORS)
            // =================================================================
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.2,
                  colors: [
                    Color(0xFF3D101A), // Warm glowing burgundy sanctuary
                    midnightVelvet,
                  ],
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'THE ROYAL UNION',
                        style: GoogleFonts.plusJakartaSans(
                          color: regalGoldLeaf,
                          letterSpacing: 4.0,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        'Victor & Naza',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.playfairDisplay(
                          color: champagneSilk,
                          fontSize: size.width < 600 ? 38.0 : 54.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'EKUMA × OKAFOR · DECEMBER 05 2026',
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFFAA7C11),
                          fontSize: 12.0,
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // =================================================================
            // LAYER 2: VOLUMETRIC GOLD LIGHT BEAM THROUGH CENTER CREVICE
            // =================================================================
            AnimatedBuilder(
              animation: _lightBeamWidth,
              builder: (context, child) {
                if (_lightBeamWidth.value == 0) return const SizedBox.shrink();
                return Center(
                  child: Container(
                    width: size.width * _lightBeamWidth.value,
                    height: size.height,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          regalGoldLeaf.withValues(alpha: 0.45 * (1.0 - _lightBeamWidth.value)),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // =================================================================
            // LAYER 3: 3D DOUBLE DOORS EMBEDDED WITH COUPLE PORTRAITS
            // =================================================================
            Row(
              children: [
                // LEFT DOOR PANEL (Naza's Portrait Card)
                Expanded(
                  child: AnimatedBuilder(
                    animation: _leftDoorAngle,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.0012) // 3D perspective depth
                          ..rotateY(_leftDoorAngle.value),
                        child: child,
                      );
                    },
                    child: _buildDoorPanel(
                      isLeft: true,
                      imageAssetPath: 'assets/images/Victor_portrait.jpg',
                    ),
                  ),
                ),

                // RIGHT DOOR PANEL (Victor's Portrait Card)
                Expanded(
                  child: AnimatedBuilder(
                    animation: _rightDoorAngle,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.0012) // 3D perspective depth
                          ..rotateY(_rightDoorAngle.value),
                        child: child,
                      );
                    },
                    child: _buildDoorPanel(
                      isLeft: false,
                      imageAssetPath: 'assets/images/Naza_portrait1.jpg',
                    ),
                  ),
                ),
              ],
            ),

            // =================================================================
            // LAYER 4: CENTER INTERLOCKING GOLD SEAL & V♥N MONOGRAM
            // =================================================================
            if (!_isUnlocked)
              Center(
                child: AnimatedBuilder(
                  animation: _knockerBounce,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _knockerBounce.value),
                      child: child,
                    );
                  },
                  child: _buildCenterKnocker(),
                ),
              ),

            // =================================================================
            // LAYER 5: BOTTOM INSTRUCTION & GUEST HINT PILL
            // =================================================================
            Positioned(
              bottom: 36.0,
              left: 20.0,
              right: 20.0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    color: midnightVelvet.withValues(alpha: 0.90),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: regalGoldLeaf, width: 1.2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.6),
                        blurRadius: 16.0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.touch_app, color: regalGoldLeaf, size: 16.0),
                      const SizedBox(width: 8.0),
                      Text(
                        _knockCount == 0
                            ? 'TAP KNOCKER TO ENTER GUEST PORTAL'
                            : 'KNOCK ONCE MORE TO OPEN GATES',
                        style: GoogleFonts.plusJakartaSans(
                          color: champagneSilk,
                          fontSize: 11.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper: Individual Door Panel featuring Split Wedding Photo Frame
  Widget _buildDoorPanel({required bool isLeft, required String imageAssetPath}) {
    const Color regalGoldLeaf = Color(0xFFD4AF37);
    const Color imperialBurgundy = Color(0xFF2B0A12);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1B0B0F), // Rich dark mahogany wine
        border: Border(
          right: isLeft ? const BorderSide(color: regalGoldLeaf, width: 2.0) : BorderSide.none,
          left: !isLeft ? const BorderSide(color: regalGoldLeaf, width: 2.0) : BorderSide.none,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 20.0,
            spreadRadius: 4.0,
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Inner Carved Wood Panel Inset Molding housing the portrait card
          Padding(
            padding: EdgeInsets.only(
              top: 40.0,
              bottom: 100.0,
              left: isLeft ? 24.0 : 12.0,
              right: isLeft ? 12.0 : 24.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: imperialBurgundy.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: regalGoldLeaf.withValues(alpha: 0.5),
                  width: 1.5,
                ),
                image: DecorationImage(
                  image: AssetImage(imageAssetPath),
                  fit: BoxFit.cover,
                  // Add a dark luxury color filter overlay so it integrates seamlessly with the theme
                  colorFilter: ColorFilter.mode(
                    Colors.black.withValues(alpha: 0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: regalGoldLeaf.withValues(alpha: 0.3),
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),

          // Dynamic Angular Shadow that deepens during rotation
          AnimatedBuilder(
            animation: _doorShadow,
            builder: (context, child) {
              return Container(
                color: Colors.black.withValues(
                  alpha: _doorShadow.value * (isLeft ? 0.8 : 0.6),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Helper: Central Royal Seal Knocker Component with V♥N arrangement
  Widget _buildCenterKnocker() {
    const Color midnightVelvet = Color(0xFF0D0B0A);
    const Color regalGoldLeaf = Color(0xFFD4AF37);
    const Color champagneSilk = Color(0xFFFFF6D6);

    return Container(
      width: 90.0,
      height: 90.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: midnightVelvet,
        border: Border.all(color: regalGoldLeaf, width: 2.5),
        boxShadow: [
          BoxShadow(
            color: regalGoldLeaf.withValues(alpha: 0.4),
            blurRadius: 22.0,
            spreadRadius: 2.0,
          ),
          const BoxShadow(
            color: Colors.black87,
            blurRadius: 15.0,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'V ♥ N', // Corrected order: Victor & Naza monogram
              style: GoogleFonts.cinzel(
                color: champagneSilk,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 2.0),
            const Icon(
              Icons.pan_tool_alt_rounded,
              color: regalGoldLeaf,
              size: 14.0,
            ),
          ],
        ),
      ),
    );
  }
}