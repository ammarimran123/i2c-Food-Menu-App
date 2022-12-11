import 'package:flutter/material.dart';
import 'package:food_menu_app/routes/app_pages.dart';
import 'package:food_menu_app/services/notificationservice.dart';
import 'package:food_menu_app/themes/colors_theme.dart';
import 'package:food_menu_app/utils/constants.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'modules/today_menu/today_menu_binding.dart';
import 'modules/today_menu/today_menu_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(

    // The top level function, aka callbackDispatcher
      callbackDispatcher,

      // If enabled it will post a notification whenever
      // the task is running. Handy for debugging tasks
      isInDebugMode: false
  );
  Workmanager().registerPeriodicTask(
    "2",

    //This is the value that will be
    // returned in the callbackDispatcher
    "simplePeriodicTask",

    // When no frequency is provided
    // the default 15 minutes is set.
    // Minimum frequency is 15 min.
    // Android will automatically change
    // your frequency to 15 min
    // if you have configured a lower frequency.
    frequency: const Duration(hours: 6),
  );

  runApp(const MyApp());
}
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {

    NotificationService().initNotification();
    tz.initializeTimeZones();

    // initialise the plugin of flutterlocalnotifications.
    NotificationService().showNotification(
        1, 'Lucnh is ready!', 'Hurry up! Click to see the menu',lunchTime);
    NotificationService().showNotification(
        2, 'Dinner is ready!', 'Hurry up! Click to see the menu',dinnerTime);


    return Future.value(true);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/imageFoodl.jpg"), context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'i2c Food App',
      theme: ThemeColor().themeData,
      home: TodayMenuPage(),
      initialBinding: TodayMenuBinding(),
      getPages: AppPages.pages,
    );
  }
}
