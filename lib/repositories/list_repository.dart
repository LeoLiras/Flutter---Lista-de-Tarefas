import 'dart:convert';

import 'package:mylist/Models/tasks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {

  late SharedPreferences sharedPreferences;

  void saveList(List<Task> tasks){
    final String save_string = jsonEncode(tasks);
    sharedPreferences.setString('list', save_string);
  }

  Future<List<Task>> getList() async{
    sharedPreferences = await SharedPreferences.getInstance();
    final load_string = sharedPreferences.getString('list') ?? '[]';
    final List list_decoded = jsonDecode(load_string) as List;
    return list_decoded.map((e) => Task.fromJson(e)).toList();
  }

}
