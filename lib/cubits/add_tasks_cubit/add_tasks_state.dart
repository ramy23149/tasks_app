 class AddTasksState {}

final class AddTasksInitial extends AddTasksState {}

final class AddTasksSuccess extends AddTasksState {
  final String? task;

  AddTasksSuccess(this.task);
}

final class AddTasksLoading extends AddTasksState {}
