import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knowunity_flutter/domain/models/todo_item.dart';

class TodoListInMemoryStore extends Cubit<InMemoryListPresentationModel> {
  TodoListInMemoryStore() : super(InMemoryListPresentationModel._(list: []));

  addTodo(TodoItem item) => emit(state.byUpdatingList(item));

  List<TodoItem> get getList => state.list;
}

class InMemoryListPresentationModel {
  final List<TodoItem> list;

  InMemoryListPresentationModel._({
    required this.list,
  });

  InMemoryListPresentationModel byUpdatingList(TodoItem item) {
    List<TodoItem> temp = <TodoItem>[];
    temp.addAll(list);
    temp.add(item);
    return copyWith(list: temp);
  }

  InMemoryListPresentationModel copyWith({
    List<TodoItem>? list,
  }) =>
      InMemoryListPresentationModel._(
        list: list ?? this.list,
      );
}
