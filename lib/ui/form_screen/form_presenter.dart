


import 'package:examen_flutter_casadojaime/data/repository/local/local_repository.dart';
import 'package:examen_flutter_casadojaime/data/repository/remote/remote_repository.dart';

class FormPresenter{
  final FormView _view;
  final RemoteRepository _remoteRepository;
  final LocalRepository _localRepository;

  FormPresenter(this._view, this._remoteRepository, this._localRepository);

  void init() {}





}


abstract class FormView{

}