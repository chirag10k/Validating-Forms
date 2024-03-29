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

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      performLogin();
    }
  }

  void performLogin(){
    final snackbar = new SnackBar(
        content: new Text("Email: $_email, Password: $_password ")
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text("Form Page"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(labelText: "Email"),
                validator: (val)=> !(val).contains('@')?'Invalid Email': null,
                onSaved: (val) => _email = val,
              ),
              new Padding(padding: const EdgeInsets.only(top: 20.0)),
              new TextFormField(
                decoration: new InputDecoration(labelText: "Password"),
                validator: (val)=> val.length<6?'Password too short': null,
                onSaved: (val) => _password = val,
                obscureText: true,
              ),
              new RaisedButton(
                child: new Text("Login"),
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
