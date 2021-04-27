class NotificationObj {

  int msgId;

  String notificationType;

  String title;

  String message;

  String datetime;

  bool read;

  NotificationObj({required this.msgId, required this.notificationType, required this.title,
    required this.message, required this.read, required this.datetime});

  factory NotificationObj.fromJson(Map<String, dynamic> parsedJson){
    return NotificationObj(
        msgId: null == parsedJson['msgId'] ? 0 : parsedJson['msgId'] as int,
        notificationType : parsedJson['notificationType'] as String,
        title: parsedJson['title'] as String,
        message: parsedJson['message'] as String,
        read:  parsedJson['read'] as bool,
        datetime: parsedJson['datetime'] as String
    );
  }
}