import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_main/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_pkg_etc_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc_model/model/policy_presentation_entity.dart';
import 'package:eliud_pkg_etc_model/model/policy_presentation_model.dart';

class PolicyPresentationBloc
    extends EditorBaseBloc<PolicyPresentationModel, PolicyPresentationEntity> {
  PolicyPresentationBloc(String appId, EditorFeedback feedback)
      : super(appId, policyPresentationRepository(appId: appId)!, feedback);

  @override
  PolicyPresentationModel newInstance(StorageConditionsModel conditions) {
    return PolicyPresentationModel(
        appId: appId,
        documentID: newRandomKey(),
        conditions: conditions,
        description: 'new policy');
  }

  @override
  PolicyPresentationModel setDefaultValues(
      PolicyPresentationModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: t.conditions ?? conditions);
  }
}
