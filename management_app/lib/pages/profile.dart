import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_app/pages/login.dart';

class ProfileScreen extends GetView {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            child: SizedBox(
              height: Get.size.height * 0.25,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: Get.size.height * 0.3 - Get.size.height * 0.15,
                ),
                Container(
                  width: Get.size.width * 0.4,
                  height: Get.size.height * 0.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/profile.png",
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Role",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            left: Get.size.width * 0.2,
            right: Get.size.width * 0.2,
            child: ElevatedButton.icon(
              onPressed: () => Get.to(() => const LoginPage()),
              icon: Image.asset(
                "assets/images/logout_icon.png",
              ),
              label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: const Text(
                  'Sign out',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: const Size(200, 50),
              ),
            ),
          )
        ],
      ),
    );
  }
}
