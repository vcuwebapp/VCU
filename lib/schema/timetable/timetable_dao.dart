import 'dart:convert';

/// timetableID: A unique identifier for each timetable entry.
/// courseID: The identifier of the course to which the timetable entry is related.
/// dayOfWeek: The day of the week for the class.
/// startTime: The start time of the class.
/// endTime: The end time of the class.
/// location: The location or room where the class will be held.
/// instructorID: The identifier of the instructor teaching the class.
class TimetableDAO {
  int? timetableID;
  int? courseID;
  String? dayOfWeek;
  String? startTime;
  String? endTime;
  String? location;
  int? instructorID;
  int? syncStatus;

  TimetableDAO(
    this.timetableID,
    this.courseID,
    this.dayOfWeek,
    this.startTime,
    this.endTime,
    this.location,
    this.instructorID,
    this.syncStatus,
  );

  convert(String type) {
    var map = <String, dynamic>{};
    map['timetableID'] = timetableID;
    map['courseID'] = courseID;
    map['dayOfWeek'] = dayOfWeek;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['location'] = location;
    map['instructorID'] = instructorID;
    map['syncStatus'] = syncStatus;
    if (type == 'toMap') {
      return map;
    } else if (type == 'toJson') {
      map.remove('syncStatus');
      return jsonEncode(map);
    }
  }

  TimetableDAO.fromMapObject(Map<String, dynamic> map) {
    timetableID = map['timetableID'];
    courseID = map['courseID'];
    dayOfWeek = map['dayOfWeek'];
    startTime = map['startTime'];
    endTime = map['endTime'];
    location = map['location'];
    instructorID = map['instructorID'];
    syncStatus = map['syncStatus'] ?? 0;
  }
}

List<TimetableDAO> timetableModelFromJson(String str) =>
    List<TimetableDAO>.from(
        json.decode(str).map((x) => TimetableDAO.fromMapObject(x)));
