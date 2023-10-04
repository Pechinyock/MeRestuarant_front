import 'package:flutter/material.dart';
import 'package:me_restaurant/pages/login.dart';
import 'package:me_restaurant/pages/main.dart';
import 'package:me_restaurant/pages/register.dart';

/*  TODO:

# CRITICAL
 
# MOST IMPORTANT
 1) on startup check if user siggned(if refresh tokent is valid)
    -> Splash screen will help with it
        -> if not go to login screen
 
# LESS IMPORTANT
  1) Add 'hint' to login and register pages

*/

void main() {  
  runApp(MaterialApp(
    initialRoute: '/home',
    routes:{
        '/home': (context) => const MainPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage()
    },  
  ));
}