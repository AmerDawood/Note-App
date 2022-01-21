import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite_app/widgets/gridView.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                // color: Colors.blue,
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade300,
                Colors.blue.shade900,
              ],
            )),
            width: double.infinity,
            height: 270,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: TextField(
                          controller: null,
                          autofocus: false,
                          style: new TextStyle(
                              fontSize: 22.0, color: Color(0xFFbdc6cf)),
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search Your Notes',
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search),
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 27,
                        backgroundImage: NetworkImage(
                          'https://image.shutterstock.com/image-photo/image-happy-brunette-man-wearing-260nw-1489874846.jpg',
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Container(
                    width: 300,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Meeting',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, top: 5),
                            child: Text(
                              'Meeting with client',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, top: 5),
                            child: Text(
                              '13.00 PM, 08 June',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 400,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3,
                mainAxisSpacing: 5,
              ),
              // itemCount: 3,

              children: [
                GridViewWidget(
                  title: 'Personal',
                  NumberOfNode: '44',
                  image:Image(
                    image: AssetImage(
                      'assets/user.png',
                    ),
                  ),
                  backColor: Color.fromRGBO(255, 238, 155, 1).withOpacity(0.6),
                ),
                GridViewWidget(
                    title: 'Work',
                    NumberOfNode: '11',
                    image:Image(
                      image: AssetImage(
                        'assets/briefcase.png',
                      ),
                    ),
                  backColor: Color.fromRGBO(181, 255, 155,1).withOpacity(0.6),
                ),
                GridViewWidget(
                    title: 'Meeting',
                    NumberOfNode: '20',
                    image:Image(
                      image: AssetImage(
                        'assets/presentation (1).png',
                      ),
                    ),
                  backColor: Color.fromRGBO(255, 155, 205, 1).withOpacity(0.6),
                ),
                GridViewWidget(
                    title: 'Shopping',
                    NumberOfNode: '143',
                    image:Image(
                      image: AssetImage(
                        'assets/shopping-basket.png',
                      ),
                    ),
                  backColor: Color.fromRGBO(181, 255, 155,1).withOpacity(0.6),
                ),
              ],

              // },
            ),
          ),
        ],
      ),
    );
  }
}
