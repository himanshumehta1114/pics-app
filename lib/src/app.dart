// import flutter helper
import "package:flutter/material.dart";

// create class for custom widget
// This class must extend the 'StatelessWidget' base class
class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;

  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      body: Text('$counter'),
      appBar: AppBar(title: Text("Lets see some images!")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          setState(() {
            counter += 1;
          })
        },
      ),
    ));
  }
}

// must define "build" method that returns *this* widget
