import '../enums/task_status.dart';

class Task<T> { // Используем Generics для метаданных
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  TaskStatus status;
  T? metadata; // Поле с generics

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.status = TaskStatus.pending,
    this.metadata,
  });

  // Метод класса
  void updateStatus(TaskStatus newStatus) {
    status = newStatus;
    print('Статус задачи "$title" изменен на: ${newStatus.displayName}');
  }

  // Еще один метод
  bool isOverdue() {
    final deadline = createdAt.add(const Duration(days: 7));
    return DateTime.now().isAfter(deadline) && status != TaskStatus.completed;
  }

  @override
  String toString() {
    return 'Задача: $title | Статус: ${status.displayName} | ID: $id';
  }
}