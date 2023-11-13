import 'package:flutter/material.dart';
import 'package:todo_application/Hive/task_model.dart';

class TaskController extends ChangeNotifier {
  final List<TaskModel> _upcomingTasks = [];
  List<TaskModel> get upcomingTasks => _upcomingTasks;

  void addTask(TaskModel taskModel) {
    _upcomingTasks.add(taskModel);
    notifyListeners();
  }

  void deleteTask(int index) {
    _upcomingTasks.removeAt(index);
    notifyListeners();
  }
}
