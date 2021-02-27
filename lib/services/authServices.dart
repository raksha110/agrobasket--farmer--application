import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  String fullname;
  String username;
  String phoneNumber;
  String password;

  String state;
  String city;
  String season;
  String month;
  String soil;
  double soilPhMin;
  double soilPhMax;

  String bankAccHolderName;
  String bankIFSCCode;
  String bankAccNumber;

  Future<bool> login(username, password) async {
    final response = await http.post(
        "https://agrobasket.herokuapp.com/loginFarmer",
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}));
    final data = json.decode(response.body);
    print(data["success"]);
    if (data["success"]) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', data["token"]);
      prefs.setString('username', data["farmer"]["username"]);
      prefs.setString('fullname', data["farmer"]["fullname"]);
      return true;
    }
    return false;
  }

  Future<bool> register() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    fullname = prefs.getString('fullname');
    username = prefs.getString('username');
    phoneNumber = prefs.getString('phoneNumber');
    password = prefs.getString('password');
    state = prefs.getString('state');
    city = prefs.getString('city');
    season = prefs.getString('season');
    month = prefs.getString('month');
    soil = prefs.getString('soil');
    soilPhMin = prefs.getDouble('soilPhMin');
    soilPhMax = prefs.getDouble('soilPhMax');
    bankAccHolderName = prefs.getString('accountNumber');
    bankIFSCCode = prefs.getString('ifscCode');
    bankAccNumber = prefs.getString('accountHolderName');
    await prefs.clear();

    final response =
        await http.post("https://agrobasket.herokuapp.com/registerFarmer",
            headers: <String, String>{'Content-Type': 'application/json'},
            body: jsonEncode({
              'locationCity': city,
              'locationState': state,
              'soil': soil,
              'season': season,
              'month': month,
              'soilPhMin': soilPhMin,
              'soilPhMax': soilPhMax,
              'fullname': fullname,
              'username': username,
              'phoneNumber': phoneNumber,
              'password': password,
              'bankAccountHolderName': bankAccHolderName,
              'bankIfscCode': bankIFSCCode,
              'bankAccountNumber': bankAccNumber
            }));
    print(response.body);
    return await login(username, password);
  }
}
