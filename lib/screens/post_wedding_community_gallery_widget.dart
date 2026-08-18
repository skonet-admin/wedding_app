import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/pages/aso_ebi_attire_page.dart';
import 'package:wedding_app/theme/theme_colors.dart';

/// FlutterFlow Component: PostWeddingCommunityGalleryWidget
/// Design System Tokens: Replaced hardcoded color values with centralized ThemeColors.
class PostWeddingCommunityGalleryWidget extends StatefulWidget {
  const PostWeddingCommunityGalleryWidget({Key? key}) : super(key: key);

  @override
  _PostWeddingCommunityGalleryWidgetState createState() =>
      _PostWeddingCommunityGalleryWidgetState();
}

class _PostWeddingCommunityGalleryWidgetState
    extends State<PostWeddingCommunityGalleryWidget> {
  String _activeCategory = 'All Memories';

  final List<String> _categories = [
    'All Memories',
    'Traditional Rites (Igba Nkwu)',
    'The Reception',
    'Aso-Ebi Styles',
    'Guest Captures'
  ];

  // Community gallery items dataset
  final List<Map<String, dynamic>> _posts = [
    {
      'category': 'Traditional Rites (Igba Nkwu)',
      'badgeText': 'TRADITIONAL RITES (IGBA NKWU)',
      'imageUrl': 'https://images.unsplash.com/photo-1519741497674-611481863552?auto=format&fit=crop&w=600&q=80',
      'authorName': 'Chioma Nwoye',
      'authorAvatar': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&q=80',
      'timestamp': 'Dec 5, 2026 · 2:30 PM',
      'sprayedAmount': '₦50,000 sprayed',
      'caption': 'The wine carrying moment (Igba Nkwu)! Naza gracefully searching for her husband Victor through the royal crowd.',
      'likes': 142,
      'comments': 2,
    },
    {
      'category': 'The Reception',
      'badgeText': 'THE RECEPTION',
      'imageUrl': 'https://images.unsplash.com/photo-1507676184212-d03ab07a01bf?auto=format&fit=crop&w=600&q=80',
      'authorName': 'Chef & Banquet Team',
      'authorAvatar': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=150&q=80',
      'timestamp': 'Dec 5, 2026 · 5:30 PM',
      'sprayedAmount': '₦40,000 sprayed',
      'caption': 'The 6-tier gold leaf wedding cake cutting ceremony. Pure elegance!',
      'likes': 164,
      'comments': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter posts based on selected category tab
    final filteredPosts = _activeCategory == 'All Memories'
        ? _posts
        : _posts.where((p) => p['category'] == _activeCategory).toList();

    return Scaffold(
      backgroundColor: ThemeColors.midnightVelvet,
      // Pinned top App Bar so it stays fixed and content scrolls under it
      appBar: AppBar(
        backgroundColor: ThemeColors.midnightVelvet,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: ThemeColors.goldLeaf, size: 18),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Back',
        ),
        title: Text(
          'NAZA & VICTOR',
          style: GoogleFonts.montserrat(
            color: ThemeColors.champagneSilk,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColors.goldLeaf,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Opening memory upload studio...'),
              backgroundColor: ThemeColors.imperialBurgundySolid,
            ),
          );
        },
        child: Icon(Icons.camera_alt, color: ThemeColors.midnightVelvet),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header Tag
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: ThemeColors.goldLeaf),
                color: ThemeColors.imperialBurgundySolid,
              ),
              child: Text(
                'COMMUNITY GALLERY & MEMORIES',
                style: GoogleFonts.montserrat(
                  color: ThemeColors.goldLeaf,
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              'The living album of our day.',
              style: GoogleFonts.playfairDisplay(
                fontSize: 32.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: ThemeColors.champagneSilk,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              'Relive every moment from the traditional rites to the grand reception. Upload your captures, leave your blessings, and celebrate with us.',
              style: GoogleFonts.montserrat(
                fontSize: 13.0,
                color: ThemeColors.warmIvory.withValues(alpha: 0.85),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24.0),

            // Filter Chips Wrapped Layout
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _categories.map((cat) {
                final isSelected = cat == _activeCategory;
                return ChoiceChip(
                  label: Text(
                    cat,
                    style: GoogleFonts.montserrat(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? ThemeColors.midnightVelvet : ThemeColors.goldLeaf,
                    ),
                  ),
                  selected: isSelected,
                  selectedColor: ThemeColors.goldLeaf,
                  backgroundColor: ThemeColors.imperialBurgundySolid,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: ThemeColors.goldLeaf),
                  ),
                  onSelected: (selected) {
                    setState(() {
                      _activeCategory = cat;
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 24.0),

            // Feed Stream Layout
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredPosts.isNotEmpty ? filteredPosts.length : 1,
              separatorBuilder: (context, index) => const SizedBox(height: 20.0),
              itemBuilder: (context, index) {
                if (filteredPosts.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(32.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ThemeColors.imperialBurgundySolid,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: ThemeColors.goldLeaf),
                    ),
                    child: Text(
                      'No captures found in this category yet. Be the first to add one!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: ThemeColors.warmIvory,
                        fontSize: 13.0,
                      ),
                    ),
                  );
                }
                return _buildCommunityMediaCard(filteredPosts[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityMediaCard(Map<String, dynamic> post) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.imperialBurgundySolid,
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(color: ThemeColors.goldLeaf, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(14.0)),
                child: Image.network(
                  post['imageUrl'],
                  height: 240,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: ThemeColors.midnightVelvet.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ThemeColors.goldLeaf, width: 1.0),
                  ),
                  child: Text(
                    post['badgeText'],
                    style: GoogleFonts.montserrat(
                      color: ThemeColors.goldLeaf,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(post['authorAvatar']),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post['authorName'],
                            style: GoogleFonts.montserrat(
                              color: ThemeColors.champagneSilk,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            post['timestamp'],
                            style: GoogleFonts.montserrat(
                              color: ThemeColors.goldLeaf,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: ThemeColors.midnightVelvet,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: ThemeColors.goldLeaf, width: 0.8),
                      ),
                      child: Text(
                        post['sprayedAmount'],
                        style: GoogleFonts.montserrat(
                          color: ThemeColors.goldLeaf,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  post['caption'],
                  style: GoogleFonts.montserrat(
                    color: ThemeColors.warmIvory.withValues(alpha: 0.9),
                    fontSize: 12.5,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                Divider(color: ThemeColors.goldLeaf.withValues(alpha: 0.3)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: ThemeColors.midnightVelvet,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: ThemeColors.goldLeaf.withValues(alpha: 0.4)),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.favorite, color: ThemeColors.goldLeaf, size: 16),
                            const SizedBox(width: 6),
                            Text('${post['likes']}', style: GoogleFonts.montserrat(color: ThemeColors.champagneSilk, fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: ThemeColors.midnightVelvet,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: ThemeColors.goldLeaf.withValues(alpha: 0.4)),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.chat_bubble_outline, color: ThemeColors.goldLeaf, size: 16),
                            const SizedBox(width: 6),
                            Text('${post['comments']}', style: GoogleFonts.montserrat(color: ThemeColors.champagneSilk, fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColors.goldLeaf,
                        foregroundColor: ThemeColors.midnightVelvet,
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        minimumSize: Size.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Virtual spraying gateway initiated!'),
                            backgroundColor: ThemeColors.imperialBurgundySolid,
                          ),
                        );
                      },
                      icon: const Icon(Icons.monetization_on_outlined, size: 16),
                      label: Text(
                        'Spray 💵',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  EdgeInsets get explicitPaddingFix => const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
}

// Helper wrapper to prevent any Skia/Impeller shader compilation crash with negative mipmap filtering parameters
extension on _PostWeddingCommunityGalleryWidgetState {
  EdgeInsets get explicitPaddingFix => const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
}
