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

/*
 * PolicyPresentationComponentEvent is the base class for events to be used with constructing a PolicyPresentationComponentBloc 
 */
abstract class PolicyPresentationComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchPolicyPresentationComponent is the event to instruct the bloc to fetch the component
 */
class FetchPolicyPresentationComponent
    extends PolicyPresentationComponentEvent {
  final String? id;

  /*
   * Construct the FetchPolicyPresentationComponent
   */
  FetchPolicyPresentationComponent({this.id});
}

/*
 * PolicyPresentationComponentUpdated is the event to inform the bloc that a component has been updated
 */
class PolicyPresentationComponentUpdated
    extends PolicyPresentationComponentEvent {
  final PolicyPresentationModel value;

  /*
   * Construct the PolicyPresentationComponentUpdated
   */
  PolicyPresentationComponentUpdated({required this.value});
}
