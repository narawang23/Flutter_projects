// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $TodoDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $TodoDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $TodoDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<TodoDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorTodoDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $TodoDatabaseBuilderContract databaseBuilder(String name) =>
      _$TodoDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $TodoDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$TodoDatabaseBuilder(null);
}

class _$TodoDatabaseBuilder implements $TodoDatabaseBuilderContract {
  _$TodoDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $TodoDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $TodoDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<TodoDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$TodoDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$TodoDatabase extends TodoDatabase {
  _$TodoDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TodoDao? _todoDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `todo_item` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `itemName` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TodoDao get todoDao {
    return _todoDaoInstance ??= _$TodoDao(database, changeListener);
  }
}

class _$TodoDao extends TodoDao {
  _$TodoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _todoItemInsertionAdapter = InsertionAdapter(
            database,
            'todo_item',
            (TodoItem item) =>
                <String, Object?>{'id': item.id, 'itemName': item.itemName}),
        _todoItemUpdateAdapter = UpdateAdapter(
            database,
            'todo_item',
            ['id'],
            (TodoItem item) =>
                <String, Object?>{'id': item.id, 'itemName': item.itemName}),
        _todoItemDeletionAdapter = DeletionAdapter(
            database,
            'todo_item',
            ['id'],
            (TodoItem item) =>
                <String, Object?>{'id': item.id, 'itemName': item.itemName});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TodoItem> _todoItemInsertionAdapter;

  final UpdateAdapter<TodoItem> _todoItemUpdateAdapter;

  final DeletionAdapter<TodoItem> _todoItemDeletionAdapter;

  @override
  Future<List<TodoItem>> findAllTodos() async {
    return _queryAdapter.queryList('SELECT * FROM todo_item',
        mapper: (Map<String, Object?> row) =>
            TodoItem(row['id'] as int?, row['itemName'] as String));
  }

  @override
  Future<int> insertItem(TodoItem item) {
    return _todoItemInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateItem(TodoItem item) async {
    await _todoItemUpdateAdapter.update(item, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteItem(TodoItem item) async {
    await _todoItemDeletionAdapter.delete(item);
  }
}
