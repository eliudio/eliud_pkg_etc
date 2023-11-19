/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_etc/model/model_export.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef PolicyPresentationModelTrigger = Function(
    List<PolicyPresentationModel?> list);
typedef PolicyPresentationChanged = Function(PolicyPresentationModel? value);
typedef PolicyPresentationErrorHandler = Function(dynamic o, dynamic e);

abstract class PolicyPresentationRepository
    extends RepositoryBase<PolicyPresentationModel, PolicyPresentationEntity> {
  @override
  Future<PolicyPresentationEntity> addEntity(
      String documentID, PolicyPresentationEntity value);
  @override
  Future<PolicyPresentationEntity> updateEntity(
      String documentID, PolicyPresentationEntity value);
  @override
  Future<PolicyPresentationModel> add(PolicyPresentationModel value);
  @override
  Future<void> delete(PolicyPresentationModel value);
  @override
  Future<PolicyPresentationModel?> get(String? id,
      {Function(Exception)? onError});
  @override
  Future<PolicyPresentationModel> update(PolicyPresentationModel value);

  @override
  Stream<List<PolicyPresentationModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<PolicyPresentationModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PolicyPresentationModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PolicyPresentationModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<PolicyPresentationModel?>> listen(
      PolicyPresentationModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<PolicyPresentationModel?>> listenWithDetails(
      PolicyPresentationModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<PolicyPresentationModel?> listenTo(
      String documentId, PolicyPresentationChanged changed,
      {PolicyPresentationErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<PolicyPresentationModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
