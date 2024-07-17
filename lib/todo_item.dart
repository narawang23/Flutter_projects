import 'package:floor/floor.dart';

@Entity(tableName: 'todo_item')
class TodoItem {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String itemName;

  TodoItem(this.id, this.itemName);
}
