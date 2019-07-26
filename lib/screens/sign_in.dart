import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Explicit
  double myPadding = 20.0;
  String nameString, emailString, passwordString;


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
          labelText: 'Email :',
          icon: Icon(
            Icons.email,
            size: 40.0,
          ),
        ),
        validator: (String value) {
          if (!((value.contains('@')) && (value.contains('.')))) {
            return 'Please Type Email Format';
          }
        },
        onSaved: (String value) {
          emailString = value;
        },
      ),
    );
  }

  Widget nameText() {
    return Container(
      padding: EdgeInsets.only(left: myPadding, right: myPadding),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'Name :',
            icon: Icon(
              Icons.face,
              size: 40.0,
            )),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Fill Name in Blank';
          }
        },
        onSaved: (String value) {
          nameString = value;
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
          print('You Click SignIn');

          var signInRoute =
              MaterialPageRoute(builder: (BuildContext context) => SignIn());
          Navigator.of(context).push(signInRoute);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.purple[300],
      ),
      body: Container(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showAppName(),
            emailText(),
            nameText(),
            signInButton(),
          ],
        ),
        alignment: Alignment.center,),
    );
  }
}
