/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_action_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/random.dart';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class MemberActionEntity implements EntityBase {
  final String? text;
  final String? description;
  final ActionEntity? action;

  MemberActionEntity({this.text, this.description, this.action, });

  MemberActionEntity copyWith({String? documentID, String? text, String? description, ActionEntity? action, }) {
    return MemberActionEntity(text : text ?? this.text, description : description ?? this.description, action : action ?? this.action, );
  }
  List<Object?> get props => [text, description, action, ];

  @override
  String toString() {
    return 'MemberActionEntity{text: $text, description: $description, action: $action}';
  }

  static MemberActionEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var actionFromMap;
    actionFromMap = map['action'];
    if (actionFromMap != null)
      actionFromMap = ActionEntity.fromMap(actionFromMap, newDocumentIds: newDocumentIds);

    return MemberActionEntity(
      text: map['text'], 
      description: map['description'], 
      action: actionFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? actionMap = action != null 
        ? action!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (text != null) theDocument["text"] = text;
      else theDocument["text"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (action != null) theDocument["action"] = actionMap;
      else theDocument["action"] = null;
    return theDocument;
  }

  @override
  MemberActionEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static MemberActionEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

