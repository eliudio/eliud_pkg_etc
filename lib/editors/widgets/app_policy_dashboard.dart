import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/app_policy_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_policy_bloc/app_policy_dashboard_bloc.dart';
import 'app_policy_bloc/app_policy_dashboard_event.dart';
import 'app_policy_bloc/app_policy_dashboard_state.dart';

class AppPolicyDashboard {
  static void updateAppPolicy(
      AppModel app, BuildContext context, model) {
    _openIt(app, context, false, model.copyWith());
  }

  static void deleteAppPolicy(
      AppModel app, BuildContext context, model) {
    // ask for confirmation. Very dangerous
  }

  static void addAppPolicy(
      AppModel app, BuildContext context) {
    _openIt(
        app,
        context,
        true,
        AppPolicyModel(
          appId: app.documentID,
          documentID: newRandomKey(),
        ),);
  }

  static void _openIt(AppModel app, BuildContext context, bool create,
      AppPolicyModel model) {
    openComplexDialog(
      app,
      context,
      app.documentID + '/shop',
      title: create
          ? 'Create AppPolicy'
          : 'Update AppPolicy',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<AppPolicyDashboardBloc>(
          create: (context) => AppPolicyDashboardBloc(
                app.documentID,
                (_, __) {},
              )..add(AppPolicyDashboardInitialise(model)),
          child: AppPolicyDashboardWidget(
            app: app,
          )),
    );
  }
}

class AppPolicyDashboardWidget extends StatefulWidget {
  final AppModel app;

  const AppPolicyDashboardWidget({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _AppPolicyDashboardWidgetState();
}

class _AppPolicyDashboardWidgetState
    extends State<AppPolicyDashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<AppPolicyDashboardBloc,
                AppPolicyDashboardBaseState>(
            builder: (ppContext, shopState) {
          if (shopState
              is AppPolicyDashboardInitialised) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'AppPolicy',
                    okAction: () async {
                      await BlocProvider.of<AppPolicyDashboardBloc>(context)
                          .save(AppPolicyDashboardApplyChanges(
                              model: shopState.appPolicy));
                      return true;
                    },
                    cancelAction: () async {
                      return true;
                    },
                  ),
                  topicContainer(widget.app, context,
                      title: 'General',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.vpn_key),
                            title: text(widget.app, context,
                                shopState.appPolicy.documentID)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue:
                              shopState.appPolicy.name,
                              valueChanged: (value) {
                                shopState.appPolicy.name =
                                    value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Name',
                                labelText: 'Name',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Pages',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        _pages(shopState),
                      ]),
                ]);
          } else {
            return progressIndicator(widget.app, context);
          }
        });
      } else {
        return progressIndicator(widget.app, context);
      }
    });
  }

  Widget _pages(
      AppPolicyDashboardInitialised state) {
    var items =
        state.values != null ? state.values! : [];
    return Container(
      height: 150,
      child: ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
        Container(
            height: 100,
            child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                //separatorBuilder: (context, index) => divider(widget.app, context),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final value = items[index];
                  return getListTile(
                    context,
                    widget.app,
                    title: text(widget.app, context,
                        (value.title ?? '?')),
                    trailing: popupMenuButton<int>(
                        widget.app, context,
                        child: Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                              popupMenuItem(
                                widget.app, context,
                                value: 2,
                                label: 'Delete',
                              ),
                            ],
                        onSelected: (selectedValue) {
                          if (selectedValue == 2) {
                            // DELETE FROM THE LIST TODO
                          }
                        }),
                  );
                })),
        divider(
          widget.app,
          context,
        ),
        Row(children: [
          Spacer(),
          button(
            widget.app,
            context,
            icon: Icon(
              Icons.add,
            ),
            label: 'Add',
            onPressed: () {
              // ALLOW TO ADD A PAGE, UPLOAD
            },
          ),
          Spacer(),
        ])
      ]),
    );
  }

}
