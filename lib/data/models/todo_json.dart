import 'package:knowunity_flutter/domain/models/todo_item.dart';

class TodoJson {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const TodoJson({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory TodoJson.fromJson(Map<String, dynamic> json) => TodoJson(
        id: json['id'] as int? ?? 0,
        userId: json['userId'] as int? ?? 0,
        title: json['title'] as String? ?? '',
        completed: json['completed'] as bool? ?? false,
      );

  TodoItem toDomain() => TodoItem(
        id: id,
        userId: userId,
        title: title,
        completed: completed,
      );
}
