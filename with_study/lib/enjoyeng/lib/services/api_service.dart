
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchTodos() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/todos'));

  if (response.statusCode == 200) {
    return json.decode(response.body)['todos'];
  } else {
    throw Exception('Failed to load todos');
  }
}