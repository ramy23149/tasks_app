import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks_app/cubits/reed_task_cubit/reed_tasks_cubit.dart';
import 'package:tasks_app/widgets/task_item.dart';

import '../cubits/reed_task_cubit/reed_tasks_state.dart';

class TasksListView extends StatefulWidget {
  const TasksListView({super.key});

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
final  ScrollController controller =ScrollController();
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  } 


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReedTasksCubit, ReedTasksState>(
      builder: (context, state) {
        List tasks = BlocProvider.of<ReedTasksCubit>(context).tasks!;

         WidgetsBinding.instance!.addPostFrameCallback((_) {
          controller.animateTo(
            controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });

        return ListView.builder(
          controller: controller,
            physics: const BouncingScrollPhysics(),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskItem(
                btnOkOnPress: () async {
                  final myBox = Hive.box('TasksBox');
                  await myBox.deleteAt(index);
                  // ignore: use_build_context_synchronously
                  BlocProvider.of<ReedTasksCubit>(context).reedTasks();
                },
                task: tasks[index],
              );
            });
      },
    );
  }
}
