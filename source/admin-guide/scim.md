[TOC]

Gluu Server Community Edition supports System for Cross-domain Identity Management (SCIM) Version 1.0 and 2.0 out of the box, operated using HTTP `GET` and `POST` commands. SCIM uses a REST API for operations which are disabled by default. The support for SCIM must be enabled from the oxTrust admin interface. 

## Enable SCIM 
SCIM is enabled from the Organization Configuration in the oxTrust administration interface. Please navigate to `Organization Configuration` --> `System Configuration`.

![organization-menu](../img/oxtrust/organization-menu.png)

Please navigate down the page to find `SCIM Support` in the `SYstem Configuration` page and select `Enabled`.

![enable](../img/scim/enable.png)

### SCIM Endpoints
SCIM uses REST API for the operations which are covered in short in this section. There are two versions of the SCIM API each with its own specification. This usage of SCIM requires advanced level knowledge of HTTP GET and POST commands and not recommended for entry level users.

The SCIM 1.1 is governed by the [SCIM:Protocol 1.1](http://www.simplecloud.info/specs/draft-scim-api-01.html) document and SCIM 2.0 is governed by the [SCIM:Core Schema](https://tools.ietf.org/html/rfc7643) & [SCIM:Protocol](https://tools.ietf.org/html/rfc7644). As it is mentioned before, the specifications define an API, the operations are performed through endpoints. There are three endpoints that are available in Gluu Server SCIM:

1. User Endpoint
2. Group Endpoint
3. Bulk Operation Endpoint

The supported operations are given later in this document.

## SCIM 1.1

The endpoints URLS are incomplete withour the hostname. Please use the hostname of Gluu Server Community Edition before the give URLS to make any requrest using SCIM.

|Resource|Endpoint			|Operations		|Description	|
|--------|------------------------------|-----------------------|---------------|
|User    |/seam/resource/restv1/Users	|GET, POST|Retrieve/Add/Modify Users	|
|Group	 |/seam/resource/restv1/Groups	|GET, POST|Retrieve/Add/Modify Groups	|
|Bulk	 |/seam/resource/restv1/scim/v1/Bulk|GET, POST|Bulk modify Resources	|

The endpoints are described in detail in the follwing sections. Please remember to go through the specifications before using SCIM.

### Endpoint: User & Group
The userinfo endpoint is given above in [Section SCIM 1.1](#scim-11). The example below shows the userinfo endpoint for a Gluu Server with hostname `idp.gluu.org`:

```
https://idp.gluu.org/host/seam/resource/restv1/scim/v1/Users{rsid}
```
The groups endpoint is given in [Section SCIM 1.1](#scim-11). The example below shown the groupinfo endpoint for a Gluu Server with hostname `idp.gluu.org`:

```
https://idp.gluu.org/host/seam/resource/restv1/scim/v1/Groups{rsid}
```
The following table details the request parameters to the endpoints:

|Parameter|Data Type|Location|Required|Description|
|---------|---------|--------|--------|-----------|
|rsid     |string   |path    |TRUE    |Resource set description ID|
|Authorization|string|header |FALSE   |

The response contains either JSON/XML application with a status code `200` if the request is successful.

Please see the [Response Code Section](#response-codes) for more details.

#### Example
The following is an example to add a new user with SCIM 1.1 in `idp.gluu.org` using a JSON Request.

```
POST https://idp.gluu.org/oxTrust/seam/resource/restv1/Users/ 
Accept: application/json 
Authorization: Basic bWlrZTpzZWNyZXQ=
```
```
{"schemas":["urn:scim:schemas:core:1.0"],"externalId":"mike","userName":"mike","name":{"givenName":"Michael","familyName":"Schwartz","middleName":"N/A","honorificPrefix":"N/A","honorificSuffix":"N/A"},"displayName":"Micheal Schwartz","nickName":"Sensei","profileUrl":"http://www.gluu.org/","emails":[{"value":"mike@gluu.org","type":"work","primary":"true"},{"value":"mike2@gluu.org","type":"home","primary":"false"}],"addresses":[{"type":"work","streetAddress":"621 East 6th Street Suite 200","locality":"Austin","region":"TX","postalCode":"78701","country":"US","formatted":"621 East 6th Street Suite 200  Austin , TX 78701 US","primary":"true"}],"phoneNumbers":[{"value":"646-345-2346","type":"work"}],"ims":[{"value":"nynymike","type":"Skype"}],"photos":[{"value":"http://www.gluu.org/wp-content/themes/SaaS-II/images/logo.png","type":"gluu photo"}],"userType":"CEO","title":"CEO","preferredLanguage":"en-us","locale":"en_US","timezone":"America/Chicago","active":"true","password":"secret","groups":[{"display":"Gluu Manager Group","value":"@!1111!0003!B2C6"},{"display":"Gluu Owner Group","value":"@!1111!0003!D9B4"}],"roles":[{"value":"Owner"}],"entitlements":[{"value":"full access"}],"x509Certificates":[{"value":"MIIDQzCCAqygAwIBAgICEAAwDQYJKoZIhvcNAQEFBQAwTjELMAkGA1UEBhMCVVMxEzARBgNVBAgMCkNhbGlmb3JuaWExFDASBgNVBAoMC2V4YW1wbGUuY29tMRQwEgYDVQQDDAtleGFtcGxlLmNvbTAeFw0xMTEwMjIwNjI0MzFaFw0xMjEwMDQwNjI0MzFa MH8xCzAJBgNVBAYTAlVTMRMwEQYDVQQIDApDYWxpZm9ybmlhMRQwEgYDVQQKDAtleGFtcGxlLmNvbTEhMB8GA1UEAwwYTXMuIEJhcmJhcmEgSiBKZW5zZW4gSUlJMSIwIAYJKoZIhvcNAQkBFhNiamVuc2VuQGV4YW1wbGUuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7Kr+Dcds/JQ5GwejJFcBIP682X3xpjis56AK02bc1FLgzdLI8auoR+cC9/Vrh5t66HkQIOdA4unHh0AaZ4xL5PhVbXIPMB5vAPKpzz5iPSi8xO8SL7I7SDhcBVJhqVqr3HgllEG6UClDdHO7nkLuwXq8HcISKkbT5WFTVfFZzidPl8HZ7DhXkZIRtJwBweq4bvm3hM1Os7UQH05ZS6cVDgweKNwdLLrT51ikSQG3DYrl+ft781UQRIqxgwqCfXEuDiinPh0kkvIi5jivVu1Z9QiwlYEdRbLJ4zJQBmDrSGTMYn4lRc2HgHO4DqB/bnMVorHB0CC6AV1QoFK4GPe1LwIDAQABo3sweTAJBgNVHRMEAjAAMCwGCWCGSAGG+EIBDQQfFh1PcGVuU1NMIEdlbmVyYXRlZCBDZXJ0aWZpY2F0ZTAdBgNVHQ4EFgQU8pD0U0vsZIsaA16lL8En8bx0F/gwHwYDVR0jBBgwFoAUdGeKitcaF7gnzsNwDx708kqaVt0wDQYJKoZIhvcNAQEFBQADgYEAA81SsFnOdYJtNg5Tcq+/ByEDrBgnusx0jloUhByPMEVkoMZ3J7j1ZgI8rAbOkNngX8+pKfTiDz1RC4+dx8oU6Za+4NJXUjlL5CvV6BEYb1+QAEJwitTVvxB/A67g42/vzgAtoRUeDov1+GFiBZ+GNF/cAYKcMtGcrs2i97ZkJMo="}],"meta":{"created":"2010-01-23T04:56:22Z","lastModified":"2011-05-13T04:42:34Z","version":"W\\\"b431af54f0671a2\"","location":"http://localhost:8080/oxTrust/seam/resource/restv1/Users/@!1111!0000!D4E7"}}
```

The response is in JSON as well. The following is the expected response

```
201 CREATED
Server:  Apache-Coyote/1.1
Location:  https://idp.gluu.org/oxTrust/seam/resource/restv1/Users/@!1111!0000!D4E7
Content-Type:  application/json
```
```
{"schemas":["urn:scim:schemas:core:1.0"],"id":"@!1111!0000!D4E7","externalId":"mike","userName":"mike","name":{"givenName":"Michael","familyName":"Schwartz","middleName":"N/A","honorificPrefix":"N/A","honorificSuffix":"N/A"},"displayName":"Micheal Schwartz","nickName":"Sensei","profileUrl":"http://www.gluu.org/","emails":[{"value":"mike@gluu.org","type":"work","primary":"true"},{"value":"mike2@gluu.org","type":"home","primary":"false"}],"addresses":[{"type":"work","streetAddress":"621 East 6th Street Suite 200","locality":"Austin","region":"TX","postalCode":"78701","country":"US","formatted":"621 East 6th Street Suite 200  Austin , TX 78701 US","primary":"true"}],"phoneNumbers":[{"value":"646-345-2346","type":"work"}],"ims":[{"value":"nynymike","type":"Skype"}],"photos":[{"value":"http://www.gluu.org/wp-content/themes/SaaS-II/images/logo.png","type":"gluu photo"}],"userType":"CEO","title":"CEO","preferredLanguage":"en-us","locale":"en_US","timezone":"America/Chicago","active":"true","password":"Hiden for Privacy Reasons","groups":[{"display":"Gluu Manager Group","value":"@!1111!0003!B2C6"},{"display":"Gluu Owner Group","value":"@!1111!0003!D9B4"}],"roles":[{"value":"Owner"}],"entitlements":[{"value":"full access"}],"x509Certificates":[{"value":"MIIDQzCCAqygAwIBAgICEAAwDQYJKoZIhvcNAQEFBQAwTjELMAkGA1UEBhMCVVMxEzARBgNVBAgMCkNhbGlmb3JuaWExFDASBgNVBAoMC2V4YW1wbGUuY29tMRQwEgYDVQQDDAtleGFtcGxlLmNvbTAeFw0xMTEwMjIwNjI0MzFaFw0xMjEwMDQwNjI0MzFa MH8xCzAJBgNVBAYTAlVTMRMwEQYDVQQIDApDYWxpZm9ybmlhMRQwEgYDVQQKDAtleGFtcGxlLmNvbTEhMB8GA1UEAwwYTXMuIEJhcmJhcmEgSiBKZW5zZW4gSUlJMSIwIAYJKoZIhvcNAQkBFhNiamVuc2VuQGV4YW1wbGUuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7Kr+Dcds/JQ5GwejJFcBIP682X3xpjis56AK02bc1FLgzdLI8auoR+cC9/Vrh5t66HkQIOdA4unHh0AaZ4xL5PhVbXIPMB5vAPKpzz5iPSi8xO8SL7I7SDhcBVJhqVqr3HgllEG6UClDdHO7nkLuwXq8HcISKkbT5WFTVfFZzidPl8HZ7DhXkZIRtJwBweq4bvm3hM1Os7UQH05ZS6cVDgweKNwdLLrT51ikSQG3DYrl+ft781UQRIqxgwqCfXEuDiinPh0kkvIi5jivVu1Z9QiwlYEdRbLJ4zJQBmDrSGTMYn4lRc2HgHO4DqB/bnMVorHB0CC6AV1QoFK4GPe1LwIDAQABo3sweTAJBgNVHRMEAjAAMCwGCWCGSAGG+EIBDQQfFh1PcGVuU1NMIEdlbmVyYXRlZCBDZXJ0aWZpY2F0ZTAdBgNVHQ4EFgQU8pD0U0vsZIsaA16lL8En8bx0F/gwHwYDVR0jBBgwFoAUdGeKitcaF7gnzsNwDx708kqaVt0wDQYJKoZIhvcNAQEFBQADgYEAA81SsFnOdYJtNg5Tcq+/ByEDrBgnusx0jloUhByPMEVkoMZ3J7j1ZgI8rAbOkNngX8+pKfTiDz1RC4+dx8oU6Za+4NJXUjlL5CvV6BEYb1+QAEJwitTVvxB/A67g42/vzgAtoRUeDov1+GFiBZ+GNF/cAYKcMtGcrs2i97ZkJMo="}],"meta":{"created":"2010-01-23T04:56:22Z","lastModified":"2011-05-13T04:42:34Z","version":"W\\\"b431af54f0671a2\"","location":"http://localhost:8080/oxTrust/seam/resource/restv1/Users/@!1111!0000!D4E7"}}
```

### Endpoint: Bulk
Bulk endpoint allows the administrator to work with a large collection of Resources with a single request.A body of a bulk operation may contain a set of HTTP Resource operations using one of the API supported HTTP methods; i.e., POST, PUT, PATCH or DELETE. Please see the [SCIM Specs](http://www.simplecloud.info/specs/draft-scim-api-01.html#bulk-resources) for more details. 

The example below shows the bulk operaiton endpoint for a Gluu Server with hostname `idp.gluu.org`:

```
https://idp.gluu.org/seam/resource/restv1/scim/v1/Bulk
```

The following table details the request parameters:

|Parameter    |Data Type|Location|
|-------------|---------|--------|
|Authorization|string   |header  |
|body         |BulkRequest|body  |

#### Definitions
The definitions for the bulk operation is covered in the tables below. The parametes below are all optional.

|BulkOperation|  |BulkRequest|  |BulkResponse| |
|-------------|--|-----------|--|------------|--|
|**Parameter**|**Data Type**|**Parameter**|**Data Type**||**Parameter**|**Data Type**|
|bulkid|string|schemes|array[string]|schemes|array[string]|
|version|string|operations|array[BulkOperation]|operations|array[BulkOperation]|
|method|string|failOnErrors|integar(int32)|
|path|string|
|location|string|
|status|string|
|data|object|
|response|object|

### Response Codes
This sections defines the response codes for the requests sent to the SCIM endpoints.

|Status Code	|Reason		|Description		|
|---------------|---------------|-----------------------|
|200		|OK		|Successful Operation	|
|201		|Created	|Successfully created resource|

|Status Code    |Reason         |Description            |
|---------------|---------------|-----------------------|
|400		|Bad Request	|Request cannot be parsed, is syntactically incorrect, or violates schema|
|401		|Unauthorized	|Authorization header is invalid or missing|
|403		|Forbidden	|Operation is not permitted based on the supplied authorization|
|404 		|Not Found	|Specified resource does not exist|
