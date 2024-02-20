import 'dart:convert';

/// doubtID: A unique identifier for each doubt.
/// studentID: The identifier of the student who raised the doubt.
/// courseID: The identifier of the course related to the doubt.
/// assignmentID: The identifier of the assignment related to the doubt (if applicable).
/// doubtDescription: The description of the doubt.
/// dateRaised: The date when the doubt was raised.
/// resolvedStatus: The status of the doubt (Unresolved, Resolved).
/// dateResolved: The date when the doubt was resolved (if applicable).
/// resolutionDescription: The description of how the doubt was resolved (if applicable).
class DoubtsDAO {
  int? doubtID;
  int? studentID;
  int? courseID;
  int? assignmentID;
  String? doubtDescription;
  String? dateRaised;
  String? resolvedStatus;
  String? dateResolved;
  String? resolutionDescription;
  int? syncStatus;

  DoubtsDAO(
    this.doubtID,
    this.studentID,
    this.courseID,
    this.assignmentID,
    this.doubtDescription,
    this.dateRaised,
    this.resolvedStatus,
    this.dateResolved,
    this.resolutionDescription,
    this.syncStatus,
  );

  convert(String type) {
    var map = <String, dynamic>{};
    map['doubtID'] = doubtID;
    map['studentID'] = studentID;
    map['courseID'] = courseID;
    map['assignmentID'] = assignmentID;
    map['doubtDescription'] = doubtDescription;
    map['dateRaised'] = dateRaised;
    map['resolvedStatus'] = resolvedStatus;
    map['dateResolved'] = dateResolved;
    map['resolutionDescription'] = resolutionDescription;
    map['syncStatus'] = syncStatus;
    if (type == 'toMap') {
      return map;
    } else if (type == 'toJson') {
      map.remove('syncStatus');
      return jsonEncode(map);
    }
  }

  DoubtsDAO.fromMapObject(Map<String, dynamic> map) {
    doubtID = map['doubtID'];
    studentID = map['studentID'];
    courseID = map['courseID'];
    assignmentID = map['assignmentID'];
    doubtDescription = map['doubtDescription'];
    dateRaised = map['dateRaised'];
    resolvedStatus = map['resolvedStatus'];
    dateResolved = map['dateResolved'];
    resolutionDescription = map['resolutionDescription'];
    syncStatus = map['syncStatus'] ?? 0;
  }
}

List<DoubtsDAO> doubtsModelFromJson(String str) => List<DoubtsDAO>.from(
    json.decode(str).map((x) => DoubtsDAO.fromMapObject(x)));
