import 'package:flutter/material.dart';
import 'package:todo_application/Widgets/custom_appbar.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Add Task")
    );
  }
}