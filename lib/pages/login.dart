import 'package:flutter/material.dart';
import 'package:me_restaurant/widgets/stateful/login_widget.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({
    super.key
  });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 200,
        horizontal: 50
      ),
      child: const LoginWidget()
    );
  }
}