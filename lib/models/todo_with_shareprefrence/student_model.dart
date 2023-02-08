class StdModel {
   List<StudentList>? studentList;

  StdModel({
    this.studentList,
  });

  StdModel.fromJson(Map<String, dynamic> json)
      : studentList = (json['student_list'] as List?)
            ?.map(
                (dynamic e) => StudentList.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'student_list': studentList?.map((e) => e.toJson()).toList()};
}

class StudentList {
  final String? name;
  final String? surname;
  final String? dob;
  final String? qualification;

  StudentList({
    this.name,
    this.surname,
    this.dob,
    this.qualification,
  });

  StudentList.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        surname = json['surname'] as String?,
        dob = json['dob'] as String?,
        qualification = json['qualification'] as String?;

  Map<String, dynamic> toJson() => {
        'name': name,
        'surname': surname,
        'dob': dob,
        'qualification': qualification
      };
}
