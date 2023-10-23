import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knowunity_flutter/features/create_todo/create_todo_presentation_model.dart';
import 'package:knowunity_flutter/features/create_todo/create_todo_presenter.dart';

class CreateTodoPage extends StatelessWidget {
  final CreateTodoPresenter presenter;

  const CreateTodoPage({required this.presenter, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CreateTodoPresenter, CreateTodoPresentationModel>(
            bloc: presenter,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Title',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onChanged: presenter.onTitleUpdated,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.isEnabled ? presenter.onTapAdd : null,
                        child: const Text(
                          'Add Todo',
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
