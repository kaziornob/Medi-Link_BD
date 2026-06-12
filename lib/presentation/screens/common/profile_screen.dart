import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants.dart';
import '../../../routes/app_pages.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Center(
              child: Stack(
                children: [
                  CircleAvatar(radius: 60, backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=user")),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      radius: 18,
                      child: Icon(Icons.camera_alt, color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text("User Name", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text("user@example.com", style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 32),
            _buildProfileItem(Icons.person_outline, "Edit Profile"),
            _buildProfileItem(Icons.history, "Medical History"),
            _buildProfileItem(Icons.language, "Language", trailing: const Text("English")),
            _buildProfileItem(Icons.notifications_outlined, "Notifications"),
            _buildProfileItem(Icons.security, "Privacy Policy"),
            _buildProfileItem(Icons.help_outline, "Help Support"),
            const SizedBox(height: 24),
            _buildProfileItem(Icons.logout, "Logout", color: AppColors.error, onTap: () => Get.offAllNamed(AppRoutes.LOGIN)),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, {Widget? trailing, Color? color, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap ?? () {},
      leading: Icon(icon, color: color ?? AppColors.primary),
      title: Text(title, style: TextStyle(color: color ?? AppColors.textPrimary, fontWeight: FontWeight.w500)),
      trailing: trailing ?? const Icon(Icons.chevron_right, size: 20),
    );
  }
}
