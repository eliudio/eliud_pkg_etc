import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum InitialPosition {
  CenterTop,
  CenterBottom,
  RightTop,
  RightBottom,
  RightAlmostBottom,
  CenterCenter,
  LeftCenter,
  LeftTop,
  LeftAlmostBottom,
  LeftBottom // Horizontal X Vertical
}

class CreatorButton extends StatefulWidget {
  static double BUTTON_HEIGHT = kBottomNavigationBarHeight / 2;
  final InitialPosition initialPosition;
  final String? label;
  final Widget toDecorate;
  final Key? toDecorateKey;
  final GestureTapDownCallback? onTapDown;
  final GestureTapCallback? onTap;
  final bool ensureHeight;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Widget icon;

  CreatorButton(
      {Key? key,
      required this.initialPosition,
      required this.toDecorateKey,
      required this.toDecorate,
      this.onTap,
      this.onTapDown,
      required this.ensureHeight,
      required this.backgroundColor,
      required this.icon,
      required this.borderColor,
      required this.textColor,
      this.label})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreatorButtonState();
  }
}

class _CreatorButtonState extends State<CreatorButton> {
  Offset? position = Offset(0, 0);
  double? width;
  double? height;

  final _buttonKey = GlobalKey();

  _CreatorButtonState();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback(_getWidgetInfo);
  }

  void _getWidgetInfo(_) {
    var key = widget.toDecorateKey;
    if (key is GlobalKey) {
      var renderObject = key.currentContext?.findRenderObject();
      var renderButtonObject = _buttonKey.currentContext?.findRenderObject();
      if ((renderObject is RenderBox) && (renderButtonObject is RenderBox)) {
        var renderBox = renderObject;
        var renderButtonBox = renderButtonObject;

        var sizeBox = renderBox.size;
        var sizeButtonBox = renderButtonBox.size;

        width = sizeButtonBox.width;
        height = sizeButtonBox.height;

        setState(() {
          switch (widget.initialPosition) {
            case InitialPosition.CenterTop:
              position = Offset((sizeBox.width - width!) / 2, 0);
              break;
            case InitialPosition.CenterBottom:
              position = Offset((sizeBox.width - width!) / 2, sizeBox.height - height!);
              break;
            case InitialPosition.CenterCenter:
              position = Offset(
                  (sizeBox.width - width!) / 2, (sizeBox.height - height!) / 2);
              break;
            case InitialPosition.RightTop:
              position = Offset((sizeBox.width - width!), 0);
              break;
            case InitialPosition.RightBottom:
              position =
                  Offset((sizeBox.width - width!), sizeBox.height - height!);
              break;
            case InitialPosition.RightAlmostBottom:
              position =
                  Offset((sizeBox.width - width!), sizeBox.height - kBottomNavigationBarHeight);
              break;
            case InitialPosition.LeftAlmostBottom:
              position =
                  Offset(0, sizeBox.height - kBottomNavigationBarHeight);
              break;
            case InitialPosition.LeftCenter:
              position = Offset(0, (sizeBox.height - height!) / 2);
              break;
            case InitialPosition.LeftTop:
              position = Offset(0, 20);
              break;
            case InitialPosition.LeftBottom:
              position = Offset(0, sizeBox.height - height!);
              break;
          }
        });
      }
    } else {
      throw Exception("Specified key is not a global key)");
    }
  }

  @override
  Widget build(BuildContext context) {
    var button;

    if (widget.label == null) {
      button = Container(
          height: CreatorButton.BUTTON_HEIGHT,
          width: CreatorButton.BUTTON_HEIGHT,
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              border: Border.all(width: 1, color: widget.borderColor)),
          child: GestureDetector(
              onTap: widget.onTap,
              onTapDown: widget.onTapDown,
              child: widget.icon));
    } else {
      button = GestureDetector(
          onTap: widget.onTap,
          onTapDown: widget.onTapDown,
          child: Container(
          height: CreatorButton.BUTTON_HEIGHT,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: widget.borderColor)),
          child: ElevatedButton.icon(
              onPressed: widget.onTap,
              icon: widget.icon,
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(widget.backgroundColor),
                  padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                  textStyle:
                  MaterialStateProperty.all(TextStyle(fontSize: 30))),
              label: Text(widget.label!,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.normal,
                      color: widget.textColor)))));
    }

    var draggable = Draggable(
        key: _buttonKey,
        feedback: button,
        child: button,
        childWhenDragging: Container(),
        onDragEnd: (DraggableDetails details) {
          setState(() {
            onDrag(details);
          });
        });

    return Stack(children: [
      widget.toDecorate,
      if (widget.ensureHeight) Container(height: height),
      if (position != null) Positioned(left: position!.dx, top: position!.dy, child: draggable),
      if (position == null) Positioned(left: 0, top: 0, child: draggable),
    ]);
  }

  void onDrag(DraggableDetails details) {
    var renderObject = context.findRenderObject();
    if ((renderObject != null) && (renderObject is RenderBox)) {
      var size = renderObject.size;
      var newPosition = renderObject.globalToLocal(details.offset);
      if ((width != null) && (height != null)) {
        position = Offset(min(max(0, newPosition.dx), size.width - width!),
            min(max(0, newPosition.dy), size.height - height!));
      } else {
        position = Offset(min(max(0, newPosition.dx), size.width - 30),
            min(max(0, newPosition.dy), size.height - 20));
      }
    }
  }
}
