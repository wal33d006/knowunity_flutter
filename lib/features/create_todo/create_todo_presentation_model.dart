import 'package:knowunity_flutter/features/create_todo/create_todo_initial_params.dart';

class CreateTodoPresentationModel {
  final bool isLoading;
  final String title;

  bool get isEnabled => title.isNotEmpty;

  CreateTodoPresentationModel._({
    required this.isLoading,
    required this.title,
  });

  CreateTodoPresentationModel.initial(CreateTodoInitialParams initialParams)
      : isLoading = false,
        title = '';

  CreateTodoPresentationModel copyWith({
    bool? isLoading,
    String? title,
  }) =>
      CreateTodoPresentationModel._(
        isLoading: isLoading ?? this.isLoading,
        title: title ?? this.title,
      );
}
