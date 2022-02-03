import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_bubble_model.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/widgets/attachments.dart';
import 'package:whatsapp/widgets/chat_bubble_widget.dart';

class ChatDetails extends StatefulWidget {
  final Chat singlechatdata;
  const ChatDetails({Key? key, required this.singlechatdata}) : super(key: key);

  @override
  _ChatDetailsState createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  List<ChatBubble> chat = [
    ChatBubble(isSend: true, isReaded: false, message: 'Hi', sendAt: '10:30pm'),
    ChatBubble(
        isSend: false, isReaded: true, message: 'hello', sendAt: '10:45pm'),
    ChatBubble(
        isSend: true, isReaded: true, message: 'goodnyt', sendAt: '10:50pm'),
    ChatBubble(
        isSend: false, isReaded: true, message: 'gdni8', sendAt: '10:55pm'),
    ChatBubble(isSend: true, isReaded: false, message: 'ok', sendAt: '11:30pm'),
    ChatBubble(
        isSend: false, isReaded: true, message: 'bye', sendAt: '12:30pm'),
  ];
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showEmoji = false;
        });
      }
    });
  }

  TextEditingController messageController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool showSend = false;
  bool showEmoji = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.singlechatdata.name!,
              style: const TextStyle(fontSize: 25),
            ),
            Text(
              'last seen at ${widget.singlechatdata.updatedAt!}',
              style: const TextStyle(fontSize: 15),
            )
          ],
        ),
        backgroundColor: Colors.teal[800],
        leadingWidth: 85,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              GestureDetector(
                child: const Icon(Icons.arrow_back),
                onTap: () => Navigator.of(context).pop(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: widget.singlechatdata.avatar == ""
                    ? CircleAvatar(
                        radius: 20,
                        child: Icon(
                          widget.singlechatdata.isGroup == false
                              ? Icons.person
                              : Icons.group,
                          color: Colors.grey,
                        ),
                        backgroundColor: Colors.white,
                      )
                    : CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage(widget.singlechatdata.avatar!),
                      ),
              ),
            ],
          ),
        ),
        // automaticallyImplyLeading: false,
        actions: [
          const Icon(
            Icons.videocam,
            size: 30,
          ),
          const SizedBox(
            width: 8,
          ),
          const Icon(
            Icons.call,
            size: 30,
          ),
          const SizedBox(
            width: 4,
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: widget.singlechatdata.isGroup == true
                      ? const Text('Group info')
                      : const Text('View contact'),
                ),
                PopupMenuItem(
                  child: Text(widget.singlechatdata.isGroup == true
                      ? 'Group media'
                      : 'Media, links and docs'),
                ),
                const PopupMenuItem(
                  child: Text('Search'),
                ),
                const PopupMenuItem(
                  child: Text('Mute notifications'),
                ),
                const PopupMenuItem(
                  child: Text('Wallpaper'),
                ),
                const PopupMenuItem(
                  child: Text('More'),
                ),
              ];
            },
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/backimage.jpeg',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            ListView.builder(
              itemCount: chat.length,
              itemBuilder: (context, index) {
                return SingleChatBubble(bubbledata: chat[index]);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        // color: Colors.amber,
                        width: MediaQuery.of(context).size.width - 60,
                        child: Card(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Type a message...',
                                prefixIcon: IconButton(
                                    onPressed: () {
                                      print(focusNode.hasFocus);
                                      if (focusNode.hasFocus) {
                                        focusNode.unfocus();
                                      }
                                      setState(() {
                                        showEmoji = !showEmoji;
                                      });
                                    },
                                    icon: Icon(showEmoji == true
                                        ? Icons.keyboard
                                        : Icons.emoji_emotions_outlined)),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (Builder) {
                                              return const Attachments();
                                            },
                                            backgroundColor:
                                                Colors.transparent);
                                      },
                                      icon: const Icon(
                                        Icons.attach_file,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(Icons.camera_alt),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                )),
                            controller: messageController,
                            focusNode: focusNode,
                            onChanged: (value) {
                              if (value.length > 0) {
                                setState(() {
                                  showSend = true;
                                });
                              } else {
                                setState(() {
                                  showSend = false;
                                });
                              }
                            },
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: CircleAvatar(
                          backgroundColor: Colors.teal[800],
                          radius: 25,
                          child:
                              Icon(showSend == true ? Icons.send : Icons.mic),
                        ),
                      )
                    ],
                  ),
                  showEmoji == true ? selectEmoji() : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget selectEmoji() {
    return EmojiPicker(onEmojiSelected: (emoji, category) {
      messageController.text = '${messageController.text}${emoji.emoji}';
      if (messageController.text.length > 0) {
        setState(() {
          showSend = true;
        });
      } else {
        setState(() {
          showSend = false;
        });
      }
    });
  }
}
