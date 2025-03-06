import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gaana_messenger/core/entities/message_entity.dart';
import 'package:gaana_messenger/core/entities/user_entity.dart';
import '../controllers/chat_controller.dart';

class ChatInputWidget extends StatefulWidget {
  final ChatController chatController;
  final UserEntity? user;
  const ChatInputWidget({
    super.key,
    required this.chatController,
    required this.user,
  });

  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = textController.text;
    if (text.isEmpty) return;
    // Create a user message. Assume senderId 1 for user, 0 for bot.
    final userMessage = MessageEntity(
      id: DateTime.now().millisecondsSinceEpoch,
      senderId: 1,
      content: text,
      timestamp: DateTime.now(),
    );
    widget.chatController.sendMessage(userMessage);
    textController.clear();

    // Schedule bot response after 1 second.
    Timer(const Duration(seconds: 1), () {
      if (widget.user != null) {
        widget.chatController.sendBotResponse(widget.user!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Row(
    //     children: [
    //       Expanded(
    //         child: TextField(
    //           controller: textController,
    //           decoration: const InputDecoration(
    //             hintText: "Type your message",
    //             border: OutlineInputBorder(),
    //           ),
    //         ),
    //       ),
    //       const SizedBox(width: 8),
    //       ElevatedButton(onPressed: _sendMessage, child: const Text("Send")),
    //     ],
    //   ),
    // );
  }
}
