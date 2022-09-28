/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_etc/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';

import 'package:eliud_pkg_etc/model/policy_presentation_form_event.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_form_state.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_repository.dart';

class PolicyPresentationFormBloc extends Bloc<PolicyPresentationFormEvent, PolicyPresentationFormState> {
  final FormAction? formAction;
  final String? appId;

  PolicyPresentationFormBloc(this.appId, { this.formAction }): super(PolicyPresentationFormUninitialized()) {
      on <InitialiseNewPolicyPresentationFormEvent> ((event, emit) {
        PolicyPresentationFormLoaded loaded = PolicyPresentationFormLoaded(value: PolicyPresentationModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",

        ));
        emit(loaded);
      });


      on <InitialisePolicyPresentationFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        PolicyPresentationFormLoaded loaded = PolicyPresentationFormLoaded(value: await policyPresentationRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialisePolicyPresentationFormNoLoadEvent> ((event, emit) async {
        PolicyPresentationFormLoaded loaded = PolicyPresentationFormLoaded(value: event.value);
        emit(loaded);
      });
      PolicyPresentationModel? newValue = null;
      on <ChangedPolicyPresentationDocumentID> ((event, emit) async {
      if (state is PolicyPresentationFormInitialized) {
        final currentState = state as PolicyPresentationFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittablePolicyPresentationForm(value: newValue));
        }

      }
      });
      on <ChangedPolicyPresentationAppId> ((event, emit) async {
      if (state is PolicyPresentationFormInitialized) {
        final currentState = state as PolicyPresentationFormInitialized;
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittablePolicyPresentationForm(value: newValue));

      }
      });
      on <ChangedPolicyPresentationDescription> ((event, emit) async {
      if (state is PolicyPresentationFormInitialized) {
        final currentState = state as PolicyPresentationFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittablePolicyPresentationForm(value: newValue));

      }
      });
      on <ChangedPolicyPresentationPolicies> ((event, emit) async {
      if (state is PolicyPresentationFormInitialized) {
        final currentState = state as PolicyPresentationFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(policies: await appPolicyRepository(appId: appId)!.get(event.value));
        emit(SubmittablePolicyPresentationForm(value: newValue));

      }
      });
      on <ChangedPolicyPresentationConditions> ((event, emit) async {
      if (state is PolicyPresentationFormInitialized) {
        final currentState = state as PolicyPresentationFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittablePolicyPresentationForm(value: newValue));

      }
      });
  }


  DocumentIDPolicyPresentationFormError error(String message, PolicyPresentationModel newValue) => DocumentIDPolicyPresentationFormError(message: message, value: newValue);

  Future<PolicyPresentationFormState> _isDocumentIDValid(String? value, PolicyPresentationModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<PolicyPresentationModel?> findDocument = policyPresentationRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePolicyPresentationForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

