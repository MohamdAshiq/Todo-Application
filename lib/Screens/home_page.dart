import 'package:flutter/material.dart';
import 'package:todo_application/Widgets/custom_appbar.dart';
import 'package:todo_application/Widgets/floating_action_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButtonWidget(),
    );
  }
}
