import 'package:eliud_core/model/app_policy_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AppPolicyDashboardBaseState extends Equatable {
  const AppPolicyDashboardBaseState();

  @override
  List<Object?> get props => [];
}

class AppPolicyDashboardUninitialised extends AppPolicyDashboardBaseState {
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AppPolicyDashboardUninitialised;
}

class AppPolicyDashboardInitialised extends AppPolicyDashboardBaseState {
  final AppPolicyModel appPolicy;
  final List<PublicMediumModel>? values;

  const AppPolicyDashboardInitialised(
      {required this.appPolicy, this.values});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppPolicyDashboardInitialised &&
          appPolicy == other.appPolicy &&
          ListEquality().equals(values, other.values);
}

class AppPolicyDashboardLoaded extends AppPolicyDashboardInitialised {
  AppPolicyDashboardLoaded(
      { required AppPolicyModel appPolicy,
        List<PublicMediumModel>? values})
      : super(appPolicy: appPolicy, values: values);
}

class AppPolicyDashboardError extends AppPolicyDashboardInitialised {
  final String error;

  AppPolicyDashboardError(
      {required this.error,
      required AppPolicyModel appPolicy,
      required List<PublicMediumModel> values})
      : super(appPolicy: appPolicy, values: values);
}
