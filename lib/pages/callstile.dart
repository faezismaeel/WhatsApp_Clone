import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/pages/chat_details.dart';

class CallsTile extends StatelessWidget {
  CallsTile({Key? key, required this.callsdata}) : super(key: key);
  Chat callsdata;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => ChatDetails(
      //         singlechatdata: callsdata,
      //       ),
      //     )),
      child: ListTile(
        leading: CircleAvatar(
            // backgroundColor: Colors.grey[400],
            radius: 30,
            backgroundImage: callsdata.avatar == ""
                ? AssetImage(callsdata.isGroup == true
                    ? "assets/images/defaultgroupicon.png"
                    : "assets/images/defaultpersonicon.jpeg")
                : AssetImage(callsdata.avatar.toString())
            // child: chatdata.isGroup == true
            //     ? const Icon(
            //         Icons.group,
            //         size: 35,
            //         color: Colors.white,
            //       )
            //     : const Icon(Icons.person, size: 35, color: Colors.white),
            ),
        title: Text(callsdata.name.toString()),
        subtitle: Row(
          children: [
            const Icon(
              Icons.call_received,
              color: Colors.red,
              size: 20,
            ),
            Text(callsdata.message.toString()),
          ],
        ),
        trailing: Icon(Icons.call),
      ),
    );
  }
}
