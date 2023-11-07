/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class PolicyPresentationEntity implements EntityBase {
  final String? appId;
  final String? description;
  final String? policiesId;
  final StorageConditionsEntity? conditions;

  PolicyPresentationEntity({
    required this.appId,
    this.description,
    this.policiesId,
    this.conditions,
  });

  PolicyPresentationEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? policiesId,
    StorageConditionsEntity? conditions,
  }) {
    return PolicyPresentationEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      policiesId: policiesId ?? this.policiesId,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        policiesId,
        conditions,
      ];

  @override
  String toString() {
    return 'PolicyPresentationEntity{appId: $appId, description: $description, policiesId: $policiesId, conditions: $conditions}';
  }

  static PolicyPresentationEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return PolicyPresentationEntity(
      appId: map['appId'],
      description: map['description'],
      policiesId: map['policiesId'],
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? conditionsMap =
        conditions != null ? conditions!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (policiesId != null) {
      theDocument["policiesId"] = policiesId;
    } else {
      theDocument["policiesId"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  PolicyPresentationEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static PolicyPresentationEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
