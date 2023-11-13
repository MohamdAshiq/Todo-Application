import 'package:hive_flutter/hive_flutter.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  final String taskTitle;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final String time;

  TaskModel({
    required this.taskTitle,
    required this.description,
    required this.category,
    required this.time,
  });
}
