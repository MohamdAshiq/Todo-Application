import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Hive/db_functions.dart';
import 'package:todo_application/Hive/task_model.dart';
import 'package:todo_application/Provider/task_controller.dart';
import 'package:todo_application/Widgets/custom_appbar.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  static const List<String> category = [
    "Personal",
    "Study",
    "Homework",
    "Health",
    "Other "
  ];

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController titlecontroller = TextEditingController();

  final TextEditingController descriptioncontroller = TextEditingController();
  String? selectedCategory;

  @override
  void dispose() {
    titlecontroller.dispose();
    descriptioncontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "Add Task"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 20.h,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: titlecontroller,
                  validator: (value) => value == null || value.isEmpty
                      ? "Please fill this"
                      : null,
                  decoration: InputDecoration(
                    label: const Text("Title"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: descriptioncontroller,
                  validator: (value) => value == null || value.isEmpty
                      ? "Please fill this"
                      : null,
                  maxLines: 3,
                  decoration: InputDecoration(
                    label: const Text("Description"),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  child: DropdownButtonFormField(
                    validator: (value) => value == null || value.isEmpty
                        ? "Please select a category"
                        : null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                    ),
                    hint: const Text("Select Category"),
                    items: AddTaskPage.category
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value.toString();
                      });
                    },
                    value: selectedCategory,
                  ),
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      DatabaseFunctions.addTask(
                          TaskModel(
                            taskTitle: titlecontroller.text,
                            description: descriptioncontroller.text,
                            category: selectedCategory.toString(),
                            time: DateFormat('hh:mm a dd/MM/yyyy').format(
                              DateTime.now(),
                            ),
                          ),
                          context);

                      showsnackbar();
                      titlecontroller.clear();
                      descriptioncontroller.clear();
                      setState(() {
                        selectedCategory = null;
                      });
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(120.w, 45.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.w500,
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

  void showsnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 41, 41, 41),
        content: Text(
          "Item Added Succesfully..!!",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ),
      ),
    );
  }
}
