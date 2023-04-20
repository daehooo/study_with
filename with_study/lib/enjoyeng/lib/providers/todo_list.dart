// lib/providers/todo_list.dart

import 'package:flutter/foundation.dart';
import '../models/todo.dart';

class TodoList extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void setTodos(List<Todo> todos) {
    _todos = todos;
    notifyListeners();
  }

  void toggleCompleted(int index) {
    _todos[index].completed = !_todos[index].completed;
    notifyListeners();
  }
}