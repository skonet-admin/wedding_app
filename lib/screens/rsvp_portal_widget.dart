import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/theme/theme_colors.dart';

class RsvpPortalAndMonetizationWidget extends StatefulWidget {
  const RsvpPortalAndMonetizationWidget({super.key});

  @override
  State<RsvpPortalAndMonetizationWidget> createState() =>
      _RsvpPortalAndMonetizationWidgetState();
}

class _RsvpPortalAndMonetizationWidgetState
    extends State<RsvpPortalAndMonetizationWidget> {
  bool _isJoyfullyAccepting = true;
  
  String _selectedEvent = 'Traditional Wedding (Aug 4 - Open Feast)';
  String _affiliation = 'The Okafor Family (Bride)';
  String _guestCount = '1 Guest (Single Seat)';
  
  final List<Map<String, TextEditingController>> _additionalGuests = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dietaryController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _customAmountController = TextEditingController();
  
  final TextEditingController _groupContextNameController = TextEditingController();

  final TextEditingController _declinedNameController = TextEditingController();
  final TextEditingController _declinedContactController = TextEditingController();
  final TextEditingController _declinedNoteController = TextEditingController();

  int _selectedTokenAmount = 10000;
  bool _isCustomAmount = false;
  bool _isInstantGatewayMode = true; 
  String _selectedBank = 'Opay Digital Services (9012345678)';
  String _selectedDeclinedAffiliation = 'The Okafor Family (Bride)';

  @override
  void dispose() {
    _nameController.dispose();
    _dietaryController.dispose();
    _noteController.dispose();
    _customAmountController.dispose();
    _groupContextNameController.dispose();
    _declinedNameController.dispose();
    _declinedContactController.dispose();
    _declinedNoteController.dispose();
    for (var guest in _additionalGuests) {
      guest['name']?.dispose();
      guest['dietary']?.dispose();
    }
    super.dispose();
  }

  void _addDelegateMember() {
    setState(() {
      _additionalGuests.add({
        'name': TextEditingController(),
        'dietary': TextEditingController(),
      });
    });
  }

  void _removeDelegateMember(int index) {
    setState(() {
      _additionalGuests[index]['name']?.dispose();
      _additionalGuests[index]['dietary']?.dispose();
      _additionalGuests.removeAt(index);
    });
  }

  void _syncAdditionalGuestsCount(String tier) {
    _additionalGuests.clear();
    int targetCount = 0;
    if (tier.contains('2 Guests')) {
      targetCount = 1; 
    } else if (tier.contains('Family Table')) {
      targetCount = 3; 
    } else if (tier.contains('Church / Delegation')) {
      targetCount = 3; 
    }

    for (int i = 0; i < targetCount; i++) {
      _additionalGuests.add({
        'name': TextEditingController(),
        'dietary': TextEditingController(),
      });
    }
  }

  void _addDietaryTag(String tag) {
    final cleanTag = tag.replaceFirst('+ ', '');
    final currentText = _dietaryController.text.trim();
    if (currentText.isEmpty) {
      _dietaryController.text = cleanTag;
    } else if (!currentText.contains(cleanTag)) {
      _dietaryController.text = '$currentText, $cleanTag';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;
    final isWhiteWedding = _selectedEvent.contains('White Wedding');
    final needsAdditionalGuestsForm = !_guestCount.contains('1 Guest') && !isWhiteWedding;

    return Scaffold(
      backgroundColor: ThemeColors.midnightVelvet,
      appBar: AppBar(
        backgroundColor: ThemeColors.imperialBurgundySolid,
        elevation: 0,
        iconTheme: const IconThemeData(color: ThemeColors.goldLeaf),
        title: Text(
          'RSVP & REGISTRY PORTAL',
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Rsvp.jpg',
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
                    ThemeColors.midnightVelvet.withValues(alpha: 0.25),
                    ThemeColors.midnightVelvet.withValues(alpha: 0.75),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
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
                      Text(
                        'KINDLY RESPOND',
                        style: GoogleFonts.plusJakartaSans(
                          color: ThemeColors.goldLeaf,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.5,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Save your seat at the feast.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: isMobile ? 28.0 : 38.0,
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.warmIvory,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: ThemeColors.midnightVelvet.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: ThemeColors.goldLeaf.withValues(alpha: 0.5)),
                        ),
                        child: Text(
                          'Kindly reply before oct 05, 2026. You can return to update your seating count up to one month before the event.',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12.0,
                            color: ThemeColors.champagneSilk,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 28.0),
                      
                      // ATTENDANCE STATUS
                      _buildLiquidGlassContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ATTENDANCE STATUS',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12.0,
                                color: ThemeColors.goldLeaf,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _isJoyfullyAccepting
                                          ? ThemeColors.goldLeaf
                                          : ThemeColors.midnightVelvet.withValues(alpha: 0.6),
                                      foregroundColor: _isJoyfullyAccepting
                                          ? ThemeColors.imperialBurgundySolid
                                          : ThemeColors.goldLeaf,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                        side: const BorderSide(color: ThemeColors.goldLeaf),
                                      ),
                                    ),
                                    onPressed: () => setState(() => _isJoyfullyAccepting = true),
                                    child: const Text('JOYFULLY ACCEPTS'),
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                Expanded(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: !_isJoyfullyAccepting
                                          ? ThemeColors.goldLeaf
                                          : ThemeColors.midnightVelvet.withValues(alpha: 0.6),
                                      foregroundColor: !_isJoyfullyAccepting
                                          ? ThemeColors.imperialBurgundySolid
                                          : ThemeColors.goldLeaf,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                        side: const BorderSide(color: ThemeColors.goldLeaf),
                                      ),
                                    ),
                                    onPressed: () => setState(() => _isJoyfullyAccepting = false),
                                    child: const Text('REGRETS DECLINES'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      
                      if (_isJoyfullyAccepting) ...[
                        _buildLiquidGlassContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ACCEPTANCE DETAILS',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 12.0,
                                  color: ThemeColors.goldLeaf,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              
                              // EVENT SELECTOR
                              _buildFieldLabel('SELECT EVENT DAY'),
                              const SizedBox(height: 6.0),
                              _buildDropdownContainer(
                                value: _selectedEvent,
                                items: const [
                                  'Traditional Wedding (Aug 4 - Open Feast)',
                                  'White Wedding (Aug 5 - Exclusive/Invite Only)',
                                ],
                                onChanged: (val) {
                                  setState(() {
                                    _selectedEvent = val!;
                                    if (_selectedEvent.contains('White Wedding')) {
                                      _guestCount = '1 Guest (Single Seat)';
                                      _additionalGuests.clear();
                                    }
                                  });
                                },
                              ),
                              const SizedBox(height: 12.0),
                              
                              if (isWhiteWedding)
                                Container(
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: ThemeColors.goldLeaf.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: ThemeColors.goldLeaf.withValues(alpha: 0.4)),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.verified_user_outlined, color: ThemeColors.goldLeaf, size: 20.0),
                                      const SizedBox(width: 10.0),
                                      Expanded(
                                        child: Text(
                                          'Note: White Wedding seating is strictly restricted to designated invitees and max 1 partner per invitation code.',
                                          style: GoogleFonts.plusJakartaSans(
                                            fontSize: 11.0,
                                            color: ThemeColors.champagneSilk,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (isWhiteWedding) const SizedBox(height: 20.0),

                              _buildFieldLabel('LEADER / REPRESENTATIVE FULL NAME'),
                              const SizedBox(height: 6.0),
                              _buildTextField(_nameController, 'Lord / Lady Full Name', Icons.person_outline),
                              const SizedBox(height: 20.0),
                              
                              _buildFieldLabel('GUEST AFFILIATION / TIER'),
                              const SizedBox(height: 6.0),
                              _buildDropdownContainer(
                                value: _affiliation,
                                items: const [
                                  'The Okafor Family (Bride)',
                                  'The Ekuma Family (Groom)',
                                  'Church Delegation / Group',
                                  'Colleagues & Corporate Friends',
                                  'Mutual Friend / Guest',
                                ],
                                onChanged: (val) => setState(() => _affiliation = val!),
                              ),
                              const SizedBox(height: 20.0),
                              
                              // NUMBER OF SEATS REQUIRED
                              _buildFieldLabel('NUMBER OF SEATS REQUIRED'),
                              const SizedBox(height: 6.0),
                              _buildDropdownContainer(
                                value: _guestCount,
                                items: isWhiteWedding
                                    ? const [
                                        '1 Guest (Single Seat)',
                                        '2 Guests (Couple / Plus One)',
                                      ]
                                    : const [
                                        '1 Guest (Single Seat)',
                                        '2 Guests (Couple / Plus One)',
                                        'Family Table (Up to 4)',
                                        'Church / Delegation Block',
                                      ],
                                onChanged: (val) {
                                  setState(() {
                                    _guestCount = val!;
                                    _syncAdditionalGuestsCount(_guestCount);
                                  });
                                },
                              ),
                              const SizedBox(height: 20.0),

                              if (needsAdditionalGuestsForm) ...[
                                Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: ThemeColors.midnightVelvet.withValues(alpha: 0.5),
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(color: ThemeColors.goldLeaf.withValues(alpha: 0.4)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (_guestCount.contains('Family Table')) ...[
                                        Text(
                                          'FAMILY NAME',
                                          style: GoogleFonts.plusJakartaSans(
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.bold,
                                            color: ThemeColors.goldLeaf,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                        const SizedBox(height: 6.0),
                                        TextField(
                                          controller: _groupContextNameController,
                                          style: const TextStyle(color: ThemeColors.warmIvory, fontSize: 13.0),
                                          decoration: InputDecoration(
                                            hintText: 'e.g. The Adebayo Family',
                                            hintStyle: TextStyle(color: ThemeColors.warmIvory.withValues(alpha: 0.3), fontSize: 13.0),
                                            isDense: true,
                                            filled: true,
                                            fillColor: ThemeColors.midnightVelvet.withValues(alpha: 0.4),
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: const BorderSide(color: ThemeColors.goldLeaf)),
                                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: ThemeColors.goldLeaf.withValues(alpha: 0.4))),
                                          ),
                                        ),
                                        const SizedBox(height: 16.0),
                                      ] else if (_guestCount.contains('Church / Delegation')) ...[
                                        Text(
                                          'ORGANIZATION / CHURCH / INSTITUTION NAME',
                                          style: GoogleFonts.plusJakartaSans(
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.bold,
                                            color: ThemeColors.goldLeaf,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                        const SizedBox(height: 6.0),
                                        TextField(
                                          controller: _groupContextNameController,
                                          style: const TextStyle(color: ThemeColors.warmIvory, fontSize: 13.0),
                                          decoration: InputDecoration(
                                            hintText: 'e.g. St. Peters Anglican Church / BlueTag / FUNAAB',
                                            hintStyle: TextStyle(color: ThemeColors.warmIvory.withValues(alpha: 0.3), fontSize: 13.0),
                                            isDense: true,
                                            filled: true,
                                            fillColor: ThemeColors.midnightVelvet.withValues(alpha: 0.4),
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: const BorderSide(color: ThemeColors.goldLeaf)),
                                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: ThemeColors.goldLeaf.withValues(alpha: 0.4))),
                                          ),
                                        ),
                                        const SizedBox(height: 16.0),
                                      ],

                                      Wrap(
                                        alignment: WrapAlignment.spaceBetween,
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        spacing: 8.0,
                                        runSpacing: 4.0,
                                        children: [
                                          Text(
                                            'SEAT RESERVATIONS (${_additionalGuests.length + 1} Total)',
                                            style: GoogleFonts.plusJakartaSans(
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.bold,
                                              color: ThemeColors.goldLeaf,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                          if (!_guestCount.contains('2 Guests'))
                                            TextButton.icon(
                                              onPressed: _addDelegateMember,
                                              icon: const Icon(Icons.add, size: 16.0, color: ThemeColors.goldLeaf),
                                              label: Text(
                                                'Add Member',
                                                style: GoogleFonts.plusJakartaSans(fontSize: 11.0, color: ThemeColors.goldLeaf),
                                              ),
                                            ),
                                        ],
                                      ),
                                      const SizedBox(height: 4.0),
                                      Text(
                                        'Please list names and dietary requirements for all guests occupying these seats.',
                                        style: GoogleFonts.plusJakartaSans(fontSize: 11.0, color: ThemeColors.champagneSilk),
                                      ),
                                      const SizedBox(height: 12.0),
                                      
                                      Container(
                                        margin: const EdgeInsets.only(bottom: 12.0),
                                        padding: const EdgeInsets.all(12.0),
                                        decoration: BoxDecoration(
                                          color: ThemeColors.midnightVelvet.withValues(alpha: 0.3),
                                          borderRadius: BorderRadius.circular(10.0),
                                          border: Border.all(color: ThemeColors.goldLeaf.withValues(alpha: 0.3)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Guest #1 (Primary Representative / Leader)',
                                              style: GoogleFonts.plusJakartaSans(fontSize: 11.0, color: ThemeColors.goldLeaf, fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 8.0),
                                            TextField(
                                              controller: _nameController,
                                              style: const TextStyle(color: ThemeColors.warmIvory, fontSize: 13.0),
                                              decoration: InputDecoration(
                                                hintText: 'Primary Guest Full Name',
                                                hintStyle: TextStyle(color: ThemeColors.warmIvory.withValues(alpha: 0.3), fontSize: 13.0),
                                                isDense: true,
                                                filled: true,
                                                fillColor: ThemeColors.midnightVelvet.withValues(alpha: 0.4),
                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: const BorderSide(color: ThemeColors.goldLeaf)),
                                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: ThemeColors.goldLeaf.withValues(alpha: 0.4))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: _additionalGuests.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: const EdgeInsets.only(bottom: 12.0),
                                            padding: const EdgeInsets.all(12.0),
                                            decoration: BoxDecoration(
                                              color: ThemeColors.midnightVelvet.withValues(alpha: 0.3),
                                              borderRadius: BorderRadius.circular(10.0),
                                              border: Border.all(color: ThemeColors.goldLeaf.withValues(alpha: 0.2)),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Guest #${index + 2}',
                                                      style: GoogleFonts.plusJakartaSans(fontSize: 11.0, color: ThemeColors.goldLeaf, fontWeight: FontWeight.bold),
                                                    ),
                                                    if (!_guestCount.contains('2 Guests') && _additionalGuests.length > 1)
                                                      InkWell(
                                                        onTap: () => _removeDelegateMember(index),
                                                        child: const Icon(Icons.close, size: 16.0, color: Colors.redAccent),
                                                      ),
                                                  ],
                                                ),
                                                const SizedBox(height: 8.0),
                                                TextField(
                                                  controller: _additionalGuests[index]['name'],
                                                  style: const TextStyle(color: ThemeColors.warmIvory, fontSize: 13.0),
                                                  decoration: InputDecoration(
                                                    hintText: 'Guest Full Name',
                                                    hintStyle: TextStyle(color: ThemeColors.warmIvory.withValues(alpha: 0.3), fontSize: 13.0),
                                                    isDense: true,
                                                    filled: true,
                                                    fillColor: ThemeColors.midnightVelvet.withValues(alpha: 0.4),
                                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: const BorderSide(color: ThemeColors.goldLeaf)),
                                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: ThemeColors.goldLeaf.withValues(alpha: 0.4))),
                                                  ),
                                                ),
                                                const SizedBox(height: 8.0),
                                                TextField(
                                                  controller: _additionalGuests[index]['dietary'],
                                                  style: const TextStyle(color: ThemeColors.warmIvory, fontSize: 13.0),
                                                  decoration: InputDecoration(
                                                    hintText: 'Dietary Requirement (e.g. Vegetarian, None)',
                                                    hintStyle: TextStyle(color: ThemeColors.warmIvory.withValues(alpha: 0.3), fontSize: 13.0),
                                                    isDense: true,
                                                    filled: true,
                                                    fillColor: ThemeColors.midnightVelvet.withValues(alpha: 0.4),
                                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: const BorderSide(color: ThemeColors.goldLeaf)),
                                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: ThemeColors.goldLeaf.withValues(alpha: 0.4))),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                              ],
                              
                              _buildFieldLabel('DIETARY REQUIREMENTS (PRIMARY GUEST)'),
                              const SizedBox(height: 6.0),
                              _buildTextField(_dietaryController, 'e.g. No pepper, no shellfish, vegetarian...', Icons.restaurant_menu),
                              const SizedBox(height: 10.0),
                              Wrap(
                                spacing: 8.0,
                                runSpacing: 6.0,
                                children: [
                                  _buildDietaryChip('+ Mild Pepper'),
                                  _buildDietaryChip('+ No Shellfish'),
                                  _buildDietaryChip('+ Vegetarian'),
                                  _buildDietaryChip('+ Halal'),
                                  _buildDietaryChip('+ Traditional Igbo Feast Only'),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              
                              _buildFieldLabel('A NOTE TO THE COUPLE'),
                              const SizedBox(height: 6.0),
                              TextField(
                                controller: _noteController,
                                maxLines: 3,
                                style: const TextStyle(color: ThemeColors.warmIvory),
                                decoration: InputDecoration(
                                  hintText: 'Share your prayers, goodwill, and blessings for Naza & Victor...',
                                  hintStyle: TextStyle(color: ThemeColors.warmIvory.withValues(alpha: 0.3)),
                                  filled: true,
                                  fillColor: ThemeColors.midnightVelvet.withValues(alpha: 0.4),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: const BorderSide(color: ThemeColors.goldLeaf)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(color: ThemeColors.goldLeaf.withValues(alpha: 0.5))),
                                ),
                              ),
                              const SizedBox(height: 24.0),
                              
                              NeonGlowingButton(
                                text: 'SEND MY RSVP',
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('RSVP Submitted Successfully to Supabase!'), backgroundColor: ThemeColors.imperialBurgundySolid),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 48.0),
                        
                        // VIRTUAL BLESSINGS & STORE
                        Text(
                          'VIRTUAL BLESSINGS & STORE',
                          style: GoogleFonts.plusJakartaSans(
                            color: ThemeColors.goldLeaf,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.5,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Digital Spraying & Keepsakes',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: isMobile ? 26.0 : 36.0,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.warmIvory,
                          ),
                        ),
                        const SizedBox(height: 28.0),
                        Container(
                          padding: const EdgeInsets.all(26.0),
                          decoration: BoxDecoration(
                            color: ThemeColors.midnightVelvet.withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(24.0),
                            border: Border.all(
                              color: ThemeColors.goldLeaf.withValues(alpha: 0.2),
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Digital Spraying Squad',
                                          style: GoogleFonts.playfairDisplay(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                            color: ThemeColors.warmIvory,
                                          ),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          _isInstantGatewayMode ? 'Instant Paystack / Flutterwave Hook' : 'Direct Bank Transfer (Opay / Access)',
                                          style: GoogleFonts.plusJakartaSans(
                                            fontSize: 12.0,
                                            color: ThemeColors.goldLeaf,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(color: ThemeColors.goldLeaf),
                                      color: ThemeColors.midnightVelvet.withValues(alpha: 0.4),
                                    ),
                                    child: const Icon(Icons.monetization_on_outlined, color: ThemeColors.goldLeaf, size: 20.0),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Divider(color: Colors.white24, height: 1),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () => setState(() => _isInstantGatewayMode = true),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                          color: _isInstantGatewayMode ? ThemeColors.goldLeaf : ThemeColors.midnightVelvet.withValues(alpha: 0.4),
                                          borderRadius: BorderRadius.circular(8.0),
                                          border: Border.all(color: ThemeColors.goldLeaf),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '⚡ Instant Gateway',
                                          style: GoogleFonts.plusJakartaSans(
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.bold,
                                            color: _isInstantGatewayMode ? ThemeColors.imperialBurgundySolid : ThemeColors.goldLeaf,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () => setState(() => _isInstantGatewayMode = false),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                          color: !_isInstantGatewayMode ? ThemeColors.goldLeaf : ThemeColors.midnightVelvet.withValues(alpha: 0.4),
                                          borderRadius: BorderRadius.circular(8.0),
                                          border: Border.all(color: ThemeColors.goldLeaf),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '🏦 Direct Transfer',
                                          style: GoogleFonts.plusJakartaSans(
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.bold,
                                            color: !_isInstantGatewayMode ? ThemeColors.imperialBurgundySolid : ThemeColors.goldLeaf,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              if (_isInstantGatewayMode) ...[
                                Wrap(
                                  alignment: WrapAlignment.spaceBetween,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 8.0,
                                  runSpacing: 4.0,
                                  children: [
                                    Text(
                                      'SELECT SPRAYING AMOUNT (₦)',
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.bold,
                                        color: ThemeColors.goldLeaf,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => setState(() => _isCustomAmount = !_isCustomAmount),
                                      child: Text(
                                        _isCustomAmount ? 'Use Presets' : 'Enter Custom',
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 11.0,
                                          decoration: TextDecoration.underline,
                                          color: ThemeColors.goldLeaf,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
                                if (!_isCustomAmount)
                                  Row(
                                    children: [
                                      _buildTokenOption(5000),
                                      const SizedBox(width: 8.0),
                                      _buildTokenOption(10000),
                                      const SizedBox(width: 8.0),
                                      _buildTokenOption(25000),
                                    ],
                                  )
                                else
                                  TextField(
                                    controller: _customAmountController,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(color: ThemeColors.warmIvory),
                                    decoration: InputDecoration(
                                      hintText: 'Enter amount in ₦',
                                      hintStyle: TextStyle(color: ThemeColors.warmIvory.withValues(alpha: 0.3)),
                                      filled: true,
                                      fillColor: ThemeColors.midnightVelvet.withValues(alpha: 0.4),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: const BorderSide(color: ThemeColors.goldLeaf)),
                                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(color: ThemeColors.goldLeaf.withValues(alpha: 0.5))),
                                    ),
                                  ),
                                const SizedBox(height: 20.0),
                                
                                NeonGlowingButton(
                                  text: 'SPRAY NOW 💸',
                                  onPressed: () {},
                                ),
                              ] else ...[
                                Text(
                                  'CHOOSE PREFERRED BANK ACCOUNT',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeColors.goldLeaf,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                _buildDropdownContainer(
                                  value: _selectedBank,
                                  items: const [
                                    'Opay Digital Services (9012345678)',
                                    'Access Bank PLC (0123456789)',
                                    'Moniepoint MFB (8123456789)',
                                  ],
                                  onChanged: (val) => setState(() => _selectedBank = val!),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ] else ...[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: ThemeColors.goldLeaf),
                                color: ThemeColors.midnightVelvet.withValues(alpha: 0.4),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.person_off_outlined, color: ThemeColors.goldLeaf, size: 14.0),
                                  const SizedBox(width: 6.0),
                                  Text(
                                    'REGRETS & DECLINES',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 11.0,
                                      color: ThemeColors.goldLeaf,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            Text(
                              'We will miss you at the celebration.',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: isMobile ? 26.0 : 34.0,
                                fontWeight: FontWeight.bold,
                                color: ThemeColors.warmIvory,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(height: 6.0),
                            Text(
                              'Please let Victor & Naza know your status so they can share live streaming access and digital souvenir links with you.',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 13.0,
                                color: ThemeColors.champagneSilk.withValues(alpha: 0.85),
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            
                            _buildLiquidGlassContainer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildFieldLabel('FULL NAME'),
                                  const SizedBox(height: 6.0),
                                  _buildTextField(_declinedNameController, 'Lord / Lady Full Name', Icons.person_outline),
                                  const SizedBox(height: 20.0),
                                  _buildFieldLabel('AFFILIATION'),
                                  const SizedBox(height: 6.0),
                                  _buildDropdownContainer(
                                    value: _selectedDeclinedAffiliation,
                                    items: const [
                                      'The Okafor Family (Bride)',
                                      'The Ekuma Family (Groom)',
                                      'Mutual Friend / Guest',
                                    ],
                                    onChanged: (val) => setState(() => _selectedDeclinedAffiliation = val!),
                                  ),
                                  const SizedBox(height: 20.0),
                                  _buildFieldLabel('EMAIL OR CONTACT (FOR LIVESTREAM LINK)'),
                                  const SizedBox(height: 6.0),
                                  _buildTextField(_declinedContactController, 'email@domain.com or phone number', Icons.email_outlined),
                                  const SizedBox(height: 20.0),
                                  _buildFieldLabel('A NOTE OF BLESSING & PRAYERS'),
                                  const SizedBox(height: 6.0),
                                  TextField(
                                    controller: _declinedNoteController,
                                    maxLines: 3,
                                    style: const TextStyle(color: ThemeColors.warmIvory),
                                    decoration: InputDecoration(
                                      hintText: 'Share your goodwill and prayers...',
                                      hintStyle: TextStyle(color: ThemeColors.warmIvory.withValues(alpha: 0.3)),
                                      filled: true,
                                      fillColor: ThemeColors.midnightVelvet.withValues(alpha: 0.4),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: const BorderSide(color: ThemeColors.goldLeaf)),
                                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(color: ThemeColors.goldLeaf.withValues(alpha: 0.5))),
                                    ),
                                  ),
                                  const SizedBox(height: 24.0),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: ThemeColors.goldLeaf,
                                        foregroundColor: ThemeColors.imperialBurgundySolid,
                                        elevation: 4.0,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                                      ),
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Regrets recorded. Thank you for your message!'), backgroundColor: ThemeColors.imperialBurgundySolid),
                                        );
                                      },
                                      child: Text('SUBMIT REGRETS', style: GoogleFonts.plusJakartaSans(fontSize: 14.0, fontWeight: FontWeight.bold, letterSpacing: 2.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
      padding: const EdgeInsets.all(26.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ThemeColors.midnightVelvet.withValues(alpha: 0.95),
            ThemeColors.midnightVelvet.withValues(alpha: 0.75),
            ThemeColors.midnightVelvet.withValues(alpha: 0.55),
          ],
          stops: const [0.0, 0.45, 1.0],
        ),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: ThemeColors.goldLeaf.withValues(alpha: 0.35),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 20.0,
            spreadRadius: -2.0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 12.0,
        color: ThemeColors.goldLeaf,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, IconData icon) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: ThemeColors.warmIvory),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: ThemeColors.goldLeaf.withValues(alpha: 0.7), size: 18.0),
        hintText: hint,
        hintStyle: TextStyle(color: ThemeColors.warmIvory.withValues(alpha: 0.3)),
        filled: true,
        fillColor: ThemeColors.midnightVelvet.withValues(alpha: 0.4),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: const BorderSide(color: ThemeColors.goldLeaf)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(color: ThemeColors.goldLeaf.withValues(alpha: 0.5))),
      ),
    );
  }

  Widget _buildDropdownContainer({required String value, required List<String> items, required ValueChanged<String?> onChanged}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: ThemeColors.midnightVelvet.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: ThemeColors.goldLeaf.withValues(alpha: 0.5)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: ThemeColors.midnightVelvet,
          style: const TextStyle(color: ThemeColors.warmIvory),
          items: items.map<DropdownMenuItem<String>>((String val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val, overflow: TextOverflow.ellipsis),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildDietaryChip(String label) {
    return InkWell(
      onTap: () => _addDietaryTag(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: ThemeColors.midnightVelvet.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: ThemeColors.goldLeaf.withValues(alpha: 0.5)),
        ),
        child: Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 11.0,
            color: ThemeColors.goldLeaf,
          ),
        ),
      ),
    );
  }

  Widget _buildTokenOption(int amount) {
    final isSelected = _selectedTokenAmount == amount;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _selectedTokenAmount = amount),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            color: isSelected ? ThemeColors.goldLeaf : ThemeColors.midnightVelvet.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: ThemeColors.goldLeaf),
          ),
          alignment: Alignment.center,
          child: Text(
            '₦${amount.toString()}',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: isSelected ? ThemeColors.imperialBurgundySolid : ThemeColors.goldLeaf,
            ),
          ),
        ),
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
            child: Text(
              widget.text,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ),
        );
      },
    );
  }
}