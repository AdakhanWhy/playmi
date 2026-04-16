class TodoModel {
  final String id;
  final String todo;
  final bool status;

  TodoModel({required this.id, required this.todo, required this.status});

  TodoModel copyWith({String? id, String? todo, bool? status}) {
    return TodoModel(
      id: id ?? this.id,
      todo: todo ?? this.todo,
      status: status ?? this.status,
    );
  }
}
