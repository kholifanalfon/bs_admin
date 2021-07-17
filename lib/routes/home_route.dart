import 'package:bs_admin/routes.dart';
import 'package:bs_admin/utils/session.dart';
import 'package:bs_admin/views/home.dart';
import 'package:fluro/fluro.dart';

class HomeRoute{

  static String routeKey = '';
  static String home = '/$routeKey';
  static String homeSession = '/$routeKey/session';

  static void routes(Routes router) {
    router.define(home, handler: Handler(
      handlerFunc: (context, parameters) => Session(
        builder: (context) async {
          return HomeView();
        },
      ),
    ));
    router.define(homeSession, handler: Handler(
      handlerFunc: (context, parameters) => Session(
        builder: (context) async {
          return HomeView();
        },
      ),
    ));
  }
}