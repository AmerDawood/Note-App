import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_app/prefs/app_preferences.dart';
import 'package:sqflite_app/provider/note_provider.dart';
import 'package:sqflite_app/screens/add_note_screen.dart';
import 'package:sqflite_app/screens/groups_screen.dart';
import 'package:sqflite_app/screens/launach_screen.dart';
import 'package:sqflite_app/screens/main_screen.dart';
import 'package:sqflite_app/storage/db/db_provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbProvider().initDb();
  await AppPreferences().initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteProvider>(create: (_) => NoteProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/launch_screen',
        routes: {
          '/launch_screen':(context)=>LaunchScreen(),
          '/main_screen':(context)=>MainScreen(),
          '/add_note_screen':(context)=>AddNoteScreen(),
          '/group_screen':(context)=>GroupScreen(),
        },
      ),
    );
  }
}
