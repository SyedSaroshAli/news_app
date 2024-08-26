import 'package:flutter/material.dart';
import 'package:news_app/Pages/home.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.7,
                  //decoration: BoxDecoration(
                   // borderRadius: BorderRadius.circular(10)
                  //),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset('assets/landingPage2.jpg',
                    fit: BoxFit.cover,),
                  )
                  ),
                
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                const Text('News from around the\nworld for you',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black,
                  wordSpacing: 2
                ),),
            
                SizedBox(height: MediaQuery.of(context).size.height*0.03),
                const Text('Best time to read, take your time to read a little more of this world',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.black45
                ),),
                
               SizedBox(height: MediaQuery.of(context).size.height*0.03),
            
               GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Home()));
                },
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                  height: 55,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text('Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                  ),
                               ),
                ),),
               
               SizedBox(height: MediaQuery.of(context).size.height*0.04),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Designed with ',
                   style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black45
                   ),),
                   Icon(Icons.favorite,
                   color: Colors.blue,),
                   Text(' by  ',
                   style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45
                   ),),
                   Text('Syed Sarosh Ali',
                   style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                   ),)
                 ],
               ),
               
              ],
            ),
          ),
        ),
      )
    );
  }
}