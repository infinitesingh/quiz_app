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
      home: const MyHomePage(title: 'QUIZ UPSC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: const Center(
          child: Text(
        "Hello AV! How is Kittu",
        style: TextStyle(color: Colors.black, fontSize: 40.0),
      )),
      floatingActionButton: FloatingActionButton(
          elevation: 10.0, child: const Icon(Icons.add), onPressed: () {}),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Text(
                  "drawer head",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
            ListTile(
              title: Text("Item 1"),
            ),
            ListTile(
              title: Text("Item 2"),
            )
          ],
        ),
      ),
    );
  }
}
