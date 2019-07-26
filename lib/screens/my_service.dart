import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tik_shopping/screens/home.dart';
import 'package:tik_shopping/screens/page1.dart';
import 'package:tik_shopping/screens/page2.dart';
import 'package:tik_shopping/screens/page3.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
// Explicit

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String displayNameString = '';
  Widget myWidget = Page1();

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
          showPage1(),
          showPage2(),
          showPage3(),
          mySignOut(),
        ],
      ),
    );
  }

  Widget headDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.white, Colors.purple],
          center: Alignment.topLeft,
          radius: 2.0,
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

  Widget mySignOut() {
    return ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text('SignOut'),
      onTap: () {
        processSignOut();
      },
    );
  }

  Widget showPage1() {
    return ListTile(
      leading: Icon(Icons.account_balance),
      title: Text('Page 1'),
      onTap: () {
        setState(() {
         myWidget = Page1();
         Navigator.of(context).pop(); 
        });
      },
    );
  }

  Widget showPage2() {
    return ListTile(
      leading: Icon(Icons.account_box),
      title: Text('Page 2'),
      onTap: () {
        setState(() {
         myWidget = Page2();
         Navigator.of(context).pop(); 
        });
      },
    );
  }

  Widget showPage3() {
    return ListTile(
      leading: Icon(Icons.home),
      title: Text('Page 3'),
      onTap: () {
        setState(() {
         myWidget = Page3();
         Navigator.of(context).pop(); 
        });
      },
    );
  }

  Future<void> processSignOut() async {
    await firebaseAuth.signOut().then((response) {
      var homeRoute =
          MaterialPageRoute(builder: (BuildContext context) => Home());
      Navigator.of(context)
          .pushAndRemoveUntil(homeRoute, (Route<dynamic> route) => false);
    });
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
      body: myWidget,
      drawer: myDrawerMenu(),
    );
  }
}
