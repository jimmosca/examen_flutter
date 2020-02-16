import 'dart:collection';

import 'package:examen_flutter_casadojaime/data/models/logged_user.dart';

abstract class RemoteRepository{

 Future<Map<String, List<String>>> getComponentsList();
 
}