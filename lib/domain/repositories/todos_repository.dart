import 'package:fpdart/fpdart.dart';
import 'package:knowunity_flutter/domain/failures/fetch_todos_failure.dart';
import 'package:knowunity_flutter/domain/models/todo_item.dart';

abstract class TodosRepository {
  Future<Either<FetchTodosFailure, List<TodoItem>>> fetchTodos();
}
