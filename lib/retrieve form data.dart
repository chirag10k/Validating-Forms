import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(),
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  final textController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.addListener(printSomeValues);

  }

  printSomeValues(){
    print("Controller values: ${textController.text}");
  }

  @override
  void dispose() {
    textController.removeListener(printSomeValues);
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Form Page"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            TextField(
              onChanged: (text) => print("My Text: $text"),
              controller: textController,
              decoration: new InputDecoration(
                  hintText: "Enter Something", border: InputBorder.none, labelText: "Enter Data"),
            ),
            new Text(textController.text),
          ],
        ),
      ),
    );
  }
}
