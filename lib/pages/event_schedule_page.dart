import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/pages/aso_ebi_attire_page.dart';
import 'package:wedding_app/theme/theme_colors.dart';

class EventSchedulePage extends StatefulWidget {
  const EventSchedulePage({super.key});

  @override
  State<EventSchedulePage> createState() => _EventSchedulePageState();
}

class _EventSchedulePageState extends State<EventSchedulePage> {
  final List<Map<String, String>> _scheduleEvents = [
    {
      'time': '12:00 PM',
      'title': 'Guest Arrival & Seating',
      'description': 'Family members, friends, and invited guests arrive and take their designated seats to traditional sounds.',
    },
    {
      'time': '01:00 PM',
      'title': 'Traditional Opening Rites',
      'description': 'Opening prayers, breaking of the kola nut (Iji Oji), and official welcome address by the chairman of the occasion.',
    },
    {
      'time': '02:00 PM',
      'title': 'The Bride’s Procession',
      'description': 'The bride makes her grand entrance accompanied by her bridal train, searching for her groom amidst the cheering crowd.',
    },
    {
      'time': '03:15 PM',
      'title': 'Wine Presentation Ceremony',
      'description': 'The pivotal cultural milestone where the bride receives her cup of wine from her father, searches for her groom, and presents it to him.',
    },
    {
      'time': '04:30 PM',
      'title': 'Blessing & Traditional Marriage Rites',
      'description': 'The couple receives blessings from both families, elders, and spiritual leaders, sealing the union culturally.',
    },
    {
      'time': '05:30 PM',
      'title': 'General Reception & Dancing',
      'description': 'Feasting, exchange of gifts, family dance processions, and celebration into the evening.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.midnightVelvet,
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Section Header Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: ThemeColors.goldLeaf, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.schedule, color: ThemeColors.goldLeaf, size: 14),
                  const SizedBox(width: 8),
                  Text(
                    'EVENT PROGRAMME',
                    style: GoogleFonts.plusJakartaSans(
                      color: ThemeColors.goldLeaf,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Main Title
            Text(
              'Order of Proceedings',
              style: GoogleFonts.playfairDisplay(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFFF6D6),
                height: 1.15,
              ),
            ),
            const SizedBox(height: 12),

            // Subtitle Description
            Text(
              'A timeline of the traditional ceremonies and celebratory events for the day.',
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white70,
                fontSize: 15,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),

            // Timeline Items Container (Replaced ListView.builder with Column mapping)
            Column(
              children: _scheduleEvents.asMap().entries.map((entry) {
                final index = entry.key;
                final event = entry.value;
                final isLast = index == _scheduleEvents.length - 1;

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Time Column
                    SizedBox(
                      width: 80,
                      child: Text(
                        event['time']!,
                        style: GoogleFonts.plusJakartaSans(
                          color: ThemeColors.goldLeaf,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Timeline Node Line & Dot
                    Column(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: ThemeColors.goldLeaf,
                            shape: BoxShape.circle,
                            border: Border.all(color: ThemeColors.midnightVelvet, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: ThemeColors.goldLeaf.withValues(alpha: 0.4),
                                blurRadius: 6,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                        if (!isLast)
                          Container(
                            width: 2,
                            height: 95, // Adjusted to match card padding dimensions safely
                            color: ThemeColors.goldLeaf.withValues(alpha: 0.3),
                          ),
                      ],
                    ),
                    const SizedBox(width: 16),

                    // Event Content Card
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: ThemeColors.midnightVelvet.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: ThemeColors.goldLeaf.withValues(alpha: 0.4),
                            width: 1.1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event['title']!,
                              style: GoogleFonts.playfairDisplay(
                                color: const Color(0xFFFFF6D6),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              event['description']!,
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white70,
                                fontSize: 13.5,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}