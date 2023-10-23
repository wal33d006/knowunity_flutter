import 'package:knowunity_flutter/domain/fetch_todos_use_case.dart';
import 'package:knowunity_flutter/domain/models/todo_item.dart';
import 'package:knowunity_flutter/features/todo_list/todo_list_navigator.dart';
import 'package:knowunity_flutter/features/todo_list/todo_list_presenter.dart';
import 'package:mocktail/mocktail.dart';

class Mocks {
  static List<TodoItem> list = [
    const TodoItem(
      id: 1,
      userId: 2,
      title: 'title',
      completed: false,
    ),
  ];
}

class MockTodoListNavigator extends Mock implements TodoListNavigator {}

class MockTodoListPresenter extends Mock implements TodoListPresenter {}

class MockFetchTodosUseCase extends Mock implements FetchTodosUseCase {}
