import 'package:bs_admin/views/skins/layout/sidebar-menus-child.dart';
import 'package:bs_admin/views/skins/layout/sidebar-menus-item.dart';
import 'package:bs_admin/views/utils/overlay.dart';
import 'package:flutter/material.dart';

class SidebarMenus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SidebarMenusState();
  }
}

class _SidebarMenusState extends State<SidebarMenus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scrollbar(child: SingleChildScrollView(
        child: Column(
          children: [
            SidebarMenuItem(
              active: true,
              menuKey: 'dashboard',
              icon: Icons.dashboard,
              label: 'Dashboard',
              onPressed: () => UtilsOverlay.removeAll(),
            ),
            SidebarMenuItem(
              icon: Icons.widgets,
              menuKey: 'widgets',
              label: 'Widgets',
              children: [
                SidebarMenuChild(
                  label: 'Sub Item',
                  menuKey: 'subitem',
                  children: [
                    SidebarMenuChild(
                      label: 'Sub Item 1',
                      menuKey: 'subitem1',
                      children: [
                        SidebarMenuChild(
                          label: 'Sub Item 1.1',
                          menuKey: 'subitem1.1',
                          onPressed: () => UtilsOverlay.removeAll(),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            SidebarMenuItem(
              icon: Icons.settings_rounded,
              menuKey: 'settings',
              label: 'Settings',
              children: [
                SidebarMenuChild(
                  label: 'Users',
                  menuKey: 'users',
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
