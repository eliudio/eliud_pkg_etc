/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'dart:collection';
import '../model/member_action_repository.dart';
import '../model/member_action_cache.dart';
import '../model/policy_presentation_firestore.dart';
import '../model/policy_presentation_repository.dart';
import '../model/policy_presentation_cache.dart';

import '../model/policy_presentation_model.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
    var _policyPresentationRepository = HashMap<String, PolicyPresentationRepository>();

    PolicyPresentationRepository? policyPresentationRepository(String? appId) {
      if ((appId != null) && (_policyPresentationRepository[appId] == null)) _policyPresentationRepository[appId] = PolicyPresentationCache(PolicyPresentationFirestore(() => appRepository()!.getSubCollection(appId, 'policypresentation'), appId));
      return _policyPresentationRepository[appId];
    }

}
