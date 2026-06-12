import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants.dart';

class AmbulanceScreen extends StatelessWidget {
  const AmbulanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ambulance Service")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.error.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.emergency, color: AppColors.error, size: 40),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Emergency Call", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        Text("Call 999 or our direct hotline", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
                    child: const Text("Call Now"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text("Book an Ambulance", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(hintText: "Pickup Location", prefixIcon: Icon(Icons.my_location))),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(hintText: "Destination Hospital", prefixIcon: Icon(Icons.location_on))),
            const SizedBox(height: 16),
            const Text("Ambulance Type", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            _buildTypeSelector(),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Get.snackbar("Request Sent", "We are searching for an ambulance near you."),
              child: const Text("Request Ambulance"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeSelector() {
    final types = ["Basic", "AC", "ICU / Cardiac"];
    return Row(
      children: types.map((type) {
        bool isSelected = type == "Basic";
        return Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                type,
                style: TextStyle(color: isSelected ? Colors.white : AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
