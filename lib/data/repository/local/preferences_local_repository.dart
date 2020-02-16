
import 'dart:convert';
import 'dart:io';

import 'package:examen_flutter_casadojaime/data/models/logged_user.dart';
import 'package:examen_flutter_casadojaime/data/repository/local/local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesLocalRepository implements LocalRepository{

  SharedPreferences _preferences;

  @override
  Future<LoggedUser> getLoggedUser() async {
    _preferences = await SharedPreferences.getInstance();
    if (_preferences.containsKey('loggedUser')) {
      String loggedUserJson = _preferences.getString('loggedUser');
      return LoggedUser.fromMap(jsonDecode(loggedUserJson));
    } else
      return null;
  }


  @override
  Future<LoggedUser> saveLoggedUser(LoggedUser loggedUser) async {
    _preferences = await SharedPreferences.getInstance();
    Map userMap = loggedUser.toMap();
    String user = json.encode(userMap);
    bool success = await _preferences.setString('loggedUser', user);
    if (success) {
      return loggedUser;
    } else {
      throw FileSystemException();
    }
  }

}