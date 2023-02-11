import 'package:flutter/material.dart';
import 'package:to_do_self_project/utils/todo_with_prefrenceshare/constant_sharepref.dart';
import 'package:to_do_self_project/utils/use_both_project/global.dart';
import 'package:to_do_self_project/utils/use_both_project/text_decoration_fun.dart';

class ShareprefCompleteScreen extends StatefulWidget {
  const ShareprefCompleteScreen({Key? key}) : super(key: key);

  @override
  State<ShareprefCompleteScreen> createState() =>
      _ShareprefCompleteScreenState();
}

class _ShareprefCompleteScreenState extends State<ShareprefCompleteScreen> {
  TextDeco textDeco = TextDeco();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ToDo With Sharepref Complete Screen",
          style: textDeco.textDecoration(
            size: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Global.bgColour,
        foregroundColor: Global.fgColour,
      ),
      body: completeShareData.studentList == null
          ? const Center(child: Text("No Dataaaaa Found"))
          : ListView.separated(
              itemCount: completeShareData.studentList!.length,
              padding: const EdgeInsets.symmetric(vertical: 15),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final item = completeShareData.studentList![index];
                return ListTile(
                  tileColor: Colors.grey.shade400,
                  title: Text('${item.name}'),
                  subtitle: Text('${item.surname}'),
                  trailing: Text('${item.dob}'),
                );
              },
            ),
    );
  }
}
