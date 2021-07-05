import 'package:bs_admin/views/skins/layout/sidebar-menus-child.dart';
import 'package:bs_admin/views/skins/layout/sidebar-menus-item.dart';
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
              icon: Icons.dashboard,
              label: 'Dashboard',
            ),
            SidebarMenuItem(
              icon: Icons.widgets,
              label: 'Widgets',
              children: [
                SidebarMenuChild(
                  label: 'Sub Item',
                  children: [
                    SidebarMenuChild(
                      label: 'Sub Item 1',
                      children: [
                        SidebarMenuChild(
                          label: 'Sub Item 1.1',
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
