class Email {
  final String sender;
  final String subject;
  final String preview;
  final String time;
  final String body;
  bool starred;
  final bool unread;
  final List<String> attachments;

  Email({
    required this.sender,
    required this.subject,
    required this.preview,
    required this.time,
    required this.body,
    this.starred = false,
    this.unread = true,
    this.attachments = const [],
  });
}
