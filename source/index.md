# Gluu Server Community Edition (CE) Docs
The Gluu Server is a free open source identity provider (IDP) and access management suite of software primarily written in Java. The Gluu Server is a central authentication and authorization server that should be leveraged by applications to perform person identification and lowest common denominator authorization decisions. The Gluu Server is engineered to support robust enterprise requirements for uptime and availability.

Organizations use the Gluu Server to achieve:
- Outbound and Inbound Single Sign-On (SSO)
- Centralized authentication and authorization
- Customer, partner, and employee authentication
- Web & API access management
- Strong authentication
- Identity Federation

The Gluu Server supports the following open standards for authentication, authorization, and identity management:
- SAML      
- OpenID Connect     
- UMA    
- CAS 
- SCIM     
- FIDO    
- LDAP

Learn more about the differences between OAuth, SAML and OpenID Connect in [this blog](https://www.gluu.org/blog/oauth-vs-saml-vs-openid-connect/).

Learn more about each supported standard on [our website](https://www.gluu.org/resources/documents/#standards). 

The Gluu Server code is open source, and can be found on [Github](github.com/GluuFederation/).

# Client Software
In order for an application to leverage the Gluu Server (or any identity provider) for authentication and authorization, the application needs to support federation. The Gluu Server provides identity provider endpoints for the SAML and OpenID Connect federation standards. Therefore, any application that wants to send users to the Gluu Server for login should support either SAML or OpenID Connect. 

If the target application does not already support one of these standards, we highly recommend securing the application with [oxd](http://oxd.gluu.org), our OpenID Connect middleware software. oxd makes its easy to properly secure the sign-in flow for applications with OpenID Connect, and is supported and maintained by Gluu. 

Learn more about oxd in [this blog](https://www.gluu.org/blog/secure-web-apps-openid-connect-oxd/). 

Watch the [oxd demo](http://gluu.co/oxd-demo). 

The Gluu Server also supports a few third party OpenID Connect client library projects. See [the current list](https://www.gluu.org/blog/limiting-openid-connect-community-client-support/). 

# Support

Gluu hosts a public knowledge base and support platform on the [Gluu support site](http://support.gluu.org). Anyone can browse tickets and register to open public tickets. 

VIP support can be purchased if you or your organization wants private support, SLA's on support responses (like production outages), and consultative support from Gluu. See VIP support pricing on [our website](gluu.org/pricing) options.

# License
Any software published by Gluu in the OX Project is under the [MIT License](http://opensource.org/licenses/MIT). This includes oxAuth, the OAuth 2.0 and OpenID Connect Provider, and UMA Authorization Server, and oxTrust, the web based server administration GUI.

During installation you will also have the option to install third party software components which have the following licenses:

|	Component	|	License	|
|-----------------------|---------------|
|	Shibboleth  |	[Apache2](http://www.apache.org/licenses/LICENSE-2.0)|
|	OpenLDAP		|[Public License](http://www.openldap.org/software/release/license.html)|
|	Asimba		|	[GNU APGL 3.0](http://www.gnu.org/licenses/agpl-3.0.html)|


