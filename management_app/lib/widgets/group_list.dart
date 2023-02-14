import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_app/pages/group.dart';
import 'package:management_app/widgets/add_group_dialog.dart';

class GroupListWidget extends GetView {
  const GroupListWidget({super.key});

  Widget _buildList() {
    return Column(textDirection: TextDirection.ltr, children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('Groups you are in:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
              )),
          //add button
          IconButton(
            onPressed: () => {Get.dialog(AddGroupDialogWidget())},
            icon: const Icon(
              Icons.add_circle,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
      Expanded(
        child: ListView(
          children: [
            _tile('ARB Group', 'Actived now', Icons.meeting_room),
            _tile('ITSS Group', 'Actived 1 minutes ago', Icons.meeting_room),
            _tile('Greeny Group', 'Actived 9 hours ago', Icons.meeting_room),
            _tile('Room 4', 'Actived 9 hours ago', Icons.meeting_room),
            _tile('Room 5', 'Actived 9 hours ago', Icons.meeting_room),
            _tile('Room 6', 'Actived 9 hours ago', Icons.meeting_room),
            _tile('Room 7', 'Actived 9 hours ago', Icons.meeting_room),
            _tile('Room 8', 'Actived 9 hours ago', Icons.meeting_room),
            _tile('Room 9', 'Actived 9 hours ago', Icons.meeting_room),
            _tile('Room 10', 'Actived 9 hours ago', Icons.meeting_room),
            _tile('Room 11', 'Actived 9 hours ago', Icons.meeting_room),
            _tile('Room 12', 'Actived 9 hours ago', Icons.meeting_room),
            _tile('Room 13', 'Actived 9 hours ago', Icons.meeting_room),
          ],
        ),
      )
    ]);
  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      onTap: (() => Get.to(() => GroupPage())),
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
