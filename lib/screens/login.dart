import 'package:flutter/material.dart';
import 'package:in_out_board/screens/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  TextEditingController unC = new TextEditingController();
  TextEditingController pasC = new TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              uperPart(),
              userNameTF(),
              passTF(),
              loginBtn(),
            ],
          ),
        )),
      ),
    );
  }

  uperPart() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.2,
      decoration: BoxDecoration(
          color: Color.fromRGBO(26, 119, 186, 1),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(height: 40,)),
          Expanded(
              flex: 1,
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }

  userNameTF() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.25,
              padding: EdgeInsets.only(left: 20, top: 3, bottom: 3, right: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 1)]),
              child: TextFormField(
                // textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                controller: unC,
                validator: validateUN,
                decoration: InputDecoration(
                    hintText: 'User name',
                    border: InputBorder.none,
                    fillColor: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }

  passTF() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.25,
              padding: EdgeInsets.only(left: 20, top: 3, bottom: 3, right: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 1)]),
              child: TextFormField(
                // textAlign: TextAlign.center,
                controller: pasC,
                obscureText: true,
                validator: validatePassword,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none,
                    fillColor: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }

  loginBtn() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 1.25,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25))),
        child: RaisedButton(
          color: Color.fromRGBO(26, 119, 186, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          onPressed: () {
            navigateToHomePage();
          },
          child: Text(
            'Login',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
          ),
        ),
      ),
    );
  }

  String validateUN(String value) {
    if (unC.text.isEmpty)
      return 'Enter username should not be empty';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.length < 3) {
      return 'Your password need to be atleast 3 characters';
    } else
      return null;
  }

  void navigateToHomePage() async {
    if (_formKey.currentState.validate()) {
      //user login
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('islogIn', true);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    }
  }
}
