/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_action_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_etc/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';


@immutable
abstract class MemberActionFormEvent extends Equatable {
  const MemberActionFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewMemberActionFormEvent extends MemberActionFormEvent {
}


class InitialiseMemberActionFormEvent extends MemberActionFormEvent {
  final MemberActionModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseMemberActionFormEvent({this.value});
}

class InitialiseMemberActionFormNoLoadEvent extends MemberActionFormEvent {
  final MemberActionModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseMemberActionFormNoLoadEvent({this.value});
}

class ChangedMemberActionDocumentID extends MemberActionFormEvent {
  final String? value;

  ChangedMemberActionDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedMemberActionDocumentID{ value: $value }';
}

class ChangedMemberActionText extends MemberActionFormEvent {
  final String? value;

  ChangedMemberActionText({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedMemberActionText{ value: $value }';
}

class ChangedMemberActionDescription extends MemberActionFormEvent {
  final String? value;

  ChangedMemberActionDescription({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedMemberActionDescription{ value: $value }';
}

class ChangedMemberActionAction extends MemberActionFormEvent {
  final ActionModel? value;

  ChangedMemberActionAction({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedMemberActionAction{ value: $value }';
}

