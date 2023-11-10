import 'package:flutter/material.dart';
import 'package:todo_application/Screens/add_task_page.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: false,
      backgroundColor: const Color.fromARGB(255, 47, 47, 47),
      splashColor: Colors.grey[900],
      tooltip: "Add Task",
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddTaskPage(),
        ),
      ),
      child: const Icon(Icons.add),
     
    );
  }
}
