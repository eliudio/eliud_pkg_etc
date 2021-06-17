{
  "id": "PolicyPresentation",
  "packageName": "eliud_pkg_etc",
  "isAppModel": true,
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
	"hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": false,
    "isExtension": true,
    "isDocumentCollection": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "displayName": "Document ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "appId",
      "displayName": "App Identifier",
      "remark": "This is the identifier of the app to which this belongs",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "description",
      "displayName": "Description",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "policy",
      "displayName": "Policy",
      "fieldType": "MemberMedium",
      "association": true,
      "optional": true,
      "group": "policy"
    },
    {
      "fieldName": "conditions",
      "displayName": "Conditions",
      "fieldType": "ConditionsSimple",
      "group": "conditions"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "policy",
        "description": "Policy"
    },
    {
        "group": "conditions",
        "description": "Conditions"
    }
 ],
  "listFields": {
    "title": "documentID!",
    "subTitle": "description!"
  },
  "depends": ["eliud_core"]
}