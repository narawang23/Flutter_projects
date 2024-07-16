

import 'package:floor/floor.dart';
import 'todo_item.dart';

@dao// Floor to generate the bodies
abstract class todo_dao {// NO function bodies

  @Query('SELECT * FROM ToDoItem')
  Future<List<todo_item>>  findAllTodos();

  @insert // make it an insert function to generate
  Future<int> insertItem(todo_item todo);

  @delete  // generate the deletion statement in code
  Future<void> deleteItem(todo_item todo);

  // @query ('sql query')

  @update
  Future<void> updateItem(todo_item item);


}
