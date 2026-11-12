import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextStepsWidget extends StatelessWidget {
  const NextStepsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> steps = [
      {
        'icon': Icons.bar_chart_outlined,
        'title': 'Check your credit report',
        'subtitle': 'How to improve your credit score',
      },
      {
        'icon': Icons.trending_up_rounded,
        'title': 'Improve your score',
        'subtitle': 'Tips to boost eligibility in 3-6 months',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('🚀', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              Text(
                'Recommended Next Steps',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...steps.map((step) => _buildStepTile(step)),
        ],
      ),
    );
  }

  Widget _buildStepTile(Map<String, dynamic> step) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE8ECF8), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFEEF2FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            step['icon'] as IconData,
            color: const Color(0xFF2B4BAA),
            size: 20,
          ),
        ),
        title: Text(
          step['title'] as String,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A),
          ),
        ),
        subtitle: Text(
          step['subtitle'] as String,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF888888),
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: Color(0xFF888888),
          size: 20,
        ),
        onTap: () {},
      ),
    );
  }
}
