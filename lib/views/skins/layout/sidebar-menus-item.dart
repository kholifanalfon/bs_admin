import 'package:bs_admin/views/skins/layout/sidebar-menus-child.dart';
import 'package:bs_admin/views/utils/menus.dart';
import 'package:bs_admin/views/utils/overlay.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SidebarMenuItem extends StatefulWidget {

  const SidebarMenuItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.menuKey,
    this.active = false,
    this.children = const [],
    this.onPressed,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SidebarMenuItem();
  }

  final String label;

  final IconData icon;

  final bool active;

  final String menuKey;

  final List<SidebarMenuChild> children;

  final VoidCallback? onPressed;
}

class _SidebarMenuItem extends State<SidebarMenuItem> {

  GlobalKey<State> _keyContainer = GlobalKey<State>();
  bool _onHover = false;

  bool _overlayOpen = false;

  Duration _duration = Duration(milliseconds: 100);

  LayerLink _link = LayerLink();

  late UtilsMenusKey _utils;
  late FocusNode _focusNode;

  @override
  void initState() {
    _utils = UtilsMenus.add(() => _updateState(() {}));
    _utils.active = widget.active;

    _focusNode = FocusNode();
    _focusNode.addListener(_onFocus);
    super.initState();
  }

  void _onFocus() {
    if (_focusNode.hasFocus) open();
    else if(!_focusNode.hasFocus) close();
  }

  void _onKeyPressed(RawKeyEvent event) {
    if(event.logicalKey == LogicalKeyboardKey.escape)
      close();
  }

  void _updateState(VoidCallback function) {
    if(mounted)
      setState(() {
        function();
      });
  }

  void open() {
    UtilsOverlay.removeAll();

    UtilsOverlayEntry overlayEntry = UtilsOverlay.add(OverlayEntry(
      builder: (context) => SidebarMenuChildWrapper(
        containerKey: _keyContainer,
        layerLink: _link,
        children: widget.children,
      ),
    ), () => _updateState(() {
      _overlayOpen = false;
      _utils.setActive(false);
    }));
    
    Overlay.of(context)!.insert(overlayEntry.overlayEntry);
    FocusScope.of(context).requestFocus(_focusNode);

    _updateState(() {
      _overlayOpen = true;
      _utils.setActive(true);
    });
  }

  void close() {
    UtilsOverlay.removeAll();

    _updateState(() {
      _overlayOpen = false;
      _utils.setActive(false);
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget child = Container();
    if(BreakPoint.isDesktop(context))
      child = screenDesktop();

    else if(BreakPoint.isTablet(context))
      child = screenTablet();

    return child;
  }

  Widget screenDesktop() {
    return Container(
      margin: EdgeInsets.only(bottom: _utils.active ? 5.0 : 10.0),
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
                    color: _onHover || _utils.active ? Colors.blueAccent : null,
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Icon(widget.icon,
                          size: 18.0,
                          color: _onHover || _utils.active ? Colors.white : Color(0xff7f7f7f),
                        ),
                      ),
                      Expanded(child: Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Text(widget.label,
                          style: TextStyle(
                            color: _onHover || _utils.active ? Colors.white : Color(0xff7f7f7f),
                          ),
                        ),
                      )),
                      widget.children.length == 0 ? Container() : Container(
                        child: Icon(_utils.active ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_right_rounded,
                          size: 18.0,
                          color: _onHover || _utils.active ? Colors.white : Color(0xff7f7f7f),
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  UtilsMenus.updateAll();

                  if(widget.children.length > 0)
                    _updateState(() => _utils.setActive(true));

                  else if(widget.onPressed != null)
                    widget.onPressed!();
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
            margin: EdgeInsets.only(left: 5.0),
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

  Widget screenTablet() {
    return CompositedTransformTarget(
      link: _link,
      key: _keyContainer,
      child: RawKeyboardListener(
        focusNode: _focusNode,
        onKey: _onKeyPressed,
        child: Container(
          margin: EdgeInsets.only(bottom: 5.0),
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
                          color: _onHover || _utils.active ? Colors.blueAccent : null,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(widget.icon,
                              size: 30.0,
                              color: _onHover || _utils.active ? Colors.white : Color(0xff7f7f7f),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      UtilsMenus.updateAll();

                      if(widget.children.length > 0 && !_overlayOpen)
                        open();

                      else if(widget.children.length > 0 && _overlayOpen)
                        close();

                      else if(widget.onPressed != null)
                        widget.onPressed!();
                    },
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onHover: (hovered) => _updateState(() => _onHover = hovered),
                  ),
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}