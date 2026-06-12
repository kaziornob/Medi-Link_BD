import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Prescriptions")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dr. Ariful Islam", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text("Cardiologist", style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                        ],
                      ),
                      Text("29 Apr 2026", style: TextStyle(color: AppColors.textHint, fontSize: 12)),
                    ],
                  ),
                  const Divider(height: 24),
                  const Text("Medicines:", style: TextStyle(fontWeight: FontWeight.w600)),
                  const Text("• Napa Extend (1+0+1)\n• Sergel 20mg (1+0+1) Before Meal"),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.download, size: 18),
                          label: const Text("Download PDF"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("View Details"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
