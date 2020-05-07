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
  "description": "Use this variable together with the wordpress plugin \"Beautiful cookie consent banner\" to easily set up your triggers according the users consent.",
  "categories": [
    "UTILITY",
    "ANALYTICS"
  ],
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "complianceType",
    "displayName": "Compliance Type",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "info",
        "displayValue": "Info only"
      },
      {
        "value": "diffConsent",
        "displayValue": "Differentiated Consent (one \u0026 two Buttons)"
      },
      {
        "value": "optin",
        "displayValue": "Opt-In"
      },
      {
        "value": "optout",
        "displayValue": "Opt-Out"
      }
    ],
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "info",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
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
        "type": "TEXT",
        "valueValidators": [
          {
            "type": "STRING_LENGTH",
            "args": [
              1,
              10
            ]
          }
        ],
        "isUnique": true
      }
    ],
    "newRowButtonText": "Add Cookie Suffix",
    "notSetText": "If you use \"Differentiated Consent\" please add at least one cookie suffix.",
    "enablingConditions": [
      {
        "paramName": "complianceType",
        "paramValue": "diffConsent",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "cookieName",
    "displayName": "Cookie Name",
    "simpleValueType": true,
    "defaultValue": "cookieconsent_status",
    "help": "Leave it to default, if you have not changed the value in your wordpress plugin.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const getCookieValues = require('getCookieValues');

let cookieValueDiff = "";
let cookieValue = getCookieValues(data.cookieName, false)[0];

if(cookieValue){
 cookieValue = "-" + cookieValue + "-"; 
}

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

if(!cookieValue && data.complianceType == "optin"){
 return "-deny-"; 
}

if(!cookieValue && data.complianceType == "optout"){
 return "-allow-"; 
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

Created on 26.4.2020, 14:53:27


