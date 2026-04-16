part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoLoadedState extends TodoState {
  final List<TodoModel> todos;
  TodoLoadedState({required this.todos});
}
