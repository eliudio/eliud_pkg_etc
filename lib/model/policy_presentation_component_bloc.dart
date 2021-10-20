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

import 'package:eliud_pkg_etc/model/policy_presentation_model.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_component_event.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_component_state.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_repository.dart';
import 'package:flutter/services.dart';


class PolicyPresentationComponentBloc extends Bloc<PolicyPresentationComponentEvent, PolicyPresentationComponentState> {
  final PolicyPresentationRepository? policyPresentationRepository;
  StreamSubscription? _policyPresentationSubscription;

  Stream<PolicyPresentationComponentState> _mapLoadPolicyPresentationComponentUpdateToState(String documentId) async* {
    _policyPresentationSubscription?.cancel();
    _policyPresentationSubscription = policyPresentationRepository!.listenTo(documentId, (value) {
      if (value != null) add(PolicyPresentationComponentUpdated(value: value));
    });
  }

  PolicyPresentationComponentBloc({ this.policyPresentationRepository }): super(PolicyPresentationComponentUninitialized());

  @override
  Stream<PolicyPresentationComponentState> mapEventToState(PolicyPresentationComponentEvent event) async* {
    final currentState = state;
    if (event is FetchPolicyPresentationComponent) {
      yield* _mapLoadPolicyPresentationComponentUpdateToState(event.id!);
    } else if (event is PolicyPresentationComponentUpdated) {
      yield PolicyPresentationComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _policyPresentationSubscription?.cancel();
    return super.close();
  }

}

