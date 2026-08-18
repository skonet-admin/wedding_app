import 'package:flutter/material.dart';
// Imports your centralized theme folder
import 'theme/theme_colors.dart';
import 'screens/wedding_hero_screen.dart';
import 'pages/our_story_page.dart';
import 'pages/ceremony_order_page.dart';
import 'pages/event_schedule_page.dart';
import 'pages/dress_code_palette_page.dart' hide ThemeColors;
import 'pages/aso_ebi_attire_page.dart' hide ThemeColors;
// Import your RSVP Portal & New Gifts & Blessings Page
import 'screens/rsvp_portal_widget.dart';
import 'pages/gifts_and_blessings_page.dart';
// Import the Admin Control Center Screen
import 'screens/admin_dashboard_widget.dart';
// Import the Community Gallery & Memories Screen
import 'screens/post_wedding_community_gallery_widget.dart';
// Import the Luxury Entrance Gateway / Ogene screen from screens folder
import 'screens/luxury_entrance_gateway_page.dart';

void main() {
  runApp(const WeddingApp());
}

class WeddingApp extends StatelessWidget {
  const WeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naza & Victor Wedding',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ThemeColors.midnightVelvet,
        primaryColor: ThemeColors.goldLeaf,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ThemeColors.goldLeaf,
          primary: ThemeColors.goldLeaf,
          surface: ThemeColors.midnightVelvet,
        ),
      ),
      initialRoute: '/gateway',
      routes: {
        '/gateway': (context) => LuxuryEntranceGatewayPage(
              onUnlock: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
        '/': (context) => const HomePage(),
        '/rsvp': (context) => const RsvpPortalAndMonetizationWidget(),
        '/gifts-and-blessings': (context) => const GiftsAndFooterWidget(),
        '/admin-control': (context) => const AdminDashboardAndControlCenterWidget(),
        '/community-gallery': (context) => const PostWeddingCommunityGalleryWidget(),
      },
    );
  }
}

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

  // Navigate straight to the RSVP & Monetization Portal route
  void _openRsvpModal() {
    Navigator.pushNamed(context, '/rsvp');
  }

  // Navigate to the dedicated Gifts & Blessings page
  void _openGiftsPage() {
    Navigator.pushNamed(context, '/gifts-and-blessings');
  }

  // Navigate to the Admin Control Center
  void _openAdminControl() {
    Navigator.pushNamed(context, '/admin-control');
  }

  // Navigate to the Community Gallery
  void _openCommunityGallery() {
    Navigator.pushNamed(context, '/community-gallery');
  }

  // Open the end drawer
  void _openDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  // Safe scroll position helper
  void _scrollToPosition(double offset) {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        backgroundColor: ThemeColors.midnightVelvet,
        child: SafeArea(
          child: Column(
            children: [
              // Drawer Top Header 
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: ThemeColors.goldLeaf.withValues(alpha: 0.3))),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ThemeColors.goldLeaf, width: 1.5),
                        color: ThemeColors.midnightVelvet,
                      ),
                      child: Center(
                        child: Text(
                          'N♥V',
                          style: TextStyle(
                            color: ThemeColors.champagneSilk,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NAZA & VICTOR',
                            style: TextStyle(
                              color: ThemeColors.champagneSilk,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'OKAFOR × EKUMA · 2026',
                            style: TextStyle(
                              color: ThemeColors.goldLeaf,
                              fontSize: 10,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColors.goldLeaf,
                        foregroundColor: ThemeColors.midnightVelvet,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        _openRsvpModal();
                      },
                      child: const Text(
                        'RSVP',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ThemeColors.goldLeaf, width: 1),
                        ),
                        child: const Icon(Icons.close, color: ThemeColors.goldLeaf, size: 16),
                      ),
                    ),
                  ],
                ),
              ),

              // Scrollable Menu List Items housing all public app sections
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  children: [
                    _buildDrawerItem(
                      icon: Icons.auto_awesome,
                      title: 'HERO PREVIEW',
                      onTap: () {
                        Navigator.pop(context);
                        _scrollToPosition(0);
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.book_outlined,
                      title: 'OUR STORY',
                      onTap: () {
                        Navigator.pop(context);
                        _scrollToPosition(screenHeight);
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.favorite_border,
                      title: 'RSVP PORTAL',
                      onTap: () {
                        Navigator.pop(context);
                        _openRsvpModal();
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.card_giftcard,
                      title: 'GIFTS & BLESSINGS',
                      onTap: () {
                        Navigator.pop(context);
                        _openGiftsPage();
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.checkroom,
                      title: 'ASO-EBI & ATTIRE',
                      onTap: () {
                        Navigator.pop(context);
                        _scrollToPosition(screenHeight * 4);
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.palette_outlined,
                      title: 'DRESS CODE & PALETTE',
                      onTap: () {
                        Navigator.pop(context);
                        _scrollToPosition(screenHeight * 5);
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.photo_library_outlined,
                      title: 'COMMUNITY GALLERY',
                      onTap: () {
                        Navigator.pop(context);
                        _openCommunityGallery();
                      },
                    ),
                    Divider(color: ThemeColors.goldLeaf.withValues(alpha: 0.3), height: 32),
                    _buildDrawerItem(
                      icon: Icons.admin_panel_settings,
                      title: 'COMMAND & CONTROL',
                      onTap: () {
                        Navigator.pop(context);
                        _openAdminControl();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Use a Stack so the global header floats persistently over the scrolling body
      body: Stack(
        children: [
          // 1. Main Page ListView Content (Scrolls under the floating header)
          ListView(
            controller: _scrollController,
            children: [
              SizedBox(
                height: screenHeight,
                child: WeddingHeroScreen(
                  onOpenRsvpModal: _openRsvpModal,
                  onOpenDrawer: _openDrawer,
                ),
              ),
              const OurStoryPage(),
              const CeremonyOrderPage(),
              const EventSchedulePage(),
              const AsoEbiAttirePage(),
              const DressCodePalettePage(),
            ],
          ),

          // 2. Global Sticky Header Bar with Solid Background Color
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: ThemeColors.midnightVelvet,
                  border: Border(
                    bottom: BorderSide(
                      color: ThemeColors.goldLeaf.withValues(alpha: 0.4),
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
                              border: Border.all(color: ThemeColors.goldLeaf, width: 1.0),
                              color: ThemeColors.midnightVelvet,
                            ),
                            child: Text(
                              'V♥N',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: ThemeColors.champagneSilk,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'VICTOR & NAZA',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  color: ThemeColors.champagneSilk,
                                ),
                              ),
                              Text(
                                'EKUMA × OKAFOR · 2026',
                                style: TextStyle(
                                  fontSize: 9,
                                  letterSpacing: 1.0,
                                  color: ThemeColors.goldLeaf,
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
                              backgroundColor: ThemeColors.goldLeaf,
                              foregroundColor: ThemeColors.midnightVelvet,
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
                                color: ThemeColors.goldLeaf,
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

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? ThemeColors.imperialBurgundySolid.withValues(alpha: 0.4) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: isSelected ? Border.all(color: ThemeColors.goldLeaf, width: 1) : null,
      ),
      child: ListTile(
        leading: Icon(icon, color: ThemeColors.goldLeaf, size: 20),
        title: Text(
          title,
          style: TextStyle(
            color: ThemeColors.champagneSilk,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}