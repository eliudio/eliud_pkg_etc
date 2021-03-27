
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/storage/firestore_helper.dart';
import 'package:eliud_pkg_album/tools/slider/carousel_slider.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_component.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_model.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_repository.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PolicyPresentationComponentConstructorDefault
    implements ComponentConstructor {
  @override
  Widget createNew({String id, Map<String, Object> parameters}) {
    return PolicyPresentation(id: id);
  }
}

class PolicyPresentation extends AbstractPolicyPresentationComponent {
  PolicyPresentation({String id}) : super(policyPresentationID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  Widget yourWidget(BuildContext context, PolicyPresentationModel policyPresentationModel) {
    if (policyPresentationModel.policy == null) return Text('Policy not available');
    if (policyPresentationModel.policy.mediumType != MediumType.Pdf) return Text('Policy not in pdf format. Not supported');

    return FutureBuilder<List<String>>(
        future: ChainOfMediumModels.getChainOfUrls(policyPresentationModel.appId, policyPresentationModel.policy),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AlbumSlider(title: 'policyPresentationModel.title', urls: snapshot.data, initialPage: 0, withCloseButton: false, withNextPrevButton: true,);
          } else {
            return Center(
              child: DelayedCircularProgressIndicator(),
            );
          }
        });
  }

  @override
  PolicyPresentationRepository getPolicyPresentationRepository(BuildContext context) {
    return policyPresentationRepository(appId: AccessBloc.appId(context));
  }
}
