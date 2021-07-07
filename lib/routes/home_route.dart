import 'package:bs_admin/routes.dart';
import 'package:bs_admin/views/home.dart';
import 'package:fluro/fluro.dart';

class HomeRoute{

  static String routeKey = '';
  static String home = '/$routeKey';

  static void routes(Routes router) {
    router.define(home, handler: Handler(
      handlerFunc: (context, parameters) {
        return HomeView();
      },
    ));
  }
}