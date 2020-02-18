import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_out_board/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            logOutUser();
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color.fromRGBO(26, 119, 186, 1),
          child: Text(
            'Log out',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void logOutUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('islogIn', false);

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Login();
      }));
  }
}
