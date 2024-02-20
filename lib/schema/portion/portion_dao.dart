import 'dart:convert';

/// portionID: A unique identifier for each portion.
/// courseID: The identifier of the course to which the portion is related.
/// topicID: The identifier of the topic covered in the portion.
/// topicName: The name of the topic.
/// topicDescription: A brief description of the topic.
/// startDate: The date when the topic is scheduled to start.
/// endDate: The date when the topic is scheduled to end.
/// status: The status of the topic (Not Started, In Progress, Completed).
class PortionDAO {
  int? portionID;
  int? courseID;
  int? topicID;
  String? topicName;
  String? topicDescription;
  String? startDate;
  String? endDate;
  String? status;
  int? syncStatus;

  PortionDAO(
    this.portionID,
    this.courseID,
    this.topicID,
    this.topicName,
    this.topicDescription,
    this.startDate,
    this.endDate,
    this.status,
    this.syncStatus,
  );

  convert(String type) {
    var map = <String, dynamic>{};
    map['portionID'] = portionID;
    map['courseID'] = courseID;
    map['topicID'] = topicID;
    map['topicName'] = topicName;
    map['topicDescription'] = topicDescription;
    map['startDate'] = startDate;
    map['endDate'] = endDate;
    map['status'] = status;
    map['syncStatus'] = syncStatus;
    if (type == 'toMap') {
      return map;
    } else if (type == 'toJson') {
      map.remove('syncStatus');
      return jsonEncode(map);
    }
  }

  PortionDAO.fromMapObject(Map<String, dynamic> map) {
    portionID = map['portionID'];
    courseID = map['courseID'];
    topicID = map['topicID'];
    topicName = map['topicName'];
    topicDescription = map['topicDescription'];
    startDate = map['startDate'];
    endDate = map['endDate'];
    status = map['status'];
    syncStatus = map['syncStatus'] ?? 0;
  }
}

List<PortionDAO> portionModelFromJson(String str) => List<PortionDAO>.from(
    json.decode(str).map((x) => PortionDAO.fromMapObject(x)));
