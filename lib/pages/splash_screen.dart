import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:me_restaurant/constants/cache_constants.dart';
import 'package:me_restaurant/pages/login.dart';
import 'package:me_restaurant/pages/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> 
  with SingleTickerProviderStateMixin { 
  String splashText = 'MeRest';


  @override
  void initState() {    
    super.initState();
    SharedPreferences? cacher;

    SharedPreferences.getInstance()
      .then((value) => cacher = value);      
    StatelessWidget nextPage;
    final accessToken = cacher?.getString(CacheConstants.refreshToken);
    if(accessToken == null){
      nextPage = const LoginPage();
    }
    else{
      /** 
       * ? to main page from splash logic
       */
      nextPage = const MainPage();
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);    
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => nextPage,
      ));
    });

  }

  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.edit,
              size: 80,
              color:Colors.white
            ),
            const SizedBox(
              height: 20,
            ),
            Text(splashText,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontSize: 32
              ),  
            ) 
          ],
        ),
      )
    );
  }
}