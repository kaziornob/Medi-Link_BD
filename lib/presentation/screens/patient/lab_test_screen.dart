import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants.dart';

class LabTestScreen extends StatelessWidget {
  const LabTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tests = [
      {"name": "Complete Blood Count (CBC)", "price": "৳500"},
      {"name": "Lipid Profile", "price": "৳1200"},
      {"name": "Blood Sugar (Fasting)", "price": "৳200"},
      {"name": "Thyroid Profile (T3, T4, TSH)", "price": "৳1500"},
      {"name": "Liver Function Test (LFT)", "price": "৳1800"},
      {"name": "Kidney Function Test (KFT)", "price": "৳2000"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Lab Tests")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tests.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: AppColors.secondary,
                child: Icon(Icons.biotech, color: AppColors.primary),
              ),
              title: Text(tests[index]['name']!),
              subtitle: Text(tests[index]['price']!, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
              trailing: ElevatedButton(
                onPressed: () => _showBookingDialog(tests[index]['name']!),
                style: ElevatedButton.styleFrom(minimumSize: const Size(80, 36)),
                child: const Text("Book"),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showBookingDialog(String testName) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Book $testName", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(hintText: "Pickup Address", prefixIcon: Icon(Icons.location_on))),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(hintText: "Preferred Date", prefixIcon: Icon(Icons.calendar_today))),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Get.back();
                Get.snackbar("Success", "Lab test booked successfully!");
              },
              child: const Text("Confirm Booking"),
            ),
          ],
        ),
      ),
    );
  }
}
