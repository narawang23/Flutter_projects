// lib/todo.dart
import 'package:floor/floor.dart';

@entity
class ToDo {
  @primaryKey
  final int id;
  final String title;

  ToDo(this.id, this.title);
}
