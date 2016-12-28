# Gluu Server Community Edition (CE) Docs
Gluu Server is a free open source identity provider (IDP) and access management suite of software primarily written in java. The Gluu Server is a central authentication and authorization server that should be leveraged by applications to perform person identification and lowest common denominator authorization decisions. The Gluu Server is engineered to support robust enterprise requirements for uptime and availability.

Organizations use the Gluu Server to achieve:
- Outbound and Inbound Single Sign-On (SSO)
- Centralized authentication and authorization
- Customer, partner, and employee authentication
- Web & API access management
- Strong authentication
- Identity Federation

The code is open source, and available on [Github](github.com/GluuFederation/).

# Client Software
In order for an application to leverage the Gluu Server for authentication and authorization decisions it needs to support either the SAML or OpenID Connect federation standard. If the target application does not already support one of these standards, we highly recommend securing the application with [oxd](http://oxd.gluu.org), our OpenID Connect middleware software. oxd makes its easy to properly secure the sign-in flow for applications with OpenID Connect. 

# Support

Free community support can be enlisted on the [Gluu support site](http://support.gluu.org). VIP support can be purchased for private support, SLA's, and consultative support. See VIP support pricing on [our website](gluu.org/pricing) options.

# License
Any software published by Gluu in the OX Project is under the [MIT License](http://opensource.org/licenses/MIT). This includes oxAuth, the OAuth 2.0 and OpenID Connect Provider, and UMA Authorization Server, and oxTrust, the web based server administration GUI.

During installation you will also have the option to install third party software components which have the following licenses:

|	Component	|	License	|
|-----------------------|---------------|
|	Shibboleth  |	[Apache2](http://www.apache.org/licenses/LICENSE-2.0)|
|	OpenLDAP		|[Public License](http://www.openldap.org/software/release/license.html)|
|	Asimba		|	[GNU APGL 3.0](http://www.gnu.org/licenses/agpl-3.0.html)|


