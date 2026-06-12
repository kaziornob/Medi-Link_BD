import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants.dart';

class HospitalSeatScreen extends StatelessWidget {
  const HospitalSeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hospitals = [
      {"name": "Evercare Hospital", "location": "Bashundhara", "seats": "12 Available"},
      {"name": "Square Hospital", "location": "Panthapath", "seats": "5 Available"},
      {"name": "United Hospital", "location": "Gulshan", "seats": "8 Available"},
      {"name": "Labaid Specialized", "location": "Dhanmondi", "seats": "0 Available"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Hospital Seat Booking")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: hospitals.length,
        itemBuilder: (context, index) {
          bool isAvailable = !hospitals[index]['seats']!.contains("0");
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.local_hospital, color: AppColors.primary, size: 30),
              title: Text(hospitals[index]['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(hospitals[index]['location']!),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hospitals[index]['seats']!,
                    style: TextStyle(color: isAvailable ? AppColors.success : AppColors.error, fontWeight: FontWeight.bold),
                  ),
                  if (isAvailable)
                    const Text("Book Now", style: TextStyle(color: AppColors.primary, fontSize: 12, decoration: TextDecoration.underline)),
                ],
              ),
              onTap: isAvailable ? () => Get.snackbar("Booking", "Seat booking request sent to ${hospitals[index]['name']}") : null,
            ),
          );
        },
      ),
    );
  }
}
