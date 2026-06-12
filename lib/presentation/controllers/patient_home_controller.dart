import 'package:get/get.dart';
import '../../domain/models.dart';
import '../../services/mock_data_service.dart';

class PatientHomeController extends GetxController {
  var doctors = <Doctor>[].obs;
  var specialties = <String>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    doctors.value = MockDataService.getDoctors();
    specialties.value = MockDataService.getSpecialties();
    isLoading.value = false;
  }
}
