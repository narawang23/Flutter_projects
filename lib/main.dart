import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

  void _login() {
    setState(() {
      if (_passwordController.text == "QWERTY123") {
        imageSource = "images/idea.png"; // Change to light bulb image
      } else {
        imageSource = "images/stop.png"; // Change to stop sign image
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
              SizedBox(height: 20), // Add some space between the fields
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
              SizedBox(height: 20), // Add some space between the fields and button
          ElevatedButton(
            onPressed: _login,
            child: Container(
              // color: Colors.yellow, // Background color for the text
              padding: EdgeInsets.all(8.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24.0, // Adjusts the font size
                    color: Colors.blue, // Adjusts the font color
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