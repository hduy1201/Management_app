import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_app/pages/add_task_form.dart';
import 'package:management_app/pages/task.dart';

class TaskListWidget extends GetView {
  const TaskListWidget({super.key});

  Widget _buildList() {
    return Column(textDirection: TextDirection.ltr, children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('Tasks available:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
              )),
          // const Spacer(),

          IconButton(
            icon: const Icon(
              Icons.add_circle,
              color: Colors.blueGrey,
            ),
            onPressed: (() => Get.to(() => AddTaskDialogPage())),
          ),
        ],
      ),
      Expanded(
        child: ListView(
          children: [
            _tile('Design UI Kit Components', 'Created now', Icons.task_alt),
            _tile('Implement Components from UI prototype',
                'Created 1 minutes ago', Icons.task_alt),
            _tile('Eat', 'Created 9 h', Icons.task_alt),
            _tile('Sleep', 'Created 9 hours ago', Icons.task_alt),
            _tile('Do Final Project', 'Created 12 hours ago', Icons.task_alt),
            _tile(
                'Do Flutter Homework', 'Created 15 hours ago', Icons.task_alt),
            _tile('Fix Greeny Bugs', 'Created 9 days ago', Icons.task_alt),
            _tile('Mentoring by schedule', 'Created 1 months ago',
                Icons.task_alt),
          ],
        ),
      )
    ]);
  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      onTap: (() =>
          Get.to(() => TaskDetailPage(title: title, subtitle: subtitle))),
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blueGrey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }
}
