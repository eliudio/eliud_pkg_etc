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

  PolicyPresentationComponentBloc({ this.policyPresentationRepository }): super(PolicyPresentationComponentUninitialized());
  @override
  Stream<PolicyPresentationComponentState> mapEventToState(PolicyPresentationComponentEvent event) async* {
    final currentState = state;
    if (event is FetchPolicyPresentationComponent) {
      try {
        if (currentState is PolicyPresentationComponentUninitialized) {
          bool permissionDenied = false;
          final model = await policyPresentationRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield PolicyPresentationComponentPermissionDenied();
          } else {
            if (model != null) {
              yield PolicyPresentationComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield PolicyPresentationComponentError(
                  message: "PolicyPresentation with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield PolicyPresentationComponentError(message: "Unknown error whilst retrieving PolicyPresentation");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

