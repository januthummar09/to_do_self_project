import 'package:flutter/material.dart';
import 'package:to_do_self_project/utils/todo_app/constant.dart';

import '../../utils/use_both_project/global.dart';
import '../../utils/use_both_project/text_decoration_fun.dart';

class CompleteTodoDataScreen extends StatefulWidget {
  const CompleteTodoDataScreen({Key? key}) : super(key: key);

  @override
  State<CompleteTodoDataScreen> createState() => _CompleteTodoDataScreenState();
}

class _CompleteTodoDataScreenState extends State<CompleteTodoDataScreen> {
  TextDeco textDeco = TextDeco();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heigth = size.height;
    double width = size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDoCompleteScreen"),
        backgroundColor: Global.bgColour,
        foregroundColor: Global.fgColour,
      ),
      body: completeData.isEmpty
          ? const Center(
              child: Text(
                "No  Complete Data Found",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ListView.separated(
              itemCount: completeData.length,
              padding: const EdgeInsets.symmetric(vertical: 15),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final item = completeData[index];
                return ListTile(
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
                    "${completeData[index].subTitle}",
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
                );
              },
            ),
    );
  }
}
