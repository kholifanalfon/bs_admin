import 'package:bs_admin/views/skins/layout/sidebar-menus-child.dart';
import 'package:flutter/material.dart';

class SidebarMenuItem extends StatefulWidget {

  const SidebarMenuItem({
    Key? key,
    required this.icon,
    required this.label,
    this.active = false,
    this.children = const [],
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SidebarMenuItem();
  }

  final String label;

  final IconData icon;

  final bool active;

  final List<SidebarMenuChild> children;
}

class _SidebarMenuItem extends State<SidebarMenuItem> {

  GlobalKey<State> _keyChildren = GlobalKey<State>();

  bool _onHover = false;

  bool isOpen = false;
  Duration _duration = Duration(milliseconds: 100);

  @override
  void initState() {
    isOpen = widget.active;
    super.initState();
  }

  void _updateState(VoidCallback function) {
    if(mounted)
      setState(() {
        function();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isOpen ? 5.0 : 10.0),
      child: Column(
        children: [
          AnimatedContainer(
            duration: _duration,
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Material(
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: _onHover || isOpen ? Colors.blueAccent : null,
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Icon(widget.icon,
                          size: 18.0,
                          color: _onHover || isOpen ? Colors.white : Color(0xff7f7f7f),
                        ),
                      ),
                      Expanded(child: Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Text(widget.label,
                          style: TextStyle(
                            color: _onHover || isOpen ? Colors.white : Color(0xff7f7f7f),
                          ),
                        ),
                      )),
                      widget.children.length == 0 ? Container() : Container(
                        child: Icon(isOpen ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_right_rounded,
                          size: 18.0,
                          color: _onHover || isOpen ? Colors.white : Color(0xff7f7f7f),
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  if(widget.children.length > 0)
                    _updateState(() => isOpen = isOpen ? false : true);
                },
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onHover: (hovered) => _updateState(() => _onHover = hovered),
              ),
              color: Colors.transparent,
            ),
          ),
          widget.children.length == 0 ? Container() : Container(
            key: _keyChildren,
            margin: EdgeInsets.only(left: 5.0),
            child: Opacity(
              opacity: isOpen ? 1 : 0,
              child: Container(
                height: !isOpen ? 0 : null,
                child: Column(
                  children: widget.children,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}