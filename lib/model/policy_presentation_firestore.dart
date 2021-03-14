/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_firestore.dart
                       
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class PolicyPresentationFirestore implements PolicyPresentationRepository {
  Future<PolicyPresentationModel> add(PolicyPresentationModel value) {
    return PolicyPresentationCollection.doc(value.documentID).set(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(PolicyPresentationModel value) {
    return PolicyPresentationCollection.doc(value.documentID).delete();
  }

  Future<PolicyPresentationModel> update(PolicyPresentationModel value) {
    return PolicyPresentationCollection.doc(value.documentID).update(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  PolicyPresentationModel _populateDoc(DocumentSnapshot value) {
    return PolicyPresentationModel.fromEntity(value.id, PolicyPresentationEntity.fromMap(value.data()));
  }

  Future<PolicyPresentationModel> _populateDocPlus(DocumentSnapshot value) async {
    return PolicyPresentationModel.fromEntityPlus(value.id, PolicyPresentationEntity.fromMap(value.data()), appId: appId);  }

  Future<PolicyPresentationModel> get(String id, {Function(Exception) onError}) {
    return PolicyPresentationCollection.doc(id).get().then((doc) {
      if (doc.data() != null)
        return _populateDocPlus(doc);
      else
        return null;
    }).catchError((Object e) {
      if (onError != null) {
        onError(e);
      }
    });
  }

  StreamSubscription<List<PolicyPresentationModel>> listen(PolicyPresentationModelTrigger trigger, {String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery}) {
    Stream<List<PolicyPresentationModel>> stream;
//    stream = getQuery(PolicyPresentationCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().map((data) {
//    The above line is replaced by the below line. The reason is because the same collection can not be subscribed to twice
//    The reason we're subscribing twice to the same list, is because the close on bloc isn't called. This needs to be fixed.
//    See https://github.com/felangel/bloc/issues/2073.
//    In the meantime:
      stream = getQuery(appRepository().getSubCollection(appId, 'policypresentation'), orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().map((data) {
      Iterable<PolicyPresentationModel> policyPresentations  = data.docs.map((doc) {
        PolicyPresentationModel value = _populateDoc(doc);
        return value;
      }).toList();
      return policyPresentations;
    });
    return stream.listen((listOfPolicyPresentationModels) {
      trigger(listOfPolicyPresentationModels);
    });
  }

  StreamSubscription<List<PolicyPresentationModel>> listenWithDetails(PolicyPresentationModelTrigger trigger, {String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery}) {
    Stream<List<PolicyPresentationModel>> stream;
//  stream = getQuery(PolicyPresentationCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots()
//  see comment listen(...) above
    stream = getQuery(appRepository().getSubCollection(appId, 'policypresentation'), orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPolicyPresentationModels) {
      trigger(listOfPolicyPresentationModels);
    });
  }

  @override
  StreamSubscription<PolicyPresentationModel> listenTo(String documentId, PolicyPresentationChanged changed) {
    var stream = PolicyPresentationCollection.doc(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    return stream.listen((value) {
      changed(value);
    });
  }

  Stream<List<PolicyPresentationModel>> values({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    DocumentSnapshot lastDoc;
    Stream<List<PolicyPresentationModel>> _values = getQuery(PolicyPresentationCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<PolicyPresentationModel>> valuesWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    DocumentSnapshot lastDoc;
    Stream<List<PolicyPresentationModel>> _values = getQuery(PolicyPresentationCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<PolicyPresentationModel>> valuesList({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    DocumentSnapshot lastDoc;
    List<PolicyPresentationModel> _values = await getQuery(PolicyPresentationCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).get().then((value) {
      var list = value.docs;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<PolicyPresentationModel>> valuesListWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    DocumentSnapshot lastDoc;
    List<PolicyPresentationModel> _values = await getQuery(PolicyPresentationCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  void flush() {}

  Future<void> deleteAll() {
    return PolicyPresentationCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return PolicyPresentationCollection.doc(documentId).collection(name);
  }

  String timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  Future<PolicyPresentationModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return PolicyPresentationCollection.doc(documentId).update({fieldName: change}).then((v) => get(documentId));
  }


  final String appId;
  PolicyPresentationFirestore(this.PolicyPresentationCollection, this.appId);

  final CollectionReference PolicyPresentationCollection;
}

