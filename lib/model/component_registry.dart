/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/internal_component.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core_model/tools/component/component_spec.dart';
import 'abstract_repository_singleton.dart';

import '../extensions/policy_presentation_component.dart';
import '../editors/policy_presentation_component_editor.dart';
import 'policy_presentation_component_selector.dart';

/* 
 * Component registry contains a list of components
 */
class ComponentRegistry {
  /* 
   * Initialise the component registry
   */
  void init() {
    Apis.apis().addInternalComponents('eliud_pkg_etc', [
      "policyPresentations",
    ]);

    Apis.apis().register(
        componentName: "eliud_pkg_etc_internalWidgets",
        componentConstructor: ListComponentFactory());
    Apis.apis().addDropDownSupporter(
        "policyPresentations", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "policyPresentations",
        componentConstructor: PolicyPresentationComponentConstructorDefault());
    Apis.apis().addComponentSpec('eliud_pkg_etc', 'etc', [
      ComponentSpec(
          'policyPresentations',
          PolicyPresentationComponentConstructorDefault(),
          PolicyPresentationComponentSelector(),
          PolicyPresentationComponentEditorConstructor(),
          ({String? appId}) => policyPresentationRepository(appId: appId)!),
    ]);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_etc',
        'policyPresentations',
        ({String? appId}) => policyPresentationRepository(appId: appId)!);
  }
}
