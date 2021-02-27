import 'package:AgroBasket/dashboard/dashboard.dart';
import 'package:AgroBasket/login/gotoRegister.dart';
import 'package:AgroBasket/services/authServices.dart';
import 'package:AgroBasket/util/button.dart';
import 'package:AgroBasket/util/colors.dart';
import 'package:AgroBasket/util/initialHeroText.dart';
import 'package:AgroBasket/util/textfield.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Builder(
        builder: (ctx) => Container(
          color: white,
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                InitialHeroText("Welcome Back"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.027,
                ),
                CustomTextField("Username", (value) {
                  print(value);
                  setState(() {
                    username = value;
                  });
                }, false, TextCapitalization.none, false, false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.021,
                ),
                CustomTextField("Password", (value) {
                  print("Password" + value);
                  setState(() {
                    password = value;
                  });
                }, true, TextCapitalization.none, false, false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.269,
                ),
                GotoRegister(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.007,
                ),
                CustomButton("Login", () async {
                  await Authentication().login(username, password);
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  if (prefs.getString('token') != null) {
                    final snackBar =
                        SnackBar(content: Text('Successful Login!'));
                    Scaffold.of(ctx).showSnackBar(snackBar);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashBoard()),
                    );
                  } else {
                    print("Error");
                    final snackBar =
                        SnackBar(content: Text('Error while login'));
                    Scaffold.of(ctx).showSnackBar(snackBar);
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
