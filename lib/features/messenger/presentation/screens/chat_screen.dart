import 'package:flutter/material.dart';
import 'package:gaana_messenger/core/entities/user_entity.dart';
import 'package:gaana_messenger/di/injector.dart';
import 'package:gaana_messenger/features/messenger/presentation/widgets/chat_input_widget.dart';
import '../controllers/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the shared ChatController from your Injector.
    final chatController = Injector().get<ChatController>();
    final user = ModalRoute.of(context)?.settings.arguments as UserEntity?;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Chat"),
        backgroundColor: Colors.grey[300],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: AnimatedBuilder(
                animation: chatController,
                builder: (context, _) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: chatController.messages.length,
                    itemBuilder: (context, index) {
                      final msg = chatController.messages[index];
                      return ListTile(
                        title: Text(msg.content),
                        subtitle: Text(msg.senderId == 0 ? "Bot" : "User"),
                        trailing: GestureDetector(
                          onTap: () {
                            chatController.deleteMessage(msg);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "${msg.timestamp.hour.toString().padLeft(2, '0')}:${msg.timestamp.minute.toString().padLeft(2, '0')}",
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            // ChatInputWidget manages its own TextEditingController.
            ChatInputWidget(chatController: chatController, user: user),
          ],
        ),
      ),
    );
  }
}
