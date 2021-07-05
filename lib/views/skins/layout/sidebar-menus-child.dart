import 'package:flutter/material.dart';

class SidebarMenuChild extends StatefulWidget {

  const SidebarMenuChild({
    Key? key,
    required this.label,
    this.active = false,
    this.children = const [],
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SidebarMenuChildState();
  }

  final String label;

  final bool active;

  final List<SidebarMenuChild> children;

}

class _SidebarMenuChildState extends State<SidebarMenuChild> {

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
      child: Column(
        children: [
          AnimatedContainer(
            duration: _duration,
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            margin: EdgeInsets.only(left: 10.0, top: 5.0),
            decoration: BoxDecoration(
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15.0),
                  child: Icon(Icons.circle,
                    size: 5.0,
                    color: _onHover || isOpen ? Colors.blueAccent : Color(0xff7f7f7f),
                  ),
                ),
                Expanded(child: Container(
                  child: Material(
                    child: InkWell(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(child: Container(
                              child: Text(widget.label,
                                style: TextStyle(
                                  color: _onHover || isOpen ? Colors.blueAccent : Color(0xff7f7f7f),
                                ),
                              ),
                            ))
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
                )),
                widget.children.length == 0 ? Container() : Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Icon(isOpen ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_right_rounded,
                    size: 18.0,
                    color: _onHover || isOpen ? Colors.blueAccent : Color(0xff7f7f7f),
                  ),
                )
              ],
            ),
          ),
          Container(
            key: _keyChildren,
            margin: EdgeInsets.only(left: 8.0),
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