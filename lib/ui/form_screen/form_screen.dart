import 'dart:ui';

import 'package:examen_flutter_casadojaime/data/repository/dependency_injector.dart';
import 'package:examen_flutter_casadojaime/ui/form_screen/form_presenter.dart';
import 'package:examen_flutter_casadojaime/ui/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> implements FormView {
  final _formKey = GlobalKey<FormState>();
  FormPresenter _presenter;
  Map<String, List> faceParts;
  String imgUrl;
  String userName;
  String name;
  String eyesSelection;

  String noseSelection;
  String mouthSelection;

  @override
  void initState() {
    _presenter = FormPresenter(this, Injector.instance.remoteRepository,
        Injector.instance.localRepository);
    _presenter.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register your avatar'),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "SAVE AVATAR",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (_formKey.currentState.validate() &&
                    eyesSelection != null &&
                    noseSelection != null &&
                    mouthSelection != null) {
                  _presenter.onSaveClicked(userName, name, eyesSelection,
                      noseSelection, mouthSelection);
                } else
                  return;
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildForm(),
              ],
            ),
          ),
        ));
  }

  Form buildForm() {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildTextFormField("UserName"),
            buildTextFormField("Name"),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Build your avatar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
              ),
            ),
            faceParts == null
                ? Text("")
                : Column(
                    children: <Widget>[
                      DropdownButton<String>(
                        hint: Text("Select your eyes"),
                        isExpanded: true,
                        value: eyesSelection,
                        items: faceParts['eyes'].map((value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (String s) {
                          print(s);
                          setState(() {
                            eyesSelection = s;
                          });
                          _presenter.newPartSelected('eyes', s);
                        },
                      ),
                      DropdownButton<String>(
                        hint: Text("Select your nose"),
                        isExpanded: true,
                        value: noseSelection,
                        items: faceParts['nose'].map((value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (String s) {
                          print(s);
                          setState(() {
                            noseSelection = s;
                          });
                          _presenter.newPartSelected('nose', s);
                        },
                      ),
                      DropdownButton<String>(
                        hint: Text("Select your mouth"),
                        isExpanded: true,
                        value: mouthSelection,
                        items: faceParts['mouth'].map((value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (String s) {
                          print(s);
                          setState(() {
                            mouthSelection = s;
                          });
                          _presenter.newPartSelected('mouth', s);
                        },
                      )
                    ],
                  ),
            imgUrl == null
                ? Text("")
                : CircleAvatar(
                    minRadius: 18,
                    child: Image.network(imgUrl),
                  )
          ],
        ));
  }

  TextFormField buildTextFormField(String labelName) {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text for $labelName';
        }
        return null;
      },
      onChanged: (text) {},
      decoration: InputDecoration(labelText: labelName),
    );
  }

  @override
  navigateToProfile() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return ProfileScreen();
    }));
  }

  @override
  showDropDowns(Map<String, List> faceParts) {
    setState(() {
      this.faceParts = faceParts;
    });
  }

  @override
  showAvatar(String url) {
    setState(() {
      imgUrl = url;
    });
  }

  @override
  showError(String msg) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}
