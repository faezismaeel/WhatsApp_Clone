import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/pages/chat_details.dart';

class Chattile extends StatelessWidget {
  Chattile({Key? key, required this.chatdata}) : super(key: key);
  Chat chatdata;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetails(
              singlechatdata: chatdata,
            ),
          )),
      child: ListTile(
        leading: CircleAvatar(
            // backgroundColor: Colors.grey[400],
            radius: 30,
            backgroundImage: chatdata.avatar == ""
                ? AssetImage(chatdata.isGroup == true
                    ? "assets/images/defaultgroupicon.png"
                    : "assets/images/defaultpersonicon.jpeg")
                : AssetImage(chatdata.avatar.toString())
            // child: chatdata.isGroup == true
            //     ? const Icon(
            //         Icons.group,
            //         size: 35,
            //         color: Colors.white,
            //       )
            //     : const Icon(Icons.person, size: 35, color: Colors.white),
            ),
        title: Text(chatdata.name.toString()),
        subtitle: Row(
          children: [
            Icon(Icons.done_all),
            Text(chatdata.message.toString()),
          ],
        ),
        trailing: Text(chatdata.updatedAt.toString()),
      ),
    );
  }
}
