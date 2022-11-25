import 'package:flutter/material.dart';

import '../modules/today_menu/today_menu_controller.dart';

menuTable(TodayMenuController controller,int index,BuildContext context){
  //String menuDecider=functionMapper[currentvalue].toString();

  if(controller.currentvalue==1) {
    return DataTable(
      //dataRowHeight: 30.0,


        columns: [

          DataColumn(label: Text(
            'Main Dish', style: TextStyle(fontWeight: FontWeight.bold),),),
          DataColumn(
              label: Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.47,
                      child: Text(controller.lunch[index].column3.toString())))),

        ],
        rows: [
          // Set the values to the columns
          DataRow(cells: [
            DataCell(

                Text(
              "Side Dish", style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            DataCell(Text(controller.lunch[index].column4.toString())),

          ]),
          DataRow(cells: [
            DataCell(Text(
              "Sweet Dish", style: TextStyle(fontWeight: FontWeight.bold),)),
            DataCell(Text(controller.lunch[index].column5.toString())),

          ]),
        ]


    );
  }
  else if(controller.currentvalue==2){
    return DataTable(

        columns: [

          DataColumn(label: Text(
            'Main Dish', style: TextStyle(fontWeight: FontWeight.bold),),),
          DataColumn(
              label: Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width*0.47,
                      child: Text(controller.dinner[index].column3.toString())))),

        ],
        rows: [
          // Set the values to the columns
          DataRow(cells: [
            DataCell(Text(
              "Side Dish", style: TextStyle(fontWeight: FontWeight.bold),)),
            DataCell(Text(controller.dinner[index].column4.toString())),

          ]),
          DataRow(cells: [
            DataCell(Text(
              "Sweet Dish", style: TextStyle(fontWeight: FontWeight.bold),)),
            DataCell(Text(controller.dinner[index].column5.toString())),

          ]),
        ]


    );
  }
  else{
    return Exception('error');

  }
}
menuTableUpcoming(TodayMenuController controller,int index,BuildContext context){
  //String menuDecider=functionMapper[currentvalue].toString();

  if(controller.currentValueUpcoming==1) {
    return DataTable(
      //dataRowHeight: 30.0,


        columns: [

          DataColumn(label: Text(
            'Main Dish', style: TextStyle(fontWeight: FontWeight.bold),),),
          DataColumn(
              label: Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width*0.47,
                      child: Text(controller.lunch[index].column3.toString())))),

        ],
        rows: [
          // Set the values to the columns
          DataRow(cells: [
            DataCell(

                Text(
                  "Side Dish", style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            DataCell(Text(controller.lunch[index].column4.toString())),

          ]),
          DataRow(cells: [
            DataCell(Text(
              "Sweet Dish", style: TextStyle(fontWeight: FontWeight.bold),)),
            DataCell(Text(controller.lunch[index].column5.toString())),

          ]),
        ]


    );
  }
  else if(controller.currentValueUpcoming==2){
    return DataTable(

        columns: [

          DataColumn(label: Text(
            'Main Dish', style: TextStyle(fontWeight: FontWeight.bold),),),
          DataColumn(
              label: Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width*0.47,
                      child: Text(controller.dinner[index].column3.toString())))),

        ],
        rows: [
          // Set the values to the columns
          DataRow(cells: [
            DataCell(Text(
              "Side Dish", style: TextStyle(fontWeight: FontWeight.bold),)),
            DataCell(Text(controller.dinner[index].column4.toString())),

          ]),
          DataRow(cells: [
            DataCell(Text(
              "Sweet Dish", style: TextStyle(fontWeight: FontWeight.bold),)),
            DataCell(Text(controller.dinner[index].column5.toString())),

          ]),
        ]


    );
  }
  else{
    return Exception('error');

  }
}