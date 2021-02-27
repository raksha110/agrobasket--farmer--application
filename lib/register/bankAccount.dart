import 'package:AgroBasket/dashboard/dashboard.dart';
import 'package:AgroBasket/services/authServices.dart';
import 'package:AgroBasket/util/button.dart';
import 'package:AgroBasket/util/colors.dart';
import 'package:AgroBasket/util/initialHeroText.dart';
import 'package:AgroBasket/util/textfield.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BankAccount extends StatefulWidget {
  @override
  _BankAccountState createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  String accountNumber;
  String ifscCode;
  String accountHolderName;
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
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              InitialHeroText("Next Steps"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              CustomTextField("Bank Account Number", (value) {
                setState(() {
                  accountNumber = value;
                });
              }, false, TextCapitalization.none, false, true),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              CustomTextField("IFSC Code", (value) {
                setState(() {
                  ifscCode = value;
                });
              }, false, TextCapitalization.none, false, false),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              CustomTextField("Account Holder's Name", (value) {
                setState(() {
                  accountHolderName = value;
                });
              }, false, TextCapitalization.words, false, false),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.275,
              ),
              CustomButton("Submit", () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('accountNumber', accountNumber);
                prefs.setString('ifscCode', ifscCode);
                prefs.setString('accountHolderName', accountHolderName);

                Authentication().register();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashBoard()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
