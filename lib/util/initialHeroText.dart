import 'package:AgroBasket/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialHeroText extends StatelessWidget {
  final String displayText;
  InitialHeroText(this.displayText);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: this.displayText,
              style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 58,
                      color: black,
                      height: 0,
                      letterSpacing: 0)),
            ),
            TextSpan(
                text: ".",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 68,
                    color: secondary_green,
                    height: 0.95))
          ])),
        ],
      ),
    );
  }
}
