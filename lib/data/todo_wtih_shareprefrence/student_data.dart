//.   WRITE IN JSON CONVETER...

/* {

"student_list":[
{
"name":"name",
"surname":"surname",

"dob":"dob",

"qualification":"qualification"

}
]
} */

class StudentData {
  Map<String, dynamic> student = {
    "student_list": [
      {
        "name": "name",
        "surname": "surname",
        "dob": "dob",
        "qualification": "qualification"
      }
    ]
  };
}
