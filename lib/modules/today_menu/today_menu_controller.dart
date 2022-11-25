import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/model.dart';
import '../../services/API_calling.dart';


class TodayMenuController extends GetxController {
  MenuAPI menu_api=MenuAPI();
   List<Dinner> lunch = [];
  List<Dinner> dinner = [];
  bool isLoading = true;
  int currentvalue=1;
  int currentValueUpcoming=1;
  DateTime date=DateTime.now();
  late BottomSheet popUpSheet;


  @override
  void onInit() async{
    super.onInit();
    fetchMenu();


  }
  void setCurrentTabMenu(int newValue ){
    currentvalue=newValue;
    update();
  }
  void setCurrentUpcomingTabMenu(int newValue ){
    currentValueUpcoming=newValue;
    update();
  }

  void fetchMenu() async {
    var response = await menu_api.fetchAlbum();
    if( response!=null){
      for(int i=0; i<response.dinner!.length;i++){
        lunch.add(response.lunch![i]);
        dinner.add(response.dinner![i]);
      }
    }
       isLoading = false;
       update();
    }



}