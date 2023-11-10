import 'package:flutter/material.dart';

class TaskController extends ChangeNotifier {
  final List<TaskModel> _upcomingTasks = [];
  List<TaskModel> get upcomingTasks => _upcomingTasks;

  void addTask(TaskModel taskModel) {
    _upcomingTasks.add(taskModel);
    notifyListeners();
  }
}

class TaskModel {
  final String taskTitle;
  final String description;
  final String category;
  final String time;

  TaskModel({
    required this.taskTitle,
    required this.description,
    required this.category,
    required this.time,
  });
}
