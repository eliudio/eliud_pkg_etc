import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/app_policy_list_bloc.dart';
import 'package:eliud_core/model/app_policy_list_event.dart';
import 'package:eliud_core/model/app_policy_list_state.dart';
import 'package:eliud_core/model/app_policy_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/widgets/app_policy_dashboard.dart';
import 'package:eliud_core/tools/widgets/editor/select_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/cupertino.dart';

Widget selectAppPolicyWidget(BuildContext context, AppModel app, StorageConditionsModel? containerStorageConditions, AppPolicyModel? appPolicy, Function (dynamic selected) selectedCallback) {
  return SelectWidget<AppPolicyModel>(
      app: app,
      currentlySelected: appPolicy,
      title: 'AppPolicy',
      selectTitle: 'Select appPolicy',
      displayItemFunction: (item) => text(app, context,
          item.documentID + ' ' + (item.name ?? '?')),
      blocProviderProvider: () => BlocProvider<AppPolicyListBloc>(
        create: (context) => AppPolicyListBloc(
          eliudQuery: getComponentSelectorQuery(0, app.documentID),
          appPolicyRepository: appPolicyRepository(appId: app.documentID)!,
        )..add(LoadAppPolicyList()),
      ),
      blocBuilder: (contentsLoaded, contentsNotLoaded) {
        return BlocBuilder<AppPolicyListBloc, AppPolicyListState>(
            builder: (context, state) {
              if ((state is AppPolicyListLoaded) && (state.values != null)) {
                return contentsLoaded(context, state.values!);
              } else {
                return contentsNotLoaded(context, );
              }
            });
      },
      selectedCallback: selectedCallback,
      addCallback: () => AppPolicyDashboard.addAppPolicy(app, context),
      deleteCallback: null,
      updateCallback: (item) => AppPolicyDashboard.updateAppPolicy(app, context, item),
      changePrivilegeEventCallback: (BuildContext context, int privilegeLevel) {
        BlocProvider.of<AppPolicyListBloc>(context).add(
            AppPolicyChangeQuery(newQuery: getComponentSelectorQuery(privilegeLevel,
                app.documentID)));
      },
      containerPrivilege: containerStorageConditions == null || containerStorageConditions.privilegeLevelRequired == null ? 0 : containerStorageConditions.privilegeLevelRequired!.index
    );
}

