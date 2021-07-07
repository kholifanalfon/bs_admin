import 'package:bs_admin/views/skins/widgets/breadcrumbs.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkinContent extends StatefulWidget {

  const SkinContent({
    Key? key,
    this.title,
    this.subTitle,
    this.breadcrumbs = const [],
    this.child,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SkinContentState();
  }

  final String? title;

  final String? subTitle;

  final List<Breadcrumbs> breadcrumbs;

  final Widget? child;
}

class _SkinContentState extends State<SkinContent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              BreakPoint.isDesktop(context) ? screenDesktop() : Container(),
              BreakPoint.isTablet(context) ? screenDesktop() : Container(),
              BreakPoint.isMobile(context) ? screenMobile() : Container(),
              Container(child: widget.child),
            ],
          ),
        ),
      )),
    );
  }

  Widget screenDesktop() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 20.0),
      child: Row(
        children: [
          widget.title == null ? Container() : Expanded(child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${widget.title}',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                widget.subTitle == null ? Container() : Container(
                  padding: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 3.0),
                  child: Text('${widget.subTitle}',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                )
              ],
            ),
          )),
          widget.breadcrumbs.length == 0 ? Container() : Expanded(child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: widget.breadcrumbs.map((breadcrumb) {
                int index = widget.breadcrumbs.indexOf(breadcrumb);
                breadcrumb.active = !(index < widget.breadcrumbs.length - 1);

                return Row(
                  children: [
                    index == 0 ? Container() : Container(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.keyboard_arrow_right_rounded,
                        size: 16.0,
                      ),
                    ),
                    Container(child: breadcrumb)
                  ],
                );
              }).toList(),
            ),
          ))
        ],
      ),
    );
  }

  Widget screenMobile() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title == null ? Container() : Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(children: [
                  Expanded(child: Text('${widget.title}',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                    ),
                  ))
                ]),
                widget.subTitle == null ? Container() : Row(
                  children: [
                    Expanded(child: Container(
                      padding: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 3.0),
                      child: Text('${widget.subTitle}',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
          widget.breadcrumbs.length == 0 ? Container() : Container(
            child: Row(
              children: widget.breadcrumbs.map((breadcrumb) {
                int index = widget.breadcrumbs.indexOf(breadcrumb);
                breadcrumb.active = !(index < widget.breadcrumbs.length - 1);

                return Row(
                  children: [
                    index == 0 ? Container() : Container(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.keyboard_arrow_right_rounded,
                        size: 16.0,
                      ),
                    ),
                    Container(child: breadcrumb)
                  ],
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}