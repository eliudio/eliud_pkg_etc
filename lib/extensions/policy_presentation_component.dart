import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core_model/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_core/tools/storage/medium_info.dart';
import 'package:eliud_pkg_etc/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_component.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_model.dart';
import 'package:eliud_pkg_medium/tools/slider/album_slider.dart';
import 'package:eliud_pkg_medium/tools/slider/slide_image_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PolicyPresentationComponentConstructorDefault
    implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return PolicyPresentation(key: key, app: app, id: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await policyPresentationRepository(appId: app.documentID)!.get(id);
}

class PolicyPresentation extends AbstractPolicyPresentationComponent {
  PolicyPresentation({super.key, required super.app, required String id})
      : super(policyPresentationId: id);

  @override
  Widget yourWidget(BuildContext context, PolicyPresentationModel? value) {
    if (value!.policies == null) {
      return text(app, context, 'Policy not available');
    }
    if (value.policies!.policy == null) {
      return text(app, context, 'Policy has no pages');
    }

    return FutureBuilder<List<String?>>(
        future: ChainOfMediumModels.getPlatformMediumChainOfUrls(
            value.appId, value.policies!.policy!),
        builder: (context, snapshot) {
          if ((snapshot.hasData) && (snapshot.data != null)) {
            var height = fullScreenHeight(context) - 30;
            if (snapshot.data!.isNotEmpty) {
              //title: 'Policy',
              return AlbumSlider(
                app: app,
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
