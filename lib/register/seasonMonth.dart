import 'package:AgroBasket/util/seasonMonthList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_select/smart_select.dart';
import 'package:AgroBasket/util/colors.dart';

class SeasonMonth extends StatefulWidget {
  String _seasonMonth;
  Function(String) callBack;
  SeasonMonth(this._seasonMonth, this.callBack);
  @override
  _SeasonMonthState createState() => _SeasonMonthState();
}

class _SeasonMonthState extends State<SeasonMonth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(2.5, 0, 0, 0),
            child: Text("Season - Month",
                style: GoogleFonts.nunitoSans(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 16))),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            child: SmartSelect<String>.single(
                title: 'Month',
                placeholder: 'Choose a Month',
                value: widget._seasonMonth,
                onChange: (state) {
                  setState(() {
                    widget._seasonMonth = state.value;
                  });
                  widget.callBack(state.value);
                },
                choiceItems: S2Choice.listFrom<String, Map>(
                  source: season_month,
                  value: (index, item) => item['value'],
                  title: (index, item) => item['month'],
                  group: (index, item) => item['season'],
                ),
                choiceGrouped: true,
                modalFilter: true,
                modalFilterAuto: true,
                tileBuilder: (context, state) {
                  return S2Tile.fromState(state,
                      isTwoLine: true,
                      leading: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 7.5, 0, 0),
                        child: Icon(
                          Icons.calendar_today,
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
