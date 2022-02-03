import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_bubble_model.dart';

class SingleChatBubble extends StatefulWidget {
  SingleChatBubble({Key? key, required this.bubbledata}) : super(key: key);
  ChatBubble bubbledata;

  @override
  _SingleChatBubbleState createState() => _SingleChatBubbleState();
}

class _SingleChatBubbleState extends State<SingleChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.bubbledata.isSend == true
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 110, minWidth: 60),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 10, 30, 20),
                  child: Text(
                    widget.bubbledata.message,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 1,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text('9:00am'),
                      Icon(
                        widget.bubbledata.isSend == true
                            ? Icons.done_all
                            : null,
                        color: widget.bubbledata.isReaded == true
                            ? Colors.blue
                            : Colors.grey,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
