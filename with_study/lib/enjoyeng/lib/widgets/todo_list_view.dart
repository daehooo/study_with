// lib/widgets/todo_list_view.dart

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../providers/todo_list.dart';
import '../models/todo.dart';
import '../services/api_service.dart';

// class TodoListView extends StatefulWidget {
//   @override
//   _TodoListViewState createState() => _TodoListViewState();
// }

// class _TodoListViewState extends State<TodoListView> {
//   late Future<List<Todo>> _todosFuture;

//   @override
//   void initState() {
//     super.initState();
//     _todosFuture = _fetchTodos();
//   }

//   Future<List<Todo>> _fetchTodos() async {
//     final todosData = await fetchTodos();
//     final todos = todosData
//         .map<Todo>((json) => Todo.fromJson(json as Map<String, dynamic>))
//         .toList();
//     return todos;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Todo>>(
//       future: _todosFuture,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final todos = snapshot.data!;
//           Provider.of<TodoList>(context, listen: false).setTodos(todos);

//           return ListView.builder(
//             itemCount: todos.length,
//             itemBuilder: (context, index) {
//               return Consumer<TodoList>(
//                 builder: (context, todoList, child) {
//                   final todo = todoList.todos[index];

//                   return ListTile(
//                     title: Text(
//                       todo.todo,
//                       style: TextStyle(
//                         decoration: todo.completed
//                             ? TextDecoration.lineThrough
//                             : TextDecoration.none,
//                       ),
//                     ),
//                     onTap: () {
//                       todoList.toggleCompleted(index);
//                     },
//                   );
//                 },
//               );
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }

//         return Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }

class TodoListView extends StatefulWidget {
  @override
  _TodoListViewState createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  late Future<List<Todo>> _todosFuture;

  @override
  void initState() {
    super.initState();
    _todosFuture = _fetchTodos();
  }

  Future<List<Todo>> _fetchTodos() async {
    final todosData = await fetchTodos();
    final todos = todosData
        .map<Todo>((json) => Todo.fromJson(json as Map<String, dynamic>))
        .toList();
    return todos;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
      future: _todosFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final todos = snapshot.data!;
          Provider.of<TodoList>(context, listen: false).setTodos(todos);

          return Scaffold(
            body: ListView.separated(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Builder(
                  builder: (context) {
                    final todoList = context.watch<TodoList>();
                    final todo = todoList.todos[index];

                    return ListTile(
                      title: Text(
                        todo.todo,
                        style: TextStyle(
                          decoration: todo.completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      onTap: () {
                        todoList.toggleCompleted(index);
                      },
                    );
                  },
                );

                // return Consumer<TodoList>(
                //   builder: (context, todoList, child) {
                //     final todo = todoList.todos[index];

                //     return ListTile(
                //       title: Text(
                //         todo.todo,
                //         style: TextStyle(
                //           decoration: todo.completed
                //               ? TextDecoration.lineThrough
                //               : TextDecoration.none,
                //         ),
                //       ),
                //       onTap: () {
                //         todoList.toggleCompleted(index);
                //       },
                //     );
                //   },
                // );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 1,
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
