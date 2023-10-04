import 'package:flutter/material.dart';
import 'package:me_restaurant/pages/login.dart';

class MainPage extends StatelessWidget{
  const MainPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {   
            Navigator.of(context).push(                  
                  MaterialPageRoute(builder: (context) => const LoginPage())                  
              );
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}