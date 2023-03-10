import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:management_app/controllers/task_controller.dart';
import 'package:management_app/models/task.model.dart';
import 'package:management_app/theme.dart';
import 'package:management_app/widgets/button.dart';
import 'package:management_app/widgets/input_field.dart';

class AddTaskDialogPage extends GetWidget {
  AddTaskDialogPage({super.key});
  final TaskController _taskController = Get.put(TaskController());

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  late DateTime _selecteDate = DateTime.now();
  late final RxString _startTime =
      DateFormat('hh:mm a').format(DateTime.now()).toString().obs;
  final RxString _endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString()
      .obs;
  final RxInt _selectedRemind = 5.obs;
  List<int> remindList = [5, 10, 15, 20];
  final RxString _selectedRepeat = 'None'.obs;
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  final RxInt _selectedColor = 0.obs;
  List<Color> colorList = [bluishClr, pinkClr, orangeClr];
  final RxString _selectedAssignee = 'None'.obs;
  List<String> assigneeList = [
    'None',
    'Me',
    'Lư Hoàng Duy',
    'Nguyễn Tuấn Kiệt',
    'Đồng Đức Mạnh',
    'WINTER',
    'Kim Jisoo',
    'Kim Jenie',
    'All'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Title
              InputField(
                title: 'Title',
                hint: 'Enter your title here...',
                fieldController: _titleController,
              ),
              //Note
              InputField(
                title: 'Note',
                hint: 'Enter your note here...',
                fieldController: _noteController,
              ),
              //Date
              InputField(
                title: 'Date',
                hint: DateFormat.yMd().format(_selecteDate),
                child: IconButton(
                  onPressed: () => _getDateFromUser(context),
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              //Date Range
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: 'Start Time',
                      hint: _startTime.value,
                      child: IconButton(
                        onPressed: () => _getTimeFromUser(
                            isStartTime: true, context: context),
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      title: 'End Time',
                      hint: _endTime.value,
                      child: IconButton(
                        onPressed: () => _getTimeFromUser(
                            isStartTime: false, context: context),
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Remind
              Obx(() {
                return InputField(
                  title: 'Date',
                  hint: '$_selectedRemind minutes early',
                  child: DropdownButton(
                    onChanged: (String? newVal) {
                      _selectedRemind.value = int.parse(newVal!);
                    },
                    items: remindList
                        .map<DropdownMenuItem<String>>(
                          (e) => DropdownMenuItem<String>(
                            value: e.toString(),
                            child: Text('$e minutes'),
                          ),
                        )
                        .toList(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 32,
                      color: Colors.grey,
                    ),
                    elevation: 3,
                    underline: Container(height: 0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              }),
              Obx(() {
                return InputField(
                  title: 'Date',
                  hint: _selectedRepeat.value,
                  child: DropdownButton<String>(
                    onChanged: (String? value) {
                      _selectedRepeat.value = value!;
                    },
                    items: repeatList
                        .map<DropdownMenuItem<String>>(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 32,
                      color: Colors.grey,
                    ),
                    elevation: 3,
                    underline: Container(height: 0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              }),
              Obx(() {
                return InputField(
                  title: 'Assignee',
                  hint: _selectedAssignee.value,
                  child: DropdownButton<String>(
                    onChanged: (String? value) {
                      _selectedAssignee.value = value!;
                    },
                    items: assigneeList
                        .map<DropdownMenuItem<String>>(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 32,
                      color: Colors.grey,
                    ),
                    elevation: 3,
                    underline: Container(height: 0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              }),
              Obx(() {
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Color',
                        style: titleStyle,
                        textAlign: TextAlign.left,
                      ),
                      Row(
                        children: List.generate(
                          colorList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 5.0, top: 8),
                            child: InkWell(
                              onTap: () {
                                _selectedColor.value = index;
                              },
                              borderRadius: BorderRadius.circular(50),
                              child: CircleAvatar(
                                backgroundColor: colorList[index],
                                child: index == _selectedColor.value
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })
              //Color
            ],
          ),
        ),
      ),
      floatingActionButton: MyButton(
          label: 'Create Task',
          onTap: () {
            _validateDate();
          }),
    );
  }

  AppBar _appBar(context) {
    return AppBar(
      title: const Text('Add Task',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
      elevation: 0,
      // backgroundColor:
      //     Get.isDarkMode ? const Color(0x00303030) : Colors.white10,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 24,
        ),
      ),
    );
  }

  _validateDate() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      print(1);
      _addTaskToDb();
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      print(2);

      Get.snackbar(
        'Required',
        'All fileds are required',
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        colorText: pinkClr,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
        ),
      );
    } else {
      print('######## Error Here ! ########');
    }
  }

  _addTaskToDb() {
    _taskController.addTask(
      task: Task(
        id: null,
        title: _titleController.text,
        note: _noteController.text,
        isCompleted: 0,
        date: DateFormat.yMd().format(_selecteDate),
        startTime: _startTime.value,
        endTime: _endTime.value,
        color: _selectedColor.value,
        remind: _selectedRemind.value,
        repeat: _selectedRepeat.value,
        assignee: _selectedAssignee.value,
      ),
    );
  }

  _getDateFromUser(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selecteDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      _selecteDate = pickedDate;
    } else
      print('picked date empty !');
  }

  _getTimeFromUser({required bool isStartTime, context}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    if (pickedTime != null) {
      if (isStartTime) {
        _startTime.value = pickedTime.format(context);
        print(_startTime);
      } else {
        _endTime.value = pickedTime.format(context);
        print(_endTime);
      }
    }
  }
}
