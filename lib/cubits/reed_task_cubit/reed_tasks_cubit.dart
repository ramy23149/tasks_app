import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'reed_tasks_state.dart';


class ReedTasksCubit extends Cubit<ReedTasksState> {
  ReedTasksCubit() : super(ReedTasksInitial());
  List<dynamic>? tasks;
  reedTasks() {
    // emit(ReedTasksLoadding());
    var taskBox = Hive.box('TasksBox');
    tasks = taskBox.values.toList();
    emit(ReedTasksSucses());
  }
}
