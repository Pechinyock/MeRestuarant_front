import 'package:flutter/material.dart';
import 'package:me_restaurant/constants/cache_constants.dart';
import 'package:me_restaurant/data/providers/data_provider_user.dart';
import 'package:me_restaurant/pages/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          var pass = passwordController.text;
          var email = emailController.text;
          if(email.isEmpty || pass.isEmpty){
            return;
          }
          try{
            final jwt = await getTokens(email, pass);
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            final ssss =prefs.getString(CacheConstants.accessToken);
            print('Cache from splash screen:' + ssss.toString());
            await prefs.setString(CacheConstants.accessToken, jwt.accessToken);
            await prefs.setString(CacheConstants.refreshToken, jwt.refreshToken);
            if(!context.mounted){
              return;
            }
            Navigator.of(context).pushAndRemoveUntil(                  
              MaterialPageRoute(builder: (context) => const MainPage()),
              ModalRoute.withName('/home')
            );
            
          }
          catch(exeption){
            print(exeption.toString());
            return;
          }              
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
          child: Text('Login'),
          )
        ),
      ],
    );
      }
}