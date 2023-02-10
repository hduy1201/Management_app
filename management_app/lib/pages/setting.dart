import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_app/pages/login.dart';

class SettingPage extends GetView {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => Get.to(() => const LoginPage()),
          icon: Image.asset(
            "assets/images/logout_icon.png",
          ),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text(
              'Sign out',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minimumSize: const Size(200, 50),
          ),
        ),
      ),
    );
  }
}
