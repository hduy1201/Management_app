import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMemberDialogWidget extends GetView {
  AddMemberDialogWidget({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userRoleController = TextEditingController();
  final _selectedRole = UserRoleList.admin.obs;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<UserRoleList>> roleEntries =
        <DropdownMenuEntry<UserRoleList>>[];
    for (final UserRoleList role in UserRoleList.values) {
      roleEntries.add(DropdownMenuEntry<UserRoleList>(
          value: role, label: role.name, enabled: role.name != 'Grey'));
    }
    return AlertDialog(
      title: const Text('Add member to group'),
      content: Form(
          key: _formKey,
          child: Column(mainAxisSize: MainAxisSize.max, children: [
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
              return DropdownMenu<UserRoleList>(
                menuHeight: 10,
                initialSelection: _selectedRole.value,
                controller: userRoleController,
                label: const Text('Role'),
                dropdownMenuEntries: roleEntries,
                onSelected: (UserRoleList? role) {
                  if (role != null) {
                    _selectedRole.value = role;
                  }
                },
              );
            })
          ])),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Disable'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Enable'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

enum UserRoleList {
  admin('Admin'),
  member('Member');

  const UserRoleList(this.name);
  final String name;
}
