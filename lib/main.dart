import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';

import 'secondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // list all pages
      routes:{
        //keys:     //values
        '/pageOne'  :  (context) => MyHomePage(title: "Flutter Demo Home Page"),
        '/pageTwo'  :  (context) {
          return SecondPage();
        }
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/pageOne',
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class DataRepository{
  static String loginName="";
  static String password="";
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _counter = 0.0;
  var myFontSize = 25.0;
  // var isChecked = false;

  late TextEditingController _loginController;
  late TextEditingController _passwordController;
  late EncryptedSharedPreferences savedData;

  @override
  void initState() {
    super.initState();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    savedData = EncryptedSharedPreferences();
    _loadSavedData();

  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _loadSavedData() async {
    String? savedLogin = await savedData.getString("login");
    String? savedPassword = await savedData.getString("password");

    if (savedLogin != null && savedLogin.isNotEmpty && savedPassword != null && savedPassword.isNotEmpty) {

      setState(() {
        _loginController.text = savedLogin;
        _passwordController.text = savedPassword;
      });
    }
  }


  void _validateAndLogin()  async{
    String? savedLogin = await savedData.getString("login");
    String? savedPassword = await savedData.getString("password");
    if (_loginController.text == savedLogin &&
        _passwordController.text == savedPassword ) {
      Navigator.pushNamed(context, '/pageTwo').then((_) {
        final snackBar = SnackBar(
          content: Text('Welcome Back, ${_loginController.text}'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
    else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: const Text(
                  'Would you like to save the username and password?'),
              actions: <Widget>[
                FilledButton(
                  onPressed: () {
                    var userTyped = _loginController.value.text;
                    var passwordTyped = _passwordController.value.text;
                    savedData.setString("login", userTyped);
                    savedData.setString("password", passwordTyped);
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
                FilledButton(
                  onPressed: () {
                    savedData.setString("login", "");
                    savedData.setString("password", "");
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ],
            ),
      );
    }
  }


  void buttonClicked() {
    if (_loginController.text.isNotEmpty && _passwordController.text.isNotEmpty)
    { _validateAndLogin();
      // Navigator.pushNamed(context, '/pageTwo');
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: const Text(
                  'Would you like to save the username and password?'),
              actions: <Widget>[
                FilledButton(
                  onPressed: () {
                    var userTyped = _loginController.value.text;
                    var passwordTyped = _passwordController.value.text;
                    savedData.setString("login", userTyped);
                    savedData.setString("password", passwordTyped);
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
                FilledButton(
                  onPressed: () {
                    savedData.setString("login", "");
                    savedData.setString("password", "");
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ],
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
            Text(
              '',
              style: TextStyle(fontSize: myFontSize, color: Colors.deepPurple),
            ),
            Flexible(
              child: TextField(
                controller: _loginController,
                decoration: const InputDecoration(
                  hintText: "Login",
                  border: OutlineInputBorder(),
                  labelText: "Login",
                ),
              ),
            ),
            Flexible(
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: buttonClicked,
              child: Text(
                "Login",
                style: TextStyle(fontSize: myFontSize),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
