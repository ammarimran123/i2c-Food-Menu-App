import 'package:food_menu_app/modules/today_menu/today_menu_controller.dart';
import 'package:get/get.dart';

class TodayMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodayMenuController());
  }
}