import 'package:AgroBasket/services/posts.dart';
import 'package:AgroBasket/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyProduct extends StatefulWidget {
  dynamic data;
  BuyProduct(this.data);

  @override
  _BuyProductState createState() => _BuyProductState();
}

class _BuyProductState extends State<BuyProduct> {
  String companyName;
  String crop;
  int price;
  int units = 0;
  String postId;
  @override
  void initState() {
    companyName = widget.data['company'][0]['companyName'].toString();
    crop = widget.data['crop'][0]['cropName'];
    price = widget.data['price'];
    postId = widget.data['_id'];
    // print(postId);
    super.initState();
  }

  void add() {
    setState(() {
      units++;
    });
    print(units);
  }

  void minus() {
    setState(() {
      if (units != 0) units--;
    });
    print(units);
  }

  showAlertDialog(BuildContext context) {
    Widget closeButton = FlatButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        child: Text("Close"),
        textColor: black);

    AlertDialog closeAlert = AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      title: Text(
        "Success",
        style: TextStyle(
          color: primary_green,
        ),
      ),
      content: Text("You can now grow " +
          units.toString() +
          " units(kg) of " +
          crop +
          ". To Track and Update your Progress check it under Crop Progress Tab."),
      actions: [closeButton],
    );

    Widget cancelButton = FlatButton(
      textColor: black,
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    Widget continueButton = FlatButton(
      textColor: black,
      child: Text("Continue"),
      onPressed: () async {
        // Call API and Create Transaction
        dynamic data = await Posts().buyUnits(postId, units, price);
        if (data['msg'] == "Updated Successfully") {
          //To close the modal & call closeAlert
          Navigator.pop(context);
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return closeAlert;
            },
          );
        }
      },
    );

    AlertDialog alert = AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      title: Text("Buy Units"),
      content: Text("Would you like to grow and sell " +
          units.toString() +
          " units (kg) of " +
          crop +
          "?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      height: 300,
      child: Column(
        children: [
          Center(
            child: Text("Buy Units",
                style: GoogleFonts.nunitoSans(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 20))),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(companyName,
                    style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16))),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Grow and Sell " +
                        crop +
                        " at Rs. " +
                        price.toString() +
                        " per unit",
                    style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16))),
                SizedBox(
                  height: 10,
                ),
                Text(
                    widget.data['availableUnits'].toString() +
                        " Available Units",
                    style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16))),
                Text("Each Unit is equal to 1kg",
                    style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16))),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              padding: EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: units > 0
                  ? () {
                      showAlertDialog(context);
                    }
                  : null,
              color: black,
              textColor: white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: minus,
                    child: Icon(
                      Icons.remove,
                      color: white,
                    ),
                  ),
                  Text(
                    units == 0 ? "Buy Units" : units.toString(),
                    style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18)),
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: add,
                    child: Icon(
                      Icons.add,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
