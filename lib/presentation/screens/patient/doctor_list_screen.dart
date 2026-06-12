import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants.dart';
import '../../controllers/patient_home_controller.dart';
import '../../../routes/app_pages.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PatientHomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Find Doctors"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
        ],
      ),
      body: Obx(() => ListView.builder(
            padding: const EdgeInsets.all(AppSizes.padding),
            itemCount: controller.doctors.length,
            itemBuilder: (context, index) {
              final doctor = controller.doctors[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(doctor.image, width: 80, height: 80, fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(doctor.name,
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text(doctor.specialty, style: TextStyle(color: AppColors.textSecondary)),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber, size: 18),
                                    Text(" ${doctor.rating}  •  ${doctor.experience}"),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text("৳${doctor.fee}",
                                    style: const TextStyle(
                                        color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 16)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () => Get.toNamed(AppRoutes.CHAT),
                              icon: const Icon(Icons.chat_outlined, size: 18),
                              label: const Text("Chat"),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.primary,
                                side: const BorderSide(color: AppColors.primary),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => Get.toNamed(AppRoutes.APPOINTMENT_BOOKING, arguments: doctor),
                              child: const Text("Book Now"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
