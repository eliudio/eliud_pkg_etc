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

/* 
 * PolicyPresentationComponentState is the base class for state for PolicyPresentationComponentBloc
 */
abstract class PolicyPresentationComponentState extends Equatable {
  const PolicyPresentationComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * PolicyPresentationComponentUninitialized is the uninitialized state of the PolicyPresentationComponentBloc 
 */
class PolicyPresentationComponentUninitialized
    extends PolicyPresentationComponentState {}

/* 
 * PolicyPresentationComponentError is the error state of the PolicyPresentationComponentBloc 
 */
class PolicyPresentationComponentError
    extends PolicyPresentationComponentState {
  final String? message;
  PolicyPresentationComponentError({this.message});
}

/* 
 * PolicyPresentationComponentPermissionDenied is to indicate permission denied state of the PolicyPresentationComponentBloc 
 */
class PolicyPresentationComponentPermissionDenied
    extends PolicyPresentationComponentState {
  PolicyPresentationComponentPermissionDenied();
}

/* 
 * PolicyPresentationComponentLoaded is used to set the state of the PolicyPresentationComponentBloc to the loaded state
 */
class PolicyPresentationComponentLoaded
    extends PolicyPresentationComponentState {
  final PolicyPresentationModel value;

  /* 
   * construct PolicyPresentationComponentLoaded
   */
  const PolicyPresentationComponentLoaded({required this.value});

  /* 
   * copy method
   */
  PolicyPresentationComponentLoaded copyWith(
      {PolicyPresentationModel? copyThis}) {
    return PolicyPresentationComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'PolicyPresentationComponentLoaded { value: $value }';
}
