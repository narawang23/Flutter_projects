
// required packages imports
import 'package:floor/floor.dart';
import 'todo_dao.dart';
import 'dart:async';
import 'todo_item.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'todo_database.g.dart';

@Database(version: 1, entities: [todo_item])
abstract class todo_database extends FloorDatabase{

  todo_dao get todoDao;
}