import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDetailPage extends GetWidget {
  final String title;
  final String subtitle;

  const TaskDetailPage(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
            )),
      ]),
    );
  }
}
