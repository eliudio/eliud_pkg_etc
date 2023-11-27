import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_button.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog.dart';
import 'package:eliud_pkg_etc_model/model/member_action_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;

class MemberPopupMenu {
  static void showPopupMenuWithAllActions(
      AppModel app,
      BuildContext context,
      String extraLabel,
      VoidCallback callback,
      List<MemberActionModel>? memberActions,
      String memberId) async {
    List<Widget> buttons = [];

    buttons.add(button1(app, context, extraLabel, callback));
    if (memberActions != null) {
      for (var memberAction in memberActions) {
        buttons.add(button2(app, context, memberAction, memberId));
      }
    }
    var contents =
        ListView(shrinkWrap: true, physics: ScrollPhysics(), children: buttons);

    openComplexDialog(app, context, '${app.documentID}/memberactions',
        title: "Member Actions", child: contents);
  }

  static Widget button1(AppModel app, BuildContext context, String label,
      VoidCallback voidCallback) {
    return button(app, context, label: label, onPressed: voidCallback);
  }

  static Widget button2(AppModel app, BuildContext context,
      MemberActionModel action, String memberId) {
    String text;
    if (action.text != null) {
      text = action.text!;
      if (action.description != null) {
        text = '$text - ${action.description!}';
      }
    } else {
      if (action.description != null) {
        text = action.description!;
      } else {
        text = '?';
      }
    }
    return button(app, context,
        label: text,
        onPressed: () => eliudrouter.Router.navigateTo(context, action.action!,
            parameters: {'memberId': memberId}));
  }
}
