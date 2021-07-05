import 'package:bs_admin/views/skins/layout/header.dart';
import 'package:bs_admin/views/skins/layout/sidebar.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BreakPoint.isMobile(context)
          || BreakPoint.isTablet(context) ? SkinSidebar(shadow: false) : null,
      body: Container(
        child: Row(
          children: [
            BreakPoint.isDesktop(context) ? SkinSidebar() : Container(),
            Expanded(child: Container(
              child: Column(
                children: [
                  SkinHeader(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

}