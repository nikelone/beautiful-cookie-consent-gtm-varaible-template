___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Beautiful Cookie Banner - Consent Status",
  "categories": ["UTILITY", "ANALYTICS"],
  "description": "This variable can be used with the wordpress plugin \"beautiful cookie banner\" to set up your triggers according the users consent.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "cookieName",
    "displayName": "Cookie Name",
    "simpleValueType": true,
    "defaultValue": "cookieconsent_status"
  },
  {
    "type": "CHECKBOX",
    "name": "useDifferentiatedConsent",
    "checkboxText": "Use differentiated Consent",
    "simpleValueType": true
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "cookieSuffixes",
    "displayName": "",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Cookie Suffix",
        "name": "cookieSuffix",
        "type": "TEXT"
      }
    ],
    "newRowButtonText": "Add Cookie Suffix",
    "notSetText": "If you use \"Differentiated Consent\" please add at least one cookie suffix.",
    "enablingConditions": [
      {
        "paramName": "useDifferentiatedConsent",
        "paramValue": true,
        "type": "EQUALS"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const getCookieValues = require('getCookieValues');

let cookieValueDiff = "";
let cookieValue = getCookieValues(data.cookieName, false)[0];

if(data.cookieSuffixes){
  for(let i = 0; i < data.cookieSuffixes.length; i += 1){
   let cookieName = data.cookieName + "_" + data.cookieSuffixes[i].cookieSuffix;
   if(getCookieValues(cookieName)[0] != "allow"){
   	continue;
   }
   cookieValueDiff += "-" + data.cookieSuffixes[i].cookieSuffix + "-";
  }
}

if(cookieValueDiff){
 return cookieValueDiff; 
}

return cookieValue;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 26.4.2020, 13:50:37


