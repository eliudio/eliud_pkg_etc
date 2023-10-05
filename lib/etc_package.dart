import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core_package.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/repository_singleton.dart';
import 'package:eliud_pkg_etc/model/component_registry.dart';

import 'package:eliud_pkg_etc/etc_package_stub.dart'
if (dart.library.io) 'etc_mobile_package.dart'
if (dart.library.html) 'etc_web_package.dart';
import 'package:eliud_pkg_medium/medium_package.dart';

abstract class EtcPackage extends Package {
  EtcPackage() : super('eliud_pkg_etc');

  @override
  Future<List<PackageConditionDetails>>? getAndSubscribe(AccessBloc accessBloc, AppModel app, MemberModel? member, bool isOwner, bool? isBlocked, PrivilegeLevel? privilegeLevel) => null;

  @override
  List<String>? retrieveAllPackageConditions() => null;

  @override
  void init() {
    ComponentRegistry().init();

    AbstractRepositorySingleton.singleton = RepositorySingleton();
  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() => AbstractRepositorySingleton.collections;

  static EtcPackage instance() => getEtcPackage();

  /*
   * Register depending packages
   */
  void registerDependencies(Eliud eliud) {
    eliud.registerPackage(CorePackage.instance());
    eliud.registerPackage(MediumPackage.instance());
  }
}
