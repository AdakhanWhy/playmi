import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playmi/features/cubit/cubit/todo_cubit.dart';
import 'package:playmi/features/pages/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: BlocProvider(create: (context) => TodoCubit(), child: Home()),
    );
  }
}
