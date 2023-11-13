import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_application/Hive/db_functions.dart';
import 'package:todo_application/Screens/Home%20Page/Sections/category_section.dart';
import 'package:todo_application/Screens/Home%20Page/Sections/upcoming_tasks_section.dart';
import 'package:todo_application/Widgets/custom_appbar.dart';
import 'package:todo_application/Widgets/floating_action_button_widget.dart';
import 'package:todo_application/responsive_layout.dart';


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
    return ResponsiveLayout(
      desktopScaffold: const Scaffold(),
      tabletScaffold: const Scaffold(),
      mobileScaffold: Scaffold(
        appBar: const CustomAppbar(title: "Todo Application"),
        floatingActionButton: const FloatingActionButtonWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 15.h,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategorySection(),
                UpcomingTasksSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
