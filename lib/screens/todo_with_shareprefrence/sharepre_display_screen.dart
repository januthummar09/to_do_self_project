import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_self_project/screens/todo_with_shareprefrence/sharepref_add_screen.dart';
import 'package:to_do_self_project/utils/use_both_project/global.dart';
import 'package:to_do_self_project/utils/use_both_project/text_decoration_fun.dart';

import '../../models/todo_with_shareprefrence/student_model.dart';
import '../../utils/todo_with_prefrenceshare/local_data.dart';

class SharepreDisplayScreen extends StatefulWidget {
  const SharepreDisplayScreen({Key? key}) : super(key: key);

  @override
  State<SharepreDisplayScreen> createState() => _SharepreDisplayScreenState();
}

class _SharepreDisplayScreenState extends State<SharepreDisplayScreen> {
  TextDeco textDeco = TextDeco();
  StdModel? listOfData;
  LocalData localData = LocalData();
  @override
  void initState() {
    getTodoData();
    super.initState();
  }

  getTodoData() async {
    dynamic data = await localData.getModel(localData.todoData);
    debugPrint("display screen data------->>${await data}");
    listOfData = StdModel.fromJson(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heigth = size.height;
    double width = size.width;
    double text = MediaQuery.textScaleFactorOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.bgColour,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          "Todo With Sharepref Display Screen",
          style: textDeco.textDecoration(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done),
            color: Global.fgColour,
            iconSize: 30,
          ),
        ],
      ),
      body: listOfData == null || listOfData!.studentList!.isEmpty
          ? Center(
              child: Text(
                "No Data Found",
                style: textDeco.textDecoration(
                  size: 30,
                ),
              ),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: heigth / 100,
              ),
              itemCount: listOfData!.studentList!.length,
              itemBuilder: (context, index) {
                final item = listOfData!.studentList![index];
                return Slidable(
                  key: UniqueKey(),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: () {
                      debugPrint(
                          "\n\n\n\n before removeData Main model data ----------->>${listOfData!.studentList!}");
                      var removeData = listOfData!.studentList!.removeAt(index);

                      debugPrint(
                          "\n\n\n\nremove data ----------->>$removeData}");
                      debugPrint(
                          "\n\n\n\n after removeData Main model data ----------->>${listOfData!.studentList!}");

                      setState(() {});
                    }),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          debugPrint(
                              "\n\n\n\n before removeData Main model data ----------->>${listOfData!.studentList!}");
                          var removeData =
                              listOfData!.studentList!.removeAt(index);

                          debugPrint(
                              "\n\n\n\n remove data ----------->>$removeData");
                          debugPrint(
                              "\n\n\n\n after removeData Main model data ----------->>${listOfData!.studentList!}");

                          setState(() {});
                        },
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: const Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          
                        },
                        backgroundColor: const Color(0xFF7BC043),
                        foregroundColor: Colors.white,
                        icon: Icons.save,
                        label: 'Save',
                      ),
                    ],
                  ),
                  child: Card(
                    color: Global.tileColor,
                    child: ListTile(
                      title:
                          Text("Name :${listOfData!.studentList![index].name}"),
                      subtitle: Text("Surname :${item.surname}"),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShareprefAddScreen(),
            ),
          ).then((value) => getTodoData());
        },
        backgroundColor: Global.bgColour,
        foregroundColor: Global.fgColour,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
