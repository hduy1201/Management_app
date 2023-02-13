import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddMemberDialogWidget extends GetWidget {
  AddMemberDialogWidget({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserRoleController userRoleController = UserRoleController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add member to group'),
      content: Form(
          key: _formKey,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter member name',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Obx(() {
              return Row(
                children: [
                  const Text('Role: '),
                  DropdownButton(
                    alignment: AlignmentDirectional.center,
                    hint: const Text(
                      'Book Type',
                    ),
                    onChanged: (newValue) {
                      userRoleController.setSelected(newValue!);
                    },
                    value: userRoleController.selected.value,
                    items: UserRoleController.list
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              );
            })
          ])),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Sumbit'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class UserRoleController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = list[0].obs;
  static List<String> list = <String>[
    'Member',
    'Admin',
  ];

  void setSelected(String value) {
    selected.value = value;
  }
}
