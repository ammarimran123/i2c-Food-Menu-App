
import 'package:flutter/cupertino.dart';

 Map<int, Widget> tab_children = const <int, Widget>{
  1: Text(
    'Lunch',
    textAlign: TextAlign.center,
  ),
  2: Text(
    'Dinner',
    textAlign: TextAlign.center,
  ),
};
Map<int, String> functionMapper = const <int, String>{
  1: "lunch",
  2: "dinner",
};


const String api_url='https://i2cfoodmenu.000webhostapp.com/uploads/menu.json';
const String dateFormat="dd MMMM yyyy";
const String lunchTime="11:59:00";
const String dinnerTime="19:00:00";