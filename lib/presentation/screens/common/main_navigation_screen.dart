import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants.dart';
import '../patient/home_screen.dart';
import '../doctor/dashboard_screen.dart';
import 'profile_screen.dart';
import '../patient/prescription_screen.dart';

class MainNavigationController extends GetxController {
  var currentIndex = 0.obs;
  final bool isPatient;

  MainNavigationController({required this.isPatient});

  List<Widget> get screens => isPatient 
    ? [const PatientHomeScreen(), const PrescriptionScreen(), const ProfileScreen()]
    : [const DoctorDashboardScreen(), const ProfileScreen()];

  void changeIndex(int index) => currentIndex.value = index;
}

class MainNavigationScreen extends StatelessWidget {
  final bool isPatient;
  const MainNavigationScreen({super.key, required this.isPatient});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainNavigationController(isPatient: isPatient));

    return Scaffold(
      body: Obx(() => controller.screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textHint,
        items: isPatient 
          ? const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.description_outlined), activeIcon: Icon(Icons.description), label: "Prescription"),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: "Profile"),
            ]
          : const [
              BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), activeIcon: Icon(Icons.dashboard), label: "Dashboard"),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: "Profile"),
            ],
      )),
    );
  }
}
