import 'package:flutter/material.dart';
import 'package:me_restaurant/pages/login.dart';
import 'package:me_restaurant/pages/main.dart';
import 'package:me_restaurant/pages/register.dart';
import 'package:me_restaurant/pages/splash_screen.dart';

/*  TODO:

# CRITICAL
 
# MOST IMPORTANT
 1) on startup check if user siggned(if refresh tokent is valid)
    -> Splash screen will help with it
        -> if not go to login screen
 
# LESS IMPORTANT
  1) Add 'hint' to login and register pages
  2) 'splash_screen.dart' ? to main page from splash logic:
        we have the refresh token in cache ->
          try to get access token by it if success show MainPage
          if not show LoginPage;
  3) Delete standart splash screen for android and ios... dnno how btw=)
*/

void main() {  
  runApp(MaterialApp(
    home: const SplashScreen(),
    routes:{
        '/home': (context) => const MainPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage()
      },  
    )
  );  
}