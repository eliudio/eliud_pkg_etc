/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_etc/model/policy_presentation_component_event.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_component_state.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_repository.dart';


class PolicyPresentationComponentBloc extends Bloc<PolicyPresentationComponentEvent, PolicyPresentationComponentState> {
  final PolicyPresentationRepository? policyPresentationRepository;
  StreamSubscription? _policyPresentationSubscription;

  void _mapLoadPolicyPresentationComponentUpdateToState(String documentId) {
    _policyPresentationSubscription?.cancel();
    _policyPresentationSubscription = policyPresentationRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(PolicyPresentationComponentUpdated(value: value));
      }
    });
  }

  PolicyPresentationComponentBloc({ this.policyPresentationRepository }): super(PolicyPresentationComponentUninitialized()) {
    on <FetchPolicyPresentationComponent> ((event, emit) {
      _mapLoadPolicyPresentationComponentUpdateToState(event.id!);
    });
    on <PolicyPresentationComponentUpdated> ((event, emit) {
      emit(PolicyPresentationComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _policyPresentationSubscription?.cancel();
    return super.close();
  }

}

