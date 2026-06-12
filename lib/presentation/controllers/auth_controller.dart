import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class AuthController extends GetxController {
  var isPatient = true.obs;
  var isLoading = false.obs;

  void toggleRole(bool value) {
    isPatient.value = value;
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please enter email and password");
      return;
    }

    isLoading.value = true;
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    if (isPatient.value) {
      Get.offAllNamed(AppRoutes.PATIENT_HOME);
    } else {
      Get.offAllNamed(AppRoutes.DOCTOR_HOME);
    }
  }
}
