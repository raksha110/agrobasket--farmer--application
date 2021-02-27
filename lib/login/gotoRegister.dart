import 'package:AgroBasket/register/createAccount.dart';
import 'package:AgroBasket/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GotoRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateAccount()),
            );
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(2.5, 0, 0, 0),
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "Dont have an account? ",
                    style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: black))),
                TextSpan(
                    text: "Register",
                    style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: primary_green))),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
