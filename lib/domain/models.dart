enum UserRole { patient, doctor }

class User {
  final String id;
  final String name;
  final String email;
  final UserRole role;
  final String? profileImage;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.profileImage,
  });
}

class Doctor {
  final String id;
  final String name;
  final String specialty;
  final double rating;
  final double fee;
  final bool isAvailable;
  final String image;
  final String experience;
  final String hospital;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.fee,
    required this.isAvailable,
    required this.image,
    required this.experience,
    required this.hospital,
  });
}

class Appointment {
  final String id;
  final String patientId;
  final String doctorId;
  final DateTime date;
  final String timeSlot;
  final String status; // pending, confirmed, completed, rejected

  Appointment({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.date,
    required this.timeSlot,
    required this.status,
  });
}
