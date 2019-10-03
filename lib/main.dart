import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      // Heading Bar of the APp
      appBar: AppBar(),

      // Body of the App
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text("Hello"),
        ),
      ),
      // Floating Button
      floatingActionButton: MovingButtons(),
    );
  }
}

class MovingButtons extends StatefulWidget {
  MovingButtons({Key key}) : super(key: key);

  @override
  MovingButtonsState createState() => MovingButtonsState();
}

class MovingButtonsState extends State<MovingButtons> {
  bool x = false;

  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: Duration(seconds: 1),
      alignment: (x) ? Alignment.bottomRight : Alignment.centerRight,
      child: FloatingActionButton(
        onPressed: (x) ? _switchUp : _switchDown,
        heroTag: 'goto_back',
        child: (x) ? Icon(Icons.arrow_upward) : Icon(Icons.arrow_downward),
      ),
    );
  }

  void _switchUp() {
    setState(() {
      x = false;
    });
  }

  void _switchDown() {
    setState(() {
      x = true;
    });
  }
}

class _MovingButtonsState extends State<MovingButtons> {
  // State Values
  bool x = false;

  // Builder
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: (x) ? Alignment.bottomRight : Alignment.topRight,
          child: Padding(
            padding: (x) ? EdgeInsets.fromLTRB(30, 0, 0, 0) : EdgeInsets.fromLTRB(30, 200, 0, 0),
            child: Transform.translate(
              offset: Offset(0, 0),
              child: FloatingActionButton(
                onPressed: (x) ? null : _switchDown,
                heroTag: 'goto_back',
                child: Icon(Icons.arrow_downward),
              ),
            ),
          ),
        ),
        Align(
          alignment: (x) ? Alignment.bottomLeft : Alignment.topLeft,
          child: Padding(
            padding: (x) ? EdgeInsets.fromLTRB(30, 0, 0, 0) : EdgeInsets.fromLTRB(30, 200, 0, 0),
            child: FloatingActionButton(
              onPressed: (x) ? _switchUp : null,
              heroTag: 'goto_front',
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ],
    );
  }

  // Functions
  void _switchUp() {
    setState(() {
      x = false;
    });
  }

  void _switchDown() {
    setState(() {
      x = true;
    });
  }
}
