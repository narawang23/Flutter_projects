// lib/todo_dao.dart
import 'package:floor/floor.dart';
import 'todo.dart';

@dao
abstract class ToDoDao {
  @Query('SELECT * FROM ToDo')
  Future<List<ToDo>> findAllToDos();

  @insert
  Future<void> insertToDo(ToDo todo);

  @delete
  Future<void> deleteToDo(ToDo todo);
}
