import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF0EA5A4);
  static const Color primaryDark = Color(0xFF14B8A6);
  static const Color secondary = Color(0xFFF1F5F9);
  static const Color accent = Color(0xFFF59E0B);
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF8FAFC);
  static const Color error = Color(0xFFEF4444);
  static const Color success = Color(0xFF10B981);
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textHint = Color(0xFF94A3B8);
  static const Color border = Color(0xFFE2E8F0);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppStrings {
  static const String appName = "MediLink BD";
  static const String login = "Login";
  static const String register = "Register";
  static const String patient = "Patient";
  static const String doctor = "Doctor";
  static const String loginAsPatient = "Login as Patient";
  static const String loginAsDoctor = "Login as Doctor";
  static const String email = "Email";
  static const String password = "Password";
  static const String forgotPassword = "Forgot Password?";
  static const String searchDoctor = "Search doctor (by specialist)";
}

class AppSizes {
  static const double radius = 16.0;
  static const double padding = 16.0;
  static const double margin = 16.0;
  static const double iconSize = 24.0;
}
