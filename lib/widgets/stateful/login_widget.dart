import 'package:flutter/material.dart';
import 'package:me_restaurant/data/providers/data_provider_user.dart';

class LoginWidget extends StatefulWidget{
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget>{
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose(){
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Column(
        children: 
        [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email'
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(5)
          ),

          TextField(       
            controller: passwordController,     
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password'),
          ),

          SizedBox(
            width: 300,
            height: 50,
            child: TextButton (            
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if(states.contains(MaterialState.hovered)){
                      return Colors.blue.withOpacity(0.04);
                    }
                    if(states.contains(MaterialState.focused) || states.contains(MaterialState.pressed)){
                      return Colors.blue.withOpacity(0.12);
                    }
                    return null;
                  }
                )
            ),
            onPressed: () async {
              var pass = passwordController.text;
              var email = emailController.text;
              if(email.isEmpty || pass.isEmpty){
                return;
              }
              await getTokens(email, pass);              
            },
            child: const Text('Login')
            )
          ),
        ],
      );    
  }

}