import 'dart:convert';

/// testID: A unique identifier for each test.
/// courseID: The identifier of the course to which the test is related.
/// testName: The name or title of the test.
/// testDescription: A brief description of the test.
/// dateScheduled: The date when the test is scheduled.
/// duration: The duration of the test.
/// totalMarks: The total marks that could be obtained in the test.
/// passMarks: The minimum marks required to pass the test.
/// testStatus: The status of the test (Scheduled, Completed, Cancelled).
class TestsDAO {
  int? testID;
  int? courseID;
  String? testName;
  String? testDescription;
  String? dateScheduled;
  String? duration;
  String? totalMarks;
  String? passMarks;
  String? testStatus;
  int? syncStatus;

  TestsDAO(
    this.testID,
    this.courseID,
    this.testName,
    this.testDescription,
    this.dateScheduled,
    this.duration,
    this.totalMarks,
    this.passMarks,
    this.testStatus,
    this.syncStatus,
  );

  convert(String type) {
    var map = <String, dynamic>{};
    map['testID'] = testID;
    map['courseID'] = courseID;
    map['testName'] = testName;
    map['testDescription'] = testDescription;
    map['dateScheduled'] = dateScheduled;
    map['duration'] = duration;
    map['totalMarks'] = totalMarks;
    map['passMarks'] = passMarks;
    map['testStatus'] = testStatus;
    map['syncStatus'] = syncStatus;
    if (type == 'toMap') {
      return map;
    } else if (type == 'toJson') {
      map.remove('syncStatus');
      return jsonEncode(map);
    }
  }

  TestsDAO.fromMapObject(Map<String, dynamic> map) {
    testID = map['testID'];
    courseID = map['courseID'];
    testName = map['testName'];
    testDescription = map['testDescription'];
    dateScheduled = map['dateScheduled'];
    duration = map['duration'];
    totalMarks = map['totalMarks'];
    passMarks = map['passMarks'];
    testStatus = map['testStatus'];
    syncStatus = map['syncStatus'] ?? 0;
  }
}

List<TestsDAO> testsModelFromJson(String str) =>
    List<TestsDAO>.from(json.decode(str).map((x) => TestsDAO.fromMapObject(x)));
