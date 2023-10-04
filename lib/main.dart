import 'package:flutter/material.dart';
import 'package:me_restaurant/pages/login.dart';
import 'package:me_restaurant/pages/main.dart';
import 'package:me_restaurant/pages/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*  TODO:

# CRITICAL
 

# MOST IMPORTANT
 1) add Sqlite to this?
 2) store userr's info in db
 3) enctypt password to store it
 4) store token model in cache
 5) on startup check if user siggned(if refresh tokent is valid)
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