import 'package:bs_admin/routes.dart';
import 'package:bs_admin/utils/session.dart';
import 'package:bs_admin/views/login/widget/login.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class LoginRoute {

  static String routeKey = 'login';
  static String login = '/$routeKey';

  static void routes(Routes router) {
    router.define(login, handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) => Session(
        guest: true,
        builder: (context) async {
          return LoginView();
        },
      ),
    ));
  }

}