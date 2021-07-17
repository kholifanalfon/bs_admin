import 'package:bs_admin/routes.dart';
import 'package:bs_admin/utils/session.dart';
import 'package:bs_admin/views/masters/types/widget/type.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class TypeRoute {

  static String routeKey = 'type';
  static String type = '/type';

  static void routes(Routes router) {
    router.define(type, handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) => Session(
        builder: (context) async {
          return TypeView();
        },
      ),
    ));
  }

}