import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Hive/db_functions.dart';
import 'package:todo_application/Provider/task_controller.dart';

class ExpandableTileWidget extends StatelessWidget {
  const ExpandableTileWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Provider.of(context, listen: false);
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Slidable(
        closeOnScroll: true,
        endActionPane: ActionPane(
            extentRatio: .2,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => DatabaseFunctions.deleteTask(index, context),
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.redAccent,
                icon: Icons.delete,
              ),
            ]),
        child: ExpansionTile(
          collapsedTextColor: Colors.white,
          textColor: Colors.white,
          iconColor: Colors.white,
          collapsedIconColor: Colors.white,
          title: Text(
            controller.upcomingTasks[index].taskTitle,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            controller.upcomingTasks[index].description,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
          leading: CircleAvatar(
            radius: 22,
            backgroundColor:const Color.fromARGB(255, 65, 65, 65),
            foregroundColor: Colors.white,
            child: Text("${index + 1}"),
          ),
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ReusableTextWidget(
                    label: "Title",
                    itemName: controller.upcomingTasks[index].taskTitle,
                  ),
                  ReusableTextWidget(
                    label: "Description",
                    itemName: controller.upcomingTasks[index].description,
                  ),
                  ReusableTextWidget(
                    label: "Category",
                    itemName: controller.upcomingTasks[index].category,
                  ),
                  ReusableTextWidget(
                    label: "Time Added",
                    itemName: controller.upcomingTasks[index].time,
                  ),
                ])
          ],
        ),
      ),
    );
  }
}

class ReusableTextWidget extends StatelessWidget {
  const ReusableTextWidget({
    super.key,
    required this.label,
    required this.itemName,
  });

  final String label;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 5.h,
      ),
      child: Text(
        "$label  :  $itemName",
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
