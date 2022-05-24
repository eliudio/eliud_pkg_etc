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
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:intl/intl.dart';

import 'package:eliud_core/eliud.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_pkg_etc/model/embedded_component.dart';
import 'package:eliud_pkg_etc/tools/bespoke_formfields.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/repository_export.dart';
import 'package:eliud_pkg_etc/model/embedded_component.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_etc/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_etc/model/entity_export.dart';

import 'package:eliud_pkg_etc/model/member_action_list_bloc.dart';
import 'package:eliud_pkg_etc/model/member_action_list_event.dart';
import 'package:eliud_pkg_etc/model/member_action_model.dart';
import 'package:eliud_pkg_etc/model/member_action_form_bloc.dart';
import 'package:eliud_pkg_etc/model/member_action_form_event.dart';
import 'package:eliud_pkg_etc/model/member_action_form_state.dart';


class MemberActionForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  MemberActionModel? value;
  ActionModel? submitAction;

  MemberActionForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<MemberActionFormBloc >(
            create: (context) => MemberActionFormBloc(appId,
                                       
                                                )..add(InitialiseMemberActionFormEvent(value: value)),
  
        child: MyMemberActionForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<MemberActionFormBloc >(
            create: (context) => MemberActionFormBloc(appId,
                                       
                                                )..add(InitialiseMemberActionFormNoLoadEvent(value: value)),
  
        child: MyMemberActionForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update MemberAction' : 'Add MemberAction'),
        body: BlocProvider<MemberActionFormBloc >(
            create: (context) => MemberActionFormBloc(appId,
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseMemberActionFormEvent(value: value) : InitialiseNewMemberActionFormEvent())),
  
        child: MyMemberActionForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyMemberActionForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyMemberActionForm({required this.app, this.formAction, this.submitAction});

  _MyMemberActionFormState createState() => _MyMemberActionFormState(this.formAction);
}


class _MyMemberActionFormState extends State<MyMemberActionForm> {
  final FormAction? formAction;
  late MemberActionFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();


  _MyMemberActionFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberActionFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _textController.addListener(_onTextChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MemberActionFormBloc, MemberActionFormState>(builder: (context, state) {
      if (state is MemberActionFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is MemberActionFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.text != null)
          _textController.text = state.value!.text.toString();
        else
          _textController.text = "";
        if (state.value!.description != null)
          _descriptionController.text = state.value!.description.toString();
        else
          _descriptionController.text = "";
      }
      if (state is MemberActionFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'text', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _textController, keyboardType: TextInputType.text, validator: (_) => state is TextMemberActionFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _descriptionController, keyboardType: TextInputType.text, validator: (_) => state is DescriptionMemberActionFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Action')
                ));

        children.add(

                ActionField(widget.app, state.value!.action, _onActionChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is MemberActionFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<MemberActionListBloc>(context).add(
                          UpdateMemberActionList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              text: state.value!.text, 
                              description: state.value!.description, 
                              action: state.value!.action, 
                        )));
                      } else {
                        BlocProvider.of<MemberActionListBloc>(context).add(
                          AddMemberActionList(value: MemberActionModel(
                              documentID: state.value!.documentID, 
                              text: state.value!.text, 
                              description: state.value!.description, 
                              action: state.value!.action, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                ));

        return StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().container(widget.app, context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedMemberActionDocumentID(value: _documentIDController.text));
  }


  void _onTextChanged() {
    _myFormBloc.add(ChangedMemberActionText(value: _textController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedMemberActionDescription(value: _descriptionController.text));
  }


  void _onActionChanged(value) {
    _myFormBloc.add(ChangedMemberActionAction(value: value));
    
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _textController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, MemberActionFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



