import 'package:get/get.dart';
import 'package:todo_app/views/home_view.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: HomeView.id,
      page: () => HomeView(),
    ),
  ];
}
