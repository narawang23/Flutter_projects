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
      debugShowCheckedModeBanner: false,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          // AppBar(
          //   // TRY THIS: Try changing the color here to a specific color (to
          //   // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          //   // change color while the other colors stay the same.
          //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          //   // Here we take the value from the MyHomePage object that was created by
          //   // the App.build method, and use it to set our appbar title.
          //   title: Text(widget.title),
          // ),
          AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Welcome"),
        // actions: [
        //   OutlinedButton(onPressed: () { }, child:Text("Button 1")),
        //   OutlinedButton(onPressed: (){ }, child: Text("Button 2"))]
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
          child: Text("Hi there"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BROWSE CATEGORIES',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Not sure about exactly which recipe you're looking for? Do a search, or dive into our most popular categories.",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center, // This aligns the text to the center
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BY MEAT',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/beef.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'BEEF',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/chicken.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'CHICKEN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/pork.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'PORK',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/seafood.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'SEAFOOD',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BY COURSE',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Add space between the title and the images
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/main_dishes.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Add space between the image and the text
                      Text(
                        'MAIN DISHES',
                        style: TextStyle(
                          color: Colors.black87,
                          // fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/salad.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Add space between the image and the text
                      Text(
                        'SALAD',
                        style: TextStyle(
                          color: Colors.black87,
                          // fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/side_dishes.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Add space between the image and the text
                      Text(
                        'SIDE DISHES',
                        style: TextStyle(
                          color: Colors.black87,
                          // fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/crock_pot.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Add space between the image and the text
                      Text(
                        'CROCK POT',
                        style: TextStyle(
                          color: Colors.black87,
                          // fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BY DESSERT',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Add space between the title and the images
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/ice_cream.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Add space between the image and the text
                      Text(
                        'Ice Cream',
                        style: TextStyle(
                          color: Colors.black87,
                          // fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/brownies.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Add space between the image and the text
                      Text(
                        'Brownies',
                        style: TextStyle(
                          color: Colors.black87,
                          // fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/pies.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Add space between the image and the text
                      Text(
                        'Pies',
                        style: TextStyle(
                          color: Colors.black87,
                          // fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/cookies.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Add space between the image and the text
                      Text(
                        'Cookies',
                        style: TextStyle(
                          color: Colors.black87,
                          // fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Add space at the bottom of the webpage
            ],
          )
        ],
      ),
    );
  }
}

// bottomNavigationBar: BottomNavigationBar(
// items:[
// BottomNavigationBarItem( icon: Icon(Icons.accessibility), label: 'Help'),
// BottomNavigationBarItem( icon: Icon(Icons.add_call), label: 'Phone'),
// ],
// onTap:(btnIndex){  }, )
