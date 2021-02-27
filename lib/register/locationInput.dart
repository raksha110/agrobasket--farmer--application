import 'package:AgroBasket/util/colors.dart';
import 'package:AgroBasket/util/stateCitiesList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_select/smart_select.dart';

class LocationInput extends StatefulWidget {
  String _location = '';
  Function(String) callBack;

  LocationInput(this._location, this.callBack);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(2.5, 0, 0, 0),
            child: Text("Location",
                style: GoogleFonts.nunitoSans(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 16))),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            child: SmartSelect<String>.single(
                title: 'Location',
                placeholder: 'Choose a Location',
                value: widget._location,
                onChange: (state) {
                  print(state.value);
                  setState(() => widget._location = state.value);
                  widget.callBack(state.value);
                },
                choiceItems: S2Choice.listFrom<String, Map>(
                  source: state_cities,
                  value: (index, item) => item['value'],
                  title: (index, item) => item['city'],
                  group: (index, item) => item['state'],
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
