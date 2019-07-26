import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tik_shopping/screens/my_service.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Explicit

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  double myPadding = 20.0;
  String nameString, emailString, passwordString;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget showAppName() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Text(
        'Tik Shopping',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.blue[500],
          fontWeight: FontWeight.bold,
          fontFamily: 'Fascinate',
        ),
      ),
    );
  }

  Widget emailText() {
    return Container(
      padding: EdgeInsets.only(left: myPadding, right: myPadding),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          helperStyle: TextStyle(color: Colors.red),
          hintText: 'you@email.com',
          labelText: 'Email :',
          helperText: 'you@email.com',
          icon: Icon(
            Icons.email,
            size: 40.0,
          ),
        ),
        onSaved: (String value) {
          emailString = value;
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      padding: EdgeInsets.only(left: myPadding, right: myPadding),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          helperStyle: TextStyle(color: Colors.red),
          labelText: 'Password :',
          helperText: 'More 6 Charactor',
          icon: Icon(
            Icons.vpn_key,
            size: 40.0,
          ),
        ),
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }

  Widget signInButton() {
    return Container(
      child: FlatButton(
        color: Colors.purple[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          formKey.currentState.save();
          checkAuthen();
        },
      ),
    );
  }

  Future<void> checkAuthen() async {
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      var homeRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context)
          .pushAndRemoveUntil(homeRoute, (Route<dynamic> route) => false);
    }).catchError((response) {
      String errorString = response.message;
      mySnackBar(errorString);
    });
  }

  void mySnackBar(String messageString) {
    SnackBar snackBar = SnackBar(
      content: Text(messageString),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.purple[300],
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showAppName(),
            emailText(),
            passwordText(),
            signInButton(),
          ],
        ),
      ),
    );
  }
}
