import 'package:flutter/material.dart';
import 'package:in_out_board/screens/HomePage.dart';
import 'package:in_out_board/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log in_out',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _screen;

  bool isLoggedIn;

  @override
  void initState() {
    _screen = Center (child:  CircularProgressIndicator());

    getLoginState();
    super.initState();
  }

  getLoginState() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLoggedIn = pref.getBool('islogIn') ?? false;

    setState(() {
      if (isLoggedIn) {
        _screen = HomePage();
      } else {
        _screen = Login();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screen);
  }
}
