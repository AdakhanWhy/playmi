import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playmi/features/cubit/cubit/todo_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo App'), backgroundColor: Colors.amber),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: 'Write todo'),
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<TodoCubit>().addNewTodo(_controller.text);
                },
                icon: Icon(Icons.done),
              ),
            ],
          ),
        ),
        BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            if (state is TodoLoadedState) {
              final todos = state.todos;
              return Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final todo = todos[index];
                    return ListTile(
                      leading: Checkbox(
                        value: todo.status,
                        onChanged: (_) {
                          context.read<TodoCubit>().toggleTodoStatus(todo.id);
                        },
                      ),
                      title: Text(todo.todo),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<TodoCubit>().deleteTodo(todo.id);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
