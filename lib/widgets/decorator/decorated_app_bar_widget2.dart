import 'package:eliud_core/decoration/decoration.dart' as deco;
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/decoration_color_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/style/tools/colors.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_pkg_etc/widgets/decorator/creator_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

/*
 * The DecoratedAppBarWidget2 can be used to extend the app bar. It's used for example within eliud_pkg_create to add an extra icon.
 *
 * The DecoratedAppBarWidget2 adds an icon to the app bar in case we're logged in as the owner of the app.
 * This icon allows to run an action
 */
class DecoratedAppBarWidget2 extends StatefulWidget {
  final AppModel app;
  final deco.CreateWidget createOriginalAppBar;
  final String label;
  AppBarModel model;
  final IconModel iconModel;
  final Key? appBarKey;
  final VoidCallback action;

  DecoratedAppBarWidget2({
    Key? key,
    required this.app,
    required this.label,
    required this.appBarKey,
    required this.model,
    required this.createOriginalAppBar,
    required this.iconModel,
    required this.action,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DecoratedAppBarWidgetState2();
  }
}

class _DecoratedAppBarWidgetState2 extends State<DecoratedAppBarWidget2> {
  late MenuItemModel itemModelLocked;

  @override
  void initState() {
    super.initState();
    itemModelLocked = getMenuItemModelLocked();
  }

  MenuItemModel getMenuItemModelLocked() {
    return MenuItemModel(
        documentID: 'lock_' + widget.label,
        text: 'Lock ' + widget.label,
        description: '',
        icon: widget.iconModel,
        action: FunctionToRun(widget.app, actionToRun: () {
          widget.action();
        }));
  }

  void _delete(MenuItemModel deleteItem) {
    var items = widget.model.iconMenu!.menuItems!;
    items.removeWhere((element) => element.documentID == deleteItem.documentID);
  }

  @override
  Widget build(BuildContext context) {
    _delete(itemModelLocked);
    widget.model.iconMenu!.menuItems!.add(itemModelLocked);
    return widget.createOriginalAppBar();
  }
}
