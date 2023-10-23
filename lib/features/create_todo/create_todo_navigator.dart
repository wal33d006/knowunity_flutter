import 'package:knowunity_flutter/features/create_todo/create_todo_initial_params.dart';
import 'package:knowunity_flutter/features/create_todo/create_todo_page.dart';
import 'package:knowunity_flutter/main.dart';
import 'package:knowunity_flutter/navigation/app_navigator.dart';
import 'package:knowunity_flutter/navigation/close_route.dart';
import 'package:knowunity_flutter/navigation/close_with_result_route.dart';
import 'package:knowunity_flutter/navigation/error_dialog_route.dart';

class CreateTodoNavigator with CloseRoute, ErrorDialogRoute, CloseWithResultRoute {
  const CreateTodoNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}

mixin CreateTodoRoute {
  Future<bool?> openCreateTodo(CreateTodoInitialParams initialParams) =>
      appNavigator.push(getIt<CreateTodoPage>(param1: initialParams));

  AppNavigator get appNavigator;
}
