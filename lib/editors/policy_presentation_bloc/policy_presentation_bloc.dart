import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_pkg_etc/editors/policy_presentation_bloc/policy_presentation_event.dart';
import 'package:eliud_pkg_etc/editors/policy_presentation_bloc/policy_presentation_state.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';

class PolicyPresentationBloc
    extends Bloc<PolicyPresentationEvent, PolicyPresentationState> {
  final String appId;
//  final bool create; // don't think I need this!!!
  final EditorFeedback feedback;

  PolicyPresentationBloc(this.appId, /*this.create, */ this.feedback)
      : super(PolicyPresentationUninitialised()) {
    on<PolicyPresentationInitialise>((event, emit) async {
      List<PublicMediumModel>? media = [];
      // retrieve the model, as it was retrieved without links
      var modelWithLinks = await policyPresentationRepository(appId: appId)!
          .get(event.model.documentID);
      if (modelWithLinks != null) {
        var currentPublicMediumModel = modelWithLinks.policy;
        if (currentPublicMediumModel != null) {
          if (currentPublicMediumModel.mediumType == PublicMediumType.Photo)
            media.add(currentPublicMediumModel);
          while (currentPublicMediumModel!.relatedMediumId != null) {
            currentPublicMediumModel =
                await publicMediumRepository(appId: appId)!
                    .get(currentPublicMediumModel.relatedMediumId);
            if ((currentPublicMediumModel != null) &&
                (currentPublicMediumModel.mediumType ==
                    PublicMediumType.Photo)) {
              media.add(currentPublicMediumModel);
            }
          }
        }
        emit(PolicyPresentationInitialised(modelWithLinks, media));
      } else {
        emit(PolicyPresentationInitialised(
            event.model.copyWith(
                conditions: StorageConditionsModel(
                    privilegeLevelRequired: PrivilegeLevelRequiredSimple
                        .NoPrivilegeRequiredSimple)),
            []));
      }
    });

    on<NewPolicyPageEvent>((event, emit) {
      var theState = state as PolicyPresentationInitialised;
      List<PublicMediumModel> newMedia = theState.media.map((v) => v).toList();
      newMedia.add(event.newPage);
      emit(PolicyPresentationInitialised(theState.model, newMedia));
    });

    on<DeletePolicyPageEvent>((event, emit) {
      var theState = state as PolicyPresentationInitialised;
      List<PublicMediumModel> newMedia = [];
      for (var medium in theState.media) {
        if (medium != event.deletePage) {
          newMedia.add(medium);
        }
      }
      emit(PolicyPresentationInitialised(theState.model, newMedia));
    });
  }

  Future<void> save(PolicyPresentationApplyChanges event) async {
    if (state is PolicyPresentationInitialised) {
      var theState = state as PolicyPresentationInitialised;
      var newModel = theState.model.copyWith();
      if (theState.media.isNotEmpty) {
        newModel = newModel.copyWith(policy: theState.media[0]);
        for (var medium in theState.media) {
          if (await publicMediumRepository(appId: appId)!
                  .get(medium.documentID) ==
              null) {
            await publicMediumRepository(appId: appId)!.add(medium);
          } else {
            await publicMediumRepository(appId: appId)!.update(medium);
          }
        }
      }
      if (await policyPresentationRepository(appId: appId)!
              .get(newModel.documentID) ==
          null) {
        await policyPresentationRepository(appId: appId)!.add(newModel);
      } else {
        await policyPresentationRepository(appId: appId)!.update(newModel);
      }
      feedback(true);
    }
  }
}
