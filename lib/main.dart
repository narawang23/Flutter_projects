import 'package:flutter/material.dart';

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

  List<String> words = [
    'Item 1',
  ];

  final TextEditingController _inputController = TextEditingController();
//show the ask when delete
  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Item'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  words.removeAt(index);
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Yes'),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Expanded(child: TextField(controller: _inputController,)),
                  ElevatedButton(onPressed: (){
                    if(_inputController.value.text.isNotEmpty) {
                      setState(() {
                        words.add(_inputController.value.text);
                        _inputController.text = "";
                      });
                    }
                  }, child: Text('Add Item'))
                ],
              ),
              Expanded(
                child: words.isEmpty
                    ? Center(child: Text('There are no items in the list'))
                    :ListView.builder(itemCount:words.length,
                    itemBuilder: (context,index){return GestureDetector(
                      onTap:() {
                        setState(() {
                          words.removeAt(index);
                        });
                      },
                      //long press
                      onLongPress: () {
                        _showDeleteDialog(index);
                      },
                      child: Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Row number: $index'),
                            Text(words[index])
                          ],
                        ),
                      ),
                    );}),
              )
            ],
          ),
        ),

       );
    }
}