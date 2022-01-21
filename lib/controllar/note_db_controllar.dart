import 'package:sqflite/sqflite.dart';
import 'package:sqflite_app/model/note.dart';
import 'package:sqflite_app/storage/db/dp_operations.dart';
import 'package:sqflite_app/storage/db/db_provider.dart';

class NoteDbController extends DbOperation{
  Database database = DbProvider().database;

  @override
  Future<int> create(object) async {
    int newRowId = await database.insert('notes', object.toMap());
    return newRowId;
  }

  @override
  Future<bool> delete(int id) async {
    // DELETE FROM NOTES => DELETE ALL NOTES
    //DELETE FROM NOTES WHERE ID ==1;
    int countOfDeletedRows =
    // attribute binding (تعويض القيم)
        await database.delete('notes', where: 'id=?', whereArgs: [id]);
    return countOfDeletedRows > 0;
  }

  @override
  Future<List<Note>> read()async {
    List<Map<String,dynamic>> data =await database.query('notes');
    return data.map((rowMap) =>Note.fromMap(rowMap)).toList();

  }

  @override
  Future show(int id)async {

   List<Map<String,dynamic>> data =
   await  database.query('notes',where: 'id = ?',whereArgs: [id]);
   if(data.isNotEmpty){
    Note note =Note.fromMap(data.first);
   }
   return null;

  }

  @override
  Future<bool> update(object) async {
    int countOfUpdateRows = await database.update(
      'notes',
      object.toMap(),
      where: 'id = ?',
      whereArgs: [object.id],
    );
    return countOfUpdateRows > 0;
  }
}
