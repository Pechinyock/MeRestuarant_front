import 'package:flutter/material.dart';
import 'package:me_restaurant/pages/login.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: LoginPage(),
    )
  ));
}


