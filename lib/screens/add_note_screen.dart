import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_app/helpers/helpers.dart';
import 'package:sqflite_app/model/note.dart';
import 'package:sqflite_app/prefs/app_preferences.dart';
import 'package:sqflite_app/provider/note_provider.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen>with Helpers {
  late TextEditingController _editingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          TextField(
            maxLines: 10,
            minLines: 1,

            controller: _editingController,
            decoration: InputDecoration(
              labelText: 'Enter The Note',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async=>performSave(),
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey,
            ),
            child: Text(
              'SAVE',
            ),
          ),
        ],
      ),
    );
  }

  Future<void> performSave() async {
    if (checkData()) {
      await save();
    }
  }

  bool checkData() {
    if (_editingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context: context, message: 'Enter Required Data',error: true);
    return false;
  }



  Future<void> save() async {
    bool created =await Provider.of<NoteProvider>(context,listen: false).create(note: note);

    String message =created?'Created successfully':'Created Failed';
    showSnackBar(context: context,message: message,error: !created,);
  }
  //--------  What !!
  Note get note {
    Note newNote =Note();

      newNote.name=_editingController.text;
      // AppPreferences().SaveNote(note:newNote);
    return newNote;
  }
}
