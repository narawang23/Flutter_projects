library database;

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import 'todo_dao.dart';
import 'todo_item.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [ToDoItem])
abstract class AppDatabase extends FloorDatabase {
  ToDoDao get todoDao;
}