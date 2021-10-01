import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/repository_singleton.dart';
import 'package:eliud_pkg_etc/model/component_registry.dart';

abstract class EtcPackage extends Package {
  EtcPackage() : super('eliud_pkg_etc');

  @override
  BlocProvider? createMainBloc(NavigatorBloc navigatorBloc, AccessBloc accessBloc) => null;

  @override
  Future<bool?> isConditionOk(String packageCondition, AppModel app, MemberModel? member, bool isOwner, bool? isBlocked, PrivilegeLevel? privilegeLevel) async => null;

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
