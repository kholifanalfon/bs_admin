import 'package:flutter/material.dart';

class Breadcrumbs extends StatefulWidget {

  Breadcrumbs({
    required this.label,
    this.key,
    this.icon,
    this.onPressed,
  });

  @override
  State<StatefulWidget> createState() {
    return _BreadcrumbsState();
  }

  final Key? key;

  final String label;

  final IconData? icon;

  final VoidCallback? onPressed;

  bool active = false;
}

class _BreadcrumbsState extends State<Breadcrumbs> {

  bool _onHover = false;

  void _updateState(VoidCallback function) {
    if(mounted)
      setState(() {
        function();
      });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: InkWell(
          child: Row(
            children: [
              widget.icon == null ? Container() : Container(
                margin: EdgeInsets.only(right: 5.0),
                child: Icon(widget.icon,
                  color: widget.active || _onHover ? Colors.blue : Colors.black,
                  size: 16.0,
                ),
              ),
              Container(
                child: Text(widget.label,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: widget.active || _onHover ? Colors.blue : Colors.black
                  ),
                ),
              )
            ],
          ),
          onTap: widget.onPressed,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onHover: (hovered) => _updateState(() => _onHover = hovered),
        ),
        color: Colors.transparent,
      ),
    );
  }
}