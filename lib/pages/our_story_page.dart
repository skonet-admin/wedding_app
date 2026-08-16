import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/theme/theme_colors.dart';

class OurStoryPage extends StatefulWidget {
  const OurStoryPage({super.key});

  @override
  State<OurStoryPage> createState() => _OurStoryPageState();
}

class _OurStoryPageState extends State<OurStoryPage> {
  final List<Map<String, String>> _galleryItems = [
    {
      'image': 'assets/images/Naza_1st_Notice.png',
      'title': 'First Notice in Church',
      'caption': 'When Naza first noticed Victor singing with a lovely and amazing voice during Sunday service.',
    },
    {
      'image': 'assets/images/slider.png',
      'title': 'The Worship Slide',
      'caption': 'Victor sliding into her DMs to joke about her assignment to lead worship.',
    },
    {
      'image': 'assets/images/Naza_falling_2.png',
      'title': 'Across the Distance',
      'caption': 'Our connection grew effortlessly across screens without any pressure.',
    },
    {
      'image': 'assets/images/roots_anniversary_proposal.png',
      'title': 'Roots Dinner Proposal',
      'caption': 'Victor down on one knee during a private anniversary dinner at Roots Restaurant.',
    },
    {
      'image': 'assets/images/V_N cartoon.png',
      'title': 'Naza & Victor Union',
      'caption': 'Royal traditional wedding celebration uniting our families in eternal love.',
    },
  ];

  void _openGalleryDialog(int initialIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _GalleryDialog(
          items: _galleryItems,
          initialIndex: initialIndex,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: WeddingColors.midnightVelvet,
        image: DecorationImage(
          image: const AssetImage('assets/images/picture_frame.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            WeddingColors.midnightVelvet.withValues(alpha: 0.85),
            BlendMode.darken,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. Compact Royal Header Title Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: WeddingColors.goldLeaf, width: 1.0),
                  color: WeddingColors.midnightVelvet.withValues(alpha: 0.85),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.book_outlined, size: 13.0, color: WeddingColors.goldLeaf),
                    const SizedBox(width: 6.0),
                    Text(
                      'DOCUMENTARY JOURNAL',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: WeddingColors.goldLeaf,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Our Story & Journey',
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: WeddingColors.champagneSilk,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                'Naza & Victor • In Their Own Words',
                textAlign: TextAlign.center,
                style: GoogleFonts.greatVibes(
                  fontSize: 22.0,
                  color: WeddingColors.goldLeaf,
                ),
              ),

              const SizedBox(height: 16.0),

              // 2. Streamlined Royal Fan Stack (Optimized Heights)
              SizedBox(
                height: 380.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Backlight Glow Backdrop
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            center: const Alignment(0.0, 0.0),
                            radius: 0.75,
                            colors: [
                              const Color(0xFF6A1B29).withValues(alpha: 0.75),
                              const Color(0xFF3B1019).withValues(alpha: 0.3),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Left Card 1
                    Positioned(
                      left: 12.0, top: 30.0,
                      child: GestureDetector(
                        onTap: () => _openGalleryDialog(0),
                        child: Transform.rotate(
                          angle: -0.11,
                          child: _buildKeepsakeCard('assets/images/Naza_1st_Notice.png', 'In Church', 110.0, 150.0),
                        ),
                      ),
                    ),
                    // Left Card 2
                    Positioned(
                      left: 72.0, top: 10.0,
                      child: GestureDetector(
                        onTap: () => _openGalleryDialog(1),
                        child: Transform.rotate(
                          angle: 0.08,
                          child: _buildKeepsakeCard('assets/images/slider.png', 'The Slide', 110.0, 150.0),
                        ),
                      ),
                    ),
                    // Right Card 2
                    Positioned(
                      right: 72.0, top: 15.0,
                      child: GestureDetector(
                        onTap: () => _openGalleryDialog(2),
                        child: Transform.rotate(
                          angle: -0.08,
                          child: _buildKeepsakeCard('assets/images/Naza_falling_2.png', 'Distance', 110.0, 150.0),
                        ),
                      ),
                    ),
                    // Right Card 1
                    Positioned(
                      right: 12.0, top: 35.0,
                      child: GestureDetector(
                        onTap: () => _openGalleryDialog(3),
                        child: Transform.rotate(
                          angle: 0.11,
                          child: _buildKeepsakeCard('assets/images/roots_anniversary_proposal.png', 'Roots Dinner', 110.0, 150.0),
                        ),
                      ),
                    ),

                    // Center Hero Keepsake Frame
                    Positioned(
                      top: 45.0,
                      child: GestureDetector(
                        onTap: () => _openGalleryDialog(4),
                        child: Transform.rotate(
                          angle: 0.0,
                          child: Container(
                            width: 175.0, height: 235.0, 
                            padding: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              color: WeddingColors.champagneSilk,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(color: WeddingColors.goldLeaf, width: 2.2),
                              boxShadow: [
                                const BoxShadow(
                                  color: WeddingColors.goldGlow,
                                  blurRadius: 28.0,
                                  spreadRadius: 4.0,
                                ),
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.8),
                                  blurRadius: 20.0,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: WeddingColors.goldLeaf.withValues(alpha: 0.4), width: 0.8),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.0),
                                      child: Image.asset(
                                        'assets/images/V_N cartoon.png', 
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) => _fallbackErrorBox(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6.0),
                                  Text(
                                    'Naza & Victor', 
                                    style: GoogleFonts.greatVibes(fontSize: 18.0, color: WeddingColors.midnightVelvet),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12.0),

              // 3. Royal Seal Footer Crest (Adding a professional touch to fill and ground the bottom space)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.45),
                  borderRadius: BorderRadius.circular(14.0),
                  border: Border.all(color: WeddingColors.goldLeaf.withValues(alpha: 0.4), width: 1.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.auto_awesome, color: WeddingColors.goldLeaf, size: 14.0),
                    const SizedBox(width: 8.0),
                    Flexible(
                      child: Text(
                        'TAP ANY FRAME TO EXPLORE THE MEMOIRS',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: WeddingColors.champagneSilk,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const Icon(Icons.auto_awesome, color: WeddingColors.goldLeaf, size: 14.0),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKeepsakeCard(String path, String label, double w, double h) {
    return Container(
      width: w, height: h, padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: WeddingColors.champagneSilk, 
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: WeddingColors.goldLeaf, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.7),
            blurRadius: 15.0,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          border: Border.all(color: WeddingColors.goldLeaf.withValues(alpha: 0.3), width: 0.6),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3.0), 
                child: Image.asset(
                  path, 
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => _fallbackErrorBox(),
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              label, 
              style: GoogleFonts.plusJakartaSans(
                fontSize: 9.0, 
                fontWeight: FontWeight.bold, 
                color: WeddingColors.midnightVelvet,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fallbackErrorBox() {
    return Container(
      color: Colors.grey.shade200,
      child: const Center(
        child: Icon(Icons.broken_image, color: Colors.grey, size: 20),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// IMMERSIVE GALLERY DIALOG (POPUP FRAME)
// -----------------------------------------------------------------------------

class _GalleryDialog extends StatefulWidget {
  final List<Map<String, String>> items;
  final int initialIndex;

  const _GalleryDialog({required this.items, required this.initialIndex});

  @override
  State<_GalleryDialog> createState() => _GalleryDialogState();
}

class _GalleryDialogState extends State<_GalleryDialog> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < widget.items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = widget.items[_currentIndex];

    return Dialog(
      backgroundColor: WeddingColors.midnightVelvet,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(color: WeddingColors.goldLeaf, width: 1.5),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 540),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: WeddingColors.goldLeaf, width: 1),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(Icons.close, color: WeddingColors.goldLeaf, size: 18),
                ),
              ),
            ),
            const SizedBox(height: 8),

            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.items.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Image.asset(
                          widget.items[index]['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.black26,
                            child: const Center(child: Icon(Icons.broken_image, color: WeddingColors.goldLeaf, size: 40)),
                          ),
                        );
                      },
                    ),
                  ),

                  if (_currentIndex > 0)
                    Positioned(
                      left: 8,
                      child: GestureDetector(
                        onTap: _prevPage,
                        child: Container(
                          decoration: BoxDecoration(
                            color: WeddingColors.midnightVelvet.withValues(alpha: 0.7),
                            shape: BoxShape.circle,
                            border: Border.all(color: WeddingColors.goldLeaf),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.chevron_left, color: WeddingColors.goldLeaf, size: 24),
                        ),
                      ),
                    ),

                  if (_currentIndex < widget.items.length - 1)
                    Positioned(
                      right: 8,
                      child: GestureDetector(
                        onTap: _nextPage,
                        child: Container(
                          decoration: BoxDecoration(
                            color: WeddingColors.midnightVelvet.withValues(alpha: 0.7),
                            shape: BoxShape.circle,
                            border: Border.all(color: WeddingColors.goldLeaf),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.chevron_right, color: WeddingColors.goldLeaf, size: 24),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            Text(
              currentItem['title']!, 
              style: GoogleFonts.playfairDisplay(
                color: WeddingColors.champagneSilk, 
                fontSize: 20.0, 
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              currentItem['caption']!, 
              textAlign: TextAlign.center, 
              style: GoogleFonts.plusJakartaSans(
                color: WeddingColors.warmIvory, 
                fontSize: 13.0,
              ),
            ),
            const SizedBox(height: 16.0),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: WeddingColors.goldLeaf),
              ),
              child: Text(
                '${_currentIndex + 1} / ${widget.items.length}',
                style: GoogleFonts.plusJakartaSans(
                  color: WeddingColors.goldLeaf,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}