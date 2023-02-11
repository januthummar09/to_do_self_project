import 'package:flutter/material.dart';
import 'package:to_do_self_project/utils/use_both_project/global.dart';
import 'package:to_do_self_project/utils/use_both_project/text_decoration_fun.dart';

import '../../common_widget/use_both_project/to_do_textfile.dart';
import '../../models/todo_app/todo_model_data.dart';

class AddTodoScreen extends StatefulWidget {
  final TodoModelData? item;
  const AddTodoScreen({Key? key, this.item}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  TextEditingController? titleController;
  TextEditingController? dateController;
  TextEditingController? timeController;
  TextEditingController? subTitleController;

  TextDeco textDeco = TextDeco();

  @override
  void initState() {
    titleController = TextEditingController();
    dateController = TextEditingController();
    timeController = TextEditingController();
    subTitleController = TextEditingController();
    editData();
    super.initState();
  }

  /// Edit data function

  editData() {
    if (widget.item != null) {
      titleController!.text = widget.item!.title!;
      subTitleController!.text = widget.item!.subTitle!;
      dateController!.text = widget.item!.date!;
      timeController!.text = widget.item!.time!;
    }
  }

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
          "Todo Detaile Screen",
        ),
        backgroundColor: Global.bgColour,
        foregroundColor: Global.fgColour,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: ListView(
          padding: const EdgeInsets.only(
            bottom: 270,
          ),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Title",
                style: textDeco.textDecoration(),
              ),
            ),
            SizedBox(
              height: heigth / 90,
            ),
            ToDoTextfile(
              hintText: "Enter Title",
              controller: titleController,
            ),
            SizedBox(
              height: heigth / 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "SubTitle",
                style: textDeco.textDecoration(),
              ),
            ),
            SizedBox(
              height: heigth / 90,
            ),
            ToDoTextfile(
              hintText: "Enter SubTitle",
              controller: subTitleController,
            ),
            SizedBox(
              height: heigth / 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Date",
                style: textDeco.textDecoration(),
              ),
            ),
            SizedBox(
              height: heigth / 90,
            ),
            ToDoTextfile(
              hintText: "Enter Date Picker",
              controller: dateController,
              onTap: () async {
                DateTime? pickerData = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015),
                    lastDate: DateTime(2030));
                debugPrint("date ----------->> $pickerData");
                dateController!.text = pickerData.toString().split(" ").first;
                setState(() {});
              },
            ),
            SizedBox(
              height: heigth / 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Time",
                style: textDeco.textDecoration(),
              ),
            ),
            SizedBox(
              height: heigth / 90,
            ),
            ToDoTextfile(
              hintText: "Enter Time",
              controller: timeController,
              onTap: () async {
                TimeOfDay? pickTime = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                if (pickTime != null) {
                  debugPrint("Time ---------->> ${pickTime.format(context)}");
                  timeController!.text = pickTime.format(context);
                }
                setState(() {});
              },
            ),
            SizedBox(
              height: heigth / 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 70,
              ),
              child: ElevatedButton(
                onPressed: () {
                  TodoModelData todoModelData = TodoModelData(
                    title: titleController!.text,
                    date: dateController!.text,
                    time: timeController!.text,
                    subTitle: subTitleController!.text,
                  );
                  Navigator.pop(context, todoModelData);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Global.bgColour,
                  ),
                  foregroundColor: MaterialStateProperty.all(Global.fgColour),
                ),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
