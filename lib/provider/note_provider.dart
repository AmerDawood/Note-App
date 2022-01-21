import 'package:flutter/material.dart';
import 'package:sqflite_app/controllar/note_db_controllar.dart';
import 'package:sqflite_app/model/note.dart';

class NoteProvider extends ChangeNotifier{

  List <Note> notes = <Note> [];
  NoteDbController _noteDbController=NoteDbController();



      Future<bool>create({required Note note})async{
      int newRowId = await _noteDbController.create(note);
      if(newRowId != 0){
        note.id=newRowId;
        notes.add(note);
        notifyListeners();
      }
      return newRowId !=0;
      }
    Future<void>read()async{
      notes =await _noteDbController.read();
      notifyListeners();
    }
    Future<bool>update({required Note note})async{
        bool update =await _noteDbController.update(note);
        if(update){
       int index = notes.indexWhere((element) => element.id==note.id);
          if(index !=1){
            notes[index]=note;
            notifyListeners();

          }
          
        }
        return update;
    }
    Future<bool>delete({required int id})async{

        bool deleted = await _noteDbController.delete(id);

      if(deleted){
        notes.removeWhere((element) => element.id==id);
        notifyListeners();
        
      }
        return deleted;
    }

    }

