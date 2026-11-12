import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/error_banner_widget.dart';
import './widgets/loan_card_widget.dart';
import './widgets/next_steps_widget.dart';
import './widgets/search_app_bar_widget.dart';
import './widgets/why_consider_widget.dart';

class LoanOptionsScreen extends StatefulWidget {
  const LoanOptionsScreen({super.key});

  @override
  State<LoanOptionsScreen> createState() => _LoanOptionsScreenState();
}

class _LoanOptionsScreenState extends State<LoanOptionsScreen> {
  // TODO: Replace with [Riverpod/Bloc] for production
  final List<Map<String, dynamic>> _loanOptionsMaps = [
    {
      'id': '1',
      'title': 'Business Loan',
      'subtitle': 'Unsecured Option | 95% eligibility',
      'amount': '12,00,000',
      'isExpanded': true,
      'isInCart': true,
      'iconType': 'business',
      'showDetails': true,
      'goldRequired': null,
      'lendingRate': null,
      'goldKarat': null,
      'tenure': '12 months',
      'branch': 'Baner-Pune',
      'whyBetter':
          'Your business profile offsets the credit score requirement, making you 95% eligible.',
    },
    {
      'id': '2',
      'title': 'Top Up on Existing Personal Loan',
      'subtitle': 'Existing customer | 95% eligibility',
      'amount': '14,00,000',
      'isExpanded': true,
      'isInCart': false,
      'iconType': 'topup',
      'showDetails': true,
      'goldRequired': null,
      'lendingRate': null,
      'goldKarat': null,
      'tenure': '36 months',
      'branch': 'Baner-Pune',
      'whyBetter': null,
    },
    {
      'id': '3',
      'title': 'Loan Against Property',
      'subtitle': 'Collateral-based | 95% eligibility',
      'amount': '12,00,000',
      'isExpanded': true,
      'isInCart': false,
      'iconType': 'property',
      'showDetails': true,
      'goldRequired': null,
      'lendingRate': null,
      'goldKarat': null,
      'tenure': '12 years',
      'branch': 'Baner-Pune',
      'whyBetter': null,
    },
  ];

  List<Map<String, dynamic>> _loanOptions = [];

  @override
  void initState() {
    super.initState();
    _loanOptions = List<Map<String, dynamic>>.from(
      _loanOptionsMaps.map((m) => Map<String, dynamic>.from(m)),
    );
  }

  void _toggleExpand(int index) {
    // TODO: Replace with [Riverpod/Bloc] for production
    setState(() {
      _loanOptions[index]['isExpanded'] = !_loanOptions[index]['isExpanded'];
    });
  }

  void _updateTenure(int index, String value) {
    // TODO: Replace with [Riverpod/Bloc] for production
    setState(() {
      _loanOptions[index]['tenure'] = value;
    });
  }

  void _updateBranch(int index, String value) {
    // TODO: Replace with [Riverpod/Bloc] for production
    setState(() {
      _loanOptions[index]['branch'] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            SearchAppBarWidget(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    const ErrorBannerWidget(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Other loan options for you',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF1A1A1A),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            style: GoogleFonts.plusJakartaSans(
                              color: const Color(0xFF555555),
                              height: 1.5,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                            "This isn't a closed door - based on your profile, you qualify for the options below, and we're here to help you take the next step.",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...List.generate(_loanOptions.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        child: LoanCardWidget(
                          loanData: _loanOptions[index],
                          onToggle: () => _toggleExpand(index),
                          onTenureChanged: (v) => _updateTenure(index, v),
                          onBranchChanged: (v) => _updateBranch(index, v),
                        ),
                      );
                    }),
                    const SizedBox(height: 24),
                    const WhyConsiderWidget(),
                    const SizedBox(height: 24),
                    const NextStepsWidget(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
