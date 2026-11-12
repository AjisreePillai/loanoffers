import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoanCardWidget extends StatefulWidget {
  final Map<String, dynamic> loanData;
  final VoidCallback onToggle;
  final ValueChanged<String> onTenureChanged;
  final ValueChanged<String> onBranchChanged;

  const LoanCardWidget({
    super.key,
    required this.loanData,
    required this.onToggle,
    required this.onTenureChanged,
    required this.onBranchChanged,
  });

  @override
  State<LoanCardWidget> createState() => _LoanCardWidgetState();
}

class _LoanCardWidgetState extends State<LoanCardWidget> {
  bool _expanded = true;

  Map<String, dynamic> get loanData => widget.loanData;
  ValueChanged<String> get onTenureChanged => widget.onTenureChanged;
  ValueChanged<String> get onBranchChanged => widget.onBranchChanged;

  void onToggle() {
    setState(() => _expanded = !_expanded);
  }

  static const Color _headerBlue = Color(0xFF3149A6);

  Widget _buildIcon(String iconType) {
    IconData iconData;
    switch (iconType) {
      case 'business':
        iconData = Icons.monetization_on_outlined;
        break;
      case 'topup':
        iconData = Icons.home_outlined;
        break;
      case 'property':
        iconData = Icons.apartment_rounded;
        break;
      default:
        iconData = Icons.account_balance_outlined;
    }
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(46),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(iconData, color: Colors.white, size: 22),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isExpanded = _expanded;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(isExpanded),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: isExpanded ? _buildCalculator() : _buildCollapsedSummary(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isExpanded) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: _headerBlue,
        borderRadius: isExpanded
            ? const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              )
            : BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildIcon(loanData['iconType'] as String),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  loanData['title'] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  loanData['subtitle'] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withAlpha(217),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onToggle,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: AnimatedRotation(
                turns: isExpanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Collapsed summary (replaces calculator when card is collapsed)
  // ---------------------------------------------------------------------------
  Widget _buildCollapsedSummary() {
    final String type = loanData['iconType'] as String;
    final List<List<String>> chips;
    String tagline;

    switch (type) {
      case 'business':
        tagline = 'Working capital for your business, no collateral needed';
        chips = [
          ['Up to', '₹${loanData['amount']}'],
          ['Tenure', 'Up to 60 months'],
          ['Rate', 'From 14% p.a.'],
        ];
        break;
      case 'topup':
        tagline =
            'Extra funds on your current Personal Loan, minimal paperwork';
        chips = [
          ['Top-up up to', '₹${loanData['amount']}'],
          ['Tenure', 'Up to 48 months'],
          ['Rate', 'From 11.5% p.a.'],
        ];
        break;
      default:
        tagline = 'Unlock value from your property at lower interest rates';
        chips = [
          ['Up to', '₹${loanData['amount']}'],
          ['Tenure', 'Up to 15 years'],
          ['Rate', 'From 9.5% p.a.'],
        ];
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tagline,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF555555),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: chips
                .map(
                  (c) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F4FD),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xFFE0E6F7)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          c[0],
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 10,
                            color: const Color(0xFF888888),
                          ),
                        ),
                        Text(
                          c[1],
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Expanded calculator
  // ---------------------------------------------------------------------------
  Widget _buildCalculator() {
    final bool isInCart = loanData['isInCart'] as bool;
    final String type = loanData['iconType'] as String;

    final List<List<dynamic>> detailRows;
    final String tenureHint;
    final List<String> tenureItems;

    switch (type) {
      case 'business':
        detailRows = [
          ['Business Vintage', '3+ years', true],
          ['Interest Rate', '14% p.a.', false],
          ['Processing Fee', '2% + GST', true],
        ];
        tenureHint = '(12-60 months)';
        tenureItems = const [
          '12 months',
          '24 months',
          '36 months',
          '60 months',
        ];
        break;
      case 'topup':
        detailRows = [
          ['Existing Loan EMIs Paid', '12+ EMIs', true],
          ['Interest Rate', '11.5% p.a.', false],
          ['Processing Fee', '1% + GST', true],
        ];
        tenureHint = '(12-48 months)';
        tenureItems = const [
          '12 months',
          '24 months',
          '36 months',
          '48 months',
        ];
        break;
      default:
        detailRows = [
          ['Property Value', '₹30,00,000', true],
          ['Interest Rate', '9.5% p.a.', false],
          ['Max LTV', '70%', true],
        ];
        tenureHint = '(5-15 years)';
        tenureItems = const ['5 years', '10 years', '12 years', '15 years'];
    }

    final String tenureValue = tenureItems.contains(loanData['tenure'])
        ? loanData['tenure'] as String
        : tenureItems.last;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Loan amount',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF555555),
                ),
              ),
              if (isInCart)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: _headerBlue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Already in Cart',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 2, 14, 0),
          child: Text(
            '₹${loanData['amount']}',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A1A1A),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FF),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE8ECF8), width: 1),
          ),
          child: Column(
            children: [
              for (int i = 0; i < detailRows.length; i++) ...[
                _buildDetailRow(
                  detailRows[i][0] as String,
                  detailRows[i][1] as String,
                  isBold: detailRows[i][2] as bool,
                ),
                if (i != detailRows.length - 1) const SizedBox(height: 8),
              ],
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FF),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE8ECF8), width: 1),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Required loan tenure',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF333333),
                            ),
                          ),
                          Text(
                            tenureHint,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF888888),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildDropdown(
                      value: tenureValue,
                      items: tenureItems,
                      onChanged: onTenureChanged,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(height: 1, color: Color(0xFFE8ECF8)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Branch',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ),
                    _buildDropdown(
                      value: loanData['branch'] as String,
                      items: const [
                        'Baner-Pune',
                        'Shivaji Nagar',
                        'Kothrud',
                        'Hadapsar',
                      ],
                      onChanged: onBranchChanged,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                color: const Color(0xFF555555),
              ),
              children: [
                const TextSpan(text: 'Edit loan preference and know more '),
                TextSpan(
                  text: 'Click here',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    color: _headerBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (loanData['whyBetter'] != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  size: 16,
                  color: _headerBlue,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        color: const Color(0xFF333333),
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                          text: 'Why this is a better fit:\n',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF333333),
                          ),
                        ),
                        TextSpan(
                          text: loanData['whyBetter'] as String,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            color: _headerBlue,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE55A00),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CONTINUE APPLICATION',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    '»',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF555555),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            color: const Color(0xFF1A1A1A),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      height: 34,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFCCD2E8), width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 16,
            color: _headerBlue,
          ),
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A),
          ),
          isDense: true,
          items: items
              .map(
                (item) =>
                    DropdownMenuItem<String>(value: item, child: Text(item)),
              )
              .toList(),
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
        ),
      ),
    );
  }
}
