import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tasks_app/cubits/reed_task_cubit/reed_tasks_cubit.dart';
import 'package:tasks_app/observer/bloc_observer.dart';
import 'package:tasks_app/views/todoView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = ReedTasksOserver();
  await Hive.initFlutter();
  await Hive.openBox('TasksBox');
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReedTasksCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white),
            ),
            scaffoldBackgroundColor: const Color(0xff2DA98D)),
        home: const TodoViewBody(),
      ),
    );
  }
}
