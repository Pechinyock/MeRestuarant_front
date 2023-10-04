import 'package:flutter/material.dart';
import 'package:me_restaurant/widgets/stateful/register_widget.dart';

class RegisterPage extends StatelessWidget{
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(50),
        reverse: true,
        child: RegisterWidget()
      ),
    );
  }
}