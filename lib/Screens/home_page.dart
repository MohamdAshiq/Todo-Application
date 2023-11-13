import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Hive/db_functions.dart';
import 'package:todo_application/Provider/task_controller.dart';
import 'package:todo_application/Screens/add_task_page.dart';
import 'package:todo_application/Screens/category_page.dart';
import 'package:todo_application/Widgets/custom_appbar.dart';
import 'package:todo_application/Widgets/floating_action_button_widget.dart';
import 'package:todo_application/responsive_layout.dart';

import '../Widgets/expandable_tile_widget.dart';

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
    const List<IconData> categoryIcons = [
      Icons.person,
      CupertinoIcons.book_fill,
      Icons.work,
      CupertinoIcons.heart_fill,
      Icons.more_horiz
    ];
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  child: Text(
                    "Category",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: AddTaskPage.category.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(8.0.h),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CategoryPage(
                              title: AddTaskPage.category[index],
                              index: index,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.r),
                                ),
                                color: const Color.fromARGB(255, 65, 65, 65),
                              ),
                              child: Icon(
                                categoryIcons[index],
                                size: 23,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              AddTaskPage.category[index].toString(),
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  child: Text(
                    "Upcoming Tasks",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                Consumer<TaskController>(
                  builder: (context, value, child) =>
                      value.upcomingTasks.isNotEmpty
                          ? Column(
                              children: List.generate(
                                value.upcomingTasks.length,
                                (index) => ExpandableTileWidget(
                                  index: index,
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 250.h,
                              child: Center(
                                child: Text(
                                  "No Upcoming Tasks",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
