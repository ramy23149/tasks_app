import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks_app/cubits/add_tasks_cubit/add_tasks_state.dart';



class AddTaskCubit extends Cubit<AddTasksState> {
  AddTaskCubit() : super(AddTasksInitial());

  void addTask(String? task) async {
    emit(AddTasksLoading());
    var tasksBox = Hive.box('TasksBox');
    await tasksBox.add(task);

    emit(AddTasksSuccess(task));
  }
}
