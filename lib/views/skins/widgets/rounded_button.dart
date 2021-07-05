import 'package:bs_admin/utils/config/hover_decoration.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {

  const RoundedButton({
    Key? key,
    required this.icon,
    this.margin,
    this.badge,
    this.color = Colors.black,
    this.backgroundColor = const Color(0xfff1f1f1),
    this.hoverDecoration = const HoverDecoration(),
    this.onPressed,
  }) : super(key: key);

  final Color backgroundColor;

  final Color color;

  final HoverDecoration hoverDecoration;

  final VoidCallback? onPressed;

  final Widget? badge;

  final IconData icon;

  final EdgeInsetsGeometry? margin;

  @override
  State<StatefulWidget> createState() {
    return _RoundedButtonState();
  }
}

class _RoundedButtonState extends State<RoundedButton>{

  bool _hovered = false;

  Duration _duration = Duration(milliseconds: 200);

  Color get _backgroundColor => _hovered
      ? widget.hoverDecoration.backgroundColor
      : widget.backgroundColor;

  Color get _color => _hovered
      ? widget.hoverDecoration.color
      : widget.color;

  @override
  void initState() {
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
    return AnimatedContainer(
      duration: _duration,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(50.0)
      ),
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(50.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                clipBehavior: Clip.none,
                padding: EdgeInsets.all(8.0),
                child: Icon(widget.icon,
                  color: _color,
                  size: 18.0,
                ),
              ),
              widget.badge == null ? Container() : Positioned(
                right: -5,
                top: -5,
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.white
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 3.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: widget.badge,
                  ),
                ),
              )
            ],
          ),
          onTap: widget.onPressed,
          onHover: (hovered) => _updateState(() {
            _hovered = hovered;
          }),
          splashColor: widget.hoverDecoration.splashColor,
          highlightColor: widget.hoverDecoration.highlightColor,
          mouseCursor: widget.onPressed == null ? SystemMouseCursors.noDrop : SystemMouseCursors.click,
        ),
        color: Colors.transparent,
      ),
    );
  }

}