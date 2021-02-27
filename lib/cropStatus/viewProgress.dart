import 'package:AgroBasket/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewProgress extends StatelessWidget {
  dynamic data;
  ViewProgress(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            decoration: BoxDecoration(
              border: Border.all(color: grey, width: 0.75),
              borderRadius: BorderRadius.circular(10),
              color: white,
              boxShadow: [
                BoxShadow(offset: Offset(0, 5), blurRadius: 10, color: grey)
              ],
            ),
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              children: [
                Image.network(
                  data[index]['cropPhotoURL'],
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data[index]['stage'],
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            height: 1),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
