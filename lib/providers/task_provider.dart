import 'package:flutter/material.dart';
import 'package:login_register_only/models/task_model.dart';
import 'package:login_register_only/utils/tasks_data_controller.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];

  TaskProvider({
    List<TaskModel>? tasks,
  }) {
    initializeTasks();
  }
  // [
  //   // TaskModel(taskTitle: 'task1'),
  //   // TaskModel(taskTitle: 'task2', isCompleted: true),
  //   // TaskModel(taskTitle: 'task3', isCompleted: true),
  //   // TaskModel(taskTitle: 'task4'),
  //   // TaskModel(taskTitle: 'task5'),
  //   // TaskModel(taskTitle: 'task6', isCompleted: true),
  //   // TaskModel(taskTitle: 'task7'),
  //   // TaskModel(taskTitle: 'task8', isCompleted: true),
  // ];

  void initializeTasks() async {
    tasks = await loadTasks();
    notifyListeners();
  }

  void addTask({required TaskModel task}) async {
    tasks.add(task);
    saveTasks(tasks);
    notifyListeners();
  }

  void addBackTask({required int index, required TaskModel task}) async {
    tasks.insert(index, task);
    saveTasks(tasks);
    notifyListeners();
  }

  void updateTask({
    required TaskModel task,
    required int index,
  }) async {
    tasks[index] = task;
    saveTasks(tasks);
    notifyListeners();
  }

  void deleteTask({required int index}) async {
    tasks.removeAt(index);
    saveTasks(tasks);
    notifyListeners();
  }
}
