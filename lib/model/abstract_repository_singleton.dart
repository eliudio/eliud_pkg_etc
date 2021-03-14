/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/abstract_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/policy_presentation_repository.dart';
import 'package:eliud_core/core/access/bloc/user_repository.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/package/package.dart';

PolicyPresentationRepository policyPresentationRepository({ String appId }) => AbstractRepositorySingleton.singleton.policyPresentationRepository(appId);

abstract class AbstractRepositorySingleton {
  static List<MemberCollectionInfo> collections = [
  ];
  static AbstractRepositorySingleton singleton;

  PolicyPresentationRepository policyPresentationRepository(String appId);

  void flush(String appId) {
  }
}
