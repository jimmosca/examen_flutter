


import 'package:examen_flutter_casadojaime/data/models/logged_user.dart';
import 'package:examen_flutter_casadojaime/data/repository/local/local_repository.dart';
import 'package:examen_flutter_casadojaime/data/repository/remote/remote_repository.dart';

class FormPresenter{
  final FormView _view;
  final RemoteRepository _remoteRepository;
  final LocalRepository _localRepository;

  Map<String, List> _faceParts;

  FormPresenter(this._view, this._remoteRepository, this._localRepository);

  String eyesSelected;
  String noseSelected;
  String mouthSelected;

  init() async {
      LoggedUser loggedUser = await _localRepository.getLoggedUser();
      if(loggedUser != null){
        _view.navigateToProfile();
      }else{
        _faceParts = await _remoteRepository.getComponentsList();
        _view.showDropDowns(_faceParts);
      }
  }

  void newPartSelected(String part, String value) {
      if(part == 'eyes'){
        eyesSelected = value;
      }else if(part == 'nose'){
        noseSelected = value;
      }else if(part == 'mouth'){
        mouthSelected = value;
      }

      if(eyesSelected!= null && noseSelected!= null && mouthSelected!= null){
        _view.showAvatar("https://api.adorable.io/avatars/face/$eyesSelected/$noseSelected/$mouthSelected/EDEDFF/200");
      }
  }

  onSaveClicked(String userName, String name, String eyesSelection, String noseSelection, String mouthSelection) async {
    LoggedUser loggedUser = await _localRepository.saveLoggedUser(new LoggedUser(userName, name, eyesSelection, noseSelection, mouthSelection));
    if(loggedUser != null){
      _view.navigateToProfile();
    }else{
      _view.showError("Something went Wrong saving your avatar");
    }

  }





}


abstract class FormView{
  navigateToProfile();

  showDropDowns(Map<String, List> faceParts);

  showAvatar(String url);

  showError(String msg);

}