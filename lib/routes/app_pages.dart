import 'package:get/get.dart';


import '../modules/today_menu/today_menu_binding.dart';
import '../modules/today_menu/today_menu_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.todayMenu,
      page: () => TodayMenuPage(),
      binding: TodayMenuBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.movieDetails,
    //   page: () => MovieDetailsPage(),
    //   binding: MovieDetailsBinding(),
    // ),
  ];
}
