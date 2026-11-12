import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorBannerWidget extends StatelessWidget {
  const ErrorBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF0F0),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFFFCDD2), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "We're unable to offer you a Personal Loan based on your current CIBIL eligibility",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFCC0000),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              style: GoogleFonts.plusJakartaSans(
                color: const Color(0xFF555555),
                height: 1.5,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              "Your CIBIL score does not meet the minimum requirement of 685 for this product.",
            ),
          ],
        ),
      ),
    );
  }
}
