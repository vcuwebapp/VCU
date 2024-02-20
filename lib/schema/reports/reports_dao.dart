import 'dart:convert';

/// reportID: A unique identifier for each report.
/// studentID: The identifier of the student for whom the report is generated.
/// courseID: The identifier of the course for which the report is generated.
/// totalMarks: The total marks obtained by the student in the course.
/// maxMarks: The maximum marks that could be obtained in the course.
/// percentage: The percentage of marks obtained by the student.
/// grade: The grade obtained based on the percentage.
/// attendance: The attendance of the student in the course.
/// dateGenerated: The date when the report was generated.
class ReportsDAO {
  int? reportID;
  int? studentID;
  int? courseID;
  String? totalMarks;
  String? maxMarks;
  String? percentage;
  String? grade;
  String? attendance;
  String? dateGenerated;
  int? syncStatus;

  ReportsDAO(
    this.reportID,
    this.studentID,
    this.courseID,
    this.totalMarks,
    this.maxMarks,
    this.percentage,
    this.grade,
    this.attendance,
    this.dateGenerated,
    this.syncStatus,
  );

  convert(String type) {
    var map = <String, dynamic>{};
    map['reportID'] = reportID;
    map['studentID'] = studentID;
    map['courseID'] = courseID;
    map['totalMarks'] = totalMarks;
    map['maxMarks'] = maxMarks;
    map['percentage'] = percentage;
    map['grade'] = grade;
    map['attendance'] = attendance;
    map['dateGenerated'] = dateGenerated;
    map['syncStatus'] = syncStatus;
    if (type == 'toMap') {
      return map;
    } else if (type == 'toJson') {
      map.remove('syncStatus');
      return jsonEncode(map);
    }
  }

  ReportsDAO.fromMapObject(Map<String, dynamic> map) {
    reportID = map['reportID'];
    studentID = map['studentID'];
    courseID = map['courseID'];
    totalMarks = map['totalMarks'];
    maxMarks = map['maxMarks'];
    percentage = map['percentage'];
    grade = map['grade'];
    attendance = map['attendance'];
    dateGenerated = map['dateGenerated'];
    syncStatus = map['syncStatus'] ?? 0;
  }
}

List<ReportsDAO> reportsModelFromJson(String str) => List<ReportsDAO>.from(
    json.decode(str).map((x) => ReportsDAO.fromMapObject(x)));
