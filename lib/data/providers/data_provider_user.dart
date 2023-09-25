import 'dart:convert';

import 'package:me_restaurant/data/models/token_model.dart';
import 'package:http/http.dart' as http;

Future<TokenModel> getTokens(String email, String password) async {
  final response = await http.post(Uri.parse('http://192.168.0.105:9696/User/GetJWT?email=$email&password=$password'));
  if(response.statusCode == 200){    
    print(response.body);
    return TokenModel.fromJeson(jsonDecode(response.body));
    
  }
  throw Exception('Faild to load tokens');
}