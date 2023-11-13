import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Provider/task_controller.dart';
import 'package:todo_application/Widgets/custom_appbar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.title, required this.index});

  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: title),
      body: Consumer<TaskController>(
        builder: (context, value, child) {
          final filteredTasks = value.upcomingTasks
              .where((task) => task.category == title)
              .toList();

          if (filteredTasks.isNotEmpty) {
            return ListView.builder(
              itemCount: value.upcomingTasks
                  .where((task) => task.category == title)
                  .length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 65, 65, 65),
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                    title: Text(
                      filteredTasks[index].taskTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                    subtitle: Text(
                      filteredTasks[index].description,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                "No items in this category",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
