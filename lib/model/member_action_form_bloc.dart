/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_action_form_bloc.dart
                       
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

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_etc/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';

import 'package:eliud_pkg_etc/model/member_action_form_event.dart';
import 'package:eliud_pkg_etc/model/member_action_form_state.dart';
import 'package:eliud_pkg_etc/model/member_action_repository.dart';

class MemberActionFormBloc extends Bloc<MemberActionFormEvent, MemberActionFormState> {
  final String? appId;

  MemberActionFormBloc(this.appId, ): super(MemberActionFormUninitialized());
  @override
  Stream<MemberActionFormState> mapEventToState(MemberActionFormEvent event) async* {
    final currentState = state;
    if (currentState is MemberActionFormUninitialized) {
      on <InitialiseNewMemberActionFormEvent> ((event, emit) {
        MemberActionFormLoaded loaded = MemberActionFormLoaded(value: MemberActionModel(
                                               documentID: "IDENTIFIER", 
                                 text: "",
                                 description: "",

        ));
        emit(loaded);
      });


      if (event is InitialiseMemberActionFormEvent) {
        MemberActionFormLoaded loaded = MemberActionFormLoaded(value: event.value);
        emit(loaded);
      } else if (event is InitialiseMemberActionFormNoLoadEvent) {
        MemberActionFormLoaded loaded = MemberActionFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is MemberActionFormInitialized) {
      MemberActionModel? newValue = null;
      on <ChangedMemberActionText> ((event, emit) async {
        newValue = currentState.value!.copyWith(text: event.value);
        emit(SubmittableMemberActionForm(value: newValue));

      });
      on <ChangedMemberActionDescription> ((event, emit) async {
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableMemberActionForm(value: newValue));

      });
      on <ChangedMemberActionAction> ((event, emit) async {
        newValue = currentState.value!.copyWith(action: event.value);
        emit(SubmittableMemberActionForm(value: newValue));

      });
    }
  }


}

