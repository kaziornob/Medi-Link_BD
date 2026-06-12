import '../domain/models.dart';

class MockDataService {
  static List<Doctor> getDoctors() {
    return [
      Doctor(
        id: "1",
        name: "Dr. Ariful Islam",
        specialty: "Cardiologist",
        rating: 4.8,
        fee: 1000,
        isAvailable: true,
        image: "https://i.pravatar.cc/150?u=1",
        experience: "10 Years",
        hospital: "Evercare Hospital",
      ),
      Doctor(
        id: "2",
        name: "Dr. Nusrat Jahan",
        specialty: "Gynecologist",
        rating: 4.9,
        fee: 800,
        isAvailable: true,
        image: "https://i.pravatar.cc/150?u=2",
        experience: "8 Years",
        hospital: "Square Hospital",
      ),
      Doctor(
        id: "3",
        name: "Dr. Kamal Ahmed",
        specialty: "Neurologist",
        rating: 4.7,
        fee: 1200,
        isAvailable: false,
        image: "https://i.pravatar.cc/150?u=3",
        experience: "15 Years",
        hospital: "United Hospital",
      ),
    ];
  }

  static List<String> getSpecialties() {
    return ["Cardiology", "Neurology", "Gynecology", "Pediatrics", "Dermatology", "Orthopedics"];
  }
}
