import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_application/Screens/Add%20Task%20Page/add_task_page.dart';
import 'package:todo_application/Screens/Category%20Page/category_page.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    const List<IconData> categoryIcons = [
      Icons.person,
      CupertinoIcons.book_fill,
      Icons.work,
      CupertinoIcons.heart_fill,
      Icons.more_horiz
    ];
    return Column(
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
              padding: EdgeInsets.all(8.h),
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
      ],
    );
  }
}
