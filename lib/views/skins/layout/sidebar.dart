import 'package:bs_admin/views/skins/layout/sidebar-menus.dart';
import 'package:bs_admin/views/skins/layout/sidebar-profile.dart';
import 'package:flutter/material.dart';

class SkinSidebar extends StatelessWidget {

  const SkinSidebar({
    Key? key,
    this.shadow = true,
  }) : super(key: key);

  final bool shadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: !shadow ? [] : [
            BoxShadow(
              color: Color(0xffd9d9d9),
              spreadRadius: 8.0,
              blurRadius: 16.0,
            )
          ]
        ),
        child: Column(
          children: [
            Expanded(child: Scrollbar(
              child: SingleChildScrollView(
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
                    SidebarMenus(),
                  ],
                ),
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
}