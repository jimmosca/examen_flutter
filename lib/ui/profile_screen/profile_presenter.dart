

import 'package:examen_flutter_casadojaime/data/models/logged_user.dart';
import 'package:examen_flutter_casadojaime/data/repository/local/local_repository.dart';

class ProfilePresenter{
  final LocalRepository _localRepository;
  final ProfileView _view;

  ProfilePresenter(this._localRepository, this._view);

  init() async {
    LoggedUser loggedUser = await _localRepository.getLoggedUser();
    if(loggedUser!= null){
      _view.showScreen(loggedUser);
    }
  }

}


abstract class ProfileView{
  showScreen(LoggedUser loggedUser);

}