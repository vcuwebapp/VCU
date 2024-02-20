import 'dart:convert';

/// marksID: A unique identifier for each marks record.
/// studentID: The identifier of the student whose marks are being recorded.
/// courseID: The identifier of the course for which the marks are recorded.
/// assignmentID: The identifier of the assignment for which the marks are recorded.
/// marksObtained: The marks obtained by the student in the assignment.
/// totalMarks: The total marks that could be obtained in the assignment.
/// grade: The grade obtained based on the marks.
/// dateGraded: The date when the marks were given.
class MarksDAO {
  int? marksID;
  int? studentID;
  int? courseID;
  int? assignmentID;
  String? marksObtained;
  String? totalMarks;
  String? grade;
  String? dateGraded;
  int? syncStatus;

  MarksDAO(
    this.marksID,
    this.studentID,
    this.courseID,
    this.assignmentID,
    this.marksObtained,
    this.totalMarks,
    this.grade,
    this.dateGraded,
    this.syncStatus,
  );

  convert(String type) {
    var map = <String, dynamic>{};
    map['marksID'] = marksID;
    map['studentID'] = studentID;
    map['courseID'] = courseID;
    map['assignmentID'] = assignmentID;
    map['marksObtained'] = marksObtained;
    map['totalMarks'] = totalMarks;
    map['grade'] = grade;
    map['dateGraded'] = dateGraded;
    map['syncStatus'] = syncStatus;
    if (type == 'toMap') {
      return map;
    } else if (type == 'toJson') {
      map.remove('syncStatus');
      return jsonEncode(map);
    }
  }

  MarksDAO.fromMapObject(Map<String, dynamic> map) {
    marksID = map['marksID'];
    studentID = map['studentID'];
    courseID = map['courseID'];
    assignmentID = map['assignmentID'];
    marksObtained = map['marksObtained'];
    totalMarks = map['totalMarks'];
    grade = map['grade'];
    dateGraded = map['dateGraded'];
    syncStatus = map['syncStatus'] ?? 0;
  }
}

List<MarksDAO> marksModelFromJson(String str) =>
    List<MarksDAO>.from(json.decode(str).map((x) => MarksDAO.fromMapObject(x)));
