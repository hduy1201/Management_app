import 'package:get/get.dart';
import 'package:management_app/db/db_helper.dart';
import 'package:management_app/models/task.model.dart';

class TaskController extends GetxController {
  RxList taskList = <Task>[].obs;
  DBHelper dbHelper = DBHelper();

  Future<void> getTasks() async {
    final tasks = await dbHelper.query();

    taskList.assignAll(tasks.map((e) => Task.fromMap(e)).toList());

    update();
  }

  void addTask({required Task? task}) async {
    await dbHelper.insert(task);
    getTasks();
  }

  void deleteask({required Task task}) async {
    await dbHelper.delete(task.id!);
    getTasks();
  }

  // void markTaskAsCompleted({required Task task}) async {
  //   var value = await dbHelper.update(task.id!);
  //   getTasks();
  // }

  void deleteAllTask() async {
    await dbHelper.deleteAll();
    taskList.clear();
    update();
  }
}
