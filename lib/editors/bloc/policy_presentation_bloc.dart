import 'package:eliud_core_model/model/storage_conditions_model.dart';
import 'package:eliud_core_model/tools/component/component_spec.dart';
import 'package:eliud_core_model/tools/etc/random.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';

import '../../model/abstract_repository_singleton.dart';
import '../../model/policy_presentation_entity.dart';
import '../../model/policy_presentation_model.dart';

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
