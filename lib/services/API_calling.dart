
import 'dart:convert';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../models/model.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http;

class MenuAPI{
  Future<Model> fetchAlbum() async {
    var response = await DefaultCacheManager().getSingleFile(api_url);
    //String response=file.readAsStringSync();

    //print(file.readAsStringSync());
    //final response = await http.get(Uri.parse(api_url));

    if (response!= null) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //print(Model.fromJson(jsonDecode(response.body)).lunch![8]) ;
      //_userModel=Model.fromJson(jsonDecode(response.body));
      String s=nullCheck1(response.readAsStringSync());
      s=nullCheck2(s);
      return Model.fromJson(jsonDecode(s));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }

 nullCheck1(String s){
    return s.replaceAll("null,", "");
 }
  nullCheck2(String s){
    return s.replaceAll("null", "");
  }

}