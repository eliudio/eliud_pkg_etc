/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_model.dart';

abstract class PolicyPresentationComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPolicyPresentationComponent
    extends PolicyPresentationComponentEvent {
  final String? id;

  FetchPolicyPresentationComponent({this.id});
}

class PolicyPresentationComponentUpdated
    extends PolicyPresentationComponentEvent {
  final PolicyPresentationModel value;

  PolicyPresentationComponentUpdated({required this.value});
}
