import 'package:AgroBasket/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String displayText;
  final Function onPressed;
  CustomButton(this.displayText, this.onPressed);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: this.onPressed,
        color: black,
        textColor: white,
        child: Text(
          this.displayText,
          style: GoogleFonts.nunitoSans(
              textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
        ),
      ),
    );
  }
}
