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
 * The DecoratedAppBarWidget can be used to extend the app bar. It's used for example within eliud_pkg_create
 * to add an extra icon.
 *
 * The DecoratedAppBarWidget adds an icon to the app bar in case we're logged in as the owner of the app.
 * This icon allows to switch on / off the creator mode. The isCreationMode ValueNotifier is/should be used
 * to propagate this switch to other widgets
 */
class DecoratedAppBarWidget extends StatefulWidget {
  final AppModel app;
  final ValueNotifier<bool> isCreationMode;
  final deco.CreateWidget createOriginalAppBar;
  final String label;
  AppBarModel model;
  final IconModel lockedIconModel;
  final IconModel unlockedIconModel;
  final Key? appBarKey;

  DecoratedAppBarWidget({
    Key? key,
    required this.app,
    required this.label,
    required this.isCreationMode,
    required this.appBarKey,
    required this.model,
    required this.createOriginalAppBar,
    required this.lockedIconModel,
    required this.unlockedIconModel,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DecoratedAppBarWidgetState();
  }
}

class _DecoratedAppBarWidgetState extends State<DecoratedAppBarWidget> {
  late MenuItemModel menuItemModelLocked;
  late MenuItemModel menuItemModelUnlocked;

  @override
  void initState() {
    super.initState();
    menuItemModelLocked = getMenuItemModelLocked();
    menuItemModelUnlocked = getMenuItemModelUnlocked();
  }

  MenuItemModel getMenuItemModelLocked() {
    return MenuItemModel(
        documentID: 'lock_' + widget.label,
        text: 'Lock ' + widget.label,
        description: '',
        icon: widget.lockedIconModel,
        action: FunctionToRun(widget.app, actionToRun: () {
          setState(() {
            widget.isCreationMode.value = false;
          });
        }));
  }

  MenuItemModel getMenuItemModelUnlocked() {
    return MenuItemModel(
        documentID: 'lock_open_' + widget.label,
        text: 'Lock Open ' + widget.label,
        description: '',
        icon: widget.unlockedIconModel,
        action: FunctionToRun(widget.app, actionToRun: () {
          setState(() {
            widget.isCreationMode.value = true;
          });
        }));
  }

  void _delete(MenuItemModel deleteItem) {
    var items = widget.model.iconMenu!.menuItems!;
    items.removeWhere((element) => element.documentID == deleteItem.documentID);
  }

  @override
  Widget build(BuildContext context) {
    // remove previously added menu items
    _delete(menuItemModelLocked);
    _delete(menuItemModelUnlocked);

    // add the right item
    return ValueListenableBuilder(
        valueListenable: widget.isCreationMode,
        builder: (context, value, child) {
          if ((value != null) && (value as bool)) {
            widget.model.iconMenu!.menuItems!.add(menuItemModelLocked);
            return widget.createOriginalAppBar();
          } else {
            widget.model.iconMenu!.menuItems!.add(menuItemModelUnlocked);
            return widget.createOriginalAppBar();
          }
        });
  }
}
