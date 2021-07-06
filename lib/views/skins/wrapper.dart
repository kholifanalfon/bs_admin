import 'package:bs_admin/views/skins/layout/content.dart';
import 'package:bs_admin/views/skins/layout/header.dart';
import 'package:bs_admin/views/skins/layout/sidebar.dart';
import 'package:bs_admin/views/skins/widgets/breadcrumbs.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {

  const Wrapper({
    Key? key,
    this.title,
    this.subTitle,
    this.child,
    this.breadcrumbs = const [],
  }) : super(key: key);

  final String? title;

  final String? subTitle;

  final List<Breadcrumbs> breadcrumbs;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BreakPoint.isMobile(context) ? SkinSidebar(shadow: false) : null,
      body: Container(
        child: Row(
          children: [
            BreakPoint.isDesktop(context)
                || BreakPoint.isTablet(context) ? SkinSidebar() : Container(),
            Expanded(child: Container(
              child: Column(
                verticalDirection: VerticalDirection.up,
                children: [
                  SkinContent(
                    title: title,
                    subTitle: subTitle,
                    breadcrumbs: breadcrumbs,
                    child: child,
                  ),
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