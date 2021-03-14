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

import 'package:eliud_pkg_etc/model/policy_presentation_repository.dart';


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


import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef PolicyPresentationModelTrigger(List<PolicyPresentationModel> list);
typedef PolicyPresentationChanged(PolicyPresentationModel value);

abstract class PolicyPresentationRepository {
  Future<PolicyPresentationModel> add(PolicyPresentationModel value);
  Future<void> delete(PolicyPresentationModel value);
  Future<PolicyPresentationModel> get(String id, { Function(Exception) onError });
  Future<PolicyPresentationModel> update(PolicyPresentationModel value);

  Stream<List<PolicyPresentationModel>> values({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });
  Stream<List<PolicyPresentationModel>> valuesWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });
  Future<List<PolicyPresentationModel>> valuesList({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });
  Future<List<PolicyPresentationModel>> valuesListWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });

  StreamSubscription<List<PolicyPresentationModel>> listen(PolicyPresentationModelTrigger trigger, {String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery });
  StreamSubscription<List<PolicyPresentationModel>> listenWithDetails(PolicyPresentationModelTrigger trigger, {String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery });
  StreamSubscription<PolicyPresentationModel> listenTo(String documentId, PolicyPresentationChanged changed);
  void flush();
  
  String timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<PolicyPresentationModel> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


