import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_pkg_etc/model/member_action_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;

class MemberPopupMenu {
  static void showPopupMenuWithAllActions(
      BuildContext context,
      String extraLabel,
      VoidCallback callback,
      List<MemberActionModel>? memberActions,
      String memberId) async {
    List<Widget> _buttons = [];

    _buttons.add(button1(context, extraLabel, callback));
    if (memberActions != null) {
      for (var memberAction in memberActions) {
        _buttons.add(button2(context, memberAction, memberId));
      }
    }
    var contents = ListView(
        shrinkWrap: true, physics: ScrollPhysics(), children: _buttons);

    StyleRegistry.registry().styleWithContext(context).frontEndStyle().dialogStyle().openComplexDialog(context, title: "Member Actions",
        child: contents);

  }

  static Widget button1(
      BuildContext context, String label, VoidCallback voidCallback) {
    return StyleRegistry.registry().styleWithContext(context).frontEndStyle().buttonStyle().button(context, label: label,
        onPressed: voidCallback
    );
  }

  static Widget button2(
      BuildContext context, MemberActionModel action, String memberId) {
    var text;
    if (action.text != null) {
      text = action.text!;
      if (action.description != null) {
        text = text + ' - ' + action.description!;
      }
    } else {
      if (action.description != null) {
        text = action.description!;
      } else {
        text = '?';
      }
    }
    return StyleRegistry.registry().styleWithContext(context).frontEndStyle().buttonStyle().button(context, label: text,
        onPressed: () =>
            eliudrouter.Router.navigateTo(context, action.action!, parameters: {'memberId' : memberId})
    );
  }
}









/*
  Widget getFieldsWidget(BuildContext context, String appId,) {
    return StyleRegistry.registry().styleWithContext(context).frontEndStyle().containerStyle().simpleTopicContainer(context, children: <Widget>[buttons(appId)],
        height: 200, width: 200);
  }

*/