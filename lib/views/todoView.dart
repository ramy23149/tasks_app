import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks_app/cubits/reed_task_cubit/reed_tasks_cubit.dart';
import 'package:tasks_app/cubits/reed_task_cubit/reed_tasks_state.dart';
import 'package:tasks_app/widgets/Tasks_container.dart';
import 'package:tasks_app/widgets/custom_FAB.dart';
import 'package:tasks_app/widgets/custom_appbar.dart';

class TodoViewBody extends StatefulWidget {
  const TodoViewBody({super.key});

  @override
  State<TodoViewBody> createState() => _TodoViewBodyState();
}

class _TodoViewBodyState extends State<TodoViewBody> {
  int taskCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ReedTasksCubit>(context).reedTasks();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppbar(),
              const SizedBox(
                height: 23,
              ),
              BlocBuilder<ReedTasksCubit, ReedTasksState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${taskCount = BlocProvider.of<ReedTasksCubit>(context).tasks!.length} Tasks',
                        style: const TextStyle(fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () {
                            Hive.box('TasksBox').clear().then(
                                  (value) =>
                                      BlocProvider.of<ReedTasksCubit>(context)
                                          .reedTasks(),
                                );
                          },
                          child: const Text(
                            'مسح الكل',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 23,
              ),
              const Expanded(
                flex: 30,
                child: TasksContaner(),
              ),
              const CustomFAB(),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
