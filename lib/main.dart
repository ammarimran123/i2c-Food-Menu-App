import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:food_menu_app/routes/app_pages.dart';
import 'package:food_menu_app/services/notificationservice.dart';
import 'package:food_menu_app/themes/colors_theme.dart';
import 'package:food_menu_app/utils/constants.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/intl.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'modules/today_menu/today_menu_binding.dart';
import 'modules/today_menu/today_menu_page.dart';

Future<void> main() async {
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
    frequency: const Duration(minutes: 60),
  );
  if(DateTime.now().day==1) {
    await DefaultCacheManager().emptyCache();
  }
    runApp(const MyApp());
  }

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {

    NotificationService().initNotification();
    tz.initializeTimeZones();

    await NotificationService().showNotification(
        1, 'Lucnh is ready!', 'Hurry up! Click to see the menu',lunchTime);
    print("Ammar");
    NotificationService().showNotification(
        2, 'Dinner is ready!', 'Hurry up! Click to see the menu',dinnerTime);
    // var now = DateTime.now();
    // // String formattedTime = DateFormat.Hms().format(now);
    // String day=DateFormat('dd-MM-yyyy').format(now);
    // print(day+ "123459");
    // print(day+ lunchTime);
    // print(day+ dinnerTime);
    // // initialise the plugin of flutterlocalnotifications.
    // DateTime lunchChecker = DateTime.parse('$day $lunchTime');
    // print(day+ lunchTime);
    // DateTime dinnerChecker = DateTime.parse('$day $dinnerTime');
    // print(day + dinnerTime);
    // if(now.isBefore(lunchChecker)){
    //   await NotificationService().showNotification(
    //       1, 'Lucnh is ready!', 'Hurry up! Click to see the menu',lunchTime);
    // }
    // if(now.isBefore(dinnerChecker)){
    //   NotificationService().showNotification(
    //       2, 'Dinner is ready!', 'Hurry up! Click to see the menu',dinnerTime);
    // }

    // NotificationService().showNotification(
    //     3, 'Testing notification', 'Hurry up! Click to see the menu',formattedTime);


    return Future.value(true);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/imageFoodl.jpg"), context); //Image Caching
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
