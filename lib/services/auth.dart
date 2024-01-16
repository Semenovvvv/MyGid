import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prj/models/registeruser_model.dart';


class AuthService {

  static String? token;

  static Future<http.Response> registerUser(RegistrationModel userData) async {
    final Uri apiUrl = Uri.parse('http://192.168.3.42:8000/api/register/');
    final response = await http.post(
      apiUrl,
      body: {
        'email': userData.email,
        'username': userData.username,
        'password': userData.password,
        'password2' : userData.repeatPassword
      },
    );
    http.Response tokenResponse = await getTokenResponse(userData.email, userData.password);
    token = await getAccessToken(userData.email, userData.password, response);
    return response;
  }

  static Future<http.Response> getTokenResponse(email, password) async{
    final Uri apiUrl = Uri.parse('http://192.168.3.42:8000/api/token/');
    final response = await http.post(
      apiUrl,
      body: {
        'email': email,
        'password': password,
      },
    );
    return response;
  }

  static Future<bool> authUser(email, password) async{
    http.Response response = await getTokenResponse(email, password);
    token = await getAccessToken(email, password, response);
    if (response.statusCode >= 200 && response.statusCode < 300)
    {
      response.body;
      return true;
    }
    return false;
  }

  static Future<String> getAccessToken(email, password, tokenResponse) async{
    final Map<String, dynamic> data = json.decode(tokenResponse.body);
    return data['access'].toString();
  }
}