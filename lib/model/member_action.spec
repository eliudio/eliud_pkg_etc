{
  "id": "MemberAction",
  "packageName": "eliud_pkg_etc",
  "packageFriendlyName": "etc",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID",
      "fieldType": "String",
      "group": "general",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "text",
      "group": "general",
      "fieldType": "String",
      "iconName": "text_format"
    },
    {
      "fieldName": "description",
      "group": "general",
      "fieldType": "String",
      "iconName": "text_format"
    },
    {
      "fieldName": "action",
      "group": "action",
      "fieldType": "Action",
      "bespokeFormField": "ActionField(widget.app, state.value!.action, _onActionChanged)"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "action",
        "description": "Action"
    }
  ],
  "listFields": {
    "title": "value.text != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.text!)) : Container()",
    "subTitle": "value.description != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.description!)) : Container()"
  }
}