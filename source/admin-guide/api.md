# ID Generation API Document
This document outlines the API for ID Generation for Gluu Server.
## Path
`/id`
### Overview

The API convention is set as _id_ followed by _prefix_ and _type_ or `/id/{prefix}/{type}/`.
Please se the following table to specify what type you are generating. The `prefix` is used in the 
inum to make it possible to know the type of object just by looking at the identifier.

| `prefix` | `type`               | `description`                          |
| -------- | -------------------- | -------------------------------------- |
| 0000     | people               | Person object                          |
| 0001     | organization         | Organization object                    |
| 0002     | appliance            | Appliance object                       |
| 0003     | group                | Group object                           |
| 0004     | server               | Server object                          |
| 0005     | attribute            | User attribute (claim) object          |
| 0006     | tRelationship        | SAML Trust Relationship object         |
| 0008     | client               | OAuth2 Client object                   |
| 0009     | scope                | OAuth2 Scope Object                    |
| 0010     | uma-resource-set     | UMA Resource Set Object                |
| 0011     | interception-script  | Gluu Server interception script object |
| 0012     | sector-identifier    | Managed Sector Identifier URI          |

**generateJsonInum**<br/>
**GET**`/id/{prefix}/{type}/`

Generates ID for given prefix and type.

**URL**<br/>
    http://gluu.org/id/{prefix}/{type}/

**Parameters**<br/>
- path

|Parameter|Required|Description|Data Type|
|---------|--------|-----------|---------|
|prefix|true|Prefix for id. E.g. if prefix is @!1111 and server will generate id: !0000 then ID returned by service would be: @!1111!0000|string|
|type|true|Type of id|string|

- header

|Parameter|Required|Description|Data Type|
|Authorization|false||string|

**Response**<br/>
[String[Response]](#String[Response])

**generateHtmlInum
**GET**`/id/{prefix}/{type}/`

Generates ID for given prefix and type.

**URL**<br/>
    http://gluu.org/id/{prefix}/{type}/
**Parameters**<br/>
- path

|Parameter|Required|Description|Data Type|
|---------|--------|-----------|---------|
|prefix|true|Prefix for id. E.g. if prefix is @!1111 and server will generate id: !0000 then ID returned by service would be: @!1111!0000|string|
|type|true|Type of id|string|
- header

|Parameter|Required|Description|Data Type|
|---------|--------|-----------|---------|
|Authorization|false|The authorization sent as a String|string|

**Response**<br/>
[String[Response]](#String[Response])
**Errors**<br/>

**generateTextInum**<br/>
**GET**`/id/{prefix}/{type}/`

Generates ID for given prefix and type.

**URL**<br/>
    http://gluu.org/id/{prefix}/{type}/
**Parameters**<br/>
- path

|Parameter|Required|Description|Data Type|
|---------|--------|-----------|---------|
|prefix|true||string|
|type|true||string|

- header

|Parameter|Required|Description|Data Type|
|---------|--------|-----------|---------|
|Authorization|false||string|

**Response**<br/>
[String[Response]](#String[Response])


**Errors**<br/>
**generateXmlInum**<br/>
**GET**`/id/{prefix}/{type}/`

Generates ID for given prefix and type.

**URL**<br/>
    http://gluu.org/id/{prefix}/{type}/
**Parameters**<br/>
- path

|Parameter|Required|Description|Data Type|
|---------|--------|-----------|---------|
|prefix|true|Prefix for id. E.g. if prefix is @!1111 and server will generate id: !0000 then ID returned by service would be: @!1111!0000|string|
|type|true|Type of id|string|
- header

|Parameter|Required|Description|Data Type|
|---------|--------|-----------|---------|
|Authorization|false||string|

**Response**<br/>
[String[Response]](#String[Response])


**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
</table>
- - -

**generateHtmlInum**<br/>
**GET**`/id/{prefix}/{type}/`

Generates ID for given prefix and type.

**URL**<br/>
    http://gluu.org/id/{prefix}/{type}/
**Parameters**<br/>
- path

|Parameter|Required|Description|Data Type|
|---------|--------|-----------|---------|
|prefix|true|Prefix for id. E.g. if prefix is @!1111 and server will generate id: !0000 then ID returned by service would be: @!1111!0000|string|
|type|true|Type of id|string|
- header

|Parameter|Required|Description|Data Type|
|---------|--------|-----------|---------|
|Authorization|false||string|

**Response**<br/>
[String[Response]](#String[Response])


**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
</table>
- - -

# OpenId Connect Authorization Grant
This page provides an interface for request authorization through REST web services.

## Path
`/oxauth/authorize`
### requestAuthorizationGet
**GET**`/oxauth/authorize`

The Authorization Endpoint performs Authentication of the end-user. This is done by sending the User Agent to the Authorization Server's Authorization Endpoint for Authentication and Authorization, using request parameters defined by OAuth 2.0 and additional parameters and parameter values defined by OpenID Connect.
### URL
`http://<hostname of Gluu Server>/oxauth/authorize`
### Parameters
|Parameter|Required|Description|Data Type|
|---------|--------|-----------|---------|
|scope|true|OpenID Connect requests MUST contain the openid scope value|string|
|response_type|true|OAuth 2.0 Response Type value that determines the authorization processing flow to be used, <br/>including what parameters are returned from the endpoints used. When using the Authorization<br/> Code Flow, this value is code|string|
|client_id|true|OAuth 2.0 Client Identifier valid at the Authorization Server.|string|
|redirect_uri|true|Redirection URI to which the response will be sent. This URI MUST exactly match one of the <br/>Redirection URI values for the Client pre-registered at the OpenID Provider|string|
|state|false|Opaque value used to maintain state between the request and the callback.<br/> Typically, Cross-Site Request Forgery (CSRF, XSRF) mitigation is done by cryptographically binding<br/> the value of this parameter with a browser cookie.|string|
|response_mode|false|This parameter informs the authorization server about the mechanism to be used to return <br/>parameters from the authorization endpoint. This is not recommended if the default for<br/> response_type is requested.|string|
|nonce|false|String value used to associate a Client session with an ID Token, and to mitigate replay attacks.<br/> The value is passed through unmodified from the Authorization Request to the ID Token. <br/>Sufficient entropy MUST be present in the nonce values used to prevent attackers from guessing <br/>values.|string|
|display|false|ASCII string value that specifies how the Authorization Server displays the authentication<br/> and consent user<br/> interface pages to the end-user. The defined values are: page, popup, touch, wap|string|
|prompt|false|Space delimited, case sensitive list of ASCII string values that specifies whether the <br/>Authorization Server prompts the end-user for re-authentication and consent. <br/>The defined values are: none, login, consent, select_account|string|
|max_age|false|Maximum Authentication Age. Specifies the allowable elapsed time in seconds since the last <br/>time the end-user was actively authenticated by the OP. If the elapsed <br/>time is greater than this value, the OP MUST attempt to actively re-authenticate the end-user. <br/>(The max_age request parameter corresponds to the OpenID 2.0 PAPE [OpenID.PAPE] <br/>max_auth_age request parameter.) When max_age is used, the ID Token returned MUST include an <br/>auth_time Claim Value.|int|
|ui_locales|false|end-user&#39;s preferred languages and scripts for the user interface, represented as a space-separated<br/> list of BCP47 [RFC5646] language tag values, ordered by preference. For instance, the value &quot;fr-CA fr en&quot; represents a preference for French as spoken<br/> in Canada, then French (without a region designation), followed by English (without a region designation). An error SHOULD NOT result if some or all of the requested <br/>locales are not supported by the OpenID Provider.|string|
|id_token_hint|false|ID Token previously issued by the Authorization Server being passed as a hint about the end-user's <br/>current or past authenticated session with the Client. If the end-user identified by the ID Token is logged in or is logged in by the request, then the Authorization <br/>Server returns a positive response; otherwise, it SHOULD return an error, such as login_required. When possible, an id_token_hint SHOULD be present when prompt=none <br/>is used and an invalid_request error MAY be returned if it is not; however, the server SHOULD respond successfully when possible, even if it is not present. <br/>The Authorization Server need not be listed as an audience of the ID Token when it is used as an id_token_hint value.|string|
|login_hint|false|Hint to the Authorization Server about the login identifier the end-user might use to log in (if necessary). <br/>This hint can be used by an RP if it first asks the end-user for their e-mail address (or other identifier) and then wants to pass that value as a hint to the discovered <br/>authorization service. It is RECOMMENDED that the hint value match the value used for discovery. This value MAY also be a phone number in the format specified for the <br/>phone_number Claim. The use of this parameter is left to the OP&#39;s discretion.|string|
|acr_values|false|Requested Authentication Context Class Reference values. Space-separated string that specifies the acr values that the<br/> Authorization Server is being requested to use for processing this Authentication Request, with the values appearing in order of preference. The<br/> Authentication Context Class satisfied by the authentication performed is returned as the acr Claim Value, as specified in Section 2. The acr Claim is requested as a <br/>Voluntary Claim by this parameter.|string|
|amr_values|false|AMR Values|string|
|request|false|This parameter enables OpenID Connect requests to be passed in a single, self-contained parameter and to be optionally <br/>signed and/or encrypted. The parameter value is a Request Object value, as specified in Section 6.1. It represents the request as a JWT whose Claims are the <br/>request parameters.|string|
|request_uri|false|This parameter enables OpenID Connect requests to be passed by reference, rather than by value. The request_uri <br/>value is a URL using the https scheme referencing a resource containing a Request Object value, which is a JWT containing the request parameters.|string|
|request_session_state|false|Request session state|string|
|sessionState|false|This is an optional parameter|string|
|accessToken|false|This parameter is optinal and carries the access token for the request.|string|
|origin_headers|false|This optional token is used in custom workflows.|string|
|codeChallange|false|This parameter allows the code to be challanced using PKCE.|string|
|codeChallangeMethod|false|This parameter allows the use of PKCE to challange code.|string|
|httpRequest|false|This is an optional parameter|string|
|securityContext|false|This is an injectable interface that provides access to security related information.|string|
 
- query

<table border="1">
        <tr>
            <th>Parameter|Required|Description|Data Type|
|response_mode|false|Informs the Authorization Server of the mechanism to be used for returning parameters from the Authorization Endpoint. This use of this parameter is NOT RECOMMENDED when the Response Mode that would be requested is the default mode specified for the Response Type.|string|
        </tr>
</table>

#### Response
[JSON[Response]](#JSON[Response])

#### Errors
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
        <tr>
            <td>302|interaction_required&#10;    The Authorization Server requires end-user interaction of some form to proceed. This error MAY be returned when the prompt parameter value in the Authentication Request is none, but the Authentication Request cannot be completed without displaying a user interface for end-user interaction. |
        </tr>
        <tr>
            <td>302|login_required&#10;    The Authorization Server requires end-user authentication. This error MAY be returned when the prompt parameter value in the Authentication Request is none, but the Authentication Request cannot be completed without displaying a user interface for end-user authentication. |
        </tr>
        <tr>
            <td>302|account_selection_required&#10;    The end-user is REQUIRED to select a session at the Authorization Server. The end-user MAY be authenticated at the Authorization Server with different associated accounts, but the end-user did not select a session. This error MAY be returned when the prompt parameter value in the Authentication Request is none, but the Authentication Request cannot be completed without displaying a user interface to prompt for a session to use. |
        </tr>
        <tr>
            <td>302|consent_required&#10;    The Authorization Server requires end-user consent. This error MAY be returned when the prompt parameter value in the Authentication Request is none, but the Authentication Request cannot be completed without displaying a user interface for end-user consent. |
        </tr>
        <tr>
            <td>302|invalid_request_uri&#10;    The request_uri in the Authorization Request returns an error or contains invalid data. |
        </tr>
        <tr>
            <td>302|invalid_request_object&#10;    The request parameter contains an invalid Request Object. |
        </tr>
        <tr>
            <td>302|request_not_supported&#10;    The OP does not support use of the request parameter|
        </tr>
        <tr>
            <td>302|request_uri_not_supported&#10;    The OP does not support use of the request_uri parameter|
        </tr>
        <tr>
            <td>302|registration_not_supported&#10;    The OP does not support use of the registration parameter|
        </tr>
        <tr>
            <td>400|The request parameters contain an invalid option, e.g. an unusual grant type.|
        </tr>
        <tr>
            <td>401|The request could not be authenticated using the client_id and client_secret.|
        </tr>
        <tr>
            <td>500|Either an internal server error occurred (e.g. opendj server is down), or the username and password 
                do not match any known user.
            |
        </tr>
</table>

### requestAuthorizationPost
**POST**`/oxauth/authorize`

Performs authorization.
The Authorization Endpoint performs Authentication of the end-user.

### URL
`http://<hostname of Gluu Server>/oxauth/authorize`
### Parameters
<table border="1">
        <tr>
            <th>Parameter|Required|Description|Data Type|
|scope|true|OpenID Connect requests MUST contain the openid scope value. If the openid scope value is not present, the behavior is entirely unspecified. Other scope values MAY be present. Scope values used that are not understood by an implementation SHOULD be ignored.|string|
|response_type|true|OAuth 2.0 Response Type value that determines the authorization processing flow to be used, including what parameters are returned from the endpoints used. When using the Authorization Code Flow, this value is code.|string|
|client_id|true|OAuth 2.0 Client Identifier valid at the Authorization Server.|string|
|redirect_uri|true|Redirection URI to which the response will be sent. This URI MUST exactly match one of the Redirection URI values for the Client pre-registered at the OpenID Provider|string|
|state|false|Opaque value used to maintain state between the request and the callback. Typically, Cross-Site Request Forgery (CSRF, XSRF) mitigation is done by cryptographically binding the value of this parameter with a browser cookie.|string|
|response_mode|false|Informs the Authorization Server of the mechanism to be used for returning parameters from the Authorization Endpoint. This use of this parameter is NOT RECOMMENDED when the Response Mode that would be requested is the default mode specified for the Response Type.|string|
|nonce|false|String value used to associate a Client session with an ID Token, and to mitigate replay attacks. The value is passed through unmodified from the Authorization Request to the ID Token. Sufficient entropy MUST be present in the nonce values used to prevent attackers from guessing values.|string|
|display|false|ASCII string value that specifies how the Authorization Server displays the authentication and consent user interface pages to the end-user. The defined values are: page, popup, touch, wap|string|
|prompt|false|Space delimited, case sensitive list of ASCII string values that specifies whether the Authorization Server prompts the end-user for re-authentication and consent. The defined values are: none, login, consent, select_account|string|
|max_age|false|Maximum Authentication Age. Specifies the allowable elapsed time in seconds since the last time the end-user was actively authenticated by the OP. If the elapsed time is greater than this value, the OP MUST attempt to actively re-authenticate the end-user. (The max_age request parameter corresponds to the OpenID 2.0 PAPE [OpenID.PAPE] max_auth_age request parameter.) When max_age is used, the ID Token returned MUST include an auth_time Claim Value.|int|
|ui_locales|false|end-user&#39;s preferred languages and scripts for the user interface, represented as a space-separated list of BCP47 [RFC5646] language tag values, ordered by preference. For instance, the value &quot;fr-CA fr en&quot; represents a preference for French as spoken in Canada, then French (without a region designation), followed by English (without a region designation). An error SHOULD NOT result if some or all of the requested locales are not supported by the OpenID Provider.|string|
|id_token_hint|false|ID Token previously issued by the Authorization Server being passed as a hint about the end-user&#39;s current or past authenticated session with the Client. If the end-user identified by the ID Token is logged in or is logged in by the request, then the Authorization Server returns a positive response; otherwise, it SHOULD return an error, such as login_required. When possible, an id_token_hint SHOULD be present when prompt=none is used and an invalid_request error MAY be returned if it is not; however, the server SHOULD respond successfully when possible, even if it is not present. The Authorization Server need not be listed as an audience of the ID Token when it is used as an id_token_hint value.|string|
|login_hint|false|Hint to the Authorization Server about the login identifier the end-user might use to log in (if necessary). This hint can be used by an RP if it first asks the end-user for their e-mail address (or other identifier) and then wants to pass that value as a hint to the discovered authorization service. It is RECOMMENDED that the hint value match the value used for discovery. This value MAY also be a phone number in the format specified for the phone_number Claim. The use of this parameter is left to the OP&#39;s discretion.|string|
|acr_values|false|Requested Authentication Context Class Reference values. Space-separated string that specifies the acr values that the Authorization Server is being requested to use for processing this Authentication Request, with the values appearing in order of preference. The Authentication Context Class satisfied by the authentication performed is returned as the acr Claim Value, as specified in section 2. The acr Claim is requested as a Voluntary Claim by this parameter.|string|
|amr_values|false|AMR Values|string|
|request|false|This parameter enables OpenID Connect requests to be passed in a single, self-contained parameter and to be optionally signed and/or encrypted. The parameter value is a Request Object value, as specified in section 6.1. It represents the request as a JWT whose Claims are the request parameters.|string|
|request_uri|false|This parameter enables OpenID Connect requests to be passed by reference, rather than by value. The request_uri value is a URL using the https scheme referencing a resource containing a Request Object value, which is a JWT containing the request parameters.|string|
|request_session_state|false|Request session state|string|
|session_state|false|Session state of this call|string|
|access_token|false|Access token|string|
|origin_headers|false|Origin headers. Used in custom workflows.|string|
        </tr>
	<tr>
	    <th>code_challange|
	    <td>false|
	    <td>PKCE Code challange|
	    <td>string|
	</tr>
	<tr>
	    <th>code_challange_method|
	    <td>false|
	    <td>PKCE code challange method|
	    <td>string|
	</tr>
</table>

#### Response
[JSON[Response]](#JSON[Response])

#### Errors
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
        <tr>
            <td>302|interaction_required&#10;    The Authorization Server requires end-user interaction of some form to proceed. This error MAY be returned when the prompt parameter value in the Authentication Request is none, but the Authentication Request cannot be completed without displaying a user interface for end-user interaction. |
        </tr>
        <tr>
            <td>302|login_required&#10;    The Authorization Server requires end-user authentication. This error MAY be returned when the prompt parameter value in the Authentication Request is none, but the Authentication Request cannot be completed without displaying a user interface for end-user authentication. |
        </tr>
        <tr>
            <td>302|account_selection_required&#10;    The end-user is REQUIRED to select a session at the Authorization Server. The end-user MAY be authenticated at the Authorization Server with different associated accounts, but the end-user did not select a session. This error MAY be returned when the prompt parameter value in the Authentication Request is none, but the Authentication Request cannot be completed without displaying a user interface to prompt for a session to use. |
        </tr>
        <tr>
            <td>302|consent_required&#10;    The Authorization Server requires end-user consent. This error MAY be returned when the prompt parameter value in the Authentication Request is none, but the Authentication Request cannot be completed without displaying a user interface for end-user consent. |
        </tr>
        <tr>
            <td>302|invalid_request_uri&#10;    The request_uri in the Authorization Request returns an error or contains invalid data. |
        </tr>
        <tr>
            <td>302|invalid_request_object&#10;    The request parameter contains an invalid Request Object. |
        </tr>
        <tr>
            <td>302|request_not_supported&#10;    The OP does not support use of the request parameter|
        </tr>
        <tr>
            <td>302|request_uri_not_supported&#10;    The OP does not support use of the request_uri parameter|
        </tr>
        <tr>
            <td>302|registration_not_supported&#10;    The OP does not support use of the registration parameter|
        </tr>
</table>


- - -

# API for oxAuth Clientinfo 
This document provides interface for Client Info REST web services.
## Path
`/oxauth/clientinfo`
## Overview
The ClientInfo Endpoint is an OAuth 2.0 Protected Resource that returns Claims about the registered client.

### clientinfoGet
|Parameter|Description|Data Type|
|---------|-----------|---------|
|access_token |The access token for oxAuth|string|
|authorization| The authorization for the client|string|
|securityContext| Injectable interface providing access to security info|context|

### clientinfoPost
|Parameter|Description|Data Type|
|---------|-----------|---------|
|access_token |The access token for oxAuth|string|
|authorization| The authorization for the client|string|
|securityContext| Injectable interface providing access to security info|context|

## API Document

### /oxauth

#### Overview


#### `/oxauth/end_session`
**requestEndSession
**GET**`/oxauth/end_session`

End current Connect session.
End current Connect session.

**URL**<br/>
    http://gluu.org/oxauth/end_session
**Parameters**<br/>
- query

|Parameter|Required|Description|Data Type|
|id_token_hint|true|Previously issued ID Token (id_token) passed to the logout endpoint as a hint about the End-User&#39;s current authenticated session with the Client. This is used as an indication of the identity of the End-User that the RP is requesting be logged out by the OP. The OP need not be listed as an audience of the ID Token when it is used as an id_token_hint value.|string|
|post_logout_redirect_uri|false|URL to which the RP is requesting that the End-User&#39;s User Agent be redirected after a logout has been performed. The value MUST have been previously registered with the OP, either using the post_logout_redirect_uris Registration parameter or via another mechanism. If supplied, the OP SHOULD honor this request following the logout.|string|
|state|false|Opaque value used by the RP to maintain state between the logout request and the callback to the endpoint specified by the post_logout_redirect_uri parameter. If included in the logout request, the OP passes this value back to the RP using the state query parameter when redirecting the User Agent back to the RP.|string|
|session_id|false|Session ID|string|

**Response**<br/>
[JSON[Response]](#JSON[Response])


**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
        <tr>
            <td>400|invalid_request&#10;The request is missing a required parameter, includes an unsupported parameter or parameter value, repeats the same parameter, uses more than one method for including an access token, or is otherwise malformed.  The resource server SHOULD respond with the HTTP 400 (Bad Request) status code.|
        </tr>
        <tr>
            <td>400|invalid_grant&#10;The provided access token is invalid, or was issued to another client.|
        </tr>
</table>


- - -

## Data Types
# API Document

## /oxauth

## Overview
Any OpenID Client needs to register with the OpenID Provider to utilize OpenID Services, in this case register a user, and acquire a client ID and a shared secret.

## `/oxauth/register`
### registerPost
**POST**`/oxauth/register`

Registers new dynamic client in oxAuth.
#### URL
    http://gluu.org/oxauth/register
#### Parameters
|Parameter|Description|
|---------|--------|
|redirect_uris|Redirection URI values used by the Client. One of these registered Redirection URI values must exactly match the redirect_uri parameter value used in each Authorization Request|
|response_types|A list of the OAuth 2.0 response_type values that the Client is declaring that it will restrict itself to using. If omitted, the default is that the Client will use only the code Response Type. Allowed values are code, token, id_token|
|grant_types|A list of the OAuth 2.0 Grant Types that the Client is declaring that it will restrict itself to using. The Grant Type values used by OpenID Connect are:<ul><li>**authorization_code**The Authorization Code Grant Type</li><li>**implicit**The Implicit Grant Type</li><li>**refresh_token**The Refresh Token Grant Type</li></ul>The following table lists the correspondence between response_type values that the Client will use and grant_type values that MUST be included in the registered grant_types list:<ul><li>code: authorization_code</li><li>id_token: implicit</li><li>token id_token: implicit</li><li>code id_token: authorization_code, implicit</li><li>code token: authorization_code, implicit</li><li>code token id_token: authorization_code, implicit</li></ul>|
|application_type|Kind of the application. The default, if omitted, is web. The defined values are native or web. Web Clients using the OAuth Implicit Grant Type must only register URLs using the https scheme as redirect_uris; they must not use localhost as the hostname. Native Clients must only register redirect_uris using custom URI schemes or URLs using the http: scheme with localhost as the hostname.|
|contacts|e-mail addresses of people responsible for this Client.|
|client_name|Name of the Client to be presented to the End-User.|
|logo_uri|URL that references a logo for the Client application. If present, the server displays this image to the End-User during approval. The value of this field must point to a valid image file.|
|client_uri|URL of the home page of the Client. The value of this field must point to a valid Web page. If present, the server displays this URL to the End-User in a followable fashion.|
|policy_uri|URL that the Relying Party Client provides to the End-User to read about the how the profile data will be used. The value of this field must point to a valid web page. The OpenID Provider displays this URL to the End-User if it is given.|
|tos_uri|URL that the Relying Party Client provides to the End-User to read about the Relying Party's terms of service. The value of this field must point to a valid web page. The OpenID Provider displays this URL to the End-User if it is given.|
|jwks_uri|URL for the Client's JSON Web Key Set (JWK) document. If the Client signs requests to the Server, it contains the signing key(s) the Server uses to validate signatures from the Client. The JWK Set may also contain the Client's encryption keys(s), which are used by the Server to encrypt responses to the Client. When both signing and encryption keys are made available, a use (Key Use) parameter value is required for all keys in the referenced JWK Set to indicate each key's intended usage. Although some algorithms allow the same key to be used for both signatures and encryption, doing so is not recommended, as it is less secure. The JWK x5c parameter MAY be used to provide X.509 representations of keys provided. When used, the bare key values must still be present and must match those in the certificate.|
|jwks|Client's JSON Web Key Set (JWK) document, passed by value. The semantics of the jwks parameter are the same as the jwks_uri parameter, other than that the JWK Set is passed by value, rather than by reference. This parameter is intended only to be used by Clients that, for some reason, are unable to use the jwks_uri parameter, for instance, by native applications that might not have a location to host the contents of the JWK Set. If a Client can use jwks_uri, it must not use jwks. One significant downside of jwks is that it does not enable key rotation (which jwks_uri does). The jwks_uri and jwks parameters must not be used together.|
|sector_identifier_uri|URL using the https scheme to be used in calculating Pseudonymous Identifiers by the OP. The URL references a file with a single JSON array of redirect_uri values. Providers that use pairwise sub (subject) values utilizes the sector_identifier_uri value provided in the Subject Identifier calculation for pairwise identifiers.|
|subject_type|subject_type requested for responses to this Client. The subject_types_supported Discovery parameter contains a list of the supported subject_type values for this server. Valid types include pairwise and public.|
|id_token_signed_response_alg|JWS alg algorithm (JWA) required for signing the ID Token issued to this Client. The value none must not be used as the ID Token alg value unless the Client uses only Response Types that return no ID Token from the Authorization Endpoint (such as when only using the Authorization Code Flow). The default, if omitted, is RS256. The public key for validating the signature is provided by retrieving the JWK Set referenced by the jwks_uri element from OpenID Connect Discovery.|
|id_token_encrypted_response_alg|JWE alg algorithm (JWA) required for encrypting the ID Token issued to this Client. If this is requested, the response will be signed then encrypted, with the result being a Nested JWT. The default, if omitted, is that no encryption is performed.|
|id_token_encrypted_response_enc|JWE enc algorithm (JWA) required for encrypting the ID Token issued to this Client. If id_token_encrypted_response_alg is specified, the default for this value is A128CBC-HS256. When id_token_encrypted_response_enc is included, id_token_encrypted_response_alg must also be provided.|
|userinfo_signed_response_alg|JWS alg algorithm (JWA) required for signing UserInfo Responses. If this is specified, the response will be JWT serialized, and signed using JWS. The default, if omitted, is for the UserInfo Response to return the Claims as a UTF-8 encoded JSON object using the application/json content-type.|
|userinfo_encrypted_response_alg|JWE alg algorithm (JWA) required for encrypting UserInfo Responses. If both signing and encryption are requested, the response will be signed then encrypted, with the result being a Nested JWT. The default, if omitted, is that no encryption is performed.|
|userinfo_encrypted_response_enc|JWE enc algorithm (JWA) required for encrypting UserInfo Responses. If userinfo_encrypted_response_alg is specified, the default for this value is A128CBC-HS256. When userinfo_encrypted_response_enc is included, userinfo_encrypted_response_alg must also be provided.|
|request_object_signing_alg| JWS alg algorithm (JWA) that must be used for signing Request Objects sent to the OP. All Request Objects from this Client are rejected, if not signed with this algorithm. This algorithm is used both when the Request Object is passed by value (using the request parameter) and when it is passed by reference (using the request_uri parameter). The value none may be used. The default, if omitted, is that any algorithm supported by the OP and the RP may be used.|
|request_object_encryption_alg| JWE alg algorithm (JWA) the RP is declaring that it may use for encrypting Request Objects sent to the OP. This parameter should be included when symmetric encryption will be used, since this signals to the OP that a client_secret value needs to be returned from which the symmetric key will be derived, that might not otherwise be returned. The RP may still use other supported encryption algorithms or send unencrypted Request Objects, even when this parameter is present. If both signing and encryption are requested, the Request Object will be signed then encrypted, with the result being a Nested JWT. The default, if omitted, is that the RP is not declaring whether it might encrypt any Request Objects.|
|request_object_encryption_enc|JWE enc algorithm (JWA) the RP is declaring that it may use for encrypting Request Objects sent to the OP. If request_object_encryption_alg is specified, the default for this value is A128CBC-HS256. When request_object_encryption_enc is included, request_object_encryption_alg must also be provided.|
|token_endpoint_auth_method|Requested Client Authentication method for the Token Endpoint. The options are client_secret_post, client_secret_basic, client_secret_jwt, private_key_jwt, and none. If omitted, the default is client_secret_basic, the HTTP Basic Authentication Scheme.|
|token_endpoint_auth_signing_alg|JWS alg algorithm (JWA) that must be used for signing the JWT used to authenticate the Client at the Token Endpoint for the private_key_jwt and client_secret_jwt authentication methods. All Token Requests using these authentication methods from this Client are rejected, if the JWT is not signed with this algorithm. The value none must not be used. The default, if omitted, is that any algorithm supported by the OP and the RP MAY be used.|
|default_max_age|Default Maximum Authentication Age. Specifies that the End-User must be actively authenticated if the End-User was authenticated longer ago than the specified number of seconds. The max_age request parameter overrides this default value. If omitted, no default Maximum Authentication Age is specified.|
|require_auth_time|Boolean value specifying whether the auth_time Claim in the ID Token is required. It is required when the value is true. (If this is false, the auth_time Claim can still be dynamically requested as an individual Claim for the ID Token using the claims request parameter) If omitted, the default value is false.|
|default_acr_values|Default requested Authentication Context Class Reference values. Array of strings that specifies the default acr values that the OP is being requested to use for processing requests from this Client, with the values appearing in order of preference. The Authentication Context Class satisfied by the authentication performed is returned as the acr Claim Value in the issued ID Token. The acr Claim is requested as a Voluntary Claim by this parameter. The acr_values_supported discovery element contains a list of the supported acr values supported by this server. Values specified in the acr_values request parameter or an individual acr Claim request override these default values.|
|initiate_login_uri|URI using the https scheme that a third party can use to initiate a login by the RP. The URI must accept requests via both GET and POST. The Client must understand the login_hint and iss parameters and should support the target_link_uri parameter.|
|request_uris|request_uri values that are pre-registered by the RP for use at the OP. The Servers cache the contents of the files referenced by these URIs and not retrieve them at the time they are used in a request. OPs can require that request_uri values used be pre-registered with the require_request_uri_registration discovery parameter. If the contents of the request file could ever change, these URI values should include the base64url encoded SHA-256 hash value of the file contents referenced by the URI as the value of the URI fragment. If the fragment value used for a URI changes, that signals the server that its cached value for that URI with the old fragment value is no longer valid.|

#### Response
Client Identificator or INUM, a client shared secret and the account expiration date in a [JSON[Response]]

#### Errors
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    <tr/>
	<tr>
            <td>400|invalid_request&#10;The request is missing a required parameter, includes an unsupported parameter or parameter value, repeats the same parameter, uses more than one method for including an access token, or is otherwise malformed.  The resource server SHOULD respond with the HTTP 400 (Bad Request) status code.|
        </tr>
        <tr>
            <td>401|invalid_token&#10;The access token provided is expired, revoked, malformed, or invalid for other reasons.  The resource SHOULD respond with the HTTP 401 (Unauthorized) status code.  The client MAY request a new access token and retry the protected resource request.|
        </tr>
        <tr>
            <td>403|insufficient_scope&#10;The request requires higher privileges than provided by the access token.  The resource server SHOULD respond with the HTTP 403 (Forbidden) status code and MAY include the &quot;scope&quot;&#10; attribute with the scope necessary to access the protected resource.|
        </tr>
	<tr>
	    <td>302|
	    <td>access_denies&#14; The request is denied by the authorization server.|
	</tr>

</table>

### registerPut
**PUT**`/oxauth/register`

This operation updates the Client Metadata for a registered client.
#### URL
    http://gluu.org/oxauth/register
#### Parameters
The request is sent as an `HTTP POST` to the client registration endpoint as JSON with the parameters.

|Parameter|Description|
|---------|-----------|
|clientId |The unique client identifier usually INUM|
|authorization| The authorization for the client|
|httpRequest| The HTTP Request object|
|securityContext| Injectable interface providing access to security info|

#### Response
Client Identificator or INUM, a client shared secret and the account expiration date in a [JSON[Response]]

#### Errors
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    <tr/>
        <tr>
            <td>400|invalid_request&#10;The request is missing a required parameter, includes an unsupported parameter or parameter value, repeats the same parameter, uses more than one method for including an access token, or is otherwise malformed.  The resource server SHOULD respond with the HTTP 400 (Bad Request) status code.|
        </tr>
        <tr>
            <td>401|invalid_token&#10;The access token provided is expired, revoked, malformed, or invalid for other reasons.  The resource SHOULD respond with the HTTP 401 (Unauthorized) status code.  The client MAY request a new access token and retry the protected resource request.|
        </tr>
        <tr>
            <td>403|insufficient_scope&#10;The request requires higher privileges than provided by the access token.  The resource server SHOULD respond with the HTTP 403 (Forbidden) status code and MAY include the &quot;scope&quot;&#10; attribute with the scope necessary to access the protected resource.|
        </tr>
        <tr>
            <td>302|access_denies&#14; The request is denied by the authorization server.|
        </tr>

</table>


### registerGet
**GET**`/oxauth/register`

This operation retrieves the Client Metadata for a previously registered client.
#### URL
    http://gluu.org/oxauth/register
#### Parameters
The request is sent as an `HTTP POST` to the client registration endpoint as JSON with the parameters.

|Parameter|Description|
|---------|-----------|
|clientId |The unique client identifier usually INUM|
|securityContext|injectable interface that provides access to security related info.|
 
#### Response
Client Identificator or INUM, a client shared secret and the account expiration date in a [JSON[Response]]

#### Errors
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
        <tr>
            <td>400|invalid_request&#10;The request is missing a required parameter, includes an unsupported parameter or parameter value, repeats the same parameter, uses more than one method for including an access token, or is otherwise malformed.  The resource server SHOULD respond with the HTTP 400 (Bad Request) status code.|
        </tr>
        <tr>
            <td>401|invalid_token&#10;The access token provided is expired, revoked, malformed, or invalid for other reasons.  The resource SHOULD respond with the HTTP 401 (Unauthorized) status code.  The client MAY request a new access token and retry the protected resource request.|
        </tr>
        <tr>
            <td>403|insufficient_scope&#10;The request requires higher privileges than provided by the access token.  The resource server SHOULD respond with the HTTP 403 (Forbidden) status code and MAY include the &quot;scope&quot;&#10; attribute with the scope necessary to access the protected resource.|
        </tr>
        <tr>
            <td>302|access_denies&#14; The request is denied by the authorization server.|
        </tr>
</table>


## API Document

### /oxauth

#### Overview


#### `/oxauth/token`
**requestAccessToken
**POST**`/oxauth/token`

To obtain an Access Token, an ID Token, and optionally a Refresh Token,
the RP (Client) sends a Token Request to the Token Endpoint to obtain a
Token Response.

**URL**<br/>
    http://gluu.org/oxauth/token
**Parameters**<br/>
- form

|Parameter|Required|Description|Data Type|
|grant_type|true|Grant type value, one of these: authorization_code, implicit, password, client_credentials, refresh_token as described in OAuth 2.0 [RFC6749].|string|
|code|false|Code which is returned by authorization endpoint (For
grant_type=authorization_code).|string|
|redirect_uri|false|Redirection uri to which the response will be sent. This
uri MUST exactly match one of the redirection uri values for the client
pre-registered at the OpenID Provider.|string|
|username|false|End-User username.|string|
|password|false|End-User password.|string|
|scope|false|OpenID Connect requests MUST contain the openid scope value. If the openid scope value is not present, the behavior is entirely unspecified. Other scope values MAY be present. Scope values used that are not understood by an implementation SHOULD be ignored.|string|
|assertion|false|Assertion.|string|
|refresh_token|false|Refresh token.|string|
|oxauth_exchange_token|false|oxauth_exchange_token.|string|
|client_id|false|OAuth 2.0 Client Identifier valid at the Authorization Server.|string|
|client_secret|false|The client secret. The client MAY omit the parameter if the client secret is an empty string.|string|

**Response**<br/>
[JSON[Response]](#JSON[Response])


**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
        <tr>
            <td>400|invalid_request&#10; The request is missing a required parameter, includes an unsupported parameter value (other than grant type), repeats a parameter, includes multiple credentials,&#10; utilizes more than one mechanism for authenticating the client, or is otherwise malformed.|
        </tr>
        <tr>
            <td>400|invalid_client&#10;Client authentication failed (e.g., unknown client, no client authentication included, or unsupported&#10;authentication method). The authorization server MAY return an HTTP 401 (Unauthorized) status code to indicate&#10;which HTTP authentication schemes are supported. If the client attempted to authenticate via the &quot;Authorization&quot;&#10;request header field, the authorization server MUST respond with an HTTP 401 (Unauthorized) status code and&#10;include the &quot;WWW-Authenticate&quot; response header field matching the authentication scheme used by the client.|
        </tr>
        <tr>
            <td>400|invalid_grant&#10; The provided authorization grant (e.g., authorization code, resource owner credentials) or refresh token is&#10; invalid, expired, revoked, does not match the redirection uri used in the authorization request, or was issued to another client.|
        </tr>
        <tr>
            <td>400|unauthorized_client&#10;The authenticated client is not authorized to use this authorization grant type.|
        </tr>
        <tr>
            <td>400|unsupported_grant_type&#10;The authorization grant type is not supported by the authorization server.|
        </tr>
        <tr>
            <td>400| invalid_scope&#10;The requested scope is invalid, unknown, malformed, or exceeds the scope granted by the resource owner.|
        </tr>
</table>


- - -

## Data Types
## API Document

### /oxauth

#### Overview


#### `/oxauth/userinfo`
**requestUserInfoPost
**POST**`/oxauth/userinfo`

Returns Claims about the authenticated End-User.
The Access Token obtained from an OpenID Connect Authentication Request is sent as a Bearer Token.

**URL**<br/>
    http://gluu.org/oxauth/userinfo
**Parameters**<br/>
- form

|Parameter|Required|Description|Data Type|
|access_token|true|OAuth 2.0 Access Token.|string|
- header

|Parameter|Required|Description|Data Type|
|Authorization|false||string|

**Response**<br/>
[JSON[Response]](#JSON[Response])


**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
        <tr>
            <td>400|invalid_request&#10;The request is missing a required parameter, includes an unsupported parameter or parameter value, repeats the same parameter, uses more than one method for including an access token, or is otherwise malformed.  The resource server SHOULD respond with the HTTP 400 (Bad Request) status code.|
        </tr>
        <tr>
            <td>401|invalid_token&#10;The access token provided is expired, revoked, malformed, or invalid for other reasons.  The resource SHOULD respond with the HTTP 401 (Unauthorized) status code.  The client MAY request a new access token and retry the protected resource request.|
        </tr>
        <tr>
            <td>403|insufficient_scope&#10;The request requires higher privileges than provided by the access token.  The resource server SHOULD respond with the HTTP 403 (Forbidden) status code and MAY include the &quot;scope&quot;&#10; attribute with the scope necessary to access the protected resource.|
        </tr>
</table>


- - -
**requestUserInfoGet
**GET**`/oxauth/userinfo`

Returns Claims about the authenticated End-User.
The Access Token obtained from an OpenID Connect Authentication Request is sent as a Bearer Token.

**URL**<br/>
    http://gluu.org/oxauth/userinfo
**Parameters**<br/>
- query

|Parameter|Required|Description|Data Type|
|access_token|true|OAuth 2.0 Access Token.|string|
- header

|Parameter|Required|Description|Data Type|
|Authorization|false||string|

**Response**<br/>
[JSON[Response]](#JSON[Response])


**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
        <tr>
            <td>400|invalid_request&#10;The request is missing a required parameter, includes an unsupported parameter or parameter value, repeats the same parameter, uses more than one method for including an access token, or is otherwise malformed. The resource server SHOULD respond with the HTTP 400 (Bad Request) status code.|
        </tr>
        <tr>
            <td>401|invalid_token&#10;The access token provided is expired, revoked, malformed, or invalid for other reasons. The resource SHOULD respond with the HTTP 401 (Unauthorized) status code. The client MAY request a new access token and retry the protected resource request.|
        </tr>
        <tr>
            <td>403|insufficient_scope&#10;The request requires higher privileges than provided by the access token. The resource server SHOULD respond with the HTTP 403 (Forbidden) status code and MAY include the &quot;scope&quot;&#10; attribute with the scope necessary to access the protected resource.|
        </tr>
</table>


- - -

## Data Types
## SCIM 1.1

### SCIM 1.1 Specifications

You can see the detailed SCIM 1.1 specification documents
[here](http://www.simplecloud.info/specs/draft-scim-api-01.html).

### SCIM 1.1 Endpoints

- [User Endpoint](#user-endpoint)
- [Group Endpoint](#group-endpoint)
- [Bulk Operation Endpoint](#bulk-operation-endpoint)


## User Endpoint

### /seam/resource/restv1/Users
- - -
**getUser
**GET**`/host/seam/resource/restv1/scim/v1/Users{rsid}`

Returns a user on the basis of provided id as path parameter. The
resource MUST be already registered with the mentioned id.

**URL**<br/>
    http://gluu.org/host/seam/resource/restv1/scim/v1/Users{rsid}

**Request
**Parameters**<br/>
- Following are the details about parameters:
|Parameter|Location|
	    <th>Required|Description|Data Type|
|rsid|
	    <td>path|
	    <td>TRUE|Resource set description ID|string|
        </tr>
	<tr>
            <th>Authorization|
	    <td>header|
	    <td>FALSE||string|


**Response**<br/>
**Content Type:** application/json, application/xml

**Success
-	<table border="1">
	    <tr>
			<th>Status Code|
			<th>Reason|
			<th>Description|
	    </tr>
	    <tr>
			<th>200|
			<th>Successful Operation|
			<th>Resource returned successfully|
	    </tr>
	</table>

**Errors**<br/>
-	<table border="1">
	    <tr>
			<th>Status Code|
			<th>Reason|
			<th>Description|
	    </tr>
		<tr>
		    <th>400|
		    <td>BAD REQUEST|
		    <td>Request cannot be parsed, is syntactically incorrect, or violates schema.|
		</tr>
		<tr>
		    <th>401|
		    <td>UNAUTHORIZED|
		    <td>Authorization header is invalid or missing.|
		</tr>
		<tr>
		    <th>403|
		    <td>FORBIDDEN|
		    <td>Operation is not permitted based on the supplied
authorization.|
		</tr>
		<tr>
		    <th>404|
		    <td>NOT FOUND|
		    <td>Specified user does not exist.|
		</tr>
	</table>

- - -

## Group Endpoint

### /seam/resource/restv1/Groups
- - -
**getGroup
**GET**`/host/seam/resource/restv1/scim/v1/Groups{rsid}`

Returns a group on the basis of the provided id as a path parameter. The
group MUST be already registered with the mentioned id.

**URL**<br/>
    http://gluu.org/host/seam/resource/restv1/scim/v1/Groups{rsid}

**Request
**Parameters**<br/>
- Following are the details about parameters:
|Parameter|Location|
	    <th>Required|Description|Data Type|
|rsid|
	    <td>path|
	    <td>TRUE|Resource set description ID.|string|
        </tr>
	<tr>
            <th>Authorization|
	    <td>header|
	    <td>FALSE||string|

**Response**<br/>
**Content Type:** application/json, application/xml

**Success
-	<table border="1">
	    <tr>
			<th>Status Code|
			<th>Reason|
			<th>Description|
	    </tr>
	    <tr>
			<th>200|
			<th>Successful Operation|
			<th>Group returned successfully.|
	    </tr>
	</table>

**Errors**<br/>
-	<table border="1">
	    <tr>
			<th>Status Code|
			<th>Reason|
			<th>Description|
	    </tr>
		<tr>
		    <th>400|
		    <td>Bad Request|
		    <td>Request cannot be parsed, is syntactically incorrect, or violates schema.|
		</tr>
		<tr>
		    <th>401|
		    <td>Unauthorized|
		    <td>Authorization header is invalid or missing.|
		</tr>
		<tr>
		    <th>403|
		    <td>Forbidden|
		    <td>Operation is not permitted based on the supplied authorization.|
		</tr>
		<tr>
		    <th>404|
		    <td>Not Found|
		    <td>Specified user does not exist.|
		</tr>
	</table>

- - -


## Bulk Operation Endpoint

### /seam/resource/restv1/scim/v1/Bulk
- - -

<a id="bulkOperation">Bulk Operation</a>

SCIM Bulk Operation enables consumers to work with a potentially large
collection (bulk) of Resource operations in a single request. A body of
a bulk operation may contain a set of HTTP Resource operations using one
of the API supported HTTP methods; i.e., POST, PUT, PATCH or DELETE.
(see http://www.simplecloud.info/specs/draft-scim-api-01.html#bulk-resources
for more details.)

#### Security

* Authorization

#### Request


**Content-Type:**application/json, application/xml

**Parameters**<br/>

<table border="1">
    <tr>
        <th>Name|<th>Located in|<th>Required|<th>Description|<th>Default|<th>Schema|
    </tr>
    <tr>
        <th>Authorization|<td>header|
        <td>no|
        <td>|
        <td> - |
        <td>string |
    </tr>
    <tr>
        <th>body|<td>body|
        <td>no|
        <td>BulkRequest|
        <td> - |
        <td><a href="#/definitions/BulkRequest">BulkRequest</a>|
    </tr>
</table>

#### Response

**Content-Type: **application/json, application/xml


| Status Code | Reason      | Response Model |
|-------------|-------------|----------------|
| 200    | successful operation | <a href="#/definitions/BulkResponse">BulkResponse</a>|

- - -

## Definitions

## <a name="/definitions/BulkOperation">BulkOperation</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    
        <tr>
            <td>bulkId|string|optional|-||
        </tr>
    
        <tr>
            <td>version|string|optional|-||
        </tr>
    
        <tr>
            <td>method|string|optional|-||
        </tr>
    
        <tr>
            <td>path|string|optional|-||
        </tr>
    
        <tr>
            <td>location|string|optional|-||
        </tr>
    
        <tr>
            <td>data|object|optional|-||
        </tr>
    
        <tr>
            <td>status|string|optional|-||
        </tr>
    
        <tr>
            <td>response|object|optional|-||
        </tr>
</table>

## <a name="/definitions/BulkRequest">BulkRequest</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    
        <tr>
            <td>schemes|array[string]|optional|-||
        </tr>
    
        <tr>
            <td>failOnErrors|integer (int32)|optional|-||
        </tr>
    
        <tr>
            <td>operations|array[<a href="#/definitions/BulkOperation">BulkOperation</a>]|optional|-||
        </tr>
</table>

## <a name="/definitions/BulkResponse">BulkResponse</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    
        <tr>
            <td>schemes|array[string]|optional|-||
        </tr>
    
        <tr>
            <td>operations|array[<a href="#/definitions/BulkOperation">BulkOperation</a>]|optional|-||
        </tr>
</table>

## SCIM 2.0

### SCIM 2.0 Specifications

You can see the detailed SCIM 2.0 specification documents here:

[System for Cross-domain Identity Management: Core Schema](https://tools.ietf.org/html/rfc7643)

[System for Cross-domain Identity Management: Protocol](https://tools.ietf.org/html/rfc7644)

### SCIM 2.0 Endpoints

- [User Endpoint](#user-endpoint)
- [Group Endpoint](#group-endpoint)
- [Bulk Operation Endpoint](#bulk-operation-endpoint)

### SCIM 2.0 Definitions
- [Definitions](#definitions)

- - -

## User Endpoint

#### URL
    <domain root>/identity/seam/resource/restv1/scim/v2/Users

### GET

<a id="searchUsers">[Search Users](https://tools.ietf.org/html/rfc7644#section-3.4.2.2)</a> - searches users based on filter criteria

#### Security

* UMA (default)
* OAuth2 Access Token (Test Mode)

#### Request

**_Content-Type:_**`application/scim+json`, `application/json`

**Parameters**<br/>

<table border="1">
    <tr>
        <th>Name|<th>Located in|<th>Required|<th>Description|<th>Default|<th>Schema|
    </tr>
    <tr>
        <th>Authorization|<td>header|
        <td>yes (default)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>access_token|<td>query|
        <td>yes (if "Test Mode" is enabled)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>filter|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>startIndex|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>count|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>sortBy|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>sortOrder|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>attributes|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string array|
    </tr>
</table>

#### Response

**_Content-Type:_**`application/scim+json`, `application/json`

| Status Code | Reason      | Response Model |
|-------------|-------------|----------------|
| 200    | successful operation | <a href="#/definitions/ListResponse">ListResponse</a>|

### POST

<a id="createUser">[Create User](https://tools.ietf.org/html/rfc7644#section-3.3)</a> - creates a user

#### Security

* UMA (default)
* OAuth2 Access Token (Test Mode)

#### Request

**_Content-Type:_**`application/scim+json`, `application/json`

**Parameters**<br/>

<table border="1">
    <tr>
        <th>Name|<th>Located in|<th>Required|<th>Description|<th>Default|<th>Schema|
    </tr>
    <tr>
        <th>Authorization|<td>header|
        <td>yes (default)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>access_token|<td>query|
        <td>yes (if "Test Mode" is enabled)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>body|<td>body|
        <td>yes|
        <td>User|
        <td> - |
        <td><a href="#/definitions/User">User</a>|
    </tr>
    <tr>
        <th>attributes|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string array|
    </tr>
</table>

#### Response

**_Content-Type:_**`application/scim+json`, `application/json`

| Status Code | Reason      | Response Model |
|-------------|-------------|----------------|
| 201    | successful operation | <a href="#/definitions/User">User</a>|

#### URL
    <domain root>/identity/seam/resource/restv1/scim/v2/Users/{id}

### GET

<a id="getUserById">[Find User By ID](https://tools.ietf.org/html/rfc7644#section-3.4.1)</a> - returns a user by id as path parameter

#### Security

* UMA (default)
* OAuth2 Access Token (Test Mode)

#### Request

**_Content-Type:_**`application/scim+json`, `application/json`

**Parameters**<br/>

<table border="1">
    <tr>
        <th>Name|<th>Located in|<th>Required|<th>Description|<th>Default|<th>Schema|
    </tr>
    <tr>
        <th>Authorization|<td>header|
        <td>yes (default)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>access_token|<td>query|
        <td>yes (if "Test Mode" is enabled)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>id|<td>path|
        <td>yes|
        <td>LDAP 'inum' of user|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>attributes|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string array|
    </tr>
</table>

#### Response

**_Content-Type:_**`application/scim+json`, `application/scim`

| Status Code | Reason      | Response Model |
|-------------|-------------|----------------|
| 200    | successful operation | <a href="#/definitions/User">User</a>|

### PUT

<a id="updateUser">[Update User](https://tools.ietf.org/html/rfc7644#section-3.5.1)</a> - updates a user

#### Security

* UMA (default)
* OAuth2 Access Token (Test Mode)

#### Request

**_Content-Type:_**`application/scim+json`, `application/json`

**Parameters**<br/>

<table border="1">
    <tr>
        <th>Name|<th>Located in|<th>Required|<th>Description|<th>Default|<th>Schema|
    </tr>
    <tr>
        <th>Authorization|<td>header|
        <td>yes (default)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>access_token|<td>query|
        <td>yes (if "Test Mode" is enabled)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>id|<td>path|
        <td>yes|
        <td>LDAP 'inum' of user|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>body|<td>body|
        <td>yes|
        <td>User|
        <td> - |
        <td><a href="#/definitions/User">User</a>|
    </tr>
    <tr>
        <th>attributes|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string array|
    </tr>
</table>

#### Response

**_Content-Type:_**`application/scim+json`, `application/json`

| Status Code | Reason      | Response Model |
|-------------|-------------|----------------|
| 200    | successful operation | <a href="#/definitions/User">User</a>|

### DELETE

<a id="deleteUser">[Delete User](https://tools.ietf.org/html/rfc7644#section-3.6)</a> - deletes a user

#### Security

* UMA (default)
* OAuth2 Access Token (Test Mode)

#### Request

**Parameters**<br/>

<table border="1">
    <tr>
        <th>Name|<th>Located in|<th>Required|<th>Description|<th>Default|<th>Schema|
    </tr>
    <tr>
        <th>Authorization|<td>header|
        <td>yes (default)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>access_token|<td>query|
        <td>yes (if "Test Mode" is enabled)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>id|<td>path|
        <td>yes|
        <td>LDAP 'inum' of user|
        <td> - |
        <td>string|
    </tr>
</table>

#### Response

**_Content-Type:_**`application/scim+json`, `application/json`

| Status Code | Reason      | Response Model |
|-------------|-------------|----------------|
| default     | successful operation |  -    |

#### URL
    <domain root>/identity/seam/resource/restv1/scim/v2/Users/Search

### POST

<a id="searchUsersPost">[Search Users](https://tools.ietf.org/html/rfc7644#section-3.4) (**_Deprecated_**)</a> - searches users by HTTP POST

#### Security

* UMA (default)
* OAuth2 Access Token (Test Mode)

#### Request

**_Content-Type:_**`application/scim+json`, `application/json`

**Parameters**<br/>

<table border="1">
    <tr>
        <th>Name|<th>Located in|<th>Required|<th>Description|<th>Default|<th>Schema|
    </tr>
    <tr>
        <th>Authorization|<td>header|
        <td>yes (default)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>access_token|<td>query|
        <td>yes (if "Test Mode" is enabled)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>body|<td>body|
        <td>yes|
        <td>|
        <td> - |
        <td><a href="#/definitions/ScimPersonSearch">ScimPersonSearch|
    </tr>
</table>

#### Response

**_Content-Type:_**`application/scim+json`, `application/json`

| Status Code | Reason      | Response Model |
|-------------|-------------|----------------|
| 200    | successful operation | <a href="#/definitions/ListResponse">ListResponse</a>|

- - -

## Group Endpoint

#### URL
    <domain root>/identity/seam/resource/restv1/scim/v2/Groups

### GET

<a id="searchGroups">[Search Groups](https://tools.ietf.org/html/rfc7644#section-3.4.2.2)</a> - searches groups based on filter criteria

#### Security

* UMA (default)
* OAuth2 Access Token (Test Mode)

#### Request

**_Content-Type:_**`application/scim+json`, `application/json`

**Parameters**<br/>

<table border="1">
    <tr>
        <th>Name|<th>Located in|<th>Required|<th>Description|<th>Default|<th>Schema|
    </tr>
    <tr>
        <th>Authorization|<td>header|
        <td>yes (default)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>access_token|<td>query|
        <td>yes (if "Test Mode" is enabled)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>filter|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>startIndex|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>count|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>sortBy|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>sortOrder|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>attributes|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string array|
    </tr>
</table>

#### Response

**_Content-Type:_**`application/scim+json`, `application/json`

| Status Code | Reason      | Response Model |
|-------------|-------------|----------------|
| 200    | successful operation | <a href="#/definitions/ListResponse">ListResponse</a>|

### POST

<a id="createGroup">[Create Group](https://tools.ietf.org/html/rfc7644#section-3.3)</a> - creates a group

#### Security

* UMA (default)
* OAuth2 Access Token (Test Mode)

#### Request

**_Content-Type:_**`application/scim+json`, `application/json`

**Parameters**<br/>

<table border="1">
    <tr>
        <th>Name|<th>Located in|<th>Required|<th>Description|<th>Default|<th>Schema|
    </tr>
    <tr>
        <th>Authorization|<td>header|
        <td>yes (default)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>access_token|<td>query|
        <td>yes (if "Test Mode" is enabled)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>body|<td>body|
        <td>yes|
        <td>Group|
        <td> - |
        <td><a href="#/definitions/Group">Group</a>|
    </tr>
    <tr>
        <th>attributes|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string array|
    </tr>
</table>

#### Response

**_Content-Type:_**`application/scim+json`, `application/json`

| Status Code | Reason      | Response Model |
|-------------|-------------|----------------|
| 201    | successful operation | <a href="#/definitions/Group">Group</a>|

#### URL
    <domain root>/identity/seam/resource/restv1/scim/v2/Groups/{id}

### GET

<a id="getGroupById">[Find Group By ID](https://tools.ietf.org/html/rfc7644#section-3.4.2.1)</a> - returns a group by id as path parameter

#### Security

* UMA (default)
* OAuth2 Access Token (Test Mode)

#### Request

**_Content-Type:_**`application/scim+json`, `application/json`

**Parameters**<br/>

<table border="1">
    <tr>
        <th>Name|<th>Located in|<th>Required|<th>Description|<th>Default|<th>Schema|
    </tr>
    <tr>
        <th>Authorization|<td>header|
        <td>yes (default)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>access_token|<td>query|
        <td>yes (if "Test Mode" is enabled)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>id|<td>path|
        <td>yes|
        <td>LDAP 'inum' of group|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>attributes|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string array|
    </tr>
</table>

#### Response

**_Content-Type:_**`application/scim+json`, `application/json`

| Status Code | Reason      | Response Model |
|-------------|-------------|----------------|
| 200    | successful operation | <a href="#/definitions/Group">Group</a>|

### PUT

<a id="updateGroup">[Update Group](https://tools.ietf.org/html/rfc7644#section-3.5.1)</a> - updates a group

#### Security

* UMA (default)
* OAuth2 Access Token (Test Mode)

#### Request

**_Content-Type:_**`application/scim+json`, `application/json`

**Parameters**<br/>

<table border="1">
    <tr>
        <th>Name|<th>Located in|<th>Required|<th>Description|<th>Default|<th>Schema|
    </tr>
    <tr>
        <th>Authorization|<td>header|
        <td>yes (default)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>access_token|<td>query|
        <td>yes (if "Test Mode" is enabled)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>id|<td>path|
        <td>yes|
        <td>LDAP 'inum' of group|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>body|<td>body|
        <td>yes|
        <td>Group|
        <td> - |
        <td><a href="#/definitions/Group">Group</a>|
    </tr>
    <tr>
        <th>attributes|<td>query|
        <td>no|
        <td>|
        <td> - |
        <td>string array|
    </tr>
</table>

#### Response

**_Content-Type:_**`application/scim+json`, `application/json`

| Status Code | Reason      | Response Model |
|-------------|-------------|----------------|
| 200    | successful operation | <a href="#/definitions/Group">Group</a>|

### DELETE

<a id="deleteGroup">[Delete Group](https://tools.ietf.org/html/rfc7644#section-3.6)</a> - deletes a group

#### Security

* UMA (default)
* OAuth2 Access Token (Test Mode)

#### Request

**Parameters**<br/>

<table border="1">
    <tr>
        <th>Name|<th>Located in|<th>Required|<th>Description|<th>Default|<th>Schema|
    </tr>
    <tr>
        <th>Authorization|<td>header|
        <td>yes (default)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>access_token|<td>query|
        <td>yes (if "Test Mode" is enabled)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>id|<td>path|
        <td>yes|
        <td>LDAP 'inum' of the group|
        <td> - |
        <td>string |
    </tr>
</table>

#### Response

**_Content-Type:_**`application/scim+json`, `application/json`

| Status Code | Reason      | Response Model |
|-------------|-------------|----------------|
| default    | successful operation |  - |

- - -

## Bulk Operation Endpoint

#### URL
    <domain root>/identity/seam/resource/restv1/scim/v2/Bulk

### POST

<a id="bulkOperation">[Bulk Operations](https://tools.ietf.org/html/rfc7644#section-3.7)</a> - bulk operations

#### Security

* UMA (default)
* OAuth2 Access Token (Test Mode)

#### Request

**_Content-Type:_**`application/scim+json`, `application/json`

**Parameters**<br/>

<table border="1">
    <tr>
        <th>Name|<th>Located in|<th>Required|<th>Description|<th>Default|<th>Schema|
    </tr>
    <tr>
        <th>Authorization|<td>header|
        <td>yes (default)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>access_token|<td>query|
        <td>yes (if "Test Mode" is enabled)|
        <td>|
        <td> - |
        <td>string|
    </tr>
    <tr>
        <th>body|<td>body|
        <td>yes|
        <td>BulkRequest|
        <td> - |
        <td><a href="#/definitions/BulkRequest">BulkRequest</a>|
    </tr>
</table>

#### Response

**_Content-Type:_**`application/scim+json`, `application/json`

| Status Code | Reason      | Response Model |
|-------------|-------------|----------------|
| 200    | successful operation | <a href="#/definitions/BulkResponse">BulkResponse</a>|

- - -

## Definitions

## <a name="/definitions/Address">Address</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>operation|
        <td>string|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>primary|
        <td>boolean|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>formatted|
        <td>string|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>streetAddress|
        <td>string|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>locality|
        <td>string|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>region|
        <td>string|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>postalCode|
        <td>string|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>country|
        <td>string|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>type|
        <td><a href="#/definitions/Type">Type</a>|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>$ref|
        <td>string|
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/BulkOperation">BulkOperation</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>bulkId|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>version|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>method|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>path|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>location|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>data|
        <td> object |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>status|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>response|
        <td> object |
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/BulkRequest">BulkRequest</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>schemas|
        <td> array[string] |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>failOnErrors|
        <td> integer (int32) |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>operations|
        <td> array[<a href="#/definitions/BulkOperation">BulkOperation</a>] |
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/BulkResponse">BulkResponse</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>schemas|
        <td> array[string] |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>operations|
        <td> array[<a href="#/definitions/BulkOperation">BulkOperation</a>] |
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/Email">Email</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>operation|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>value|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>display|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>primary|
        <td> boolean |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>type|
        <td> <a href="#/definitions/Type">Type</a> |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>$ref|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/Entitlement">Entitlement</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>operation|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
   </tr>
    <tr>
        <td>value|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>display|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>primary|
        <td> boolean |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>type|
        <td> <a href="#/definitions/Type">Type</a> |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>$ref|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/Group">Group</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>id|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>externalId|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>meta|
        <td> <a href="#/definitions/Meta">Meta</a> |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>schemas|
        <td> array[string] |
        <td>required|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>displayName|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>members|
        <td> array[<a href="#/definitions/MemberRef">MemberRef</a>] |
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/GroupRef">GroupRef</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>value|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>display|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>type|
        <td> <a href="#/definitions/Type">Type</a> |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>$ref|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/Im">Im</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>operation|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>value|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>display|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>primary|
        <td> boolean |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>type|
        <td> <a href="#/definitions/Type">Type</a> |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>$ref|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/ListResponse">ListResponse</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>totalResults|
        <td>integer (int32)|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>startIndex|
        <td>integer (int32)|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>itemsPerPage|
        <td>integer (int32)|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>schemas|
        <td>array[string]|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>resources|
        <td>array[<a href="#/definitions/Resource">Resource</a>]|
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/MemberRef">MemberRef</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>operation|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>value|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>display|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>type|
        <td> <a href="#/definitions/Type">Type</a> |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>$ref|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/Meta">Meta</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>created|
        <td> string (date-time) |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>lastModified|
        <td> string (date-time) |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>location|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>version|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>attributes|
        <td> array[string] |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>resourceType|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/Name">Name</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>formatted|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>familyName|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>givenName|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>middleName|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>honorificPrefix|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>honorificSuffix|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/PhoneNumber">PhoneNumber</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>operation|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>value|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>display|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>primary|
        <td> boolean |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>type|
        <td> <a href="#/definitions/Type">Type</a> |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>$ref|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/Photo">Photo</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>operation|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>value|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>display|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>primary|
        <td> boolean |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>type|
        <td> <a href="#/definitions/Type">Type</a> |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>$ref|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/Resource">Resource</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>id|
        <td>string|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>externalId|
        <td>string|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>meta|
        <td><a href="#/definitions/Meta">Meta</a>|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>schemas|
        <td>array[string]|
        <td>required|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/Role">Role</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>operation|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>value|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>display|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>primary|
        <td> boolean |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>type|
        <td> <a href="#/definitions/Type">Type</a> |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>$ref|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/Type">Type</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
</table>

## <a name="/definitions/User">User</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>id|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>externalId|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>meta|
        <td> <a href="#/definitions/Meta">Meta</a> |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>schemas|
        <td> array[string] |
        <td>required|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>userName|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>name|
        <td> <a href="#/definitions/Name">Name</a> |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>displayName|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>nickName|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>profileUrl|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>title|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>userType|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>preferredLanguage|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>locale|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>timezone|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>active|
        <td> boolean |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>password|
        <td> string |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>emails|
        <td> array[<a href="#/definitions/Email">Email</a>] |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>phoneNumbers|
        <td> array[<a href="#/definitions/PhoneNumber">PhoneNumber</a>] |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>ims|
        <td> array[<a href="#/definitions/Im">Im</a>] |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>photos|
        <td> array[<a href="#/definitions/Photo">Photo</a>] |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>addresses|
        <td> array[<a href="#/definitions/Address">Address</a>] |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>groups|
        <td> array[<a href="#/definitions/GroupRef">GroupRef</a>] |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>entitlements|
        <td> array[<a href="#/definitions/Entitlement">Entitlement</a>] |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>roles|
        <td> array[<a href="#/definitions/Role">Role</a>] |
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>x509Certificates|
        <td> array[<a href="#/definitions/X509Certificate">X509Certificate</a>] |
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/X509Certificate">X509Certificate</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>operation|
        <td>string|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>value|
        <td>string|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>display|
        <td>string|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>primary|
        <td>boolean|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>type|
        <td><a href="#/definitions/Type">Type</a>|
        <td>optional|
        <td>-|
        <td>|
    </tr>
    <tr>
        <td>$ref|
        <td>string|
        <td>optional|
        <td>-|
        <td>|
    </tr>
</table>

## <a name="/definitions/ScimPersonSearch">ScimPersonSearch</a>

<table border="1">
    <tr>
        <th>name|<th>type|<th>required|<th>description|<th>example|
    </tr>
    <tr>
        <td>attribute|
        <td> string |
        <td>required|
        <td>User Attribute Name|
        <td>Username|
    </tr>
    <tr>
        <td>value|
        <td> string |
        <td>required|
        <td>User Attribute Value|
        <td>Mike|
    </tr>
</table>
## API Document

### /requester/perm

#### Overview


#### `/requester/perm`
**requestRptPermissionAuthorization
**POST**`/requester/perm`

Client Requests Authorization Data
Once in possession of a permission ticket and an AAT for this
authorization server, the client asks the authorization server to give
it authorization data corresponding to that permission ticket. It
performs a POST on the RPT endpoint, supplying its own AAT in the header
and a JSON object in the body with a "ticket" property containing the
ticket as its value.

If the client had included an RPT in its failed access attempt, It MAY
also provide that RPT in an "rpt" property in its request to the
authorization server.

In circumstances where the client needs to provide requesting party
claims to the authorization server, it MAY also include a "claim_tokens"
property in its request; see Section 3.4.1.2.1 for more information. The
authorization server uses the ticket to look up the details of the
previously registered requested permission, maps the requested
permission to operative resource owner policies based on the resource
set identifier and scopes associated with it, potentially requests
additional information, and ultimately responds positively or negatively
to the request for authorization data.

The authorization server bases the issuing of authorization data on
resource owner policies. These policies thus amount to an asynchronous
OAuth authorization grant. The authorization server is also free to
enable the resource owner to set policies that require the owner to
interact with the server in near-real time to provide consent subsequent
to an access attempt. All such processes are outside the scope of this
specification.

**URL**<br/>
    http://gluu.org/requester/perm

**Parameters**<br/>
- body

|Parameter|Required|Description|Data Type|
|body|false||<a href="#RptAuthorizationRequest">RptAuthorizationRequest</a>|
- header

|Parameter|Required|Description|Data Type|
|Authorization|false||string|
|Host|false||string|

**Response**<br/>
[](#)


**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
        <tr>
            <td>403|Forbidden. Example of a &quot;need_info&quot; response with a full set of &quot;error_details&quot; hints:&#10;&#10;HTTP/1.1 403 Forbidden&#10;Content-Type: application/json&#10;Cache-Control: no-store&#10;...&#10;&#10;{&#10; &quot;error&quot;: &quot;need_info&quot;,&#10; &quot;error_details&quot;: {&#10;   &quot;authentication_context&quot;: {&#10;     &quot;required_acr&quot;: [&quot;https://example.com/acrs/LOA3.14159&quot;]&#10;   },&#10;   &quot;requesting_party_claims&quot;: {&#10;     &quot;required_claims&quot;: [&#10;       {&#10;         &quot;name&quot;: &quot;email23423453ou453&quot;,&#10;         &quot;friendly_name&quot;: &quot;email&quot;,&#10;         &quot;claim_type&quot;: &quot;urn:oid:0.9.2342.19200300.100.1.3&quot;,&#10;         &quot;claim_token_format&quot;: &#10;[&quot;http://openid.net/specs/openid-connect-core-1_0.html#HybridIDToken&quot;],&#10;         &quot;issuer&quot;: [&quot;https://example.com/idp&quot;]&#10;       }&#10;     ],&#10;     &quot;redirect_user&quot;: true,&#10;     &quot;ticket&quot;: &quot;016f84e8-f9b9-11e0-bd6f-0021cc6004de&quot;&#10;   }&#10; }&#10;}&#10;|
        </tr>
        <tr>
            <td>401|Unauthorized|
        </tr>
        <tr>
            <td>400|Bad request|
        </tr>
</table>


- - -

## Data Types


## <a name="ClaimTokenList">ClaimTokenList</a>

<table border="1">
    <tr>
        <th>type|<th>required|<th>access|<th>description|<th>notes|
    </tr>
    <tr>
        <td>boolean|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>int|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
</table>

## <a name="RptAuthorizationRequest">RptAuthorizationRequest</a>

<table border="1">
    <tr>
        <th>type|<th>required|<th>access|<th>description|<th>notes|
    </tr>
    <tr>
        <td><a href="#ClaimTokenList">ClaimTokenList</a>|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
</table>

## API Document

### /requester/rpt

#### Overview


#### `/requester/rpt`
**getRequesterPermissionToken
**POST**`/requester/rpt`

The endpoint at which the requester asks the AM to issue an RPT.

**URL**<br/>
    http://gluu.org/requester/rpt

**Parameters**<br/>
- header

|Parameter|Required|Description|Data Type|
|Authorization|false||string|
|Host|false||string|

**Response**<br/>
[](#)


**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
        <tr>
            <td>401|Unauthorized|
        </tr>
</table>

- - -

## Data Types
## API Document

### /.well-known/uma-configuration

#### Overview

#### `/oxauth/uma-configuration`
**getConfiguration
**GET**`/oxauth/uma-configuration`

Provides configuration data as JSON document. It contains options and
endpoints supported by the authorization server.

**URL**<br/>
    http://gluu.org/oxauth/uma-configuration

**Parameters**<br/>

**Response**<br/>
[UmaConfiguration](#UmaConfiguration)

**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
    <tr>
        <td>500|
        <td>Failed to build UMA configuration JSON object.|
    </tr>
</table>

- - -

## Data Types

## <a name="UmaConfiguration">UmaConfiguration</a>

<table border="1">
    <tr>
        <th>type|<th>required|<th>access|<th>description|<th>notes|
    </tr>
    <tr>
        <td>Array[string]|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>Array[string]|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>Array[string]|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>Array[string]|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>required|
        <td>-|
        <td>An uri indicating the party operating the authorization server.|
        <td>An uri indicating the party operating the authorization server.|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>Array[string]|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>Array[string]|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>required|
        <td>-|
        <td>The version of the UMA core protocol to which this authorization server conforms. The value MUST be the string "1.0".|
        <td>The version of the UMA core protocol to which this authorization server conforms. The value MUST be the string "1.0".|
    </tr>
</table>

## API Document

### /host/rsrc_pr

#### Overview

#### `/host/rsrc_pr`
**registerResourceSetPermission
**POST**`/host/rsrc_pr`

Registers permission using the POST method.
The resource server uses the POST method at the endpoint. The body of
the HTTP request message contains a JSON object providing the requested
permission, using a format derived from the scope description format
specified in [OAuth-resource-reg], as follows. The object has the
following properties:

**URL**<br/>
    http://gluu.org/host/rsrc_pr

**Parameters**<br/>
- body

|Parameter|Required|Description|Data Type|
|body|true|The identifier for a resource set to which this client is seeking access. The identifier MUST correspond to a resource set that was previously registered.|<a href="#RegisterPermissionRequest">RegisterPermissionRequest</a>|
- header

|Parameter|Required|Description|Data Type|
|Authorization|false||string|
|Host|false||string|

**Response**<br/>
[](#)

**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
        <tr>
            <td>401|Unauthorized|
        </tr>
        <tr>
            <td>400|Bad Request|
        </tr>
</table>

- - -

## Data Types

## <a name="RegisterPermissionRequest">RegisterPermissionRequest</a>

<table border="1">
    <tr>
        <th>type|<th>required|<th>access|<th>description|<th>notes|
    </tr>
    <tr>
        <td>Date|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>Array[string]|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>Date|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>Date|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
</table>

## API Document

### /host/rsrc/resource_set

#### Overview

#### `/host/rsrc/resource_set{rsid}`
**deleteResourceSet
**DELETE**`/host/rsrc/resource_set{rsid}`

Deletes a previously registered resource set description using the
DELETE method, thereby removing it from the authorization server's
protection regime.

**URL**<br/>
    http://gluu.org/host/rsrc/resource_set{rsid}

**Parameters**<br/>
- path

|Parameter|Required|Description|Data Type|
|rsid|true|Resource set description ID|string|
- header

|Parameter|Required|Description|Data Type|
|Authorization|false||string|

**Response**<br/>
[ResourceSet](#ResourceSet)

**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
    <tr>
        <td>401|
        <td>Unauthorized|
    </tr>
</table>

- - -
**getResourceSet
**GET**`/host/rsrc/resource_set{rsid}`

Reads a previously registered resource set description using the GET
method. If the request is successful, the authorization server MUST
respond with a status message that includes a body containing the
referenced resource set description, along with an "_id" property.

**URL**<br/>
    http://gluu.org/host/rsrc/resource_set{rsid}

**Parameters**<br/>
- path

|Parameter|Required|Description|Data Type|
|rsid|true|Resource set description object ID|string|
- header

|Parameter|Required|Description|Data Type|
|Authorization|false||string|

**Response**<br/>
[ResourceSet](#ResourceSet)

**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
    <tr>
        <td>401|
        <td>Unauthorized|
    </tr>
</table>

- - -
**updateResourceSet
**PUT**`/host/rsrc/resource_set{rsid}`

Updates a previously registered resource set description using the PUT
method. If the request is successful, the authorization server MUST
respond with a status message that includes an "_id" property.

**URL**<br/>
    http://gluu.org/host/rsrc/resource_set{rsid}

**Parameters**<br/>
- body

|Parameter|Required|Description|Data Type|
|body|true|Resource set description JSON object|<a href="#ResourceSet">ResourceSet</a>|
- path

|Parameter|Required|Description|Data Type|
|rsid|true|Resource set description ID|string|
- header

|Parameter|Required|Description|Data Type|
|Authorization|false||string|

**Response**<br/>
[](#)

**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
    <tr>
        <td>401|
        <td>Unauthorized|
    </tr>
</table>

- - -
#### `/host/rsrc/resource_set`
**getResourceSetList
**GET**`/host/rsrc/resource_set`

Lists all previously registered resource set identifiers for this user
using the GET method. The authorization server MUST return the list in
the form of a JSON array of {rsid} string values.

The resource server uses this method as a first step in checking whether
its understanding of protected resources is in full synchronization with
the authorization server's understanding.

**URL**<br/>
    http://gluu.org/host/rsrc/resource_set

**Parameters**<br/>
- query

|Parameter|Required|Description|Data Type|
|scope|false|Scope uri|string|
- header

|Parameter|Required|Description|Data Type|
|Authorization|false||string|

**Response**<br/>
[ResourceSet](#ResourceSet)

**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
    <tr>
        <td>401|
        <td>Unauthorized|
    </tr>
</table>

- - -
**createResourceSet
**POST**`/host/rsrc/resource_set`

Adds a new resource set description using the POST method. If the
request is successful, the authorization server MUST respond with a
status message that includes an _id property.

**URL**<br/>
    http://gluu.org/host/rsrc/resource_set

**Parameters**<br/>
- body

|Parameter|Required|Description|Data Type|
|body|true|Resource set description|<a href="#ResourceSet">ResourceSet</a>|
- header

|Parameter|Required|Description|Data Type|
|Authorization|false||string|

**Response**<br/>
[](#)

**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
        <tr>
            <td>401|Unauthorized|
        </tr>
</table>

- - -
**unsupportedHeadMethod
**HEAD**`/host/rsrc/resource_set`

Not allowed

**URL**<br/>
    http://gluu.org/host/rsrc/resource_set

**Parameters**<br/>

**Response**<br/>
[](#)

**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
</table>

- - -
**unsupportedOptionsMethod
**OPTIONS**`/host/rsrc/resource_set`

Not allowed

**URL**<br/>
    http://gluu.org/host/rsrc/resource_set

**Parameters**<br/>

**Response**<br/>
[](#)

**Errors**<br/>
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
</table>

- - -

## Data Types

## <a name="ResourceSet">ResourceSet</a>

<table border="1">
    <tr>
        <th>type|<th>required|<th>access|<th>description|<th>notes|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>Array[string]|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
    <tr>
        <td>string|
        <td>optional|
        <td>-|
        <td>-|
        <td>-|
    </tr>
</table>

## API Document

### /rpt/status

#### Overview

#### `/rpt/status`
**requestRptStatusGet
**GET**`/rpt/status`

Not allowed

**URL**<br/>
    http://gluu.org/rpt/status

**Parameters**<br/>
- form

|Parameter|Required|Description|Data Type|
|token|false||string|
|token_type_hint|false||string|
- header

|Parameter|Required|Description|Data Type|
|Authorization|false||string|

**Errors**<br/>**
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
    <tr>
        <td>405|
        <td>Introspection of RPT is not allowed by GET HTTP method.|
    </tr>
</table>

- - -
**requestRptStatus
**POST**`/rpt/status`

The resource server MUST determine a received RPT's status, including
both whether it is active and, if so, its associated authorization data,
before giving or refusing access to the client. An RPT is associated
with a set of authorization data that governs whether the client is
authorized for access. 

The token's nature and format are dictated by its profile. The profile
might allow it to be self-contained, such that the resource server is
able to determine its status locally, or might require or allow the
resource server to make a run-time introspection request of the
authorization server that issued the token.

The endpoint MAY allow other parameters to provide further context to
the query. For instance, an authorization service may need to know the
IP address of the client accessing the protected resource in order to
determine the appropriateness of the token being presented.

To prevent unauthorized token scanning attacks, the endpoint MUST also
require some form of authorization to access this endpoint, such as
client authentication as described in OAuth 2.0 [RFC6749] or a separate
OAuth 2.0 access token such as the bearer token described in OAuth 2.0
Bearer Token Usage [RFC6750]. The methods of managing and validating
these authentication credentials are out of scope of this specification.

**URL**<br/>
    http://gluu.org/rpt/status

**Parameters**<br/>
- form

|Parameter|Required|Description|Data Type|
|token|true|The string value of the token. For access tokens, this
is the "access_token" value returned from the token endpoint as defined
in OAuth 2.0 [RFC6749] section 5.1. For refresh tokens, this is the
"refresh_token" value returned from the token endpoint as defined in
OAuth 2.0 [RFC6749] section 5.1. Other token types are outside the scope
of this specification.|string|
|token_type_hint|false|A hint about the type of the token submitted for
introspection. The protected resource MAY pass this parameter in order
to help the authorization server to optimize the token lookup. If the
server is unable to locate the token using the given hint, it MUST
extend its search across all of its supported token types. An
authorization server MAY ignore this parameter, particularly if it is
able to detect the token type automatically. Values for this field are
defined in OAuth Token Revocation [RFC7009].|string|
- header

|Parameter|Required|Description|Data Type|
|Authorization|false||string|

**Errors**<br/>**
<table border="1">
    <tr>
        <th>Status Code|<th>Reason|
    </tr>
    <tr>
        <td>401|
        <td>Unauthorized|
    </tr>
</table>

