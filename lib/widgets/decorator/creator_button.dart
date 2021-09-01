import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum InitialPosition {
  CenterTop, RightTop, CenterCenter, LeftCenter, LeftTop, LeftBottom // Horizontal X Vertical
}

class CreatorButton extends StatefulWidget {
  static double BUTTON_HEIGHT = 35;
/*
  static Color BACKGROUND_COLOR = Colors.green.withOpacity(.3);
  static Color ICON_COLOR = Colors.red;
  static Color BORDER_COLOR = Colors.red;
  static Color TEXT_COLOR = Colors.white;
*/

  final InitialPosition initialPosition;
  final String? label;
  final Widget toDecorate;
  final Key? toDecorateKey;
  final Function() doIt;
  final bool ensureHeight;
  final Color backgroundColor;
  final Color iconColor;
  final Color borderColor;
  final Color textColor;

  CreatorButton(
      {Key? key,
      required this.initialPosition,
      required this.toDecorateKey,
      required this.toDecorate,
      required this.doIt,
      required this.ensureHeight,
      required this.backgroundColor,
      required this.iconColor,
      required this.borderColor,
      required this.textColor,
      this.label})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreatorButtonState();
  }

/*
  static CreatorButton create(
      {Key? key,
      Key? toDecorateKey,
      required InitialPosition initialPosition,
      required Widget toDecorate,
      required Function() doIt,
      required bool ensureHeight,
      String? label}) {
    return CreatorButton(
        key: key,
        initialPosition: initialPosition,
        toDecorateKey: toDecorateKey,
        toDecorate: toDecorate,
        ensureHeight: ensureHeight,
        doIt: doIt,
        label: label);
  }
*/

}

class _CreatorButtonState extends State<CreatorButton> {
  Offset? position = Offset(-1000, -1000);
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
    if (key is GlobalKey)
    {
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
              position = Offset(
                  (sizeBox.width - width!) / 2, 0);
              break;
            case InitialPosition.CenterCenter:
              position = Offset(
                  (sizeBox.width - width!) / 2, (sizeBox.height - height!) / 2);
              break;
            case InitialPosition.RightTop:
              position = Offset(
                  (sizeBox.width - width!), 0);
              break;
            case InitialPosition.LeftCenter:
              position = Offset(
                  0, (sizeBox.height - height!) / 2);
              break;
            case InitialPosition.LeftTop:
              position = Offset(
                  0, 20);
              break;
            case InitialPosition.LeftBottom:
              position = Offset(
                  0, sizeBox.height - height!);
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
    var icon = Icon(
      Icons.edit,
      color: widget.iconColor,
      size: 15,
    );
    if (widget.label == null) {
      button = Container(
          height: CreatorButton.BUTTON_HEIGHT,
          width: CreatorButton.BUTTON_HEIGHT,
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              border: Border.all(width: 1, color: widget.borderColor)),
          child: GestureDetector(onTap: () => _doIt(), child: icon));
    } else {
      button = Container(
          height: CreatorButton.BUTTON_HEIGHT,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: widget.borderColor)),
          child: ElevatedButton.icon(
              onPressed: () => _doIt(),
              icon: icon,
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
                      color: widget.textColor))));
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
      Positioned(left: position!.dx, top: position!.dy, child: draggable),
    ]);
  }

  void onDrag(DraggableDetails details) {
    var renderObject = context.findRenderObject();
    if ((renderObject != null) && (renderObject is RenderBox)) {
      var size = renderObject.size;
      var newPosition = renderObject.globalToLocal(details.offset);
      position = Offset(min(max(0, newPosition.dx), size.width - width!),
          min(max(0, newPosition.dy), size.height - height!));
    }
  }

  void _doIt() {
    widget.doIt();
  }
}
