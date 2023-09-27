import 'package:flutter/material.dart';
import 'package:me_restaurant/routes/login.dart';

class MainRoute extends StatelessWidget{
  const MainRoute({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {   
            Navigator.of(context).push(                  
                  MaterialPageRoute(builder: (context) => const LoginRoute())                  
              );
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}