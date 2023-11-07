/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_etc/model/model_export.dart';

@immutable
abstract class PolicyPresentationFormEvent extends Equatable {
  const PolicyPresentationFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewPolicyPresentationFormEvent
    extends PolicyPresentationFormEvent {}

class InitialisePolicyPresentationFormEvent
    extends PolicyPresentationFormEvent {
  final PolicyPresentationModel? value;

  @override
  List<Object?> get props => [value];

  InitialisePolicyPresentationFormEvent({this.value});
}

class InitialisePolicyPresentationFormNoLoadEvent
    extends PolicyPresentationFormEvent {
  final PolicyPresentationModel? value;

  @override
  List<Object?> get props => [value];

  InitialisePolicyPresentationFormNoLoadEvent({this.value});
}

class ChangedPolicyPresentationDocumentID extends PolicyPresentationFormEvent {
  final String? value;

  ChangedPolicyPresentationDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPolicyPresentationDocumentID{ value: $value }';
}

class ChangedPolicyPresentationAppId extends PolicyPresentationFormEvent {
  final String? value;

  ChangedPolicyPresentationAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPolicyPresentationAppId{ value: $value }';
}

class ChangedPolicyPresentationDescription extends PolicyPresentationFormEvent {
  final String? value;

  ChangedPolicyPresentationDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPolicyPresentationDescription{ value: $value }';
}

class ChangedPolicyPresentationPolicies extends PolicyPresentationFormEvent {
  final String? value;

  ChangedPolicyPresentationPolicies({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPolicyPresentationPolicies{ value: $value }';
}

class ChangedPolicyPresentationConditions extends PolicyPresentationFormEvent {
  final StorageConditionsModel? value;

  ChangedPolicyPresentationConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPolicyPresentationConditions{ value: $value }';
}
