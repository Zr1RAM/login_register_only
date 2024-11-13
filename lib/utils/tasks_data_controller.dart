import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_register_only/models/task_model.dart';
import 'package:login_register_only/utils/shared_prefs_util.dart';

late Timer _timer;

String tasksToJSON(List<TaskModel> tasks) {
  List<Map<String, dynamic>> jsonList =
      tasks.map((task) => task.toJson()).toList();
  String jsonString = jsonEncode(jsonList);
  return jsonString;
}

void saveTasks(List<TaskModel> tasks) {
  setStringPref("tasksData", tasksToJSON(tasks));
}

Future<List<TaskModel>> loadTasks() async {
  String jsonString = await loadSavedStringPref("tasksData");
  if (jsonString.isNotEmpty) {
    List<dynamic> tasksJson = jsonDecode(jsonString);
    return tasksJson.map((json) => TaskModel.fromJson(json)).toList();
  }
  return [];
}

void run(VoidCallback action, int timerInMilliseconds) {
  if (_timer != null) {
    _timer.cancel();
  }
  _timer = Timer(Duration(milliseconds: timerInMilliseconds), action);
}
