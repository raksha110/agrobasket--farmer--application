import 'package:AgroBasket/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SoilPHInput extends StatefulWidget {
  RangeValues _currentRangeValues = RangeValues(4, 8);
  Function(RangeValues) callBack;

  SoilPHInput(this._currentRangeValues, this.callBack);

  @override
  _SoilPHInputState createState() => _SoilPHInputState();
}

class _SoilPHInputState extends State<SoilPHInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(2.5, 0, 0, 0),
          child: Text("Soil PH",
              style: GoogleFonts.nunitoSans(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 16))),
        ),
        SizedBox(
          height: 25,
        ),
        RangeSlider(
          activeColor: black,
          inactiveColor: grey,
          values: widget._currentRangeValues,
          min: 0,
          max: 10,
          divisions: 20,
          labels: RangeLabels(
            widget._currentRangeValues.start.toString(),
            widget._currentRangeValues.end.toString(),
          ),
          onChanged: (RangeValues values) {
            print(values.start);
            setState(() {
              widget._currentRangeValues = values;
            });
            widget.callBack(values);
          },
        )
      ],
    ));
  }
}
