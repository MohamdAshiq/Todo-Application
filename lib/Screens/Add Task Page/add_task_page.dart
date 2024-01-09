import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_application/Hive/db_functions.dart';
import 'package:todo_application/Hive/task_model.dart';
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
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
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
                  decoration: const InputDecoration(
                    label: Text("Title"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: descriptioncontroller,
                  validator: (value) => value == null || value.isEmpty
                      ? "Please fill this"
                      : null,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    label: Text("Description"),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: DropdownButtonFormField(
                    validator: (value) => value == null || value.isEmpty
                        ? "Please select a category"
                        : null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
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
                const SizedBox(height: 10),
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
                    fixedSize: const Size(120, 45),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 13.5,
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
      const SnackBar(
        backgroundColor: Color.fromARGB(255, 41, 41, 41),
        content: Text(
          "Item Added Succesfully..!!",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
