import 'dart:ui';

import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, '/main_screen');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                'assets/Group 271.png',
              ),

            ),
            SizedBox(height: 90,),
            Text(
              'Made it Simple',
              style: TextStyle(
                fontSize: 25,
                color: Color.fromRGBO(85, 78, 183, 1),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10,),

            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Mauris pellentesque erat in blandit luctus.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(130, 160, 183, 1),

              ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(

                onPressed: (){
                  Navigator.pushNamed(context, '/main_screen');
                },

                child:Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),

             style: ElevatedButton.styleFrom(

               primary: Color.fromRGBO(57, 48, 216, 1),
               minimumSize: Size(258, 56.29),


             ), 
            ),
          ],
        ),
      ),
    );
  }
}
/*
Text(

          'Note App',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
 */