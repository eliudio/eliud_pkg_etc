/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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


import 'package:eliud_pkg_etc/model/policy_presentation_entity.dart';

import 'package:eliud_core/tools/random.dart';



class PolicyPresentationModel {
  String? documentID;

  // This is the identifier of the app to which this belongs
  String? appId;
  String? description;
  PlatformMediumModel? policy;
  StorageConditionsModel? conditions;

  PolicyPresentationModel({this.documentID, this.appId, this.description, this.policy, this.conditions, })  {
    assert(documentID != null);
  }

  PolicyPresentationModel copyWith({String? documentID, String? appId, String? description, PlatformMediumModel? policy, StorageConditionsModel? conditions, }) {
    return PolicyPresentationModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, policy: policy ?? this.policy, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ policy.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is PolicyPresentationModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          policy == other.policy &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'PolicyPresentationModel{documentID: $documentID, appId: $appId, description: $description, policy: $policy, conditions: $conditions}';
  }

  PolicyPresentationEntity toEntity({String? appId}) {
    return PolicyPresentationEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          policyId: (policy != null) ? policy!.documentID : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<PolicyPresentationModel?> fromEntity(String documentID, PolicyPresentationEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return PolicyPresentationModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<PolicyPresentationModel?> fromEntityPlus(String documentID, PolicyPresentationEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    PlatformMediumModel? policyHolder;
    if (entity.policyId != null) {
      try {
          policyHolder = await platformMediumRepository(appId: appId)!.get(entity.policyId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise policy');
        print('Error whilst retrieving platformMedium with id ${entity.policyId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return PolicyPresentationModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          policy: policyHolder, 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

