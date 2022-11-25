import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    this.lunch,
    this.dinner,
  });

  List<Dinner>? lunch;
  List<Dinner>? dinner;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    lunch: List<Dinner>.from(json["Lunch"].map((x) => Dinner.fromJson(x))),
    dinner: List<Dinner>.from(json["Dinner"].map((x) => Dinner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Lunch": List<dynamic>.from(lunch!.map((x) => x.toJson())),
    "Dinner": List<dynamic>.from(dinner!.map((x) => x.toJson())),
  };
}

class Dinner {
  Dinner({
    this.dinnerMenuNov22,
    this.column2,
    this.column3,
    this.column4,
    this.column5,
    //this.column6,
    this.lunchMenuNov22,
  });

  String? dinnerMenuNov22;
  String? column2;
  String? column3;
  String? column4;
  String? column5;
  //Column6? column6;
  String? lunchMenuNov22;

  factory Dinner.fromJson(Map<String, dynamic> json) => Dinner(
    dinnerMenuNov22: json["Dinner Menu (Nov-22)"] == null ? null : json["Dinner Menu (Nov-22)"],
    column2: json["Column2"],
    column3: json["Column3"],
    column4: json["Column4"] == null ? null : json["Column4"],
    column5: json["Column5"],
    //column6: json["Column6"] == null ? null : column6Values.map[json["Column6"]],
    lunchMenuNov22: json["Lunch Menu (Nov-22)"] == null ? null : json["Lunch Menu (Nov-22)"],
  );

  Map<String, dynamic> toJson() => {
    "Dinner Menu (Nov-22)": dinnerMenuNov22 == null ? null : dinnerMenuNov22,
    "Column2": column2,
    "Column3": column3,
    "Column4": column4 == null ? null : column4,
    "Column5": column5,
    //"Column6": column6 == null ? null : column6Values.reverse[column6],
    "Lunch Menu (Nov-22)": lunchMenuNov22 == null ? null : lunchMenuNov22,
  };
}