import 'package:equatable/equatable.dart';

class TodoItem extends Equatable {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const TodoItem({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory TodoItem.empty() => const TodoItem(
        id: 0,
        userId: 0,
        title: '',
        completed: false,
      );

  TodoItem copyWith({
    int? id,
    int? userId,
    String? title,
    bool? completed,
  }) =>
      TodoItem(
        id: id ?? this.id,
        title: title ?? this.title,
        userId: userId ?? this.userId,
        completed: completed ?? this.completed,
      );

  @override
  List<Object?> get props => [
        id,
        userId,
        title,
        completed,
      ];
}
