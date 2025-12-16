import '../models/task.dart';
import '../enums/task_status.dart';

extension TaskListExtensions on List<Task> {
  // Метод расширения для фильтрации задач по статусу
  List<Task> filterByStatus(TaskStatus status) {
    return where((task) => task.status == status).toList();
  }

  // Метод для подсчета задач по статусу
  int countByStatus(TaskStatus status) {
    return where((task) => task.status == status).length;
  }

  // Метод для поиска задачи по ID
  Task? findById(String id) {
    for (final task in this) {
      if (task.id == id) {
        return task;
      }
    }
    return null;
  }
}