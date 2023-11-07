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

import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_etc/model/model_export.dart';

import 'package:eliud_pkg_etc/model/member_action_form_event.dart';
import 'package:eliud_pkg_etc/model/member_action_form_state.dart';

class MemberActionFormBloc
    extends Bloc<MemberActionFormEvent, MemberActionFormState> {
  final String? appId;

  MemberActionFormBloc(
    this.appId,
  ) : super(MemberActionFormUninitialized()) {
    on<InitialiseNewMemberActionFormEvent>((event, emit) {
      MemberActionFormLoaded loaded = MemberActionFormLoaded(
          value: MemberActionModel(
        documentID: "IDENTIFIER",
        text: "",
        description: "",
      ));
      emit(loaded);
    });

    on<InitialiseMemberActionFormEvent>((event, emit) async {
      MemberActionFormLoaded loaded =
          MemberActionFormLoaded(value: event.value);
      emit(loaded);
    });
    on<InitialiseMemberActionFormNoLoadEvent>((event, emit) async {
      MemberActionFormLoaded loaded =
          MemberActionFormLoaded(value: event.value);
      emit(loaded);
    });
    MemberActionModel? newValue;
    on<ChangedMemberActionText>((event, emit) async {
      if (state is MemberActionFormInitialized) {
        final currentState = state as MemberActionFormInitialized;
        newValue = currentState.value!.copyWith(text: event.value);
        emit(SubmittableMemberActionForm(value: newValue));
      }
    });
    on<ChangedMemberActionDescription>((event, emit) async {
      if (state is MemberActionFormInitialized) {
        final currentState = state as MemberActionFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableMemberActionForm(value: newValue));
      }
    });
    on<ChangedMemberActionAction>((event, emit) async {
      if (state is MemberActionFormInitialized) {
        final currentState = state as MemberActionFormInitialized;
        newValue = currentState.value!.copyWith(action: event.value);
        emit(SubmittableMemberActionForm(value: newValue));
      }
    });
  }
}
