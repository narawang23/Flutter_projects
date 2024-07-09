// lib/database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'todo_dao.dart';
import 'todo.dart';

part "database.g.dart"; // the generated code will be there

@Database(version: 1, entities: [ToDo])
abstract class AppDatabase extends FloorDatabase {
  ToDoDao get todoDao;
}
