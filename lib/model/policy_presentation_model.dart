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
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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



class PolicyPresentationModel implements ModelBase, WithAppId {
  String documentID;

  // This is the identifier of the app to which this belongs
  String appId;
  String? description;
  PublicMediumModel? policy;
  StorageConditionsModel? conditions;

  PolicyPresentationModel({required this.documentID, required this.appId, this.description, this.policy, this.conditions, })  {
    assert(documentID != null);
  }

  PolicyPresentationModel copyWith({String? documentID, String? appId, String? description, PublicMediumModel? policy, StorageConditionsModel? conditions, }) {
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
  Future<String> toRichJsonString({String? appId}) async {
    var document = toEntity(appId: appId).toDocument();
    document['documentID'] = documentID;
    if ((policy != null) && (policy!.url != null)) {
      var url = policy!.url!;
      var uriurl = Uri.parse(url);
      final response = await http.get(uriurl);
      var bytes = response.bodyBytes.toList();
      document['policy-extract'] = bytes.toList();
    }

    return jsonEncode(document);
  }

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
          appId: entity.appId ?? '', 
          description: entity.description, 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<PolicyPresentationModel?> fromEntityPlus(String documentID, PolicyPresentationEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    PublicMediumModel? policyHolder;
    if (entity.policyId != null) {
      try {
          policyHolder = await publicMediumRepository(appId: appId)!.get(entity.policyId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise policy');
        print('Error whilst retrieving publicMedium with id ${entity.policyId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return PolicyPresentationModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          policy: policyHolder, 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

