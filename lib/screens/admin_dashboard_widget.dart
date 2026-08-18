import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/pages/aso_ebi_attire_page.dart';
import 'package:wedding_app/theme/theme_colors.dart';

/// FlutterFlow Widget: AdminDashboardAndControlCenterWidget (With Embedded Liquid Glass Regrets Page)
class AdminDashboardAndControlCenterWidget extends StatefulWidget {
  const AdminDashboardAndControlCenterWidget({Key? key}) : super(key: key);

  @override
  State<AdminDashboardAndControlCenterWidget> createState() =>
      _AdminDashboardAndControlCenterWidgetState();
}

class _AdminDashboardAndControlCenterWidgetState
    extends State<AdminDashboardAndControlCenterWidget> {
  int _activeTabIndex = 0;
  String _searchQuery = '';
  String _selectedAffiliationFilter = 'All Affiliations';
  
  // Regrets tab specific controllers & states
  final TextEditingController _declinedSearchController = TextEditingController();
  String _selectedDeclinedAffiliation = 'All Affiliations';

  final List<String> _tabs = [
    'Overview Metrics',
    'Guest Whitelist',
    'Regrets & Declines',
    'Content Moderation',
    'Caching Logs',
  ];

  // Dummy guest whitelist data model representation
  final List<Map<String, dynamic>> _guests = [
    {
      'name': 'High Chief Emmanuel Okafor',
      'table': 'Table 1 - Royal Elders',
      'affiliation': 'Bride Family',
      'partySize': '4 Seats',
      'dietary': 'Shellfish',
      'status': 'ACCEPTED',
    },
    {
      'name': 'Dr. Nnamdi & Wife',
      'table': 'Table 3 - VIP Friends',
      'affiliation': 'Groom Family',
      'partySize': '2 Seats',
      'dietary': 'Mild Pepper',
      'status': 'ACCEPTED',
    },
    {
      'name': 'Barrister Chioma Adeleke',
      'table': 'Table 2 - College Crew',
      'affiliation': 'Friends',
      'partySize': '1 Seat',
      'dietary': 'Vegetarian',
      'status': 'ACCEPTED',
    },
  ];

  // Detailed regrets & declines records matching your liquid glass layout specification
  final List<Map<String, dynamic>> _declines = [
    {
      'name': 'Dr. & Mrs. Adeleke Johnson',
      'badge': 'Friends of the Couple',
      'date': '2026-08-01 14:22',
      'sprayed': '₦25,000',
      'note': 'So sorry we cannot make it physically due to international medical conference travel! Sending our warmest blessings and prayer for a blissful marriage.',
      'contact': 'adeleke.j@medcenter.org',
    },
    {
      'name': 'Senator Patrick Kalu',
      'badge': 'Dignitaries',
      'date': '2026-08-02 09:15',
      'sprayed': '₦50,000',
      'note': 'Unavoidable official trip overseas. Sending warmest blessings & virtual token for Naza & Victor.',
      'contact': 'p.kalu@senate.gov.ng',
    },
    {
      'name': 'Barrister Ifeoma Nze',
      'badge': 'Bride Family',
      'date': '2026-08-03 18:40',
      'sprayed': '₦15,000',
      'note': 'Wishing you both an everlasting bond of love and joy. So heartbroken I cannot join the dance floor in person!',
      'contact': 'ifeoma.nze@legalpartners.ng',
    },
  ];

  @override
  void dispose() {
    _declinedSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Scaffold(
      backgroundColor: WeddingColors.midnightVelvet,
      appBar: AppBar(
        backgroundColor: WeddingColors.midnightVelvet, // Updated to midnightVelvet
        elevation: 0,
        iconTheme: const IconThemeData(color: WeddingColors.goldLeaf),
        title: Text(
          'COMMAND & CONTROL CENTER',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: WeddingColors.champagneSilk,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: WeddingColors.goldLeaf.withValues(alpha: 0.3),
            height: 1.0,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Royal_order.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.85,
                  colors: [
                    WeddingColors.midnightVelvet.withValues(alpha: 0.25),
                    WeddingColors.midnightVelvet.withValues(alpha: 0.75),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16.0 : 36.0,
                vertical: 24.0,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 820.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Organizer Badge Container
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: WeddingColors.goldLeaf),
                          color: WeddingColors.midnightVelvet.withValues(alpha: 0.4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.verified_user_outlined, color: WeddingColors.goldLeaf, size: 14.0),
                            const SizedBox(width: 8.0),
                            Text(
                              'OFFICIAL ORGANIZER PORTAL',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 10.0,
                                color: WeddingColors.goldLeaf,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      // Main Header Title
                      Text(
                        'Command & Control Center',
                        style: GoogleFonts.playfairDisplay(
                          color: WeddingColors.warmIvory,
                          fontSize: isMobile ? 26.0 : 34.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        'Real-time guest logistics, community moderation, and monetization telemetry for Naza & Victor.',
                        style: GoogleFonts.plusJakartaSans(
                          color: WeddingColors.champagneSilk.withValues(alpha: 0.85),
                          fontSize: 13.0,
                        ),
                      ),
                      const SizedBox(height: 18.0),

                      // Export Guest List Button
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: WeddingColors.warmIvory,
                          side: const BorderSide(color: WeddingColors.goldLeaf),
                          backgroundColor: WeddingColors.midnightVelvet.withValues(alpha: 0.6),
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Guest list CSV export initiated successfully!'),
                              backgroundColor: WeddingColors.imperialBurgundySolid,
                            ),
                          );
                        },
                        icon: const Icon(Icons.table_chart_outlined, color: WeddingColors.goldLeaf, size: 18.0),
                        label: Text(
                          'EXPORT GUEST LIST (CSV)',
                          style: GoogleFonts.plusJakartaSans(
                            color: WeddingColors.warmIvory,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Divider(color: WeddingColors.goldLeaf.withValues(alpha: 0.3)),
                      const SizedBox(height: 16.0),

                      // Horizontal Scrollable Tab Switcher
                      SizedBox(
                        height: 44.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _tabs.length,
                          itemBuilder: (context, index) {
                            final isSelected = _activeTabIndex == index;
                            return Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: InkWell(
                                onTap: () => setState(() => _activeTabIndex = index),
                                borderRadius: BorderRadius.circular(12.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? WeddingColors.goldLeaf
                                        : WeddingColors.midnightVelvet.withValues(alpha: 0.6),
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(color: WeddingColors.goldLeaf),
                                  ),
                                  child: Text(
                                    _tabs[index],
                                    style: GoogleFonts.plusJakartaSans(
                                      color: isSelected
                                          ? WeddingColors.imperialBurgundySolid
                                          : WeddingColors.warmIvory,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24.0),

                      // Dynamic Tab Content View
                      if (_activeTabIndex == 0) ...[
                        // OVERVIEW METRICS TAB
                        Row(
                          children: [
                            Expanded(
                              child: _buildLiquidGlassContainer(
                                child: _buildMetricCardContent(
                                  title: 'ATTENDANCE HEADCOUNT',
                                  value: '14 Seats',
                                  subtitle: '6 Guest Parties Accepted\nBride Family: 6 | Groom Family: 5 | Friends: 3',
                                  icon: Icons.people_alt,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: _buildLiquidGlassContainer(
                                child: _buildMetricCardContent(
                                  title: 'MONETIZATION & GIFTS',
                                  value: '₦1,850,000',
                                  subtitle: 'Verified Paystack Telemetry\nVirtual Spraying: ₦1.2M | Keepsakes: ₦650K',
                                  icon: Icons.account_balance_wallet,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        _buildLiquidGlassContainer(
                          child: _buildMetricCardContent(
                            title: 'COMMUNITY GALLERY QUEUE',
                            value: '3 Pending Review',
                            subtitle: 'Approved & Live: 1 | Moderation Queue: 3 reels/photos awaiting inspection',
                            icon: Icons.camera_alt_outlined,
                          ),
                        ),
                      ] else if (_activeTabIndex == 1) ...[
                        // GUEST WHITELIST TAB
                        _buildLiquidGlassContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Guest Whitelist & Seating Registry',
                                style: GoogleFonts.playfairDisplay(
                                  color: WeddingColors.warmIvory,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                'Search, filter, view dietary notes, and assign seating tables.',
                                style: GoogleFonts.plusJakartaSans(
                                  color: WeddingColors.champagneSilk.withValues(alpha: 0.8),
                                  fontSize: 11.0,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              
                              // Filters row
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: TextField(
                                      onChanged: (val) => setState(() => _searchQuery = val),
                                      style: const TextStyle(color: WeddingColors.warmIvory),
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.search, color: WeddingColors.goldLeaf, size: 18.0),
                                        hintText: 'Search guest or dietary notes...',
                                        hintStyle: TextStyle(color: WeddingColors.warmIvory.withValues(alpha: 0.3)),
                                        filled: true,
                                        fillColor: WeddingColors.midnightVelvet.withValues(alpha: 0.4),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: const BorderSide(color: WeddingColors.goldLeaf)),
                                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(color: WeddingColors.goldLeaf.withValues(alpha: 0.5))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      decoration: BoxDecoration(
                                        color: WeddingColors.midnightVelvet.withValues(alpha: 0.4),
                                        borderRadius: BorderRadius.circular(12.0),
                                        border: Border.all(color: WeddingColors.goldLeaf.withValues(alpha: 0.5)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: _selectedAffiliationFilter,
                                          dropdownColor: WeddingColors.midnightVelvet,
                                          style: const TextStyle(color: WeddingColors.warmIvory, fontSize: 12.0),
                                          items: const [
                                            DropdownMenuItem(value: 'All Affiliations', child: Text('All Affiliations')),
                                            DropdownMenuItem(value: 'Bride Family', child: Text('Bride Family')),
                                            DropdownMenuItem(value: 'Groom Family', child: Text('Groom Family')),
                                            DropdownMenuItem(value: 'Friends', child: Text('Friends')),
                                          ],
                                          onChanged: (val) => setState(() => _selectedAffiliationFilter = val!),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),

                              // Guest list scrollable rows
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _guests.length,
                                separatorBuilder: (context, index) => const Divider(color: Colors.white24, height: 24),
                                itemBuilder: (context, index) {
                                  final guest = _guests[index];
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              guest['name'],
                                              style: GoogleFonts.plusJakartaSans(
                                                color: WeddingColors.warmIvory,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                            const SizedBox(height: 2.0),
                                            Text(
                                              guest['table'],
                                              style: GoogleFonts.plusJakartaSans(
                                                color: WeddingColors.goldLeaf,
                                                fontSize: 11.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          guest['affiliation'],
                                          style: GoogleFonts.plusJakartaSans(
                                            color: WeddingColors.champagneSilk.withValues(alpha: 0.8),
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              guest['partySize'],
                                              style: GoogleFonts.plusJakartaSans(
                                                color: WeddingColors.warmIvory,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(height: 2.0),
                                            Text(
                                              'Note: ${guest['dietary']}',
                                              style: GoogleFonts.plusJakartaSans(
                                                color: WeddingColors.goldLeaf,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                            decoration: BoxDecoration(
                                              color: Colors.green.withValues(alpha: 0.15),
                                              borderRadius: BorderRadius.circular(6.0),
                                              border: Border.all(color: Colors.green.withValues(alpha: 0.5)),
                                            ),
                                            child: Text(
                                              guest['status'],
                                              style: const TextStyle(color: Colors.greenAccent, fontSize: 9.0, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ] else if (_activeTabIndex == 2) ...[
                        // ----------------------------------------------------
                        // REGRETS & DECLINES FULL LIQUID GLASS PAGE CONTENT
                        // ----------------------------------------------------
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Badge Header
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: WeddingColors.goldLeaf),
                                color: WeddingColors.midnightVelvet.withValues(alpha: 0.4),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.person_off_outlined, color: WeddingColors.goldLeaf, size: 14.0),
                                  const SizedBox(width: 6.0),
                                  Text(
                                    'DECLINED INVITATIONS',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 11.0,
                                      color: WeddingColors.goldLeaf,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            Text(
                              'Those unable to join in person.',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: isMobile ? 26.0 : 34.0,
                                fontWeight: FontWeight.bold,
                                color: WeddingColors.warmIvory,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(height: 6.0),
                            Text(
                              'Honor their well wishes, manage digital souvenir links, and stream live ceremony access.',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 13.0,
                                color: WeddingColors.champagneSilk.withValues(alpha: 0.85),
                              ),
                            ),
                            const SizedBox(height: 18.0),
                            
                            // Action Buttons Row (Whitelist & Export Regrets)
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: WeddingColors.midnightVelvet.withValues(alpha: 0.6),
                                      foregroundColor: WeddingColors.goldLeaf,
                                      side: const BorderSide(color: WeddingColors.goldLeaf),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.verified_user_outlined, size: 14.0),
                                        const SizedBox(width: 4.0),
                                        Text('Whitelist', style: GoogleFonts.plusJakartaSans(fontSize: 11.0)),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                Expanded(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: WeddingColors.midnightVelvet.withValues(alpha: 0.6),
                                      foregroundColor: WeddingColors.goldLeaf,
                                      side: const BorderSide(color: WeddingColors.goldLeaf),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.file_download_outlined, size: 14.0),
                                        const SizedBox(width: 4.0),
                                        Flexible(
                                          child: Text(
                                            'Export Regrets',
                                            style: GoogleFonts.plusJakartaSans(fontSize: 11.0),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),

                            // Stats Summary Container
                            _buildLiquidGlassContainer(
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.redAccent, width: 1.5),
                                      color: WeddingColors.midnightVelvet.withValues(alpha: 0.5),
                                    ),
                                    child: const Icon(Icons.person_off, color: Colors.redAccent, size: 24.0),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${_declines.length} Guests Sent Regrets',
                                          style: GoogleFonts.playfairDisplay(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: WeddingColors.warmIvory,
                                          ),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          'Their blessings have been recorded, and digital access links will be shared for the live stream.',
                                          style: GoogleFonts.plusJakartaSans(
                                            fontSize: 11.0,
                                            color: WeddingColors.champagneSilk.withValues(alpha: 0.85),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16.0),

                            // Search and Filter Widget Container
                            _buildLiquidGlassContainer(
                              child: Column(
                                children: [
                                  TextField(
                                    controller: _declinedSearchController,
                                    style: const TextStyle(color: WeddingColors.warmIvory),
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.search, color: WeddingColors.goldLeaf, size: 18.0),
                                      hintText: 'Search declined guest name or note...',
                                      hintStyle: TextStyle(color: WeddingColors.warmIvory.withValues(alpha: 0.3)),
                                      filled: true,
                                      fillColor: WeddingColors.midnightVelvet.withValues(alpha: 0.4),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: const BorderSide(color: WeddingColors.goldLeaf)),
                                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(color: WeddingColors.goldLeaf.withValues(alpha: 0.5))),
                                    ),
                                  ),
                                  const SizedBox(height: 12.0),
                                  Row(
                                    children: [
                                      const Icon(Icons.filter_list, color: WeddingColors.goldLeaf, size: 18.0),
                                      const SizedBox(width: 8.0),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                          decoration: BoxDecoration(
                                            color: WeddingColors.midnightVelvet.withValues(alpha: 0.4),
                                            borderRadius: BorderRadius.circular(12.0),
                                            border: Border.all(color: WeddingColors.goldLeaf.withValues(alpha: 0.5)),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: _selectedDeclinedAffiliation,
                                              isExpanded: true,
                                              dropdownColor: const Color.fromARGB(255, 2, 5, 35),
                                              style: const TextStyle(color: WeddingColors.warmIvory),
                                              items: const [
                                                'All Affiliations',
                                                'Friends of the Couple',
                                                'Dignitaries',
                                                'Bride Family',
                                              ].map<DropdownMenuItem<String>>((String val) {
                                                return DropdownMenuItem<String>(
                                                  value: val,
                                                  child: Text(val, overflow: TextOverflow.ellipsis),
                                                );
                                              }).toList(),
                                              onChanged: (val) => setState(() => _selectedDeclinedAffiliation = val!),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16.0),

                            // Declined Guest Cards Feed
                            ..._declines.map((decline) => Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: _buildDeclinedGuestCard(
                                name: decline['name'],
                                badge: decline['badge'],
                                date: decline['date'],
                                sprayed: decline['sprayed'],
                                note: decline['note'],
                                contact: decline['contact'],
                              ),
                            )),
                          ],
                        ),
                      ] else ...[
                        // CONTENT MODERATION & CACHING LOGS TABS
                        _buildLiquidGlassContainer(
                          child: Column(
                            children: [
                              const Icon(Icons.security, color: WeddingColors.goldLeaf, size: 36.0),
                              const SizedBox(height: 12.0),
                              Text(
                                '${_tabs[_activeTabIndex]} Module Active & Synchronized',
                                style: GoogleFonts.playfairDisplay(
                                  color: WeddingColors.warmIvory,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6.0),
                              Text(
                                'Telemetry data stream is secure and connected to the central database.',
                                style: GoogleFonts.plusJakartaSans(
                                  color: WeddingColors.champagneSilk.withValues(alpha: 0.7),
                                  fontSize: 11.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

  Widget _buildLiquidGlassContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: 0.15),
            Colors.white.withValues(alpha: 0.04),
            WeddingColors.midnightVelvet.withValues(alpha: 0.45),
          ],
          stops: const [0.0, 0.45, 1.0],
        ),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.35),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 20.0,
            spreadRadius: -2.0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildMetricCardContent({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: WeddingColors.goldLeaf, size: 24.0),
        const SizedBox(height: 12.0),
        Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            color: WeddingColors.goldLeaf,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          value,
          style: GoogleFonts.plusJakartaSans(
            color: WeddingColors.warmIvory,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6.0),
        Text(
          subtitle,
          style: GoogleFonts.plusJakartaSans(
            color: WeddingColors.champagneSilk.withValues(alpha: 0.7),
            fontSize: 11.0,
          ),
        ),
      ],
    );
  }

  Widget _buildDeclinedGuestCard({
    required String name,
    required String badge,
    required String date,
    required String sprayed,
    required String note,
    required String contact,
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: 0.15),
            Colors.white.withValues(alpha: 0.04),
            WeddingColors.midnightVelvet.withValues(alpha: 0.45),
          ],
          stops: const [0.0, 0.45, 1.0],
        ),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 20.0,
            spreadRadius: -2.0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: WeddingColors.warmIvory,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: WeddingColors.goldLeaf.withValues(alpha: 0.5)),
                  color: WeddingColors.midnightVelvet.withValues(alpha: 0.6),
                ),
                child: Text(
                  badge,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 10.0,
                    color: WeddingColors.champagneSilk,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Wrap(
            spacing: 12.0,
            runSpacing: 6.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.calendar_today_outlined, color: WeddingColors.goldLeaf, size: 14.0),
                  const SizedBox(width: 6.0),
                  Text(
                    date,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11.0,
                      color: WeddingColors.champagneSilk.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: WeddingColors.goldLeaf),
                  color: WeddingColors.midnightVelvet.withValues(alpha: 0.6),
                ),
                child: Text(
                  'Sprayed $sprayed',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                    color: WeddingColors.goldLeaf,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14.0),
            child: Divider(color: Colors.white24, height: 1),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: WeddingColors.midnightVelvet.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: WeddingColors.goldLeaf.withValues(alpha: 0.3)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.chat_bubble_outline, color: WeddingColors.goldLeaf, size: 16.0),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    '"$note"',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12.0,
                      fontStyle: FontStyle.italic,
                      color: WeddingColors.warmIvory,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14.0),
          Text(
            'Contact: $contact',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 11.0,
              color: WeddingColors.champagneSilk.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: WeddingColors.goldLeaf,
                    foregroundColor: WeddingColors.imperialBurgundySolid,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Souvenir Link',
                    style: GoogleFonts.plusJakartaSans(fontSize: 11.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.green.withValues(alpha: 0.2),
                    foregroundColor: Colors.greenAccent,
                    side: const BorderSide(color: Colors.greenAccent),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Move to Whitelist',
                    style: GoogleFonts.plusJakartaSans(fontSize: 10.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
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