import 'package:get/get.dart';
import 'login_page.dart';
import 'pages/main_menu.dart';
import 'pages/detail_makanan_pages.dart';

class Routes {
  static const String login_page = "/login";
  static const String main_menu = "/main_menu";
  static const String detail_makanan = "/detail_makanan";

  static final myPages = [
    GetPage(name: login_page, page: () => LoginPage()),
    GetPage(name: main_menu, page: () => MainMenu()),
    GetPage(name: detail_makanan, page: () => DetailMakananPage()),
  ];
}     
