import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:knowunity_flutter/data/models/todo_json.dart';
import 'package:knowunity_flutter/domain/failures/fetch_todos_failure.dart';
import 'package:knowunity_flutter/domain/models/todo_item.dart';
import 'package:knowunity_flutter/domain/repositories/todos_repository.dart';
import 'package:http/http.dart' as http;

class RestApiTodosRepository implements TodosRepository {
  @override
  Future<Either<FetchTodosFailure, List<TodoItem>>> fetchTodos() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
      var response = await http.get(url);
      var list = jsonDecode(response.body) as List;
      return right(list.map((e) => TodoJson.fromJson(e).toDomain()).toList());
    } catch (ex) {
      return left(FetchTodosFailure(error: ex.toString()));
    }
  }
}
