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

typedef MemberActionListChanged = Function(List<MemberActionModel> values);

memberActionsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.memberActionsList(app, context, value, trigger);

class EmbeddedComponentFactory {
/* 
 * memberActionsList function to construct a list of MemberActionModel
 */
  static Widget memberActionsList(AppModel app, BuildContext context,
      List<MemberActionModel> values, MemberActionListChanged trigger) {
    MemberActionInMemoryRepository inMemoryRepository =
        MemberActionInMemoryRepository(
      trigger,
      values,
    );
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

/* 
 * MemberActionInMemoryRepository is an in memory implementation of MemberActionRepository
 */
class MemberActionInMemoryRepository implements MemberActionRepository {
  final List<MemberActionModel> items;
  final MemberActionListChanged trigger;
  Stream<List<MemberActionModel>>? theValues;

  /* 
     * Construct the MemberActionInMemoryRepository
     */
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

  /* 
     * Add an entity
     */
  @override
  Future<MemberActionEntity> addEntity(
      String documentID, MemberActionEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update an entity
     */
  @override
  Future<MemberActionEntity> updateEntity(
      String documentID, MemberActionEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update a model
     */
  @override
  Future<MemberActionModel> add(MemberActionModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  /* 
     * Delete a model
     */
  @override
  Future<void> delete(MemberActionModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  /* 
     * Update a model
     */
  @override
  Future<MemberActionModel> update(MemberActionModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  /* 
     * Get a model
     */
  @override
  Future<MemberActionModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<MemberActionModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  /* 
     * Retrieve to a list of MemberActionModel base on a query
     */
  @override
  Stream<List<MemberActionModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Retrieve to a list of MemberActionModel, including linked models base on a query
     */
  @override
  Stream<List<MemberActionModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Subscribe to a list of MemberActionModel base on a query
     */
  @override
  StreamSubscription<List<MemberActionModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Subscribe to a list of MemberActionModel, including linked models, base on a query
     */
  @override
  StreamSubscription<List<MemberActionModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Flush the repository
     */
  @override
  void flush() {}

  /* 
     * Retrieve the list of models
     */
  @override
  Future<List<MemberActionModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<MemberActionModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  /* 
     * Retrieve a subcollection of this collection
     */
  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  /* 
   * Subscribe to 1 document / 1 model
   */
  @override
  StreamSubscription<MemberActionModel> listenTo(
      String documentId, MemberActionChanged changed,
      {MemberActionErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<MemberActionModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<MemberActionEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  MemberActionEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}
