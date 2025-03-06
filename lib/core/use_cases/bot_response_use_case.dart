// lib/core/use_cases/bot_response_use_case.dart
import 'dart:math';

import 'package:gaana_messenger/core/entities/message_entity.dart';
import 'package:gaana_messenger/core/entities/user_entity.dart';

class BotResponseUseCase {
  // For demonstration, define a list of random phrases.
  static const List<String> responses = [
    "Hey, I'm here for you!",
    "What's up?",
    "I'm available to chat!",
    "Hi there, let's talk!",
    "How can I help you?",
    "Let's talk!",
    "नमस्ते आ",
    "Salam",
    "Привет",
    "Сәлеметсіз бе",
    "こんにちは。",
    "Buna ziua",
  ];

  /// Returns a random response for a given user.
  MessageEntity execute(UserEntity user) {
    // You might add more complex logic based on the user.
    final rand = Random();
    final response = "${responses[rand.nextInt(responses.length)]}";
    final botMessage = MessageEntity(
      id: DateTime.now().millisecondsSinceEpoch,
      senderId: 0,
      content: response,
      timestamp: DateTime.now(),
    );
    return botMessage;
  }
}
