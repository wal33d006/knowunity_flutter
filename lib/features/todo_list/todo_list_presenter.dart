import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knowunity_flutter/domain/fetch_todos_use_case.dart';
import 'package:knowunity_flutter/features/create_todo/create_todo_initial_params.dart';
import 'package:knowunity_flutter/features/todo_list/todo_list_navigator.dart';
import 'package:knowunity_flutter/features/todo_list/todo_list_presentation_model.dart';

class TodoListPresenter extends Cubit<TodoListPresentationModel> {
  final FetchTodosUseCase _fetchTodosUseCase;
  final TodoListNavigator _navigator;

  TodoListPresenter(
    TodoListPresentationModel state,
    this._fetchTodosUseCase,
    this._navigator,
  ) : super(state);

  onInit() async {
    emit(state.copyWith(isLoading: true));
    await _fetchTodosUseCase.execute().then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(isLoading: false));
              _navigator.showError(l.error);
            },
            (r) => emit(state.copyWith(todoList: r, isLoading: false)),
          ),
        );
  }

  void onTapAdd() async {
    bool? todoCreated = await _navigator.openCreateTodo(const CreateTodoInitialParams());
    if (todoCreated ?? false) {
      onInit();
    }
  }
}
