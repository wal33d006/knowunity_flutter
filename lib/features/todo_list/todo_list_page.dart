import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knowunity_flutter/features/todo_list/todo_list_presentation_model.dart';
import 'package:knowunity_flutter/features/todo_list/todo_list_presenter.dart';

class TodoListPage extends StatelessWidget {
  final TodoListPresenter presenter;

  const TodoListPage({
    required this.presenter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListPresenter, TodoListPresentationModel>(
      bloc: presenter,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Knowunity'),
          ),
          body: Center(
            child: state.isLoading
                ? const CircularProgressIndicator()
                : ListView(
                    children: state.todoList
                        .map(
                          (e) => ListTile(
                            title: Text(e.title),
                            leading: CircleAvatar(
                              child: Text(e.id.toString()),
                            ),
                            subtitle: Text('User ID: ${e.userId}'),
                          ),
                        )
                        .toList(),
                  ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: presenter.onTapAdd,
            label: const Text('Add Todo'),
          ),
        );
      },
    );
  }
}
