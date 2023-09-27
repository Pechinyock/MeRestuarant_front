import 'package:flutter/material.dart';
import 'package:me_restaurant/widgets/stateful/login_widget.dart';

class LoginRoute extends StatelessWidget {
  const LoginRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: LoginWidget()));
  }
}
