import 'package:AgroBasket/register/locSeasonSoilPh.dart';
import 'package:AgroBasket/util/button.dart';
import 'package:AgroBasket/util/colors.dart';
import 'package:AgroBasket/util/initialHeroText.dart';
import 'package:AgroBasket/util/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String fullName;
  String username;
  String phoneNumber;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: white,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(7.5, 1, 7.5, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {},
                      color: black,
                      textColor: white,
                      child: Text(
                        "Back to Login",
                        style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.075,
              ),
              InitialHeroText("Create Account"),
              SizedBox(
                height: 10,
              ),
              CustomTextField("Full Name", (value) {
                // print(value);
                setState(() {
                  fullName = value;
                });
              }, false, TextCapitalization.words, false, false),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.014,
              ),
              CustomTextField("Username", (value) {
                // print(value);
                setState(() {
                  username = value;
                });
              }, false, TextCapitalization.none, false, false),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.014,
              ),
              CustomTextField("Phone Number", (value) {
                // print(value);
                setState(() {
                  phoneNumber = value;
                });
              }, false, TextCapitalization.none, true, true),
              SizedBox(
                height: 5,
              ),
              CustomTextField("Password", (value) {
                // print(value);
                setState(() {
                  password = value;
                });
              }, true, TextCapitalization.none, false, false),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              CustomButton("Create Account", () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('fullname', fullName);
                prefs.setString('username', username);
                prefs.setString('phoneNumber', phoneNumber);
                prefs.setString('password', password);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LocationSeasonSoilPH()),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
