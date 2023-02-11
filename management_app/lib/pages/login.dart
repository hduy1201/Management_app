import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_app/pages/home.dart';
import 'package:management_app/widgets/login_dialog.dart';

class LoginPage extends GetWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: Get.size.height,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset("assets/images/login_2.png"),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/login_3.png"),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text("Welcome to Management App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                Image.asset("assets/images/login_1.png"),
                ElevatedButton.icon(
                  onPressed: () => Get.off(() => HomeScreen()),
                  icon: Image.asset(
                    "assets/images/google_icon.png",
                  ),
                  label: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: const Text(
                      'Sign in with Google',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: const Size(300, 50),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Get.dialog(const LoginDialogWidget());
                  },
                  icon: Image.asset(
                    "assets/images/email_icon.png",
                  ),
                  label: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 45),
                    child: const Text(
                      'Sign in with Gmail',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: const Size(300, 50),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
