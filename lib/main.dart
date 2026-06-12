import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/theme.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(const MediLinkApp());
}

class MediLinkApp extends StatelessWidget {
  const MediLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MediLink BD',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.LOGIN,
      getPages: AppPages.routes,
    );
  }
}
