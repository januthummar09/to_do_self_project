import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:to_do_self_project/utils/use_both_project/global.dart';

import '../../common_widget/use_both_project/to_do_textfile.dart';
import '../../models/todo_with_shareprefrence/student_model.dart';
import '../../utils/todo_with_prefrenceshare/local_data.dart';
import '../../utils/use_both_project/text_decoration_fun.dart';

class ShareprefAddScreen extends StatefulWidget {
  final StdModel? studItem;
  const ShareprefAddScreen({Key? key, this.studItem}) : super(key: key);

  @override
  State<ShareprefAddScreen> createState() => _ShareprefAddScreenState();
}

class _ShareprefAddScreenState extends State<ShareprefAddScreen> {
  TextDeco textDeco = TextDeco();
//  MODEL

  StdModel stdModel = StdModel();

  //SET AND GET FUNCTION OF SHAREPREFRENCE IN LOCAL CLASS
  LocalData localData = LocalData();

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    // nameController = TextEditingController();
    // surnameController = TextEditingController();
    // dobController = TextEditingController();
    // qualificationController = TextEditingController();
    // getDataModel();
    getData();
    super.initState();
  }

  // getDataModel() async {
  //   dynamic data = await localData.getModel(localData.todoData);
  //   stdModel = StdModel.fromJson(data);
  //   debugPrint("get model dataaaaa-------------->>$data");
  //   setState(() {});
  // }

  getData() async {
    if (await localData.containData(localData.todoData)) {
      dynamic data = await localData.getModel(localData.todoData);
      debugPrint("data ---------->> $data");
      stdModel = StdModel.fromJson(data);
    } else {
      stdModel.studentList = [];
    }
    setState(() {});
  }

  // @override
  // void dispose() {
  //   nameController!.dispose();
  //   surnameController!.dispose();
  //   dobController!.dispose();
  //   qualificationController!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heigth = size.height;
    double width = size.width;
    double text = MediaQuery.textScaleFactorOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Todo With sharepref Detaile Screen",
        ),
        backgroundColor: Global.bgColour,
        foregroundColor: Global.fgColour,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Name",
                style: textDeco.textDecoration(),
              ),
            ),
            SizedBox(
              height: heigth / 90,
            ),
            ToDoTextfile(
              hintText: "Enter Name",
              controller: nameController,
            ),
            SizedBox(
              height: heigth / 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Surname",
                style: textDeco.textDecoration(),
              ),
            ),
            SizedBox(
              height: heigth / 90,
            ),
            ToDoTextfile(
              hintText: "Enter Surname",
              controller: surnameController,
            ),
            SizedBox(
              height: heigth / 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "DOB",
                style: textDeco.textDecoration(),
              ),
            ),
            SizedBox(
              height: heigth / 90,
            ),
            ToDoTextfile(
              hintText: "Enter Date Of Birth",
              controller: dobController,
              onTap: () async {
                DateTime? pickerData = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now());
                debugPrint("date ----------->> $pickerData");
                dobController.text = pickerData.toString().split(" ").first;
                setState(() {});
              },
            ),
            SizedBox(
              height: heigth / 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Qualification",
                style: textDeco.textDecoration(),
              ),
            ),
            SizedBox(
              height: heigth / 90,
            ),
            ToDoTextfile(
              hintText: "Enter Qualification",
              controller: qualificationController,
              maxLines: 8,
            ),
            SizedBox(
              height: heigth / 40,
            ),
            ElevatedButton(
              onPressed: () {
                StudentList studentList = StudentList(
                  name: nameController.text,
                  surname: surnameController.text,
                  dob: dobController.text,
                  qualification: qualificationController.text,
                );
                stdModel.studentList!.add(studentList);
                // localData.removeData(localData.todoData);

                localData.setModel(
                  localData.todoData,
                  jsonEncode(stdModel),
                );

                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Global.bgColour,
                ),
                foregroundColor: MaterialStateProperty.all(Global.fgColour),
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
