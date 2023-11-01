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
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef MemberActionModelTrigger(List<MemberActionModel?> list);
typedef MemberActionChanged(MemberActionModel? value);
typedef MemberActionErrorHandler(o, e);

abstract class MemberActionRepository extends RepositoryBase<MemberActionModel, MemberActionEntity> {
  Future<MemberActionEntity> addEntity(String documentID, MemberActionEntity value);
  Future<MemberActionEntity> updateEntity(String documentID, MemberActionEntity value);
  Future<MemberActionModel> add(MemberActionModel value);
  Future<void> delete(MemberActionModel value);
  Future<MemberActionModel?> get(String? id, { Function(Exception)? onError });
  Future<MemberActionModel> update(MemberActionModel value);

  Stream<List<MemberActionModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<MemberActionModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<MemberActionModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<MemberActionModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<MemberActionModel?>> listen(MemberActionModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<MemberActionModel?>> listenWithDetails(MemberActionModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<MemberActionModel?> listenTo(String documentId, MemberActionChanged changed, {MemberActionErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<MemberActionModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


