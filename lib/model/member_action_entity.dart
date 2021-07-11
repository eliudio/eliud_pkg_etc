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
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';

class MemberActionEntity {
  final String? text;
  final String? description;
  final ActionEntity? action;

  MemberActionEntity({this.text, this.description, this.action, });


  List<Object?> get props => [text, description, action, ];

  @override
  String toString() {
    return 'MemberActionEntity{text: $text, description: $description, action: $action}';
  }

  static MemberActionEntity? fromMap(Map? map) {
    if (map == null) return null;

    var actionFromMap;
    actionFromMap = map['action'];
    if (actionFromMap != null)
      actionFromMap = ActionEntity.fromMap(actionFromMap);

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

  static MemberActionEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

