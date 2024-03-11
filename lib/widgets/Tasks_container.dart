import 'package:flutter/material.dart';
import 'package:tasks_app/widgets/tasks_List_view.dart';

class TasksContaner extends StatelessWidget {
  const TasksContaner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white
      ),
      child: const TasksListView(),
    );
  }
}


