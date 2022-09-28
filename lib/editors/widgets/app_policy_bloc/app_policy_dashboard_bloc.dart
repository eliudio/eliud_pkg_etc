import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_policy_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';

//import 'appPolicy_dashboard_event.dart';
import 'app_policy_dashboard_event.dart';
import 'app_policy_dashboard_state.dart';

class AppPolicyDashboardBloc
    extends Bloc<AppPolicyDashboardBaseEvent, AppPolicyDashboardBaseState> {
  final String appId;
  final EditorFeedback feedback;

  AppPolicyModel addItem(AppPolicyModel model, PublicMediumModel newItem) {
    // add to a list
    return model;
  }

  AppPolicyModel deleteItem(AppPolicyModel model, PublicMediumModel deleteItem) {
    // delete from a list
    return model;
  }

  void updateItem(AppPolicyModel model, PublicMediumModel oldItem, PublicMediumModel newItem) {
    // update in the list
  }

  AppPolicyDashboardBloc(this.appId, this.feedback)
      : super(AppPolicyDashboardUninitialised()) {
    on<AppPolicyDashboardInitialise>((event, emit) async {
      // retrieve the model, as it was retrieved without links
      var modelWithLinks =
          await appPolicyRepository(appId: appId)!.get(event.model.documentID);
      if (modelWithLinks == null) {
        var appPolicyId = newRandomKey();
        modelWithLinks = AppPolicyModel(
            appId: appId, documentID: appPolicyId, name: 'new appPolicy');
      }
      emit(AppPolicyDashboardLoaded(
        appPolicy: modelWithLinks,
      ));
    });

    on<PublicMediumListUpdated>((event, emit) {
      if (state is AppPolicyDashboardInitialised) {
        var theState = state as AppPolicyDashboardInitialised;
        emit(AppPolicyDashboardLoaded(appPolicy: theState.appPolicy, values: event.values));
      }
    });

    on<SelectForEditEvent>((event, emit) {
      if (state is AppPolicyDashboardInitialised) {
        var theState = state as AppPolicyDashboardInitialised;
        emit(AppPolicyDashboardLoaded(
          appPolicy: theState.appPolicy,
          values: theState.values,
        ));
      }
    });
  }

  Future<void> save(AppPolicyDashboardApplyChanges event) async {
    if (state is AppPolicyDashboardInitialised) {
      var theState = state as AppPolicyDashboardInitialised;
      var newModel = theState.appPolicy;
      if (await appPolicyRepository(appId: appId)!.get(newModel.documentID) ==
          null) {
        await appPolicyRepository(appId: appId)!.add(newModel);
      } else {
        await appPolicyRepository(appId: appId)!.update(newModel);
      }
      feedback(true, newModel);
    }
  }
}
