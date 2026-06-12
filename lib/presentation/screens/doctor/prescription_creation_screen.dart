import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants.dart';

class PrescriptionCreationScreen extends StatelessWidget {
  const PrescriptionCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Prescription")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Card(
              child: ListTile(
                leading: CircleAvatar(backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=patient")),
                title: Text("Rahim Ahmed"),
                subtitle: Text("Age: 28 | Gender: Male"),
              ),
            ),
            const SizedBox(height: 24),
            const Text("Medicines", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildMedicineInput(),
            const SizedBox(height: 24),
            const Text("Notes / Advice", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const TextField(
              maxLines: 4,
              decoration: InputDecoration(hintText: "Enter advice for patient..."),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Get.back();
                Get.snackbar("Success", "Prescription sent to patient");
              },
              child: const Text("Save & Send Prescription"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicineInput() {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(flex: 2, child: TextField(decoration: InputDecoration(hintText: "Medicine Name"))),
            const SizedBox(width: 8),
            const Expanded(child: TextField(decoration: InputDecoration(hintText: "Dose"))),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle, color: AppColors.primary)),
          ],
        ),
      ],
    );
  }
}
