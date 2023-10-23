import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:knowunity_flutter/features/todo_list/todo_list_initial_params.dart';
import 'package:knowunity_flutter/features/todo_list/todo_list_presentation_model.dart';
import 'package:knowunity_flutter/features/todo_list/todo_list_presenter.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  late TodoListPresenter presenter;
  late MockTodoListNavigator navigator;
  late MockFetchTodosUseCase mockFetchTodosUseCase;

  test(
    'On init should populate photos in the state',
    () async {
      when(() => mockFetchTodosUseCase.execute()).thenAnswer(
        (_) => Future.value(
          right(
            Mocks.list,
          ),
        ),
      );

      await presenter.onInit();

      expect(presenter.state.todoList.length, Mocks.list.length);

      verify(() => mockFetchTodosUseCase.execute());
    },
  );

  setUp(() {
    registerFallbackValue(const TodoListInitialParams());
    mockFetchTodosUseCase = MockFetchTodosUseCase();

    navigator = MockTodoListNavigator();
    presenter = TodoListPresenter(
      TodoListPresentationModel.initial(const TodoListInitialParams()),
      mockFetchTodosUseCase,
      navigator,
    );
  });
}
