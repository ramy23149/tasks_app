import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/cubits/add_tasks_cubit/add_tasks_cubit.dart';
import 'package:tasks_app/cubits/add_tasks_cubit/add_tasks_state.dart';
import 'package:tasks_app/cubits/reed_task_cubit/reed_tasks_cubit.dart';
import 'package:tasks_app/widgets/Custom_Text_Feild.dart';
import 'package:tasks_app/widgets/custom_buttom.dart';


class AddTaskBottomShet extends StatefulWidget {
  const AddTaskBottomShet({super.key});

  @override
  State<AddTaskBottomShet> createState() => _AddTaskBottomShetState();
}

class _AddTaskBottomShetState extends State<AddTaskBottomShet> {
  late TextEditingController controller;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddTaskCubit(),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    'Add Task',
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  CustomTextField(
                    controller: controller,
                    onSaved: (value) {
                      value = controller.text;
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  BlocBuilder<AddTaskCubit, AddTasksState>(
                    builder: (context, state) {
                      return CostumBottom(
                        onTab: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            BlocProvider.of<AddTaskCubit>(context)
                                .addTask(controller.text);
                                BlocProvider.of<ReedTasksCubit>(context).reedTasks();
                            Navigator.pop(context);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
