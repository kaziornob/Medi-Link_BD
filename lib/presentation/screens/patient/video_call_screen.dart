import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background - Main Video (Doctor)
          Positioned.fill(
            child: Opacity(
              opacity: 0.7,
              child: Image.network(
                "https://i.pravatar.cc/600?u=1",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Small Video (User)
          Positioned(
            top: 60,
            right: 20,
            child: Container(
              width: 120,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white, width: 2),
                image: const DecorationImage(
                  image: NetworkImage("https://i.pravatar.cc/150?u=patient"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Info Overlay
          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const Text(
                  "Dr. Ariful Islam",
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  "08:45",
                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 18),
                ),
              ],
            ),
          ),
          // Controls
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildControlButton(Icons.mic, Colors.white.withOpacity(0.2)),
                _buildControlButton(Icons.videocam, Colors.white.withOpacity(0.2)),
                _buildControlButton(Icons.call_end, Colors.red, size: 70, iconColor: Colors.white, onPressed: () => Get.back()),
                _buildControlButton(Icons.cameraswitch, Colors.white.withOpacity(0.2)),
                _buildControlButton(Icons.volume_up, Colors.white.withOpacity(0.2)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(IconData icon, Color color, {double size = 50, Color iconColor = Colors.white, VoidCallback? onPressed}) {
    return InkWell(
      onTap: onPressed ?? () {},
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: Icon(icon, color: iconColor, size: size * 0.5),
      ),
    );
  }
}
