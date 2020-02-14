import 'dart:convert';
import 'dart:io';


import 'package:examen_flutter_casadojaime/data/repository/remote/remote_repository.dart';
import 'package:http/http.dart';

class HttpRemoteRepository implements RemoteRepository {
  final Client _client;

  HttpRemoteRepository(this._client);

  @override
  Future<Map<String, List<String>>> getComponentsList() async {
    var response = await _client.get('https://api.adorable.io/avatars/list');
    if (response.statusCode == 200) {
      Map<String, List<String>> components = {};
      var jsonBody = json.decode(response.body);
      print(jsonBody);
      var jsonFace = jsonBody['face'];

      components['eyes'] = jsonFace['eyes'].cast<String>();
      components['nose'] = jsonFace['nose'].cast<String>();
      components['mouth'] = jsonFace['mouth'].cast<String>();

      return components;
    } else if (response.statusCode == 404) {
      throw HttpException("Error");
    }
  }
}
