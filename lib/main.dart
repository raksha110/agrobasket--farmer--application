import 'package:AgroBasket/dashboard/dashboard.dart';
import 'package:AgroBasket/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      runApp(MyApp(true));
    } else {
      runApp(MyApp(false));
    }
  } catch (error) {
    print("Failed to Load Agro Basket App " + error.toString());
  }
}

class MyApp extends StatelessWidget {
  bool isTokenAvailable;
  MyApp(this.isTokenAvailable);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isTokenAvailable ? DashBoard() : Welcome(),
    );
  }
}
