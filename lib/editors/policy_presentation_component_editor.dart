import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_etc/editors/policy_presentation_bloc/policy_presentation_bloc.dart';
import 'package:eliud_pkg_etc/editors/policy_presentation_bloc/policy_presentation_event.dart';
import 'package:eliud_pkg_etc/editors/policy_presentation_bloc/policy_presentation_state.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_model.dart';
import 'package:eliud_core/package/access_rights.dart';
import 'package:eliud_pkg_medium/platform/medium_platform.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PolicyPresentationComponentEditorConstructor
    extends ComponentEditorConstructor {
  @override
  void updateComponent(
      AppModel app, BuildContext context, model, EditorFeedback feedback) {
    _openIt(app, context, false, model.copyWith(), feedback);
  }

  @override
  void createNewComponent(
      AppModel app, BuildContext context, EditorFeedback feedback) {
    _openIt(
        app,
        context,
        true,
        PolicyPresentationModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(
      AppModel app, BuildContext context, String id, EditorFeedback feedback) async {
    var policyPresentation =
        await policyPresentationRepository(appId: app.documentID!)!
        .get(id);
    if (policyPresentation != null) {
      _openIt(app, context, false, policyPresentation, feedback);
    } else {
      openErrorDialog(app, context, app.documentID! + '/_error',
          title: 'Error', errorMessage: 'Cannot find policyPresentation with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      PolicyPresentationModel model, EditorFeedback feedback) {
    openComplexDialog(app, context, app.documentID! + '/policypresentation',
        title: create
            ? 'Create policy presentation'
            : 'Update policy presentation',
        includeHeading: false,
        widthFraction: .9,
        child: BlocProvider<PolicyPresentationBloc>(
          create: (context) => PolicyPresentationBloc(
            app.documentID!,
            /*create,
            */
            feedback,
          )..add(PolicyPresentationInitialise(model)),
          child: PolicyPresentationComponentEditor(
            app: app,
          ),
        ));
  }
}

class PolicyPresentationComponentEditor extends StatefulWidget {
  final AppModel app;

  const PolicyPresentationComponentEditor({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _PolicyPresentationComponentEditorState();
}

class _PolicyPresentationComponentEditorState
    extends State<PolicyPresentationComponentEditor> {
  static double height = 200;
  double? _progress;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<PolicyPresentationBloc, PolicyPresentationState>(
            builder: (ppContext, policyPresentationState) {
          if (policyPresentationState is PolicyPresentationInitialised) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'Policy Presentation',
                    okAction: () async {
                      BlocProvider.of<PolicyPresentationBloc>(context).save(
                          PolicyPresentationApplyChanges(
                              policyPresentationState.model,
                              policyPresentationState.media));
                      return true;
                    },
                    cancelAction: () async {
                      return true;
                    },
                  ),
                  topicContainer(widget.app, context,
                      title: 'General',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.vpn_key),
                            title: text(widget.app, context,
                                policyPresentationState.model.documentID!)),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Condition',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.security),
                            title: ConditionsSimpleWidget(
                              app: widget.app,
                              value: policyPresentationState.model.conditions!,
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Pages',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        _images(policyPresentationState),
                      ])
                ]);
          } else {
            return progressIndicator(widget.app, context);
          }
        });
      } else {
        return progressIndicator(widget.app, context);
      }
    });
  }

  Widget _images(PolicyPresentationInitialised state) {
    List<Widget> widgets = [];
    if (state.media != null) {
      int index = 0;
      for (var medium in state.media) {
        widgets.add(PopupMenuButton(
          icon: Image.network(
            medium.url!,
//            height: height,
          ),
          onSelected: (value) async {
            if (value == 1) {
              BlocProvider.of<PolicyPresentationBloc>(context)
                  .add(DeletePolicyPageEvent(medium));
            } else if (value == 2) {
              AbstractMediumPlatform.platform!
                  .showPhotosPublic(context, widget.app, state.media, index);
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: text(widget.app, context, 'Delete'),
            ),
            PopupMenuItem(
              value: 2,
              child: text(widget.app, context, 'View'),
            ),
          ],
        ));
        index++;
      }
    }
    widgets.add(_addButton());

    return GridView.extent(
        maxCrossAxisExtent: 200,
        padding: const EdgeInsets.all(0),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        physics: const ScrollPhysics(), // to disable GridView's scrolling
        shrinkWrap: true,
        children: widgets);
    return Column(children: widgets);
  }

  Widget _addButton() {
    if (_progress != null) {
      return progressIndicatorWithValue(widget.app, context, value: _progress!);
    } else {
      return PopupMenuButton<int>(
          child: Icon(Icons.add),
          elevation: 10,
          itemBuilder: (context) => [
                if (AbstractMediumPlatform.platform!.hasCamera())
                  PopupMenuItem(
                    value: 0,
                    child: text(widget.app, context, 'Take photo'),
                  ),
                PopupMenuItem(
                  value: 1,
                  child: text(widget.app, context, 'Upload image'),
                ),
              ],
          onSelected: (value) async {
            if (value == 0) {
              AbstractMediumPlatform.platform!.takePhoto(
                  context,
                  widget.app,
                  widget.app.ownerID!,
                  () => PublicMediumAccessRights(),
                  (photo) => _photoFeedbackFunction(photo),
                  _photoUploading,
                  allowCrop: false);
            } else if (value == 1) {
              AbstractMediumPlatform.platform!.uploadPhoto(
                  context,
                  widget.app,
                  widget.app.ownerID!,
                  () => PublicMediumAccessRights(),
                  (photo) => _photoFeedbackFunction(photo),
                  _photoUploading,
                  allowCrop: false);
            }
          });
    }
  }

  void _photoFeedbackFunction(PublicMediumModel? platformMediumModel) {
    setState(() {
      _progress = null;
      if (platformMediumModel != null) {
        BlocProvider.of<PolicyPresentationBloc>(context)
            .add(NewPolicyPageEvent(platformMediumModel));
      }
    });
  }

  void _photoUploading(dynamic progress) {
    if (progress != null) {}
    setState(() {
      _progress = progress;
    });
  }
}
