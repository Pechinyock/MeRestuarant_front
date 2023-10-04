import 'package:flutter/material.dart';
import 'package:me_restaurant/data/models/user_register_model.dart';
import 'package:me_restaurant/data/providers/data_provider_user.dart';


class RegisterWidget extends StatefulWidget{
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => RegisterWidgetState();
}

class RegisterWidgetState extends State<RegisterWidget>{
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final retryPasswordController = TextEditingController();

  @override
  void dispose(){
    passwordController.dispose();
    emailController.dispose();
    retryPasswordController.dispose();
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

        const Padding(
          padding: EdgeInsets.all(5)
        ),
    
        TextField(       
          controller: retryPasswordController,     
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Retry password'
          ),
        ),

        const Padding(
          padding: EdgeInsets.all(5)
        ),

        TextButton (            
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
            ),                
          ),
        onPressed: () async {
          if(emailController.text.isEmpty){
            return;
          }
          if(passwordController.text.isEmpty){
            return;
          }          
          if(passwordController.text != retryPasswordController.text){
            print('Passwords are not the same!');
            return;
          }
          var newUserModel = UserRegisterModel(
            email: emailController.text,
            password: passwordController.text,
            retryPassword: passwordController.text
          );
          try{
            await registerUser(newUserModel);
          }
          catch(exeption){
            print(exeption.toString());
          }
          
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
          child: Text('Register'),
          )
        ),
      ],
    );
      }
}