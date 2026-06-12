import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants.dart';
import '../../controllers/patient_home_controller.dart';
import '../../../routes/app_pages.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PatientHomeController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildSearchBar(),
              const SizedBox(height: 24),
              _buildQuickActions(),
              const SizedBox(height: 24),
              _buildSpecialties(controller),
              const SizedBox(height: 24),
              _buildTopDoctors(controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, Patient!", style: Get.textTheme.bodyMedium),
            Text("Find Your Specialist", style: Get.textTheme.titleLarge),
          ],
        ),
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=patient"),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: AppStrings.searchDoctor,
        prefixIcon: const Icon(Icons.search, color: AppColors.primary),
        suffixIcon: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.tune, color: Colors.white, size: 20),
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      {'icon': Icons.person_add, 'label': 'Book Doctor', 'route': AppRoutes.DOCTOR_LIST},
      {'icon': Icons.video_call, 'label': 'Online', 'route': AppRoutes.VIDEO_CALL},
      {'icon': Icons.biotech, 'label': 'Lab Test', 'route': AppRoutes.LAB_TEST},
      {'icon': Icons.description, 'label': 'Prescription', 'route': AppRoutes.PRESCRIPTION},
      {'icon': Icons.emergency, 'label': 'Ambulance', 'route': AppRoutes.AMBULANCE},
      {'icon': Icons.hotel, 'label': 'Hospital Seat', 'route': AppRoutes.HOSPITAL_SEAT},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Get.toNamed(actions[index]['route'] as String),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSizes.radius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(actions[index]['icon'] as IconData, color: AppColors.primary, size: 30),
                const SizedBox(height: 8),
                Text(
                  actions[index]['label'] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSpecialties(PatientHomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Specialties", style: Get.textTheme.titleLarge),
            TextButton(onPressed: () {}, child: const Text("See All")),
          ],
        ),
        SizedBox(
          height: 40,
          child: Obx(() => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.specialties.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: index == 0 ? AppColors.primary : AppColors.secondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        controller.specialties[index],
                        style: TextStyle(
                          color: index == 0 ? Colors.white : AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              )),
        ),
      ],
    );
  }

  Widget _buildTopDoctors(PatientHomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Top Doctors", style: Get.textTheme.titleLarge),
        const SizedBox(height: 16),
        Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.doctors.length,
                itemBuilder: (context, index) {
                  final doctor = controller.doctors[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(doctor.image, width: 60, height: 60, fit: BoxFit.cover),
                      ),
                      title: Text(doctor.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(doctor.specialty),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 16),
                              Text(" ${doctor.rating}  •  ${doctor.experience}"),
                            ],
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("৳${doctor.fee}",
                              style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          const Text("Fee", style: TextStyle(fontSize: 10)),
                        ],
                      ),
                      onTap: () => Get.toNamed(AppRoutes.APPOINTMENT_BOOKING, arguments: doctor),
                    ),
                  );
                },
              )),
      ],
    );
  }
}
