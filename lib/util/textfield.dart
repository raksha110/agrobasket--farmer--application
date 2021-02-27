import 'package:AgroBasket/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final bool isPhoneNumber;
  final bool isKeyboardNumber;

  CustomTextField(this.label, this.onChanged, this.obscureText,
      this.textCapitalization, this.isPhoneNumber, this.isKeyboardNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(2.5, 0, 0, 0),
            child: Text(this.label,
                style: GoogleFonts.nunitoSans(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 16))),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            child: TextField(
              onChanged: this.onChanged,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: grey,
                  hintText: this.label),
              obscureText: this.obscureText,
              textCapitalization: this.textCapitalization,
              keyboardType:
                  isKeyboardNumber ? TextInputType.number : TextInputType.text,
              maxLength: isPhoneNumber ? 10 : null,
              maxLengthEnforced: isPhoneNumber,
              cursorColor: black,
            ),
          )
        ],
      ),
    );
  }
}
