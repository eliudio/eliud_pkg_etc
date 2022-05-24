/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_etc/model/policy_presentation_component_bloc.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_component_event.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_model.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_repository.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractPolicyPresentationComponent extends StatelessWidget {
  static String componentName = "policyPresentations";
  final AppModel app;
  final String policyPresentationId;

  AbstractPolicyPresentationComponent({Key? key, required this.app, required this.policyPresentationId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PolicyPresentationComponentBloc> (
          create: (context) => PolicyPresentationComponentBloc(
            policyPresentationRepository: policyPresentationRepository(appId: app.documentID)!)
        ..add(FetchPolicyPresentationComponent(id: policyPresentationId)),
      child: _policyPresentationBlockBuilder(context),
    );
  }

  Widget _policyPresentationBlockBuilder(BuildContext context) {
    return BlocBuilder<PolicyPresentationComponentBloc, PolicyPresentationComponentState>(builder: (context, state) {
      if (state is PolicyPresentationComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(app: app, title: "Error", content: 'No PolicyPresentation defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is PolicyPresentationComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is PolicyPresentationComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, PolicyPresentationModel value);
}

