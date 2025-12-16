import 'task.dart';
import '../enums/task_status.dart';
import '../services/task_service.dart';
import '../extensions/task_extension.dart';

class TaskManager {
  List<Task> tasks = [];
  final TaskService _service = TaskService();

  // Асинхронная загрузка задач
  Future<void> loadTasks() async {
    tasks = await _service.fetchTasks();
    print('Загружено задач: ${tasks.length}');
  }

  // Метод с использованием loops
  void displayAllTasks() {
    print('\n=== ВСЕ ЗАДАЧИ ===');

    // Используем цикл for
    for (var i = 0; i < tasks.length; i++) {
      final task = tasks[i];
      print('${i + 1}. $task');
    }

    // Используем цикл for-in
    print('\n=== ДЕТАЛИ ЗАДАЧ ===');
    for (final task in tasks) {
      print('${task.title}:');
      print('  Описание: ${task.description}');
      print('  Создана: ${task.createdAt}');
      print('  Просрочена: ${task.isOverdue()}');
      if (task.metadata != null) {
        print('  Метка: ${task.metadata}');
      }
      print('');
    }
  }

  // Метод с использованием anonymous function
  void processTasks() {
    print('\n=== ОБРАБОТКА ЗАДАЧ ===');

    // Используем анонимную функцию в forEach
    tasks.forEach((task) {
      print('Обработка: ${task.title}');

      // Проверяем, не просрочена ли задача
      if (task.isOverdue() && task.status == TaskStatus.pending) {
        print('⚠️  Задача "${task.title}" просрочена!');
      }
    });

    // Используем where с анонимной функцией
    final pendingTasks = tasks.where((task) => task.status == TaskStatus.pending);
    print('\nОжидающих задач: ${pendingTasks.length}');

    // Используем map с анонимной функцией
    final taskTitles = tasks.map((task) => task.title).toList();
    print('Названия задач: $taskTitles');
  }

  // Метод с использованием extension
  void analyzeTasks() {
    print('\n=== АНАЛИЗ ЗАДАЧ ===');

    // Используем методы из extension
    final pendingTasks = tasks.filterByStatus(TaskStatus.pending);
    final completedTasks = tasks.filterByStatus(TaskStatus.completed);

    print('Ожидающих задач: ${pendingTasks.length}');
    print('Завершенных задач: ${completedTasks.length}');

    // Используем другой метод из extension
    print('Всего в процессе: ${tasks.countByStatus(TaskStatus.inProgress)}');

    // Поиск по ID через extension
    final task = tasks.findById('1');
    if (task != null) {
      print('\nНайдена задача по ID "1": ${task.title}');
    }
  }

  // Асинхронный метод для выполнения задачи
  Future<void> completeFirstTask() async {
    if (tasks.isNotEmpty) {
      await _service.completeTask(tasks.first);
    }
  }
}