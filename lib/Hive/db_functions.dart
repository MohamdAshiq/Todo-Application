import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Hive/task_model.dart';
import 'package:todo_application/Provider/task_controller.dart';

class DatabaseFunctions {
  static Future<void> addTask(TaskModel taskModel, BuildContext context) async {
    final TaskController controller = Provider.of(context, listen: false);
    final db = await Hive.openBox<TaskModel>('tasks');
    await db.add(taskModel);
    controller.addTask(taskModel);
  }

  static Future<void> getTask(BuildContext context) async {
    final TaskController controller = Provider.of(context, listen: false);
    final db = await Hive.openBox<TaskModel>('tasks');
    controller.upcomingTasks.clear();
    controller.upcomingTasks.addAll(db.values.toList());
    controller.notifyListeners();
  }

  static Future<void> deleteTask(int index, context) async {
    final TaskController controller = Provider.of(context, listen: false);
    final db = await Hive.openBox<TaskModel>('tasks');
    db.deleteAt(index);
    controller.deleteTask(index);
  }
}
