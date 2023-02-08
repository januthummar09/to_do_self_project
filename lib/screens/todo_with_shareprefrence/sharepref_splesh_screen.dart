import 'package:flutter/material.dart';
import 'package:to_do_self_project/utils/use_both_project/global.dart';

import '../../utils/use_both_project/text_decoration_fun.dart';
import 'sharepref_add_screen.dart';

class ShareprefSpleshScreen extends StatefulWidget {
  const ShareprefSpleshScreen({Key? key}) : super(key: key);

  @override
  State<ShareprefSpleshScreen> createState() => _ShareprefSpleshScreenState();
}

class _ShareprefSpleshScreenState extends State<ShareprefSpleshScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        return Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const ShareprefAddScreen(),
            ),
            (route) => false);
      },
    );
  }

  TextDeco textDeco = TextDeco();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.bgColour,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Text(
            "TODO WITH SHAREPREFRENCE SPLESH SCREEN",
            style: textDeco.textDecoration(
              size: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
