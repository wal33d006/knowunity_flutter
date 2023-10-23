import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knowunity_flutter/domain/models/todo_item.dart';
import 'package:knowunity_flutter/domain/stores/todo_list_in_memory_store.dart';
import 'package:knowunity_flutter/features/create_todo/create_todo_navigator.dart';
import 'package:knowunity_flutter/features/create_todo/create_todo_presentation_model.dart';

class CreateTodoPresenter extends Cubit<CreateTodoPresentationModel> {
  final CreateTodoNavigator _navigator;
  final TodoListInMemoryStore _todoListInMemoryStore;

  CreateTodoPresenter(
    CreateTodoPresentationModel state,
    this._navigator,
    this._todoListInMemoryStore,
  ) : super(state);

  void onTitleUpdated(String value) => emit(state.copyWith(title: value));

  void onTapAdd() {
    _todoListInMemoryStore.addTodo(
      TodoItem(
        // Dummy values as the placeholder API doesn't support POST calls
        id: 30,
        userId: 300,
        title: state.title,
        completed: false,
      ),
    );
    _navigator.closeWithResult(true);
  }
}
