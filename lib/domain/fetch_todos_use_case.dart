import 'package:fpdart/fpdart.dart';
import 'package:knowunity_flutter/domain/failures/fetch_todos_failure.dart';
import 'package:knowunity_flutter/domain/models/todo_item.dart';
import 'package:knowunity_flutter/domain/repositories/todos_repository.dart';
import 'package:knowunity_flutter/domain/stores/todo_list_in_memory_store.dart';

class FetchTodosUseCase {
  final TodosRepository _todosRepository;
  final TodoListInMemoryStore _todoListInMemoryStore;

  FetchTodosUseCase(
    this._todosRepository,
    this._todoListInMemoryStore,
  );

  Future<Either<FetchTodosFailure, List<TodoItem>>> execute() => _todosRepository.fetchTodos().then(
        (value) => value.fold(
          (l) => left(l),
          (r) {
            if (_todoListInMemoryStore.getList.isNotEmpty) {
              return right(r..addAll(_todoListInMemoryStore.getList));
            }
            return right(r);
          },
        ),
      );
}
