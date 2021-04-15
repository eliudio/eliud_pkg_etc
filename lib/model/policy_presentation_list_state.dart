/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_model.dart';

abstract class PolicyPresentationListState extends Equatable {
  const PolicyPresentationListState();

  @override
  List<Object?> get props => [];
}

class PolicyPresentationListLoading extends PolicyPresentationListState {}

class PolicyPresentationListLoaded extends PolicyPresentationListState {
  final List<PolicyPresentationModel?>? values;
  final bool? mightHaveMore;

  const PolicyPresentationListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'PolicyPresentationListLoaded { values: $values }';
}

class PolicyPresentationNotLoaded extends PolicyPresentationListState {}

