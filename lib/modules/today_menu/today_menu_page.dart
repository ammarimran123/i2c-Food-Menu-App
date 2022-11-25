import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:food_menu_app/modules/today_menu/today_menu_controller.dart';
import 'package:food_menu_app/utils/constants.dart';
import 'package:get/get.dart';

import '../../services/Bottom Sheet.dart';
import '../../services/MenuTable.dart';
import '../../themes/colors_theme.dart';
import '../../utils/constants.dart';
import '../../utils/constants.dart';
import '../../utils/constants.dart';
import '../../utils/constants.dart';


class TodayMenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
Size size=MediaQuery.of(context).size ;

    return GetBuilder<TodayMenuController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            :SingleChildScrollView(

          child: Column(
            children: [
              Container(

                height: size.height*0.65,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  //borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image:  AssetImage('assets/images/imageFoodl.jpg',),
                    fit: BoxFit.cover,
                  ),

                ),
              ),
              SizedBox(height: 12,),
              Container(
                  width: MediaQuery.of(context).size.width,
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                  child: Column(
                    children: [
                      SizedBox(height: 12,),
                      const Text(
                        'Todays Menu',
                        style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Container(
                        child: tabWidget(controller),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,

                        ),
                        child: menuTable(controller,controller.date.day,context),
                      ),SizedBox(height: 10,),
                      InkWell(
                  onTap: () {
                    openBottomSheet(controller,context);

                  },
                               child: new Center(
                               //padding: new EdgeInsets.all(10.0),
                                     child: new Text("Upcoming Days Menu",style: TextStyle(color: Colors.blueAccent),),
                  ),
                )



                    ],
                  ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  tabWidget(TodayMenuController controller){
    return CustomSlidingSegmentedControl<int>(

      isStretch: true,
      children: tab_children,
      innerPadding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(14),
      ),
      thumbDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius: 4.0,
            spreadRadius: 1.0,
            offset: const Offset(
              0.0,
              2.0,
            ),
          ),
        ],
      ),
      onValueChanged: (int newValue) {
        controller.setCurrentTabMenu(newValue);

      },
    );

  }



}