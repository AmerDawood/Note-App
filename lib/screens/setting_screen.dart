import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_app/helpers/helpers.dart';
import 'package:sqflite_app/provider/note_provider.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with Helpers{
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Colors.white,
      body:  Consumer<NoteProvider>(
        builder: (context, NoteProvider value, child) {
          if (value.notes.isEmpty) {
            return Center(

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/clipboard (2).png'),
                    SizedBox(height: 10,),
                    Text(
                      'No Notes :(',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromRGBO(85, 78, 143, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5,),

                    Text(
                      'You have no task to do.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(130, 160, 183, 1),

                      ),
                    ),
                  ],
                ));
          } else {
            return InkWell(
                // onTap: ()=> Navigator.pushNamed(context, '/note_file_screen'),
                child:ListView.builder(
                  itemCount:value.notes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child: ListTile(

                        tileColor: Colors.grey.shade200,
                        leading: Icon(Icons.note),
                        title: Text(value.notes[index].name),
                        trailing:IconButton(
                          onPressed: ()=>deleteNote(id: value.notes[index].id),
                          icon: Icon(Icons.delete),
                        ),


                      ),
                    );


                  }

                ),

            );




          }
        },
      ),

    );
  }

  Future<void>deleteNote({required int id})async{
    bool deleted = await Provider.of<NoteProvider>(context,listen:false).delete(id: id);
    String message =deleted?'Deleted Successfully':'Deleted Failed';
    showSnackBar(context: context,message: message,error: !deleted);

  }


}
