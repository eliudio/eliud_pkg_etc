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

  PolicyPresentationFormBloc(this.appId, { this.formAction }): super(PolicyPresentationFormUninitialized());
  @override
  Stream<PolicyPresentationFormState> mapEventToState(PolicyPresentationFormEvent event) async* {
    final currentState = state;
    if (currentState is PolicyPresentationFormUninitialized) {
      if (event is InitialiseNewPolicyPresentationFormEvent) {
        PolicyPresentationFormLoaded loaded = PolicyPresentationFormLoaded(value: PolicyPresentationModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialisePolicyPresentationFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        PolicyPresentationFormLoaded loaded = PolicyPresentationFormLoaded(value: await policyPresentationRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialisePolicyPresentationFormNoLoadEvent) {
        PolicyPresentationFormLoaded loaded = PolicyPresentationFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is PolicyPresentationFormInitialized) {
      PolicyPresentationModel? newValue = null;
      if (event is ChangedPolicyPresentationDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittablePolicyPresentationForm(value: newValue);
        }

        return;
      }
      if (event is ChangedPolicyPresentationAppId) {
        newValue = currentState.value!.copyWith(appId: event.value);
        yield SubmittablePolicyPresentationForm(value: newValue);

        return;
      }
      if (event is ChangedPolicyPresentationDescription) {
        newValue = currentState.value!.copyWith(description: event.value);
        yield SubmittablePolicyPresentationForm(value: newValue);

        return;
      }
      if (event is ChangedPolicyPresentationPolicy) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(policy: await memberMediumRepository(appId: appId)!.get(event.value));
        else
          newValue = new PolicyPresentationModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 description: currentState.value!.description,
                                 policy: null,
                                 conditions: currentState.value!.conditions,
          );
        yield SubmittablePolicyPresentationForm(value: newValue);

        return;
      }
      if (event is ChangedPolicyPresentationConditions) {
        newValue = currentState.value!.copyWith(conditions: event.value);
        yield SubmittablePolicyPresentationForm(value: newValue);

        return;
      }
    }
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

