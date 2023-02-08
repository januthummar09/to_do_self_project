import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  SharedPreferences? sharedPref;
  String todoData = "todoData";

  setModel(String key, dynamic val) async {
    sharedPref = await SharedPreferences.getInstance();
    sharedPref!.setString(key, val);
  }

  Future getModel(String key) async {
    sharedPref = await SharedPreferences.getInstance();
    var data = sharedPref!.getString(key)!;
    return jsonDecode(data);
  }

  Future<bool> containData(String key) async {
    sharedPref = await SharedPreferences.getInstance();
    return sharedPref!.containsKey(key);
  }

  removeData(String key) async {
    sharedPref = await SharedPreferences.getInstance();
    await sharedPref!.remove(key);
  }
}
