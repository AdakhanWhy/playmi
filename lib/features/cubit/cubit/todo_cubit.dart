import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:playmi/features/models/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit()
    : super(
        TodoLoadedState(
          todos: [TodoModel(id: '1', todo: 'do something', status: true)],
        ),
      );

  List<TodoModel> get _todos {
    final currentState = state;
    if (currentState is TodoLoadedState) {
      return currentState.todos;
    }
    return <TodoModel>[];
  }

  void addNewTodo(String todo) {
    final TodoModel newTodo = TodoModel(
      id: DateTime.now().toString(),
      todo: todo,
      status: false,
    );
    emit(TodoLoadedState(todos: [newTodo, ..._todos]));
  }

  void toggleTodoStatus(String id) {
    final List<TodoModel> updated = _todos
        .map(
          (todo) => todo.id == id ? todo.copyWith(status: !todo.status) : todo,
        )
        .toList();
    emit(TodoLoadedState(todos: updated));
  }

  void deleteTodo(String id) {
    final List<TodoModel> filteredTodos = _todos
        .where((todo) => todo.id != id)
        .toList();
    emit(TodoLoadedState(todos: filteredTodos));
  }
}
