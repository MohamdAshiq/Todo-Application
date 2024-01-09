import 'package:flutter/material.dart';
import 'package:todo_application/Hive/db_functions.dart';
import 'package:todo_application/Screens/Home%20Page/Sections/category_section.dart';
import 'package:todo_application/Screens/Home%20Page/Sections/upcoming_tasks_section.dart';
import 'package:todo_application/Widgets/custom_appbar.dart';
import 'package:todo_application/Widgets/floating_action_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    DatabaseFunctions.getTask(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(title: "Todo Application"),
      floatingActionButton: FloatingActionButtonWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategorySection(),
              UpcomingTasksSection(),
            ],
          ),
        ),
      ),
    );
  }
}
