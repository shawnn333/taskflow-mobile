import 'package:get_it/get_it.dart';
import 'package:taskflow_mobile/data/datasource/task_local_datasource.dart';
import 'package:taskflow_mobile/data/repositories/local_task_repository.dart';
import 'package:taskflow_mobile/domain/repositories/task_repository.dart';
import 'package:taskflow_mobile/domain/usecases/todo/add_task_usecase.dart';
import 'package:taskflow_mobile/domain/usecases/todo/get_all_tasks_usecase.dart';
import 'package:taskflow_mobile/domain/usecases/todo/remove_task_usecase.dart';
import 'package:taskflow_mobile/domain/usecases/todo/toggle_task_completion_usecase.dart';
import 'package:taskflow_mobile/domain/usecases/todo/update_task_usecase.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Data sources
  // NOTE: to swap in Firebase later, register a FirebaseTaskDataSource here
  // instead (and point LocalTaskRepository at it, or add a
  // FirebaseTaskRepository the same way FirebaseTaskRepository.js does on
  // web). Nothing above the data layer needs to change.
  serviceLocator.registerLazySingleton<TaskLocalDataSource>(
    () => TaskLocalDataSourceImpl(),
  );

  // Repositories
  serviceLocator.registerLazySingleton<TaskRepository>(
    () => LocalTaskRepository(serviceLocator<TaskLocalDataSource>()),
  );

  // Use cases
  serviceLocator.registerFactory(
    () => AddTaskUseCase(serviceLocator<TaskRepository>()),
  );
  serviceLocator.registerFactory(
    () => GetAllTasksUseCase(serviceLocator<TaskRepository>()),
  );
  serviceLocator.registerFactory(
    () => UpdateTaskUseCase(serviceLocator<TaskRepository>()),
  );
  serviceLocator.registerFactory(
    () => RemoveTaskUseCase(serviceLocator<TaskRepository>()),
  );
  serviceLocator.registerFactory(
    () => ToggleTaskCompletionUseCase(serviceLocator<TaskRepository>()),
  );
}
