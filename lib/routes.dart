import 'package:bs_admin/routes/home_route.dart';
import 'package:bs_admin/routes/login_route.dart';
import 'package:bs_admin/views/errors/page_not_found.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class Routes  {

  static void redirect(BuildContext context, String path) =>
      router.navigateTo(context, path, transition: TransitionType.fadeIn);

  static final router = FluroRouter();

  Routes() {
    LoginRoute.routes(this);

    HomeRoute.routes(this);

    router.notFoundHandler = Handler(
      handlerFunc: (context, parameters) => PageNotFoundView(),
    );
  }

  Route<dynamic>? generator(routeSettings) =>
      router.generator(routeSettings);

  void define(String routePath, {
    required Handler? handler,
    TransitionType? transitionType,
  }) => router.define(routePath, handler: handler, transitionType: TransitionType.fadeIn);
}