import 'package:bs_admin/utils/styles.dart';
import 'package:bs_admin/views/skins/layout/sidebar-menus.dart';
import 'package:bs_admin/views/skins/layout/sidebar-profile.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';

class SkinSidebar extends StatelessWidget {

  const SkinSidebar({
    Key? key,
    this.shadow = true,
    this.menuKey,
  }) : super(key: key);

  final bool shadow;

  final String? menuKey;

  @override
  Widget build(BuildContext context) {

    Widget widget = screenDesktop();

    if(BreakPoint.isTablet(context))
      widget = screenTablet();

    return SafeArea(child: widget);
  }

  Widget screenDesktop() {
    return Container(
      width: 250,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: !shadow ? [] : [Styles.shadowRegular]
        ),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Container(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                      child: Text('ADMIN TEMPLATE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      )
                  )),
                ],
              ),
            ),
            SidebarProfile(),
            Expanded(child: Scrollbar(
              child: SingleChildScrollView(
                child: SidebarMenus(menuKey: menuKey),
              ),
            )),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text('Version 1.0.0', style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 12.0,
              )),
            )
          ],
        ),
      ),
    );
  }

  Widget screenTablet() {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: !shadow ? [] : [Styles.shadowRegular]
      ),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: Text('ADMIN TEMPLATE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  )
                )),
              ],
            ),
          ),
          SidebarProfile(),
          Expanded(child: Scrollbar(
            child: SingleChildScrollView(
              child: SidebarMenus(menuKey: menuKey),
            ),
          ))
        ],
      ),
    );
  }
}