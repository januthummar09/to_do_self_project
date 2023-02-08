import 'package:flutter/material.dart';
import 'package:to_do_self_project/utils/use_both_project/global.dart';

class ShareprefCompleteScreen extends StatelessWidget {
  const ShareprefCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo With Sharepref Complete Screen"),
        backgroundColor: Global.bgColour,
      ),
      
    );
  }
}
