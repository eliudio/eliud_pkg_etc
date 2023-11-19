/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_action_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_etc/model/member_action_model.dart';

abstract class MemberActionListEvent extends Equatable {
  const MemberActionListEvent();
  @override
  List<Object?> get props => [];
}

class LoadMemberActionList extends MemberActionListEvent {}

class NewPage extends MemberActionListEvent {}

class AddMemberActionList extends MemberActionListEvent {
  final MemberActionModel? value;

  const AddMemberActionList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddMemberActionList{ value: $value }';
}

class UpdateMemberActionList extends MemberActionListEvent {
  final MemberActionModel? value;

  const UpdateMemberActionList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateMemberActionList{ value: $value }';
}

class DeleteMemberActionList extends MemberActionListEvent {
  final MemberActionModel? value;

  const DeleteMemberActionList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteMemberActionList{ value: $value }';
}

class MemberActionListUpdated extends MemberActionListEvent {
  final List<MemberActionModel?>? value;
  final bool? mightHaveMore;

  const MemberActionListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'MemberActionListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class MemberActionChangeQuery extends MemberActionListEvent {
  final EliudQuery? newQuery;

  const MemberActionChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'MemberActionChangeQuery{ value: $newQuery }';
}
