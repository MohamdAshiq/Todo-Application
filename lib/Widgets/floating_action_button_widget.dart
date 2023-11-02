import 'package:flutter/material.dart';
import 'package:todo_application/Screens/add_task_page.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      enableFeedback: false,
      backgroundColor: Colors.grey[900],
      splashColor: Colors.grey[900],
      icon: const Icon(Icons.add),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddTaskPage(),
        ),
      ),
      label: const Text(
        "Add Task",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }
}
