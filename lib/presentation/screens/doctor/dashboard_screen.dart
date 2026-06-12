import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants.dart';

class DoctorDashboardScreen extends StatelessWidget {
  const DoctorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildStats(),
              const SizedBox(height: 32),
              const Text("Today's Appointments", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _buildAppointmentList(),
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
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome Back,", style: TextStyle(color: AppColors.textSecondary)),
            Text("Dr. Ariful Islam", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Badge(child: Icon(Icons.notifications_outlined)),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Row(
      children: [
        _buildStatCard("Total Patients", "1,250", Icons.people, Colors.blue),
        const SizedBox(width: 16),
        _buildStatCard("Earnings", "৳45,000", Icons.account_balance_wallet, Colors.green),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(title, style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: const CircleAvatar(backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=patient")),
            title: const Text("Rahim Ahmed", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("10:30 AM - Online Consultation"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.check_circle, color: AppColors.success)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.cancel, color: AppColors.error)),
              ],
            ),
            onTap: () => Get.toNamed('/prescription-creation'),
          ),
        );
      },
    );
  }
}
