import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_app/pages/group.dart';
import 'package:management_app/widgets/add_member_dialog.dart';

class MemberListWidget extends GetView {
  const MemberListWidget({super.key});

  Widget _buildList(BuildContext context) {
    return Column(textDirection: TextDirection.ltr, children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('Members you are in:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
              )),
          IconButton(
            onPressed: () => {Get.dialog(AddMemberDialogWidget())},
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
            _tile('Lư Hoàng Duy', 'Actived now', "assets/images/lulu.jpg"),
            _tile('Đồng Đức Mạnh', 'Actived 1 minutes ago',
                "assets/images/ddm.jpg"),
            _tile('Nguyễn Tuấn Kiệt', 'Actived 9 hours ago',
                "assets/images/ntk.jpg"),
            _tile('WINTER', 'Actived 9 hours ago', "assets/images/winter.jpg"),
            _tile("Rose'", 'Actived 9 hours ago', "assets/images/rose.jpg"),
            _tile(
                'Kim Jisoo', 'Actived 9 hours ago', "assets/images/jisoo.jpg"),
            _tile(
                'Kim Jenie', 'Actived 9 hours ago', "assets/images/jenie.jpg"),
          ],
        ),
      )
    ]);
  }

  ListTile _tile(String title, String subtitle, String imageUrl) {
    return ListTile(
      onTap: (() => Get.to(() => GroupPage())),
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage(imageUrl),
          height: 50.0,
          width: 50.0,
        ),
      ),
      trailing: const Icon(
        Icons.more_vert,
        color: Colors.blueGrey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }
}
