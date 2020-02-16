import 'package:examen_flutter_casadojaime/data/models/logged_user.dart';
import 'package:examen_flutter_casadojaime/data/repository/dependency_injector.dart';
import 'package:examen_flutter_casadojaime/ui/profile_screen/profile_presenter.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> implements ProfileView {
  String name = "";
  String imgUrl;
  ProfilePresenter _presenter;


  @override
  void initState() {
    _presenter = ProfilePresenter(Injector.instance.localRepository, this);
    _presenter.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Hello $name!!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32.0,
                fontWeight: FontWeight.bold,),),
                imgUrl == null
                    ? Text("")
                    : CircleAvatar(
                  maxRadius: 60,
                  minRadius: 40,
                        backgroundImage: NetworkImage(imgUrl),
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  showScreen(LoggedUser loggedUser) {
    setState(() {
      name = loggedUser.name;
      imgUrl = "https://api.adorable.io/avatars/face/${loggedUser.eyes}/${loggedUser.nose}/${loggedUser.mouth}/EDEDFF/200";
    });
  }
}
