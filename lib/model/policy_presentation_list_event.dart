/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_model.dart';

abstract class PolicyPresentationListEvent extends Equatable {
  const PolicyPresentationListEvent();
  @override
  List<Object?> get props => [];
}

class LoadPolicyPresentationList extends PolicyPresentationListEvent {}

class NewPage extends PolicyPresentationListEvent {}

class AddPolicyPresentationList extends PolicyPresentationListEvent {
  final PolicyPresentationModel? value;

  const AddPolicyPresentationList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddPolicyPresentationList{ value: $value }';
}

class UpdatePolicyPresentationList extends PolicyPresentationListEvent {
  final PolicyPresentationModel? value;

  const UpdatePolicyPresentationList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdatePolicyPresentationList{ value: $value }';
}

class DeletePolicyPresentationList extends PolicyPresentationListEvent {
  final PolicyPresentationModel? value;

  const DeletePolicyPresentationList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeletePolicyPresentationList{ value: $value }';
}

class PolicyPresentationListUpdated extends PolicyPresentationListEvent {
  final List<PolicyPresentationModel?>? value;
  final bool? mightHaveMore;

  const PolicyPresentationListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'PolicyPresentationListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class PolicyPresentationChangeQuery extends PolicyPresentationListEvent {
  final EliudQuery newQuery;

  const PolicyPresentationChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'PolicyPresentationChangeQuery{ value: $newQuery }';
}

