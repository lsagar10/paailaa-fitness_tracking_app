import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';
import 'package:paailaa/src/features/plans/presentation/screen/complete_information.dart';
import 'package:paailaa/src/widgets/success_dialog.dart';

class SubscriptionSummary extends StatefulWidget {
  final String title;
  final String price;

  const SubscriptionSummary({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  State<SubscriptionSummary> createState() => _SubscriptionSummaryState();
}

class _SubscriptionSummaryState extends State<SubscriptionSummary> {
  int selectedPaymentIndex = 0;

  final List<Map<String, String>> paymentMethods = [
    {"title": "eSewa Mobile Wallet", "iconPath": "assets/images/esewa.png"},
    {"title": "Khalti Mobile Wallet", "iconPath": "assets/images/khalti.png"},
  ];

  String _getDuration(String planTitle) {
    switch (planTitle) {
      case 'Monthly':
        return '30 days';
      case '3 Months':
        return '90 days';
      case '6 Months':
        return '180 days';
      case '1 Years':
        return '365 days';
      default:
        return '30 days';
    }
  }

  String _getServiceCharge() {
    return 'Rs.10'; // You can make this dynamic if needed
  }

  String _getGrandTotal() {
    final price =
        int.tryParse(widget.price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    return 'Rs.${price + 10}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                  color: Color(0xFF2D70C7),
                ),
              ),
            ),
            const SizedBox(width: 40),
            Text(
              'Subscription Summary',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment Details",
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            _buildRow("Subscription Plan", widget.title),
            _buildRow("Validity Duration", _getDuration(widget.title)),
            _buildRow("Subscription Charge", widget.price),
            _buildRow("Service Charge", _getServiceCharge()),
            const Divider(height: 20),
            _buildRow("Grand Total", _getGrandTotal(), isBold: true),
            const SizedBox(height: 40),
            Text(
              "Payment Method",
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(paymentMethods.length, _buildPaymentOption),
            SizedBox(height: 45),
            CustomButton(
              text: 'Purchase',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SuccessDialog(
                    message:
                        'Congratulations! you have became the Premium Subscriber',
                    onContinue: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompleteInformation(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.robotoFlex(
              fontSize: 14,
              fontWeight: FontWeight.w500, // 500 = Medium
              fontStyle: FontStyle.normal,

              letterSpacing: -0.28, // -2% of 14px
            ),
          ),

          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600, // SemiBold
              fontStyle: FontStyle.normal,

              letterSpacing: -0.28, // -2% of 14px
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(int index) {
    final method = paymentMethods[index];
    final isSelected = selectedPaymentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentIndex = index;
        });
      },
      child: Container(
        height: 70,
        width: 358,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.shade300,
            width: 1.5,
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Image.asset(method['iconPath']!, height: 24, width: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                method['title']!,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? primaryColor : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
