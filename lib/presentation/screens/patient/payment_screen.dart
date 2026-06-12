import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants.dart';
import '../../../routes/app_pages.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment")),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Order Summary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Consultation Fee"), Text("৳1000")],
                    ),
                    Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Payable", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("৳1000",
                            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text("Select Payment Method", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildPaymentOption("bKash", "assets/icons/bkash.png", true),
            const SizedBox(height: 12),
            _buildPaymentOption("Nagad", "assets/icons/nagad.png", false),
            const SizedBox(height: 12),
            _buildPaymentOption("Cash on Delivery", null, false),
            const Spacer(),
            ElevatedButton(
              onPressed: () => _showSuccessDialog(),
              child: const Text("Pay Now"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String name, String? iconPath, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isSelected ? AppColors.primary : AppColors.border, width: isSelected ? 2 : 1),
      ),
      child: Row(
        children: [
          if (iconPath != null)
            const Icon(Icons.payment, color: AppColors.primary)
          else
            const Icon(Icons.money, color: AppColors.primary),
          const SizedBox(width: 16),
          Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
          const Spacer(),
          if (isSelected) const Icon(Icons.check_circle, color: AppColors.primary),
        ],
      ),
    );
  }

  void _showSuccessDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: AppColors.success, size: 80),
            const SizedBox(height: 20),
            const Text("Payment Successful", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Your appointment has been booked successfully.", textAlign: TextAlign.center),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(AppRoutes.PATIENT_HOME),
              child: const Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
