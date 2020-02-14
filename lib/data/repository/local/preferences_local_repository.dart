
import 'package:examen_flutter_casadojaime/data/models/logged_user.dart';
import 'package:examen_flutter_casadojaime/data/repository/local/local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesLocalRepository implements LocalRepository{

  SharedPreferences _preferences;

  @override
  Future<LoggedUser> getLoggedUser() async {
    _preferences = await SharedPreferences.getInstance();
    // TODO: implement getLoggedUser
    return null;
  }

  @override
  Future<bool> removeUser() async {
    _preferences = await SharedPreferences.getInstance();
    // TODO: implement removeUser
    return null;
  }

  @override
  Future<LoggedUser> saveLoggedUser(LoggedUser user) async {
    _preferences = await SharedPreferences.getInstance();
    // TODO: implement saveLoggedUser
    return null;
  }

}