import 'package:floor/floor.dart';
import 'todo_dao.dart';
import 'todo_item.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'todo_database.g.dart';

@Database(version: 1, entities: [TodoItem])
abstract class TodoDatabase extends FloorDatabase {
  TodoDao get todoDao;
}
