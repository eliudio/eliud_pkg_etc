/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_action_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_etc/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';


import 'package:eliud_pkg_etc/model/member_action_entity.dart';

import 'package:eliud_core/tools/random.dart';



class MemberActionModel {
  String? documentID;
  String? text;
  String? description;
  ActionModel? action;

  MemberActionModel({this.documentID, this.text, this.description, this.action, })  {
    assert(documentID != null);
  }

  MemberActionModel copyWith({String? documentID, String? text, String? description, ActionModel? action, }) {
    return MemberActionModel(documentID: documentID ?? this.documentID, text: text ?? this.text, description: description ?? this.description, action: action ?? this.action, );
  }

  @override
  int get hashCode => documentID.hashCode ^ text.hashCode ^ description.hashCode ^ action.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MemberActionModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          text == other.text &&
          description == other.description &&
          action == other.action;

  @override
  String toString() {
    return 'MemberActionModel{documentID: $documentID, text: $text, description: $description, action: $action}';
  }

  MemberActionEntity toEntity({String? appId}) {
    return MemberActionEntity(
          text: (text != null) ? text : null, 
          description: (description != null) ? description : null, 
          action: (action != null) ? action!.toEntity(appId: appId) : null, 
    );
  }

  static Future<MemberActionModel?> fromEntity(String documentID, MemberActionEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return MemberActionModel(
          documentID: documentID, 
          text: entity.text, 
          description: entity.description, 
          action: 
            await ActionModel.fromEntity(entity.action), 
    );
  }

  static Future<MemberActionModel?> fromEntityPlus(String documentID, MemberActionEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return MemberActionModel(
          documentID: documentID, 
          text: entity.text, 
          description: entity.description, 
          action: 
            await ActionModel.fromEntityPlus(entity.action, appId: appId), 
    );
  }

}

