import 'package:bs_admin/views/utils/menus.dart';
import 'package:bs_admin/views/utils/overlay.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';

class SidebarMenuChild extends StatefulWidget {

  const SidebarMenuChild({
    Key? key,
    required this.label,
    required this.menuKey,
    this.active = false,
    this.children = const [],
    this.onPressed,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SidebarMenuChildState();
  }

  final String label;

  final bool active;

  final String menuKey;

  final List<SidebarMenuChild> children;

  final VoidCallback? onPressed;

}

class _SidebarMenuChildState extends State<SidebarMenuChild> {

  GlobalKey<State> _keyChildren = GlobalKey<State>();

  bool _onHover = false;

  Duration _duration = Duration(milliseconds: 100);

  late UtilsMenusKey _utils;

  @override
  void initState() {
    _utils = UtilsMenus.add(() => _updateState(() { }));
    _utils.active = widget.active;
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
                    color: _onHover || _utils.active ? Colors.blueAccent : Color(0xff7f7f7f),
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
                                  color: _onHover || _utils.active ? Colors.blueAccent : Color(0xff7f7f7f),
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                      onTap: () {
                        if(widget.children.length > 0)
                          _updateState(() => _utils.setActive(true));

                        else if(widget.onPressed != null) {
                          if(BreakPoint.isMobile(context))
                            Navigator.pop(context);

                          else if(BreakPoint.isTablet(context))
                            UtilsOverlay.removeAll();

                          widget.onPressed!();
                          UtilsOverlay.removeAll();
                        }
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
                  child: Icon(_utils.active ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_right_rounded,
                    size: 18.0,
                    color: _onHover || _utils.active ? Colors.blueAccent : Color(0xff7f7f7f),
                  ),
                )
              ],
            ),
          ),
          Container(
            key: _keyChildren,
            margin: EdgeInsets.only(left: 8.0),
            child: Opacity(
              opacity: _utils.active ? 1 : 0,
              child: Container(
                height: !_utils.active ? 0 : null,
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

class SidebarMenuChildWrapper extends StatefulWidget {

  const SidebarMenuChildWrapper({
    required this.containerKey,
    required this.layerLink,
    required this.children
  });

  @override
  State<StatefulWidget> createState() {
    return _SidebarMenuChildWrapper();
  }

  final GlobalKey<State> containerKey;

  final LayerLink layerLink;

  final List<SidebarMenuChild> children;
}

class _SidebarMenuChildWrapper extends State<SidebarMenuChildWrapper> {

  GlobalKey<State> _key = GlobalKey<State>();

  Size _size = Size(0.0, 0.0);

  double _overlayHeight = 0;
  bool _overlayShow = false;

  @override
  void initState() {
    RenderBox renderBox = widget.containerKey.currentContext!.findRenderObject() as RenderBox;
    _size = renderBox.size;
    super.initState();
  }

  void _updateState(VoidCallback function) {
    if(mounted)
      setState(() {
        function();
      });
  }

  void _updateLayout() {
    Future.delayed(Duration(milliseconds: 100), () {
      if(_key.currentContext != null) {
        RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
        Size size = renderBox.size;
        Offset offset = renderBox.localToGlobal(Offset.zero);
        Size screenSize = MediaQuery.of(context).size;

        double topHeight = offset.dy + _size.height;
        double bottomHeight = screenSize.height - offset.dy;

        if(size.height > bottomHeight) {
          _overlayHeight = bottomHeight;
          if(topHeight > bottomHeight)
            _overlayHeight = topHeight;
        }

        _updateState(() => _overlayShow = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(!_overlayShow)
      _updateLayout();

    return Container(
      child: Stack(
        children: [
          Positioned(
            width: 200,
            height: _overlayHeight != 0 ? _overlayHeight : null,
            child: CompositedTransformFollower(
              link: widget.layerLink,
              showWhenUnlinked: false,
              offset: Offset(_size.width + 8.0, 0),
              child: Container(
                key: _key,
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0, 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffd9d9d9),
                        spreadRadius: 4.0,
                        blurRadius: 12.0,
                        offset: Offset(10.0, 0.0)
                      )
                    ]
                ),
                child: Column(children: widget.children),
              ),
            ),
          )
        ],
      ),
    );
  }
}