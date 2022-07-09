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
import 'package:eliud_core/tools/component/component_spec.dart';
import 'abstract_repository_singleton.dart';

import '../extensions/policy_presentation_component.dart';
import '../editors/policy_presentation_component_editor.dart';
import 'policy_presentation_component_selector.dart';
import 'package:eliud_pkg_etc/model/internal_component.dart';




class ComponentRegistry {

  void init() {
    Registry.registry()!.addInternalComponents('eliud_pkg_etc', ["policyPresentations", ]);

    Registry.registry()!.register(componentName: "eliud_pkg_etc_internalWidgets", componentConstructor: ListComponentFactory());
    Registry.registry()!.addDropDownSupporter("policyPresentations", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "policyPresentations", componentConstructor: PolicyPresentationComponentConstructorDefault());
    Registry.registry()!.addComponentSpec('eliud_pkg_etc', 'etc', [
      ComponentSpec('policyPresentations', PolicyPresentationComponentConstructorDefault(), PolicyPresentationComponentSelector(), PolicyPresentationComponentEditorConstructor(), ({String? appId}) => policyPresentationRepository(appId: appId)! ), 
    ]);
      Registry.registry()!.registerRetrieveRepository('eliud_pkg_etc', 'policyPresentations', ({String? appId}) => policyPresentationRepository(appId: appId)!);

  }
}


