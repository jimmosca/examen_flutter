import 'dart:collection';
import 'dart:convert';
import 'dart:io';


import 'package:examen_flutter_casadojaime/data/repository/remote/remote_repository.dart';
import 'package:http/http.dart';

class HttpRemoteRepository implements RemoteRepository {
  final Client _client;

  HttpRemoteRepository(this._client);

  @override
  Future<HashMap> getComponentsList() async {
    var response = await _client.get('https://randomuser.me/api/?results=5');
    if (response.statusCode == 200) {
      HashMap<String, List> components = new HashMap();
      var jsonBody = json.decode(response.body);
      var jsonFace = jsonBody['face'];

      components['eyes'] = jsonFace['eyes'].cast<String>();
      components['eyes'] = jsonFace['eyes'].cast<String>();
      components['eyes'] = jsonFace['eyes'].cast<String>();

      return components;
    } else if (response.statusCode == 404) {
      throw HttpException("Error");
    }
  }
}
