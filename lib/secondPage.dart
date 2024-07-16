import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'database.dart';
import 'todo_dao.dart';
import 'todo_item.dart';

class SecondPage extends StatefulWidget {
  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _taskController = TextEditingController();

  late EncryptedSharedPreferences savedData;
  late AppDatabase database;
  late ToDoDao toDoDao;
  List<ToDoItem> _toDoItems = [];

  @override
  void initState() {
    super.initState();
    savedData = EncryptedSharedPreferences();
    _initDatabase();
    _loadSavedData();
  }

  Future<void> _initDatabase() async {
    database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    toDoDao = database.todoDao;
    _loadToDos();
  }

  void _loadSavedData() async {
    String? savedFirstName = await savedData.getString("firstName");
    String? savedLastName = await savedData.getString("lastName");
    String? savedPhoneNumber = await savedData.getString("phoneNumber");
    String? savedEmail = await savedData.getString("email");

    setState(() {
      if (savedFirstName != null && savedFirstName.isNotEmpty) {
        _firstNameController.text = savedFirstName;
      }
      if (savedLastName != null && savedLastName.isNotEmpty) {
        _lastNameController.text = savedLastName;
      }
      if (savedPhoneNumber != null && savedPhoneNumber.isNotEmpty) {
        _phoneNumberController.text = savedPhoneNumber;
      }
      if (savedEmail != null && savedEmail.isNotEmpty) {
        _emailController.text = savedEmail;
      }
    });
  }

  void _loadToDos() async {
    final todos = await toDoDao.findAllToDoItems();
    setState(() {
      _toDoItems = todos;
    });
  }

  void _addToDo() async {
    if (_taskController.text.isEmpty) return;
    final newToDo = ToDoItem(task: _taskController.text);
    await toDoDao.insertToDoItem(newToDo);
    _taskController.clear();
    _loadToDos(); // Refresh the list after insertion
  }

  void _deleteToDoItem(ToDoItem todo) async {
    await toDoDao.deleteToDoItem(todo);
    _loadToDos(); // Refresh the list after deletion
  }

  void saveData() async {
    await savedData.setString("firstName", _firstNameController.text);
    await savedData.setString("lastName", _lastNameController.text);
    await savedData.setString("phoneNumber", _phoneNumberController.text);
    await savedData.setString("email", _emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Welcome to Second Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _makePhoneCall(_phoneNumberController.text);
                  },
                  child: Icon(Icons.phone),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _sendSms(_phoneNumberController.text);
                  },
                  child: Icon(Icons.message),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _sendEmail(_emailController.text);
                  },
                  child: Icon(Icons.email),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'New Task',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addToDo,
              child: Text('Add Task'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _toDoItems.length,
                itemBuilder: (context, index) {
                  final todo = _toDoItems[index];
                  return ListTile(
                    title: Text(todo.task),
                    onLongPress: () => _deleteToDoItem(todo),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: saveData,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to initiate a phone call
  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  // Function to send an SMS
  void _sendSms(String phoneNumber) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      throw 'Could not launch $smsUri';
    }
  }

  // Function to send an email
  void _sendEmail(String emailAddress) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }
}
