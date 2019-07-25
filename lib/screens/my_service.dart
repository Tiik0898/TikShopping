import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
// Explicit

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String displayNameString = '';

// Method
  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      displayNameString = firebaseUser.displayName;
    });
    print('Name = $displayNameString');
  }

  Widget myDrawerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          headDrawer(),
        ],
      ),
    );
  }

  Widget headDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.white, Colors.purple],
          center: Alignment.topLeft,radius: 2.0,
        ),
      ),
      child: Column(
        children: <Widget>[
          showLogo(),
          showTopTitle(),
          showBottomTitle(),
        ],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        showTopTitle(),
        showBottomTitle(),
      ],
    );
  }

  Widget showTopTitle() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'My Service',
        style: TextStyle(
          fontSize: 20.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget showBottomTitle() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Login by $displayNameString',
        style: TextStyle(
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[500],
        title: showTitle(),
      ),
      body: Text('body'),
      drawer: myDrawerMenu(),
    );
  }
}
