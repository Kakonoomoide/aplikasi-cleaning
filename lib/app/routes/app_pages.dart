import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list/bindings/list_binding.dart';
import '../modules/list/views/list_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/rekap/bindings/rekap_binding.dart';
import '../modules/rekap/views/rekap_view.dart';
import '../modules/search/bindings/search_binding.dart';
import 'package:final_project_2023/app/modules/list/views/list_view.dart';
import '../modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HomeView;

  static final routes = [
    GetPage(
      name: _Paths.HomeView,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.REKAP,
      page: () => Rekapan(),
      binding: RekapBinding(),
    ),
    GetPage(
      name: _Paths.LIST,
      page: () => const ListRekap(),
      binding: ListBinding(),
    ),
  ];
}
