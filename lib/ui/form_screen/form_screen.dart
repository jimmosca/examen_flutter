import 'package:examen_flutter_casadojaime/data/repository/dependency_injector.dart';
import 'package:examen_flutter_casadojaime/ui/form_screen/form_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> implements FormView {
  final _formKey = GlobalKey<FormState>();
  FormPresenter _presenter;


  @override
  void initState() {

    _presenter = FormPresenter(this, Injector.instance.remoteRepository, Injector.instance.localRepository);
    _presenter.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Alerts'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[],
              )),
        ));
  }
}
