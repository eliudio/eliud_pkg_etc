import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_core/tools/storage/medium_info.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_component.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_model.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_repository.dart';
import 'package:eliud_pkg_medium/tools/slider/album_slider.dart';
import 'package:eliud_pkg_medium/tools/slider/slide_image_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PolicyPresentationComponentConstructorDefault
    implements ComponentConstructor {
  @override
  Widget createNew({Key? key, required AppModel app, required String id, Map<String, dynamic>? parameters}) {
    return PolicyPresentation(key: key, app: app, id: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async => await policyPresentationRepository(appId: app.documentID)!.get(id);
}

class PolicyPresentation extends AbstractPolicyPresentationComponent {
  PolicyPresentation({Key? key, required AppModel app, required String id}) : super(key: key, app: app, policyPresentationId: id);

  @override
  Widget yourWidget(
      BuildContext context, PolicyPresentationModel? policyPresentationModel) {
    if (policyPresentationModel!.policy == null)
      return Text('Policy not available');
//    if (policyPresentationModel.policy!.mediumType != PublicMediumType.Pdf)
//      return Text('Policy not in pdf format. Not supported');

    return FutureBuilder<List<String?>>(
        future: ChainOfMediumModels.getPublicMediumChainOfUrls(
            policyPresentationModel.appId, policyPresentationModel.policy!),
        builder: (context, snapshot) {
          if ((snapshot.hasData) && (snapshot.data != null)) {
            var height = fullScreenHeight(context) - 30;
            if (snapshot.data!.isNotEmpty) {
              //title: 'Policy',
              return AlbumSlider(app: app,
                height: height,
                slideImageProvider: UrlSlideImageProvider(
                    ListHelper.getStringList(snapshot.data!)),
                initialPage: 0,
              );
            } else {
              return text(app, context, 'No contents');
            }
          } else {
            return progressIndicator(app, context);
          }
        });
  }
}
