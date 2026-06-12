import 'package:get/get.dart';
import '../presentation/screens/auth/login_screen.dart';
import '../presentation/screens/patient/doctor_list_screen.dart';
import '../presentation/screens/patient/appointment_booking_screen.dart';
import '../presentation/screens/patient/payment_screen.dart';
import '../presentation/screens/patient/chat_screen.dart';
import '../presentation/screens/patient/video_call_screen.dart';
import '../presentation/screens/patient/lab_test_screen.dart';
import '../presentation/screens/patient/prescription_screen.dart';
import '../presentation/screens/patient/ambulance_screen.dart';
import '../presentation/screens/patient/hospital_seat_screen.dart';
import '../presentation/screens/doctor/prescription_creation_screen.dart';
import '../presentation/screens/common/profile_screen.dart';
import '../presentation/screens/common/main_navigation_screen.dart';

class AppRoutes {
  static const INITIAL = '/';
  static const LOGIN = '/login';
  static const PATIENT_HOME = '/patient-home';
  static const DOCTOR_HOME = '/doctor-home';
  static const DOCTOR_LIST = '/doctor-list';
  static const APPOINTMENT_BOOKING = '/appointment-booking';
  static const PAYMENT = '/payment';
  static const CHAT = '/chat';
  static const VIDEO_CALL = '/video-call';
  static const LAB_TEST = '/lab-test';
  static const PRESCRIPTION = '/prescription';
  static const AMBULANCE = '/ambulance';
  static const HOSPITAL_SEAT = '/hospital-seat';
  static const PROFILE = '/profile';
}

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.LOGIN, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.PATIENT_HOME, page: () => const MainNavigationScreen(isPatient: true)),
    GetPage(name: AppRoutes.DOCTOR_HOME, page: () => const MainNavigationScreen(isPatient: false)),
    GetPage(name: AppRoutes.DOCTOR_LIST, page: () => const DoctorListScreen()),
    GetPage(name: AppRoutes.APPOINTMENT_BOOKING, page: () => const AppointmentBookingScreen()),
    GetPage(name: AppRoutes.PAYMENT, page: () => const PaymentScreen()),
    GetPage(name: AppRoutes.CHAT, page: () => const ChatScreen()),
    GetPage(name: AppRoutes.VIDEO_CALL, page: () => const VideoCallScreen()),
    GetPage(name: AppRoutes.LAB_TEST, page: () => const LabTestScreen()),
    GetPage(name: AppRoutes.PRESCRIPTION, page: () => const PrescriptionScreen()),
    GetPage(name: AppRoutes.AMBULANCE, page: () => const AmbulanceScreen()),
    GetPage(name: AppRoutes.HOSPITAL_SEAT, page: () => const HospitalSeatScreen()),
    GetPage(name: AppRoutes.PROFILE, page: () => const ProfileScreen()),
    GetPage(name: '/prescription-creation', page: () => const PrescriptionCreationScreen()),
  ];
}
