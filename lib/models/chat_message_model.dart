class ChatMessageModel {
  final String text;
  final String time;
  final bool isSender;

  const ChatMessageModel({
    required this.text,
    required this.time,
    required this.isSender,
  });
}
