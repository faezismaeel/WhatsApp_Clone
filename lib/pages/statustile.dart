import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/pages/chat_details.dart';

class StatusTile extends StatelessWidget {
  StatusTile({Key? key, required this.statusdata}) : super(key: key);
  Chat statusdata;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => ChatDetails(
      //         singlechatdata: statusdata,
      //       ),
      //     )),
      child: ListTile(
        leading: CircleAvatar(
            // backgroundColor: Colors.grey[400],
            radius: 30,
            backgroundImage: statusdata.avatar == ""
                ? AssetImage(statusdata.isGroup == true
                    ? "assets/images/defaultgroupicon.png"
                    : "assets/images/defaultpersonicon.jpeg")
                : AssetImage(statusdata.avatar.toString())
            // child: chatdata.isGroup == true
            //     ? const Icon(
            //         Icons.group,
            //         size: 35,
            //         color: Colors.white,
            //       )
            //     : const Icon(Icons.person, size: 35, color: Colors.white),
            ),
        title: Text(statusdata.name.toString()),
        subtitle: Row(
          children: [
            // Icon(Icons.done_all),
            Text(statusdata.message.toString()),
          ],
        ),
        // trailing: Text(statusdata.updatedAt.toString()),
      ),
    );
  }
}
