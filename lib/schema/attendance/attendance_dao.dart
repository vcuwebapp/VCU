import 'dart:convert';

/// attendanceID: A unique identifier for each attendance record.
/// studentID: The identifier of the student whose attendance is being recorded.
/// courseID: The identifier of the course for which the attendance is recorded.
/// date: The date of the class.
/// status: The attendance status of the student (Present, Absent, Late, Excused).
/// reason: If the student was absent or late, the reason for the absence or tardiness.
class AttendanceDAO {
  int? attendanceID;
  int? studentID;
  int? courseID;
  String? date;
  String? status;
  String? reason;
  int? syncStatus;

  AttendanceDAO(
    this.attendanceID,
    this.studentID,
    this.courseID,
    this.date,
    this.status,
    this.reason,
    this.syncStatus,
  );

  convert(String type) {
    var map = <String, dynamic>{};
    map['attendanceID'] = attendanceID;
    map['studentID'] = studentID;
    map['courseID'] = courseID;
    map['date'] = date;
    map['status'] = status;
    map['reason'] = reason;
    map['syncStatus'] = syncStatus;
    if (type == 'toMap') {
      return map;
    } else if (type == 'toJson') {
      map.remove('syncStatus');
      return jsonEncode(map);
    }
  }

  AttendanceDAO.fromMapObject(Map<String, dynamic> map) {
    attendanceID = map['attendanceID'];
    studentID = map['studentID'];
    courseID = map['courseID'];
    date = map['date'];
    status = map['status'];
    reason = map['reason'];
    syncStatus = map['syncStatus'] ?? 0;
  }
}

List<AttendanceDAO> attendanceModelFromJson(String str) =>
    List<AttendanceDAO>.from(
        json.decode(str).map((x) => AttendanceDAO.fromMapObject(x)));
