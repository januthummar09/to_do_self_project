import 'package:flutter/material.dart';
import 'package:to_do_self_project/models/todo_app/todo_model_data.dart';
import 'package:to_do_self_project/screens/todo_app/add_todo_screen.dart';
import 'package:to_do_self_project/screens/todo_app/complete_todo_data_screen.dart';
import 'package:to_do_self_project/utils/todo_app/constant.dart';
import 'package:to_do_self_project/utils/use_both_project/global.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../utils/use_both_project/text_decoration_fun.dart';

class DisplayTodoDataScreen extends StatefulWidget {
  const DisplayTodoDataScreen({Key? key}) : super(key: key);

  @override
  State<DisplayTodoDataScreen> createState() => _DisplayTodoDataScreenState();
}

class _DisplayTodoDataScreenState extends State<DisplayTodoDataScreen> {
  TextDeco textDeco = TextDeco();
  List<TodoModelData> todoList = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heigth = size.height;
    double width = size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.bgColour,
        foregroundColor: Global.fgColour,
        title: const Text("Display Data Screen"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CompleteTodoDataScreen(),
                ),
              );
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: todoList.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "No Data found",
                    style: textDeco.textDecoration(
                      size: 30,
                    ),
                  ),
                ),
              ],
            )
          : ListView(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: todoList.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemBuilder: (context, index) {
                    var item = todoList[index];
                    return Slidable(
                      key: UniqueKey(),
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {
                          completeData.add(todoList[index]);
                          todoList.removeAt(index);
                          debugPrint("total list---------->>$todoList");
                          debugPrint("complate list----------->>$completeData");

                          setState(() {});
                        }),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              completeData.add(todoList[index]);
                              todoList.removeAt(index);
                              debugPrint("total list---------->>$todoList");
                              debugPrint(
                                  "complate list----------->>$completeData");
                              setState(() {});
                            },
                            backgroundColor: const Color(0xff82b0ae),
                            foregroundColor: Global.fgColour,
                            icon: Icons.save,
                            label: 'Save',
                          ),
                          SlidableAction(
                            onPressed: (context) async {
                              dynamic editData = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddTodoScreen(
                                      item: todoList[index],
                                    ),
                                  ));
                              if (editData != null) {
                                todoList[index] = editData;
                                setState(() {});
                              }
                            },
                            backgroundColor: const Color(0xffcce3c3),
                            foregroundColor: Global.fgColour,
                            icon: Icons.edit,
                            label: 'Edit',
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {
                          todoList.removeAt(index);

                          debugPrint("remove------>>$todoList");
                          setState(() {});
                        }),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              todoList.removeAt(index);
                              setState(() {});
                              debugPrint("total list---------->>$todoList");
                              debugPrint("remove------>>$todoList");
                            },
                            backgroundColor: const Color(0xFFf797af),
                            foregroundColor: Global.fgColour,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ).copyWith(left: 10),
                        tileColor: Global.tileColor,
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            alignment: Alignment.center,
                            height: heigth / 2,
                            width: width / 5,
                            color: Global.bgColour,
                            child: Text(
                              "${index + 1}",
                              style: textDeco.textDecoration(
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          "${item.title}",
                          style: textDeco.textDecoration(
                            size: 25,
                          ),
                        ),
                        subtitle: Text(
                          "${todoList[index].subTitle}",
                          style: textDeco.textDecoration(),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${item.date}",
                              style: textDeco.textDecoration(
                                size: 15,
                              ),
                            ),
                            Text(
                              "${item.time}",
                              style: textDeco.textDecoration(
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic data = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTodoScreen(),
            ),
          );
          if (data != null) {
            todoList.add(data);
            setState(() {});
          }
          debugPrint("Main  List------------------>$todoList");
        },
        backgroundColor: Global.bgColour,
        foregroundColor: Global.fgColour,
        child: const Icon(Icons.add),
      ),
    );
  }
}
