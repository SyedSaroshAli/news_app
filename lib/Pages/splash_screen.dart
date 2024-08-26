import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:news_app/Pages/landing_page.dart';




class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
         color: Colors.white
         
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
            const SizedBox(height: 220,),
            Image.asset(
              'assets/SplashScreenLogo.jpg',
              width: 300,
              height: 300,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(' DAILY',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color:Colors.black)),
                Text("PULSE",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.lightBlue.shade900
                    )),
              ],
            ),

            const SizedBox(height: 150,),
            CircularProgressIndicator(
              color: Colors.lightBlue.shade900,
              backgroundColor: Colors.blueGrey,
            )
          ],
        ),
      ),
    );
  }

  void toTheLoginPage() {
   Navigator.push(
       context, MaterialPageRoute(builder: (context) => LandingPage()));
  }

  //initState Function
  @override
 void initState() {
   Future.delayed(Duration(seconds: 8), toTheLoginPage);
   super.initState();
 }
}
