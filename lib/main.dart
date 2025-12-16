import 'models/task_manager.dart';

void main() async {
  print('🚀 Запуск менеджера задач...\n');

  // Создаем экземпляр менеджера задач
  final taskManager = TaskManager();

  try {
    // Используем Future для асинхронной загрузки
    await taskManager.loadTasks();

    // Используем различные методы
    taskManager.displayAllTasks();
    taskManager.processTasks();
    taskManager.analyzeTasks();

    // Используем еще один Future
    print('\n=== ВЫПОЛНЕНИЕ ЗАДАЧИ ===');
    await taskManager.completeFirstTask();

    // Показываем обновленный статус
    print('\n=== ОБНОВЛЕННЫЙ СПИСОК ===');
    taskManager.displayAllTasks();

  } catch (error) {
    print('❌ Произошла ошибка: $error');
  }

  print('\n✅ Программа завершена!');
}