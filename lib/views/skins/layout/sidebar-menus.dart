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
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(24.0, 18.0, 24.0, 18.0),
                    backgroundColor: Colors.blueAccent.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))
                    )
                ),
                onPressed: () {},
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.dashboard,
                          size: 20.0,
                        ),
                      ),
                      Text('Dasboard'),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(24.0, 18.0, 24.0, 18.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))
                    )
                ),
                onPressed: () {},
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.widgets_outlined,
                          size: 20.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text('Widgets', style: TextStyle(
                          color: Colors.grey
                      )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
