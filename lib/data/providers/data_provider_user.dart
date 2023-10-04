import 'dart:convert';

import 'package:me_restaurant/data/models/token_model.dart';
import 'package:http/http.dart' as http;
import 'package:me_restaurant/data/models/user_register_model.dart';

//this one it's just for testing
Future<TokenModel> getTokens(String email, String password) async {
  final response = await http.post(Uri.parse('http://192.168.0.105:9696/User/GetJWT?email=$email&password=$password'));
  if(response.statusCode == 200){    
    print(response.body);
    return TokenModel.fromJeson(jsonDecode(response.body));    
  }
  throw Exception('Faild to load tokens');
}

Future<http.Response> registerUser(UserRegisterModel newUser) async {
  final response = await http.post(
    Uri.parse('http://192.168.0.105:9696/User/CreateUser'),
    headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
        'email': newUser.email,
        'password': newUser.password,
        'retryPassword': newUser.retryPassword
      })
    );
  if(response.statusCode == 200){
    return response;
  }
  var body = response.body;
  throw Exception('Faild to register new user: $body');
}