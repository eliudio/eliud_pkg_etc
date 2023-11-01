/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/embedded_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/model/app_model.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/member_action_list_bloc.dart';
import '../model/member_action_list.dart';
import '../model/member_action_list_event.dart';
import '../model/member_action_model.dart';
import '../model/member_action_entity.dart';
import '../model/member_action_repository.dart';

typedef MemberActionListChanged(List<MemberActionModel> values);

memberActionsList(app, context, value, trigger) => EmbeddedComponentFactory.memberActionsList(app, context, value, trigger);

class EmbeddedComponentFactory {

static Widget memberActionsList(AppModel app, BuildContext context, List<MemberActionModel> values, MemberActionListChanged trigger) {
  MemberActionInMemoryRepository inMemoryRepository = MemberActionInMemoryRepository(trigger, values,);
  return MultiBlocProvider(
    providers: [
      BlocProvider<MemberActionListBloc>(
        create: (context) => MemberActionListBloc(
          memberActionRepository: inMemoryRepository,
          )..add(LoadMemberActionList()),
        )
        ],
    child: MemberActionListWidget(app: app, isEmbedded: true),
  );
}


}

class MemberActionInMemoryRepository implements MemberActionRepository {
    final List<MemberActionModel> items;
    final MemberActionListChanged trigger;
    Stream<List<MemberActionModel>>? theValues;

    MemberActionInMemoryRepository(this.trigger, this.items) {
        List<List<MemberActionModel>> myList = <List<MemberActionModel>>[];
        myList.add(items);
        theValues = Stream<List<MemberActionModel>>.fromIterable(myList);
    }

    int _index(String documentID) {
      int i = 0;
      for (final item in items) {
        if (item.documentID == documentID) {
          return i;
        }
        i++;
      }
      return -1;
    }

    Future<MemberActionEntity> addEntity(String documentID, MemberActionEntity value) {
      throw Exception('Not implemented'); 
    }

    Future<MemberActionEntity> updateEntity(String documentID, MemberActionEntity value) {
      throw Exception('Not implemented'); 
    }

    Future<MemberActionModel> add(MemberActionModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
        return Future.value(value);
    }

    Future<void> delete(MemberActionModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
      return Future.value(value);
    }

    Future<MemberActionModel> update(MemberActionModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
      return Future.value(value);
    }

    Future<MemberActionModel> get(String? id, { Function(Exception)? onError }) {
      int index = _index(id!);
      var completer = new Completer<MemberActionModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<MemberActionModel>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    Stream<List<MemberActionModel>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    @override
    StreamSubscription<List<MemberActionModel>> listen(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<MemberActionModel>> listenWithDetails(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<MemberActionModel>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<MemberActionModel>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return Future.value(items);
    }

    @override
    getSubCollection(String documentId, String name) {
      throw UnimplementedError();
    }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }
  
  @override
  StreamSubscription<MemberActionModel> listenTo(String documentId, MemberActionChanged changed, {MemberActionErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<MemberActionModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }
  
  @override
  Future<MemberActionEntity?> getEntity(String? id, {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  MemberActionEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

    Future<void> deleteAll() async {}
}

