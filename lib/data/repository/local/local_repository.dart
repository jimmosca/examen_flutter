import 'package:examen_flutter_casadojaime/data/models/logged_user.dart';

abstract class LocalRepository{
  Future<LoggedUser> getLoggedUser();
  Future<LoggedUser> saveLoggedUser(LoggedUser user);
}