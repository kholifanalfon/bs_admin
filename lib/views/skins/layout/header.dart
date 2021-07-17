import 'package:bs_admin/routes.dart';
import 'package:bs_admin/routes/login_route.dart';
import 'package:bs_admin/utils/config/hover_decoration.dart';
import 'package:bs_admin/utils/session.dart';
import 'package:bs_admin/views/skins/widgets/rounded_button.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';

class SkinHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xffd9d9d9),
            spreadRadius: 2.0,
            blurRadius: 10.0,
            offset: Offset(12.0, 0.0)
          )
        ]
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _HeaderLeftSide(),
          _HeaderRightSide(),
        ],
      ),
    );
  }
}

class _HeaderLeftSide extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Toggle sidebar button
          BreakPoint.isDesktop(context)
              || BreakPoint.isTablet(context) ? Container() : Container(
            child: Material(
              child: InkWell(
                child: Container(
                  child: Icon(Icons.format_align_justify_rounded,
                    color: Colors.black,
                    size: 24.0,
                  ),
                ),
                onTap: () => Scaffold.of(context).openDrawer(),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _HeaderRightSide extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          BsDropdownButton(
            toggleMenu: (_) {
              return RoundedButton(
                margin: EdgeInsets.only(right: 10.0),
                badge: Text('5'),
                icon: Icons.people_rounded,
                onPressed: () => _.toggle(),
              );
            },
            dropdownMenu: BsDropdownMenu(
              children: [
                BsDropdownItem(child: Text('Dropdown')),
                BsDropdownItem(child: Text('Dropdown Items')),
                BsDropdownDivider(),
                BsDropdownItem(child: Text('Dropdown Items')),
              ],
            )
          ),
          BsDropdownButton(
            toggleMenu: (_) {
              return RoundedButton(
                icon: Icons.settings_rounded,
                backgroundColor: Colors.blueAccent,
                color: Colors.white,
                hoverDecoration: HoverDecoration.blueAccent,
                onPressed: () => _.toggle(),
              );
            },
            dropdownMenu: BsDropdownMenu(
              children: [
                BsDropdownItem(child: Text('Logout'), onPressed: () async {
                  await SessionUtils.removeSession();
                  Routes.redirect(context, LoginRoute.login);
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}