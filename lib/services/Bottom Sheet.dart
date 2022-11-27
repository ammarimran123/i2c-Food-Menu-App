

import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../modules/today_menu/today_menu_controller.dart';
import '../themes/colors_theme.dart';
import '../utils/constants.dart';
import 'MenuTable.dart';


  openBottomSheet(TodayMenuController controller,BuildContext context) {
    Get.bottomSheet(
      StatefulBuilder(
        builder: (context, setState) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  child: CustomSlidingSegmentedControl<int>(

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
                      setState(() {
                        controller.setCurrentUpcomingTabMenu(newValue);
                      });


                    },
                  ),
                ),
                SizedBox(

                    height: MediaQuery
                        .of(context)
                        .size
                        .height*0.85,
                    child: ListView.builder(
                        itemCount: controller.lunch.length-1-controller.date.day,
                        itemBuilder: (context, int index) {
                          return Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(7.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),

                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                 Center(

                                    child:Text(
                                      "${controller.dinner[index+1+controller.date.day].column2} - ${DateFormat(dateFormat).format(controller.date.add(Duration(days: index)))}", style: TextStyle(fontWeight: FontWeight.bold),)
                                ),
                                menuTableUpcoming(controller, index+1+controller.date.day,context),
                              ],
                            )


                          );
                        })


                ),
              ],
            ),
          );
        },
      ),
      backgroundColor: ThemeColor.GreyMenu,

      elevation: 0,
      isScrollControlled: true,
      ignoreSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

