import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_app/pages/profile.dart';
import 'package:management_app/widgets/group_list.dart';

class HomeScreen extends GetView {
  static const title = 'News';

  HomeScreen({super.key});
  final _selectedIndex = 0.obs;

  String listIdToName(int index) {
    if (index == 0) {
      return 'Home';
    } else if (index == 1) {
      return 'Profile';
    } else {
      return 'Home';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Center(
              child: Text(listIdToName(_selectedIndex.value),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ))),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () {
          if (_selectedIndex.value == 0) {
            return const GroupListWidget();
          } else if (_selectedIndex.value == 1) {
            return const ProfileScreen();
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
                Icons.home_max_outlined,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
                size: 30,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
