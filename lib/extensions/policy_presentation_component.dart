import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/storage/medium_info.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_component.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_model.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_repository.dart';
import 'package:eliud_pkg_medium/tools/slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PolicyPresentationComponentConstructorDefault
    implements ComponentConstructor {
  @override
  Widget createNew({Key? key, required String id, Map<String, dynamic>? parameters}) {
    return PolicyPresentation(key: key, id: id);
  }

  @override
  Future<dynamic> getModel({required String appId, required String id}) async => await policyPresentationRepository(appId: appId)!.get(id);
}

class PolicyPresentation extends AbstractPolicyPresentationComponent {
  PolicyPresentation({Key? key, required String id}) : super(key: key, policyPresentationID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  Widget yourWidget(
      BuildContext context, PolicyPresentationModel? policyPresentationModel) {
    if (policyPresentationModel!.policy == null)
      return Text('Policy not available');
    if (policyPresentationModel.policy!.mediumType != PlatformMediumType.Pdf)
      return Text('Policy not in pdf format. Not supported');

    return FutureBuilder<List<String?>>(
        future: ChainOfMediumModels.getPlatformMediumChainOfUrls(
            policyPresentationModel.appId!, policyPresentationModel.policy!),
        builder: (context, snapshot) {
          if ((snapshot.hasData) && (snapshot.data != null)) {
            if (snapshot.data!.isNotEmpty) {
              return AlbumSlider(
                title: 'policyPresentationModel.title',
                slideImageProvider: UrlSlideImageProvider(
                    ListHelper.getStringList(snapshot.data!)),
                initialPage: 0,
                withCloseButton: false,
                withNextPrevButton: true,
              );
            } else {
              return text(context, 'No contents');
            }
          } else {
            return progressIndicator(context);
          }
        });
  }

  @override
  PolicyPresentationRepository getPolicyPresentationRepository(
      BuildContext context) {
    return policyPresentationRepository(appId: AccessBloc.currentAppId(context))!;
  }
}
