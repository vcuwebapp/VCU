import 'dart:convert';

/// chatroomID: A unique identifier for each chatroom.
/// courseID: The identifier of the course to which the chatroom is related.
/// studentID: The identifier of the student participating in the chat.
/// messageID: A unique identifier for each message in the chatroom.
/// messageContent: The content of the message.
/// timestamp: The date and time when the message was sent.
/// isDeleted: A flag indicating whether the message has been deleted.
class ChatroomDAO {
  int? chatroomID;
  int? courseID;
  int? studentID;
  int? messageID;
  String? messageContent;
  String? timestamp;
  String? isDeleted;
  int? syncStatus;

  ChatroomDAO(
    this.chatroomID,
    this.courseID,
    this.studentID,
    this.messageID,
    this.messageContent,
    this.timestamp,
    this.isDeleted,
    this.syncStatus,
  );

  convert(String type) {
    var map = <String, dynamic>{};
    map['chatroomID'] = chatroomID;
    map['courseID'] = courseID;
    map['studentID'] = studentID;
    map['messageID'] = messageID;
    map['messageContent'] = messageContent;
    map['timestamp'] = timestamp;
    map['isDeleted'] = isDeleted;
    map['syncStatus'] = syncStatus;
    if (type == 'toMap') {
      return map;
    } else if (type == 'toJson') {
      map.remove('syncStatus');
      return jsonEncode(map);
    }
  }

  ChatroomDAO.fromMapObject(Map<String, dynamic> map) {
    chatroomID = map['chatroomID'];
    courseID = map['courseID'];
    studentID = map['studentID'];
    messageID = map['messageID'];
    messageContent = map['messageContent'];
    timestamp = map['timestamp'];
    isDeleted = map['isDeleted'];
    syncStatus = map['syncStatus'] ?? 0;
  }
}

List<ChatroomDAO> chatroomModelFromJson(String str) => List<ChatroomDAO>.from(
    json.decode(str).map((x) => ChatroomDAO.fromMapObject(x)));
