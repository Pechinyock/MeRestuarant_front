import 'package:flutter/material.dart';
import 'package:me_restaurant/routes/login.dart';
import 'package:me_restaurant/routes/main.dart';

/*
 1) add Sqlite to this?
 2) store userr's info in db
 3) enctypt password to store it
 4) store token model in cache
 5) on startup check if user siggned(if refresh tokent is valid)
        -> if not go to login screen
 6) register page ... (on 'back' haven't done yet)

*/

void main() {
  runApp(MaterialApp(    
    initialRoute: '/home',
    routes:{
        '/home': (context) => const MainRoute(),
        '/login':(context) => const LoginRoute()
    },
  ));
}


