import 'package:flutter/material.dart';
import 'package:tik_shopping/screens/sign_in.dart';
import 'package:tik_shopping/screens/sign_up.dart';

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
        color: Colors.yellow[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          print('You Click SignIn');

          var signInRoute =
              MaterialPageRoute(builder: (BuildContext context) => SignIn());
          Navigator.of(context).push(signInRoute);
        },
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
        onPressed: () {
          var signUpRoute = MaterialPageRoute(
            builder: (BuildContext context) => SignUp(),
          );
          Navigator.of(context).push(signUpRoute);
        },
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
