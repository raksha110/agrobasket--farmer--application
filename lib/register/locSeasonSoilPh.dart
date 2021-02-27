import 'package:AgroBasket/register/bankAccount.dart';
import 'package:AgroBasket/register/locationInput.dart';
import 'package:AgroBasket/register/seasonMonth.dart';
import 'package:AgroBasket/register/soilPhInput.dart';
import 'package:AgroBasket/register/soilSelect.dart';
import 'package:AgroBasket/util/button.dart';
import 'package:AgroBasket/util/colors.dart';
import 'package:AgroBasket/util/initialHeroText.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationSeasonSoilPH extends StatefulWidget {
  @override
  _LocationSeasonSoilPHState createState() => _LocationSeasonSoilPHState();
}

class _LocationSeasonSoilPHState extends State<LocationSeasonSoilPH> {
  String location;
  String seasonMonth;
  String soil;
  RangeValues phRangeValues = RangeValues(4, 8);

  locationCallback(locationVal) {
    setState(() {
      location = locationVal;
    });
  }

  seasonMonthCallback(seasonMonthVal) {
    setState(() {
      seasonMonth = seasonMonthVal;
    });
  }

  soilCallback(soilVal) {
    setState(() {
      soil = soilVal;
    });
  }

  phRangeValuesCallback(phRangeVal) {
    setState(() {
      phRangeValues = phRangeVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: white,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            InitialHeroText("Next Steps"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            LocationInput(location, locationCallback),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SeasonMonth(seasonMonth, seasonMonthCallback),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SoilSelect(soil, soilCallback),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SoilPHInput(phRangeValues, phRangeValuesCallback),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CustomButton("Next", () async {
              print(location.split("-")[0]);
              print(location.split("-")[1]);
              print(seasonMonth.split("-")[0]);
              print(seasonMonth.split("-")[1]);
              print(soil);
              print(phRangeValues.start);
              print(phRangeValues.end);

              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString("city", location.split("-")[0]);
              prefs.setString("state", location.split("-")[1]);
              prefs.setString("season", seasonMonth.split("-")[0]);
              prefs.setString("month", seasonMonth.split("-")[1]);
              prefs.setString("soil", soil);
              prefs.setDouble("soilPhMin", phRangeValues.start);
              prefs.setDouble("soilPhMax", phRangeValues.end);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BankAccount()),
              );
            })
          ],
        ),
      ),
    );
  }
}
