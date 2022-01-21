import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_app/helpers/helpers.dart';
import 'package:sqflite_app/model/bn_screen.dart';
import 'package:sqflite_app/provider/note_provider.dart';
import 'package:sqflite_app/screens/add_note_screen.dart';
import 'package:sqflite_app/screens/setting_screen.dart';

import 'groups_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with Helpers{


  late int _currentIndex = 0;
  final List<BnScreen> _bnScreen = <BnScreen>[
    const BnScreen(
      widget: SettingScreen(),
      titel: 'App Screen',
    ),

    const BnScreen(
      widget: AddNoteScreen(),
      titel: '--',
    ),
    const BnScreen(
      widget: GroupScreen(),
      titel: '--',
    ),

  ];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NoteProvider>(context, listen: false).read();
  // Future.delayed(Duration.zero,(){
  //   Provider.of<NoteProvider>(context).read();
  // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Note App',style: TextStyle(color: Colors.blueGrey,fontSize: 25,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),



      body:_bnScreen[_currentIndex].widget,

      bottomNavigationBar: CurvedNavigationBar(
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
          });
        },
        backgroundColor: Colors.blueGrey.withOpacity(0.1),
        items: <Widget>[
          Icon(Icons.assignment_outlined, size: 30,),
          Icon(Icons.add, size: 50,color: Colors.deepOrange,),
          Icon(Icons.dashboard_rounded, size: 30),
        ],

      ),


    );




  }




}

