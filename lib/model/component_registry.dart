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
import 'package:eliud_core/tools/registry.dart';

import '../extensions/policy_presentation_component.dart';
import 'package:eliud_pkg_etc/model/internal_component.dart';




class ComponentRegistry {

  void init() {
    Registry.registry()!.addInternalComponents('eliud_pkg_etc', ["policyPresentations", ]);

    Registry.registry()!.register(componentName: "eliud_pkg_etc_internalWidgets", componentConstructor: ListComponentFactory());
    Registry.registry()!.addDropDownSupporter("policyPresentations", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "policyPresentations", componentConstructor: PolicyPresentationComponentConstructorDefault());

  }
}


