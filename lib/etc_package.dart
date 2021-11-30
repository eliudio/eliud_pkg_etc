import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/repository_singleton.dart';
import 'package:eliud_pkg_etc/model/component_registry.dart';

abstract class EtcPackage extends Package {
  EtcPackage() : super('eliud_pkg_etc');

  @override
  Future<bool?> isConditionOk(AccessBloc accessBloc, String pluginCondition, AppModel app, MemberModel? member, bool isOwner, bool? isBlocked, PrivilegeLevel? privilegeLevel) async => null;

  @override
  List<String>? retrieveAllPackageConditions() => null;

  @override
  void init() {
    ComponentRegistry().init();

    AbstractRepositorySingleton.singleton = RepositorySingleton();
  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() => AbstractRepositorySingleton.collections;
}
