import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_self_project/screens/todo_app/splesh_screen.dart';
import 'package:to_do_self_project/screens/todo_with_shareprefrence/sharepref_splesh_screen.dart';
import 'package:to_do_self_project/utils/use_both_project/global.dart';

import 'utils/use_both_project/text_decoration_fun.dart';

void main() {
  runApp(const MyApp());
}

class ListItem {
  String title;
  Widget child;
  ListItem({required this.title, required this.child});
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextDeco textDeco = TextDeco();

  List<ListItem> items = [
    ListItem(
      title: 'ONLY TODO APP',
      child: const SpleshScreen(),
    ),
    ListItem(
      title: 'TODO WITH SHAREPREFRENCE ',
      child: const ShareprefSpleshScreen(),
    ),
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          // const SharepreDisplayScreen(),
          Scaffold(
        appBar: AppBar(
          backgroundColor: Global.bgColour,
          title: Text(
            'List Of Project',
            style: textDeco.textDecoration(
              size: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: ListView.separated(
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Card(
                  color: Global.tileColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      items[index].title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: ((BuildContext context) {
                        return items[index].child;
                      }),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
