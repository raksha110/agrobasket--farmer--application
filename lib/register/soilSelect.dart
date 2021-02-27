import 'package:AgroBasket/util/soilList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_select/smart_select.dart';
import 'package:AgroBasket/util/colors.dart';

class SoilSelect extends StatefulWidget {
  String _soil;
  Function(String) callBack;

  SoilSelect(this._soil, this.callBack);
  @override
  _SoilSelectState createState() => _SoilSelectState();
}

class _SoilSelectState extends State<SoilSelect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(2.5, 0, 0, 0),
            child: Text("Soil",
                style: GoogleFonts.nunitoSans(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 16))),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            child: SmartSelect<String>.single(
                title: 'Soil',
                placeholder: 'Choose a Soil',
                value: widget._soil,
                onChange: (state) {
                  print(state.value);
                  setState(() => widget._soil = state.value);
                  widget.callBack(state.value);
                },
                choiceItems: S2Choice.listFrom<String, Map>(
                  source: soils,
                  value: (index, item) => item['value'],
                  title: (index, item) => item['soil'],
                ),
                modalFilter: true,
                modalFilterAuto: true,
                tileBuilder: (context, state) {
                  return S2Tile.fromState(state,
                      isTwoLine: true,
                      leading: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 7.5, 0, 0),
                        child: Icon(
                          Icons.location_on,
                          color: black,
                        ),
                      ));
                }),
          )
        ],
      ),
    );
  }
}
