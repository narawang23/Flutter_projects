import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String imageSource = "images/question-mark.png";
  bool _credentialsLoaded = false;

  Future<void> _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    await prefs.setString('password', _passwordController.text);
  }

  Future<void> _clearCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');
    _usernameController.clear();
    _passwordController.clear();
    setState(() {
      _credentialsLoaded = false;
    });
  }

  Future<void> _showSaveDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Save Credentials?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Would you like to save your username and password for next time?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                _saveCredentials();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                _clearCredentials();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _login() {
    setState(() {
      if (_passwordController.text == "QWERTY123") {
        imageSource = "images/idea.png";
      } else {
        imageSource = "images/stop.png";
      }
    });
    _showSaveDialog();
  }

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  Future<void> _loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? password = prefs.getString('password');

    if (username != null && password != null) {
      _usernameController.text = username;
      _passwordController.text = password;
      _credentialsLoaded = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Previous credentials loaded.'),
          action: SnackBarAction(
            label: 'Clear Saved Data',
            onPressed: _clearCredentials,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(),
                labelText: "Login",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Image.asset(
              imageSource,
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}