import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';

class SidebarProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SidebarProfileState();
  }
}

class _SidebarProfileState extends State<SidebarProfile> {

  @override
  Widget build(BuildContext context) {
    Widget widget = Container();
    if(BreakPoint.isDesktop(context))
      widget = screenDesktop();

    else if(BreakPoint.isTablet(context))
      widget = screenTablet();

    return widget;
  }

  Widget screenDesktop() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: EdgeInsets.only(bottom: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.5),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Text('Bambang Sujatmiko', style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            )),
          ),
          Text('Superadmin', style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
            fontWeight: FontWeight.w100,
          ))
        ],
      ),
    );
  }

  Widget screenTablet() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}