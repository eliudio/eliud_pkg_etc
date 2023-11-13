/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_action_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_pkg_etc/model/model_export.dart';

import 'package:eliud_pkg_etc/model/member_action_list_bloc.dart';
import 'package:eliud_pkg_etc/model/member_action_list_event.dart';
import 'package:eliud_pkg_etc/model/member_action_model.dart';
import 'package:eliud_pkg_etc/model/member_action_form_bloc.dart';
import 'package:eliud_pkg_etc/model/member_action_form_event.dart';
import 'package:eliud_pkg_etc/model/member_action_form_state.dart';

class MemberActionForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final MemberActionModel? value;
  final ActionModel? submitAction;

  MemberActionForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the MemberActionForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<MemberActionFormBloc>(
        create: (context) => MemberActionFormBloc(
          appId,
        )..add(InitialiseMemberActionFormEvent(value: value)),
        child: _MyMemberActionForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<MemberActionFormBloc>(
        create: (context) => MemberActionFormBloc(
          appId,
        )..add(InitialiseMemberActionFormNoLoadEvent(value: value)),
        child: _MyMemberActionForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update MemberAction'
                      : 'Add MemberAction'),
          body: BlocProvider<MemberActionFormBloc>(
            create: (context) => MemberActionFormBloc(
              appId,
            )..add((formAction == FormAction.updateAction
                ? InitialiseMemberActionFormEvent(value: value)
                : InitialiseNewMemberActionFormEvent())),
            child: _MyMemberActionForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyMemberActionForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyMemberActionForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyMemberActionForm> createState() =>
      _MyMemberActionFormState(formAction);
}

class _MyMemberActionFormState extends State<_MyMemberActionForm> {
  final FormAction? formAction;
  late MemberActionFormBloc _myFormBloc;

  final TextEditingController _textController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  _MyMemberActionFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberActionFormBloc>(context);
    _textController.addListener(_onTextChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MemberActionFormBloc, MemberActionFormState>(
        builder: (context, state) {
      if (state is MemberActionFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is MemberActionFormLoaded) {
        _textController.text = state.value!.text.toString();
        _descriptionController.text = state.value!.description.toString();
      }
      if (state is MemberActionFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'text',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _textController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is TextMemberActionFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'description',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _descriptionController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DescriptionMemberActionFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Action')));

        children.add(
            ActionField(widget.app, state.value!.action, _onActionChanged));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(accessState, state)
                    ? null
                    : () {
                        if (state is MemberActionFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<MemberActionListBloc>(context)
                                .add(UpdateMemberActionList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              text: state.value!.text,
                              description: state.value!.description,
                              action: state.value!.action,
                            )));
                          } else {
                            BlocProvider.of<MemberActionListBloc>(context)
                                .add(AddMemberActionList(
                                    value: MemberActionModel(
                              documentID: state.value!.documentID,
                              text: state.value!.text,
                              description: state.value!.description,
                              action: state.value!.action,
                            )));
                          }
                          if (widget.submitAction != null) {
                            eliudrouter.Router.navigateTo(
                                context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onTextChanged() {
    _myFormBloc.add(ChangedMemberActionText(value: _textController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(
        ChangedMemberActionDescription(value: _descriptionController.text));
  }

  void _onActionChanged(value) {
    _myFormBloc.add(ChangedMemberActionAction(value: value));
  }

  @override
  void dispose() {
    _textController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, MemberActionFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
