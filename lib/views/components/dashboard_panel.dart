import 'package:bs_admin/views/utils/utils.dart';
import 'package:flutter/material.dart';

class TrenValue {

  const TrenValue(this.value, this.icon);

  final String value;

  final IconData icon;
}

class DashboardPanel extends StatefulWidget {

  const DashboardPanel({
    Key? key,
    required this.icon,
    required this.value,
    required this.title,
    this.trenValue,
    this.margin,
    this.padding = const EdgeInsets.fromLTRB(12.0, 15.0, 12.0, 15.0),
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DashboardPanelState();
  }

  final IconData icon;

  final String value;

  final String title;

  final TrenValue? trenValue;

  final EdgeInsetsGeometry? margin;

  final EdgeInsetsGeometry? padding;
}

class _DashboardPanelState extends State<DashboardPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          Utils.regular
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: Icon(widget.icon,
              size: 55.0,
            ),
          ),
          Expanded(child: Container(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(widget.value,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                      child: Text(widget.title,
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    )
                  ],
                ),
                widget.trenValue == null ? Container() : Positioned(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(widget.trenValue!.icon,
                          size: 12.0,
                          color: Colors.green
                        ),
                        Text(widget.trenValue!.value,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.green
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}