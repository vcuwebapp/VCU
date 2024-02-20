import 'dart:convert';

/// assignmentID: A unique identifier for each assignment.
/// studentID: The identifier of the student to whom the assignment is assigned.
/// courseID: The identifier of the course for which the assignment is given.
/// assignmentName: The name or title of the assignment.
/// assignmentDescription: A brief description of the assignment.
/// dateAssigned: The date when the assignment was given.
/// dueDate: The date by which the assignment should be submitted.
/// dateSubmitted: The date when the student submitted the assignment.
/// grade: The grade or marks obtained in the assignment.
/// maxGrade: The maximum possible grade or marks for the assignment.
/// status: The status of the assignment (Not Started, In Progress, Submitted, Graded).
class AssignmentsDAO {
  int? assignmentID;
  int? studentID;
  int? courseID;
  String? assignmentName;
  String? assignmentDescription;
  String? dateAssigned;
  String? dueDate;
  String? dateSubmitted;
  String? grade;
  String? maxGrade;
  String? status;
  String? type;
  String? subject;
  int? syncStatus;

  AssignmentsDAO(
    this.assignmentID,
    this.studentID,
    this.courseID,
    this.assignmentName,
    this.assignmentDescription,
    this.dateAssigned,
    this.dueDate,
    this.dateSubmitted,
    this.grade,
    this.maxGrade,
    this.status,
    this.type,
    this.subject,
    this.syncStatus,
  );

  convert(String type) {
    var map = <String, dynamic>{};
    map['assignmentID'] = assignmentID;
    map['studentID'] = studentID;
    map['courseID'] = courseID;
    map['assignmentName'] = assignmentName;
    map['assignmentDescription'] = assignmentDescription;
    map['dateAssigned'] = dateAssigned;
    map['dueDate'] = dueDate;
    map['dateSubmitted'] = dateSubmitted;
    map['grade'] = grade;
    map['maxGrade'] = maxGrade;
    map['status'] = status;
    map['type'] = type;
    map['subject'] = subject;
    map['syncStatus'] = syncStatus;
    if (type == 'toMap') {
      return map;
    } else if (type == 'toJson') {
      map.remove('syncStatus');
      return jsonEncode(map);
    }
  }

  // Extract a Note object from a Map object
  AssignmentsDAO.fromMapObject(Map<String, dynamic> map) {
    assignmentID = map['assignmentID'];
    studentID = map['studentID'];
    courseID = map['courseID'];
    assignmentName = map['assignmentName'];
    assignmentDescription = map['assignmentDescription'];
    dateAssigned = map['dateAssigned'];
    dueDate = map['dueDate'];
    dateSubmitted = map['dateSubmitted'];
    grade = map['grade'];
    maxGrade = map['maxGrade'];
    status = map['status'];
    type = map['type'];
    subject = map['subject'];
    syncStatus = map['syncstatus'] ?? 0;
  }
}

List<AssignmentsDAO> assignmentModelFromJson(String str) =>
    List<AssignmentsDAO>.from(
        json.decode(str).map((x) => AssignmentsDAO.fromMapObject(x)));
