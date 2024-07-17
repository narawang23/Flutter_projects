import 'package:floor/floor.dart';
import 'todo_item.dart';

@dao
abstract class TodoDao {
  @Query('SELECT * FROM todo_item')
  Future<List<TodoItem>> findAllTodos();

  @insert
  Future<int> insertItem(TodoItem item);

  @delete
  Future<void> deleteItem(TodoItem item);

  @update
  Future<void> updateItem(TodoItem item);
}
