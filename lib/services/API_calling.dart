
import 'dart:convert';

import '../models/model.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http;

class MenuAPI{
  Future<Model> fetchAlbum() async {
    final response = await http
        .get(Uri.parse(api_url));

    if (response!= null) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //print(Model.fromJson(jsonDecode(response.body)).lunch![8]) ;
      //_userModel=Model.fromJson(jsonDecode(response.body));
      return Model.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }



}