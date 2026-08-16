import 'package:flutter/material.dart';
import 'package:wedding_app/screens/wedding_hero_screen.dart';
import 'package:wedding_app/pages/our_story_page.dart';
import 'package:wedding_app/pages/ceremony_order_page.dart';
import 'package:wedding_app/pages/event_schedule_page.dart';
import 'package:wedding_app/pages/aso_ebi_attire_page.dart';
import 'package:wedding_app/pages/dress_code_palette_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _openRsvpModal() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A0C0E),
        title: const Text('RSVP', style: TextStyle(color: Color(0xFFFFF6D6))),
        content: const Text('RSVP form coming up next!', style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: Color(0xFFC5A059))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF1A0C0E),
      body: Stack(
        children: [
          // 1. Main Scrollable Content (Sits under the sticky header)
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Section 1: Hero Screen
                SizedBox(
                  height: screenHeight,
                  child: WeddingHeroScreen(
                    onOpenRsvpModal: _openRsvpModal,
                    onOpenDrawer: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                ),
                
                // Section 2: Our Story & Documentary Journal
                const OurStoryPage(),

                const SizedBox(height: 40),

                // Section 3: Ceremony Order Page (Dynamic layout wrapper)
                const CeremonyOrderPage(),

                const SizedBox(height: 40),

                // Section 4: Event Schedule & Procession
                const EventSchedulePage(),

                const SizedBox(height: 40),

                // Section 5: Aso-Ebi & Attire Page
                const AsoEbiAttirePage(),

                const SizedBox(height: 40),

                // Section 6: Dress Code & Official Colour Swatches Page
                const DressCodePalettePage(),

                const SizedBox(height: 60), // Bottom padding for smooth final scroll clearance
              ],
            ),
          ),

          // 2. Global Sticky Header Bar with Glassmorphic Blur
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A0C0E).withValues(alpha: 0.8),
                  border: Border(
                    bottom: BorderSide(
                      color: const Color(0xFFC5A059).withValues(alpha: 0.4),
                      width: 1.0,
                    ),
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFFC5A059), width: 1.0),
                              color: const Color(0xFF1A0C0E).withValues(alpha: 0.3),
                            ),
                            child: const Text(
                              'V♥N',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFF6D6),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'VICTOR & NAZA',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  color: Color(0xFFFFF6D6),
                                ),
                              ),
                              Text(
                                'EKUMA × OKAFOR · 2026',
                                style: TextStyle(
                                  fontSize: 9,
                                  letterSpacing: 1.0,
                                  color: const Color(0xFFC5A059),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: _openRsvpModal,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFC5A059),
                              foregroundColor: const Color(0xFF1A0C0E),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              minimumSize: Size.zero,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'RSVP',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: () {
                              _scaffoldKey.currentState?.openEndDrawer();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.menu,
                                color: Color(0xFFC5A059),
                                size: 24,
                              ),
                            ),
                          ),
                        ],
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
}
