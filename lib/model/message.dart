class Message {
  bool success;
  String message;

  Message({
    required this.success,
    required this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        success: json['Success'],
        message: json['Message'],
      );

  Map<String, dynamic> toJson() => {'Success': success, 'Message': message};
}
