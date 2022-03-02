import 'package:eliud_core/decoration/decoration.dart' as deco;
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_pkg_etc/widgets/decorator/creator_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

/*
 * This is a replacement widget to replace DecoratedAppBarWidget and DecoratedAppBarWidget2
 * The issue with these 2 is that it actually changes the model of the underlying appbar
 * This is a problem as it pollutes the model which is the thing the end user is trying
 * to modify / specify. Hence the below widget just places a button over the underlying widget
 */
class DecoratedWidget extends StatefulWidget {
  final ValueNotifier<bool> isCreationMode;
  final deco.CreateWidget createOriginalWidget;
  final Key? originalWidgetKey;
  final bool ensureHeight;
  final InitialPosition initialPosition;
  final String? label;
  final Color backgroundColor;
  final Widget iconOn;
  final Widget iconOff;
  final Color bordercolor;
  final Color textColor;

  DecoratedWidget({
    Key? key,
    required this.isCreationMode,
    required this.originalWidgetKey,
    required this.createOriginalWidget,
    required this.ensureHeight,
    required this.initialPosition,
    this.label,
    required this.backgroundColor,
    required this.iconOn,
    required this.iconOff,
    required this.bordercolor,
    required this.textColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DecoratedWidgetState();
  }
}

class _DecoratedWidgetState extends State<DecoratedWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.isCreationMode,
        builder: (context, value, child) {
          return CreatorButton(
              icon: ((widget.isCreationMode != null) &&
                      (widget.isCreationMode.value))
                  ? widget.iconOn
                  : widget.iconOff,
              borderColor: widget.bordercolor,
              textColor: widget.textColor,
              backgroundColor: widget.backgroundColor,
              ensureHeight: widget.ensureHeight,
              initialPosition: widget.initialPosition,
              toDecorateKey: widget.originalWidgetKey,
              toDecorate: widget.createOriginalWidget(),
              label: widget.label,
              onTap: () =>
                  widget.isCreationMode.value = !widget.isCreationMode.value);
        });
  }

  @override
  void refresh() {
    setState(() {});
  }
}
