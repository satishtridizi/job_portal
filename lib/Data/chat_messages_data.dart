import '../models/chat_message_model.dart';

final List<ChatMessageModel> chatMessages = [
  ChatMessageModel(
    text:
        "Hi Sarah, thank you for applying to the Senior Frontend Developer position.",
    time: "10:30 AM",
    isSender: true,
  ),
  ChatMessageModel(
    text:
        "Hello! Thank you for reaching out. I'm very excited about this opportunity.",
    time: "10:45 AM",
    isSender: false,
  ),
  ChatMessageModel(
    text:
        "We reviewed your application and would like to schedule an interview.",
    time: "11:00 AM",
    isSender: true,
  ),
  ChatMessageModel(
    text: "That's wonderful! I'm available this week.",
    time: "11:15 AM",
    isSender: false,
  ),
  ChatMessageModel(
    text: "Thank you! When can I expect to hear back?",
    time: "11:16 AM",
    isSender: false,
  ),
];
