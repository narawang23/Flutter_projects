import 'package:flutter/material.dart';
import 'todo_database.dart';
import 'todo_item.dart';
import 'todo_dao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ToDoPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key, required this.title});

  final String title;

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final TextEditingController _todoController = TextEditingController();
  late todo_database database;
  late todo_dao todoDao;
  List<todo_item> _todoItems = [];

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    database = await $Floortodo_database.databaseBuilder('app_database.db').build();
    todoDao = database.todoDao;
    print('Database initialized');
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final todos = await todoDao.findAllTodos();
    setState(() {
      _todoItems = todos;
    });
    print('Todos loaded: $_todoItems');
  }

  Future<void> _addTodoItem() async {
    if (_todoController.text.isNotEmpty) {
      final todo = todo_item(null, _todoController.text); // Do not set the id
      await todoDao.insertItem(todo);
      print('Todo added: $todo');
      _todoController.clear();
      _loadTodos();
    } else {
      print('Text field is empty');
    }
  }

  Future<void> _removeTodoItem(todo_item todo) async {
    await todoDao.deleteItem(todo);
    print('Todo removed: $todo');
    _loadTodos();
  }

  Future<void> _showDeleteDialog(todo_item todo) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Todo Item'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                _removeTodoItem(todo);
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      labelText: 'Enter a todo item',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addTodoItem,
                  child: Text('Add'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: _todoItems.isEmpty
                  ? Center(child: Text('There are no items in the list'))
                  : ListView.builder(
                itemCount: _todoItems.length,
                itemBuilder: (context, index) {
                  final todo = _todoItems[index];
                  return GestureDetector(
                    onLongPress: () => _showDeleteDialog(todo),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Row number: $index'),
                          Text(todo.itemName),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
