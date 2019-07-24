import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//  Explicit
  double myWidth = 200.0;
// Method
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

  Widget signInButton() {
    return Container(
      child: FlatButton(
        color: Colors.brown[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget signUpButton() {
    return Container(
      child: OutlineButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        borderSide: BorderSide(
          color: Colors.blue[700],
        ),
        child: Text('Sign Up'),
        onPressed: () {},
      ),
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signInButton(),
          ),
          Expanded(
            child: signUpButton(),
          ),
        ],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      width: 180.0,
      height: 180.0,
      child: Image.asset('images/logo.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.brown[700]],
            radius: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            showAppName(),
            showButton(),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
