// import flutter helper
import "package:flutter/material.dart";
import "package:http/http.dart" show get;
import "dart:convert";
import "models/image_model.dart";
import "widgets/image_list.dart";

// create class for custom widget
// This class must extend the 'StatelessWidget' base class
class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter += 1;
    var response =
        await get('http://jsonplaceholder.typicode.com/photos/$counter');

    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      body: ImageList(images),
      appBar: AppBar(title: Text("Lets see some images!")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: fetchImage,
      ),
    ));
  }
}

// must define "build" method that returns *this* widget
