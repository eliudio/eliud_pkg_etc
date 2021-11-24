/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_model.dart';

abstract class PolicyPresentationComponentState extends Equatable {
  const PolicyPresentationComponentState();

  @override
  List<Object?> get props => [];
}

class PolicyPresentationComponentUninitialized extends PolicyPresentationComponentState {}

class PolicyPresentationComponentError extends PolicyPresentationComponentState {
  final String? message;
  PolicyPresentationComponentError({ this.message });
}

class PolicyPresentationComponentPermissionDenied extends PolicyPresentationComponentState {
  PolicyPresentationComponentPermissionDenied();
}

class PolicyPresentationComponentLoaded extends PolicyPresentationComponentState {
  final PolicyPresentationModel value;

  const PolicyPresentationComponentLoaded({ required this.value });

  PolicyPresentationComponentLoaded copyWith({ PolicyPresentationModel? copyThis }) {
    return PolicyPresentationComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'PolicyPresentationComponentLoaded { value: $value }';
}

