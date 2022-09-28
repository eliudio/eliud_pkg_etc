import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_policy_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';

abstract class AppPolicyDashboardBaseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppPolicyDashboardInitialise extends AppPolicyDashboardBaseEvent {
  final AppPolicyModel model;

  AppPolicyDashboardInitialise(this.model);
}

class PublicMediumListUpdated extends AppPolicyDashboardBaseEvent {
  final List<PublicMediumModel> values;

  PublicMediumListUpdated(this.values);
}

class SelectForEditEvent extends AppPolicyDashboardBaseEvent {
  final PublicMediumModel item;

  SelectForEditEvent({required this.item});
}

class AppPolicyDashboardApplyChanges extends AppPolicyDashboardBaseEvent {
  final AppPolicyModel model;

  AppPolicyDashboardApplyChanges({required this.model});
}
