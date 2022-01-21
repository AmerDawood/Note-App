import 'package:shared_preferences/shared_preferences.dart';
class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();

  late SharedPreferences _sharedPreferences;

  // name Constructor
  AppPreferences._internal();

  factory AppPreferences() {
    return _instance;
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> SaveNote({required int note}) async {
    await _sharedPreferences.setInt('Note',note);
  }

  int get note => _sharedPreferences.getInt('Counter') ?? 0;

}
