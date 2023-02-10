import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_app/pages/setting.dart';

class HomePage extends GetView {
  HomePage({super.key});
  var _selectedIndex = 0.obs;

  String listIdToName(int index) {
    if (index == 0) {
      return 'Home';
    } else if (index == 1) {
      return 'Setting';
    } else {
      return 'Home';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Center(child: Text(listIdToName(_selectedIndex.value))),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () {
          if (_selectedIndex.value == 0) {
            return const Center(
              child: Text('Home Page'),
            );
          } else if (_selectedIndex.value == 1) {
            return const SettingPage();
          } else {
            return const Center(
              child: Text('Home Page'),
            );
          }
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (value) {
            _selectedIndex.value = value;
          },
          currentIndex: _selectedIndex.value,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 30,
              ),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
