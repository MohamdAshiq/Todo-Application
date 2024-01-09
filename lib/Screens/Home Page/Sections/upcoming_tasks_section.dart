import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Provider/task_controller.dart';
import 'package:todo_application/Widgets/expandable_tile_widget.dart';

class UpcomingTasksSection extends StatelessWidget {
  const UpcomingTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Text(
            "Upcoming Tasks",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        Consumer<TaskController>(
          builder: (context, value, child) => value.upcomingTasks.isNotEmpty
              ? Column(
                  children: List.generate(
                    value.upcomingTasks.length,
                    (index) => ExpandableTileWidget(
                      index: index,
                    ),
                  ),
                )
              : const SizedBox(
                  height: 250,
                  child: Center(
                    child: Text(
                      "No Upcoming Tasks",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
