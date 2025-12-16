import '../models/task.dart';
import '../enums/task_status.dart';
import 'dart:async';

class TaskService {
  // Асинхронный метод с Future
  Future<List<Task<dynamic>>> fetchTasks() async { // Используем dynamic для generics
    print('Начало загрузки задач...');

    // Имитируем задержку сети
    await Future.delayed(const Duration(seconds: 2));

    // Используем List<> с generics - теперь все типы совместимы
    final List<Task<dynamic>> tasks = [
      Task<String>(
        id: '1',
        title: 'Изучить Dart',
        description: 'Изучить основы языка Dart',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        status: TaskStatus.inProgress,
        metadata: 'важно',
      ),
      Task<String>(
        id: '2',
        title: 'Написать приложение',
        description: 'Создать To-Do приложение',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        status: TaskStatus.pending,
        metadata: 'срочно',
      ),
      Task<int>(
        id: '3',
        title: 'Купить продукты',
        description: 'Молоко, хлеб, яйца',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        status: TaskStatus.completed,
        metadata: 1,
      ),
      Task<double>(
        id: '4',
        title: 'Заплатить за интернет',
        description: 'Оплатить счет за интернет',
        createdAt: DateTime.now().subtract(const Duration(days: 8)),
        status: TaskStatus.pending,
        metadata: 999.99,
      ),
    ];

    print('Загрузка задач завершена!');
    return tasks;
  }

  // Еще один асинхронный метод
  Future<void> completeTask(Task task) async {
    await Future.delayed(const Duration(seconds: 1));
    task.updateStatus(TaskStatus.completed);
    print('Задача "${task.title}" выполнена!');
  }
}