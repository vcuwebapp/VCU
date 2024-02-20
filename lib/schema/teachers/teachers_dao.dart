import 'dart:convert';

/// teacherID: A unique identifier for each teacher.
/// firstName: The first name of the teacher.
/// lastName: The last name of the teacher.
/// email: The email address of the teacher.
/// contactNumber: The contact number of the teacher.
/// subjectSpecialization: The subject or subjects that the teacher specializes in.
/// qualification: The academic qualification of the teacher.
/// dateJoined: The date when the teacher joined the institution.
class TeachersDAO {
  int? teacherID;
  String? firstName;
  String? lastName;
  String? email;
  String? contactNumber;
  String? subjectSpecialization;
  String? qualification;
  String? dateJoined;
  int? syncStatus;

  TeachersDAO(
    this.teacherID,
    this.firstName,
    this.lastName,
    this.email,
    this.contactNumber,
    this.subjectSpecialization,
    this.qualification,
    this.dateJoined,
    this.syncStatus,
  );

  convert(String type) {
    var map = <String, dynamic>{};
    map['teacherID'] = teacherID;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['contactNumber'] = contactNumber;
    map['subjectSpecialization'] = subjectSpecialization;
    map['qualification'] = qualification;
    map['dateJoined'] = dateJoined;
    map['syncStatus'] = syncStatus;
    if (type == 'toMap') {
      return map;
    } else if (type == 'toJson') {
      map.remove('syncStatus');
      return jsonEncode(map);
    }
  }

  TeachersDAO.fromMapObject(Map<String, dynamic> map) {
    teacherID = map['teacherID'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    email = map['email'];
    contactNumber = map['contactNumber'];
    subjectSpecialization = map['subjectSpecialization'];
    qualification = map['qualification'];
    dateJoined = map['dateJoined'];
    syncStatus = map['syncStatus'] ?? 0;
  }
}

List<TeachersDAO> teachersModelFromJson(String str) => List<TeachersDAO>.from(
    json.decode(str).map((x) => TeachersDAO.fromMapObject(x)));
