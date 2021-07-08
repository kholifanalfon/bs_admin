import 'package:bs_admin/routes.dart';
import 'package:bs_admin/routes/home_route.dart';
import 'package:bs_admin/routes/masters/type_route.dart';
import 'package:bs_admin/views/skins/layout/sidebar-menus-child.dart';
import 'package:bs_admin/views/skins/layout/sidebar-menus-item.dart';
import 'package:flutter/material.dart';

class SidebarMenus extends StatefulWidget {

  const SidebarMenus({
    Key? key,
    this.menuKey,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SidebarMenusState();
  }

  final String? menuKey;
}

class _SidebarMenusState extends State<SidebarMenus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scrollbar(child: SingleChildScrollView(
        child: Column(
          children: [
            SidebarMenuItem(
              active: widget.menuKey == HomeRoute.routeKey,
              menuKey: HomeRoute.routeKey,
              icon: Icons.dashboard,
              label: 'Dashboard',
              onPressed: () => Routes.redirect(context, HomeRoute.home),
            ),
            SidebarMenuItem(
              active: widget.menuKey == HomeRoute.homeSession,
              menuKey: HomeRoute.routeKey,
              icon: Icons.dashboard,
              label: 'Session Page',
              onPressed: () => Routes.redirect(context, HomeRoute.homeSession),
            ),
            SidebarMenuItem(
              active: [TypeRoute.routeKey].contains(widget.menuKey),
              icon: Icons.dashboard_rounded,
              menuKey: 'master',
              label: 'Masters',
              children: [
                SidebarMenuChild(
                  active: TypeRoute.routeKey == widget.menuKey,
                  label: 'Types',
                  menuKey: TypeRoute.routeKey,
                  onPressed: () => Routes.redirect(context, TypeRoute.user),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
