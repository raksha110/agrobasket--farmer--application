import 'package:AgroBasket/login/login.dart';
import 'package:AgroBasket/util/button.dart';
import 'package:AgroBasket/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Image hero_image;

  @override
  void initState() {
    hero_image = Image.asset(
      "assets/welcome.png",
      fit: BoxFit.contain,
    );
  }

  @override
  void didChangeDependencies() {
    precacheImage(hero_image.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: white,
      padding: EdgeInsets.fromLTRB(25.0, 15, 25, 15),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Center(
            child: hero_image,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
          ),
          Text(
            "Agro Basket",
            style: GoogleFonts.nunitoSans(
                textStyle:
                    TextStyle(fontWeight: FontWeight.w800, fontSize: 36)),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "Driven by cutting edge technology, we source fresh produce from farmers to companies",
              style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xFF777777),
                      height: 1.1)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.16),
          ),
          CustomButton("Login", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          })
        ],
      ),
    ));
  }
}
