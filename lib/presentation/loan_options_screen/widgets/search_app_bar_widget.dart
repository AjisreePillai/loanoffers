import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchAppBarWidget extends StatelessWidget {
  const SearchAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1A2B4A),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                color: const Color(0xFF1A2B4A),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white.withAlpha(89), width: 1),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(Icons.search, color: Color(0xFFE8470F), size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Type to search',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        color: Colors.white.withAlpha(153),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Icon(Icons.crop_free, color: Colors.white, size: 24),
          const SizedBox(width: 14),
          Icon(Icons.mic_outlined, color: Colors.white, size: 24),
        ],
      ),
    );
  }
}
