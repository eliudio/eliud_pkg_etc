/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_action_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_etc/model/model_export.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef MemberActionModelTrigger = Function(List<MemberActionModel?> list);
typedef MemberActionChanged = Function(MemberActionModel? value);
typedef MemberActionErrorHandler = Function(dynamic o, dynamic e);

abstract class MemberActionRepository
    extends RepositoryBase<MemberActionModel, MemberActionEntity> {
  @override
  Future<MemberActionEntity> addEntity(
      String documentID, MemberActionEntity value);
  @override
  Future<MemberActionEntity> updateEntity(
      String documentID, MemberActionEntity value);
  @override
  Future<MemberActionModel> add(MemberActionModel value);
  @override
  Future<void> delete(MemberActionModel value);
  @override
  Future<MemberActionModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<MemberActionModel> update(MemberActionModel value);

  @override
  Stream<List<MemberActionModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<MemberActionModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberActionModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberActionModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<MemberActionModel?>> listen(
      MemberActionModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<MemberActionModel?>> listenWithDetails(
      MemberActionModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<MemberActionModel?> listenTo(
      String documentId, MemberActionChanged changed,
      {MemberActionErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<MemberActionModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
