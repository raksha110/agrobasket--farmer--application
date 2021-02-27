import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Posts {
  Future<Object> getPosts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token');
      final response = await http.get(
          "https://agrobasket.herokuapp.com/getCrops",
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': token
          });
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Response code 503');
      }
    } on TimeoutException catch (e) {
      throw TimeoutException("Timeout " + e.toString());
    } on Exception catch (e) {
      throw Exception("Exception " + e.toString());
    }
  }

  Future<Object> buyUnits(String postId, int units, int price) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token');
      final response = await http.post(
          "https://agrobasket.herokuapp.com/createProgessandTransactionAndUpdateAvailable",
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': token
          },
          body: json.encode({'postId': postId, 'unit': units, 'price': price}));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Response code 503');
      }
    } on TimeoutException catch (e) {
      throw TimeoutException("Timeout " + e.toString());
    } on Exception catch (e) {
      throw Exception("Exception " + e.toString());
    }
  }

  Future<Object> getCropStatus() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token');
      final response = await http.get(
        "https://agrobasket.herokuapp.com/getTransactionAndProgress",
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': token
        },
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Response code 503');
      }
    } on TimeoutException catch (e) {
      throw TimeoutException("Timeout " + e.toString());
    } on Exception catch (e) {
      throw Exception("Exception " + e.toString());
    }
  }

  Future<Object> uploadStage(
      String base64Image, String stageName, String transactionId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token');
      print(base64Image);
      print(stageName);
      print(transactionId);
      final response = await http.post(
        "https://agrobasket.herokuapp.com/addProgress",
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': token
        },
        body: jsonEncode(
          {
            'base64str': base64Image,
            'transactionId': transactionId,
            'stageName': stageName
          },
        ),
      );
      print(response);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Response code 503');
      }
    } on TimeoutException catch (e) {
      throw TimeoutException("Timeout " + e.toString());
    } on Exception catch (e) {
      throw Exception("Exception " + e.toString());
    }
  }
}
