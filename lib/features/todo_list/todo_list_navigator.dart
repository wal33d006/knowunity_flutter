import 'package:knowunity_flutter/features/create_todo/create_todo_navigator.dart';
import 'package:knowunity_flutter/navigation/app_navigator.dart';
import 'package:knowunity_flutter/navigation/close_route.dart';
import 'package:knowunity_flutter/navigation/error_dialog_route.dart';

class TodoListNavigator with CloseRoute, ErrorDialogRoute, CreateTodoRoute {
  const TodoListNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}
