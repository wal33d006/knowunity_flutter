import 'package:knowunity_flutter/domain/models/todo_item.dart';
import 'package:knowunity_flutter/features/todo_list/todo_list_initial_params.dart';

class TodoListPresentationModel {
  final List<TodoItem> todoList;
  final bool isLoading;

  TodoListPresentationModel._({
    required this.todoList,
    required this.isLoading,
  });

  TodoListPresentationModel.initial(TodoListInitialParams initialParams)
      : todoList = [],
        isLoading = false;

  TodoListPresentationModel copyWith({
    List<TodoItem>? todoList,
    bool? isLoading,
  }) =>
      TodoListPresentationModel._(
        todoList: todoList ?? this.todoList,
        isLoading: isLoading ?? this.isLoading,
      );
}
