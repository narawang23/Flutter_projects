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
      AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Welcome"),
          // actions: [
          //   OutlinedButton(onPressed: () { }, child:Text("Button 1")),
          //   OutlinedButton(onPressed: (){ }, child: Text("Button 2"))]

      ),

      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.symmetric(vertical:40.0,horizontal: 10.0),
          child: Text("Hi there"),
        ),
      ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(
                      'BROWSE CATEGORIES',
                      style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              ],
              ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child:
                        Text(
                          "Not sure about exactly which recipe you're looking for? Do a search, or dive into our most popular categories." ,
                          style: TextStyle(fontSize: 18),
                      ),
                  // ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(
                      'BY MEAT',
                      style: TextStyle(fontSize: 24, color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: <Widget> [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset('images/beef.jpg', width:150, height:100),
                            Text('BEEF',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                        children: <Widget> [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('images/chicken.jpg', width:150, height:100),
                              Text('CHICKEN',
                                style:TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),

                    Column(
                        children: <Widget> [
                          Stack(
                            alignment: Alignment.center,
                            children:<Widget>[
                              // ClipRect(
                              //   child: Align(
                              //     alignment: Alignment.center,
                              //     heightFactor: 1.0, // Controls the vertical clipping
                              //     widthFactor: 1.5, // Controls the horizontal clipping
                              //     child:
                            Image.asset('images/pork.jpg',width:150, height:100),
                                // ),
                              // ),
                            Text('PORK',
                            style:TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                               ),
                              ],
                            ),
                          ],
                        ),
                    Column(
                      children: <Widget> [
                        Stack(
                          alignment: Alignment.center,
                          children:<Widget>[
                            Image.asset('images/seafood.jpg', width: 150, height: 100),
                            Text('SEAFOOD',
                              style:TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(
                    'BY COURSE',
                    style: TextStyle(fontSize: 24, color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: <Widget> [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset('images/main_dishes.jpg', width:150, height:100),
                          Text('MAIN DISHES',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget> [
                      Stack(
                        alignment: Alignment.bottomCenter ,
                        children: [
                          Image.asset('images/salad.jpg',width:150, height:100),
                          Text('SALAD',
                            style:TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Column(
                    children: <Widget> [
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children:<Widget>[
                          Image.asset('images/side_dishes.jpg', width:150, height:100),
                          Text('SIDE DISHES',
                            style:TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget> [
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children:<Widget>[
                          Image.asset('images/crock_pot.jpg', width:150, height:100),
                          Text('CROCK POT',
                            style:TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(
                    'BY DESERT',
                    style: TextStyle(fontSize: 24, color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: <Widget> [
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children:<Widget>[
                          Image.asset('images/ice_cream.jpg', width:150, height:100),
                          Text('Ice Cream',
                            style:TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Column(
                    children: <Widget> [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children:<Widget>[
                          // ClipRect(
                          //   child: Align(
                          //     alignment: Alignment.center,
                          //     heightFactor: 1.0, // Controls the vertical clipping
                          //     widthFactor: 1.5, // Controls the horizontal clipping
                          //     child:
                          Image.asset('images/brownies.jpg', width:150, height:100),
                          // ),
                          // ),
                          Text('Brownies',
                            style:TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Column(
                    children: <Widget> [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children:<Widget>[
                          Image.asset('images/pies.jpg', width: 150, height: 100),
                          Text('Pies',
                            style:TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Column(
                    children: <Widget> [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children:<Widget>[
                          Image.asset('images/cookies.jpg', width: 150, height: 100),
                          Text('Cookies',
                            style:TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),


                ],
              ),


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

