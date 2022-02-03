// To parse this JSON data, do
//
//     final chatBubble = chatBubbleFromJson(jsonString);

import 'dart:convert';

ChatBubble chatBubbleFromJson(String str) =>
    ChatBubble.fromJson(json.decode(str));

String chatBubbleToJson(ChatBubble data) => json.encode(data.toJson());

class ChatBubble {
  ChatBubble({
    required this.isSend,
    required this.isReaded,
    required this.message,
    required this.sendAt,
  });

  bool isSend;
  bool isReaded;
  String message;
  String sendAt;

  factory ChatBubble.fromJson(Map<String, dynamic> json) => ChatBubble(
        isSend: json["isSend"],
        isReaded: json["isReaded"],
        message: json["message"],
        sendAt: json["sendAt"],
      );

  Map<String, dynamic> toJson() => {
        "isSend": isSend,
        "isReaded": isReaded,
        "message": message,
        "sendAt": sendAt,
      };
}
