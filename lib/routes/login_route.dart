import 'package:bs_admin/routes.dart';
import 'package:bs_admin/views/login/login.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class LoginRoute {

  static String routeKey = 'login';
  static String login = '/$routeKey';

  @override
  static void routes(Routes router) {
    router.define(login, handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return LoginView();
      },
    ));
  }

}