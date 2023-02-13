import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_app/pages/add_task_form.dart';
import 'package:management_app/widgets/member_list.dart';

import '../widgets/task_list.dart';

class GroupPage extends GetWidget {
  GroupPage({super.key});
  final _selectedIndex = 0.obs;

  String listIdToChangeWidget(int index) {
    if (index == 0) {
      return 'Members';
    } else if (index == 1) {
      return 'Tasks';
    } else {
      return 'Add New Task';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  onPressed: () => {
                    _selectedIndex.value = 0,
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // side: const BorderSide(color: Colors.blueGrey),
                    ),
                    backgroundColor: const Color(0xFFFFFFFF),
                    // minimumSize: const Size(200, 50),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Text(
                      'Members',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000)),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => {
                  _selectedIndex.value = 1,
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    // side: const BorderSide(color: Colors.blueGrey),
                  ),
                  backgroundColor: const Color(0xFFFFFFFF),
                  // minimumSize: const Size(200, 50),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: const Text(
                    'Tasks',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () {
            if (_selectedIndex.value == 0) {
              return const Expanded(child: MemberListWidget());
            } else if (_selectedIndex.value == 1) {
              return const Expanded(child: TaskListWidget());
            } else {
              return const Center(
                child: Text('Home Page'),
              );
            }
          },
        )
      ]),
    );
  }
}
