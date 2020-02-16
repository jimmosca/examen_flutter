

import 'package:examen_flutter_casadojaime/data/repository/local/preferences_local_repository.dart';
import 'package:examen_flutter_casadojaime/data/repository/remote/http_remote_repository.dart';
import 'package:examen_flutter_casadojaime/data/repository/remote/remote_repository.dart';
import 'package:http/http.dart';

import 'local/local_repository.dart';

class Injector{

  static final Injector instance = new Injector._internal();

  factory Injector() => instance;
  RemoteRepository remoteRepository;
  LocalRepository localRepository;
  Injector._internal(){
    remoteRepository = HttpRemoteRepository(Client());
    localRepository = PreferencesLocalRepository();
  }
}