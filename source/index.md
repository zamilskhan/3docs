[TOC]
# Gluu Server Community Edition (CE) Docs
Gluu Server is a free open source identity provider (IDP) and access management suite of software primarily written in java. The Gluu Server combines best-of-breed open source identity and access management software with easy deployment and administration, and is engineered to support robust enterprise requirements for uptime and availability.

Primarily, the Gluu Server is used to achieve the following solutions:
- Outbound and Inbound Single Sign-On (SSO)
- Centralized authentication and authorization
- Customer, partner, and employee authentication
- Web & API access management
- Strong authentication
- Identity Federation

The code is open source, and available on [Github](github.com/GluuFederation/).

Community support can be enlisted on the [Gluu support site](http://support.gluu.org). If your organization needs to open private tickets with us, or needs an SLA or consultative support, Gluu offers a range of [VIP support](gluu.org/pricing) options.

# Introduction

The Gluu Server is an identity and access management suite comprised of
free open source software (FOSS) components. Some of the software was
written by Gluu (everything with an "ox" prefix, like "oxAuth"), and
some of the software we forked from existing open source projects like
the Shibboleth SAML identity provider, Forgerock community release of
OpenDJ, the Asimba SAML proxy, the CAS authentication server and many
more components that are part of the Linux distributions.

## License
Any software published by Gluu in the OX Project is under the [MIT License](http://opensource.org/licenses/MIT).
The third party components have separate licenses.

|	Component	|	License	|
|-----------------------|---------------|
|	Shibboleth  |	[Apache2](http://www.apache.org/licenses/LICENSE-2.0)|
|	OpenDJ		|	[CDDL-1.0](http://opensource.org/licenses/CDDL-1.0)|
|	Asimba		|	[GNU APGL 3.0](http://www.gnu.org/licenses/agpl-3.0.html)|
|	Jagger		|	[MIT License](http://opensource.org/licenses/MIT)|

!!! Note
    Gluu maintains a fork of OpenDJ 3 in [our Github](https://github.com/GluuFederation/gluu-opendj3).

# History
Gluu was founded in 2009 by Mike Schwartz. After selling his ISP to
Verio in 1998, Mike advised many large companies on identity and access
management, directory services, and application security. In late 2008,
Mike had a hunch that Web single sign-on was too complex, too
proprietary and too expensive for many organizations. He felt that a
utility approach to SSO using open source software could provide an
alternative to expensive enterprise solutions. The Gluu Server was
envisioned as an integrated identity platform, based on free open source
software, to make application security available to significantly
greater number of organizations.
## Versions 1 and 2
Versions 1 of the Gluu Server was based on Sun OpenSSO and OpenDS. Mike
presented the idea at an OpenSSO community group at the European
Identity Conference in Munich in May 2009. Version 1 worked a little,
but there was no easy way to manage it. Version 2 of the Gluu Server had
a better UI, but it was just a facade--the UI didn't actually do
anything to configure OpenSSO. Version 2 was launched after Mike
Schwartz met with members of the InCommon steering committee in San
Antonio in October 2009. At that meeting, Mike expressed concern that
OpenSSO might be end-of-life. Oracle had recently purchased Sun
Microsystems, and before ForgeRock was formed, it seemed possible that
Oracle would simply migrate OpenSSO customers to Oracle Access Manager.
Bob Morgan from the University of Washington convinced Mike that the
Shibboleth IdP was a reasonable alternative, and arguably had even more
features in SAML, including fine grain access release policies, and a
better approach for multi-party federation. As the InCommon federation's
efforts to evangelize SAML federation would support Gluu's message,
switching had marketing advantages, and would reduce the event risk
around OpenSSO. Shortly thereafter, a new project from scratch was
launched for Gluu Server v3 with the goal of using templates to simplify
the management of the Shibboleth IdP.
## Version 3
The first live demo of the Gluu Server was presented at an InCommon
event in Atlanta, GA in early November 2010. At that demo, Hakeem Fahm,
then IT director at the University of the District of Columbia, was
impressed and decided that the Gluu Server was exactly what his campus
needed to join InCommon. Delivering the first Gluu Server into
production took three months. The order was placed before Thanksgiving,
and it was finally delivered in early February 2011. Mike helped write
some of the python scripts (few, if any of which are still in use), and
establish the operating procedures for delivery of the Gluu Server. In
2011, a few more campuses also adopted the Gluu Server.
## Enter OAuth2
OAuth2 had been on Gluu's roadmap since inception, but work started due
to a consulting project Gluu had undertaken for
[IDCubed](https://idcubed.org). This is the reason the OX software is
MIT license--IDCubed insisted on it. The project was a flop--Gluu
couldn't deliver the graph based federated data solution quickly enough.
But as a result, Gluu was able to accelerate the launch of the OX OAuth2
based features, first with OpenID Connect in late 2011. Then in late
2012, Gluu followed by introducing support for the User Managed Access
Protocol, which Mike felt provided an Oauth2 based solution for access
management that was superior to Computer Associates' proprietary
Siteminder access management framework.

# Design Goals

At OSCON 2014, Gluu introduced easier to install packages for the Gluu
Server, and support for the Ubuntu Juju orchestration framework. The
goal of these distributions was to promote adoption of OX in the major
distributions of Linux.
## Free Open Source Identity Suite

One of the things that has made access management difficult for
organizations is that there is no one tool you can deploy to solve even
average requirements. The Gluu Server provides a recipe to deploy a
combination of the best free open source tools, working together.

## Support most promising open standards

The goal of the Gluu Server is to support the minimum number of
standards necessary to authenticate people, and to authorize them to
access the resources they need to do business for the domain. The Gluu
Server should be practical about supporting older protocols, but always
strive to be the first implementer of the most promising new protocols.

## Leverage existing business processes

Where possible, the Gluu Server goes to work with a minimal amount 
of changes to existing business processes. Don't "rip and replace",
but for new applications, use new protocols wherever possible to 
avoid the creation of future upgrade work.

## Free license

The components of the Gluu Server should be free to use in production.
This license strategy will produce the best software at the lowest 
total cost of ownership for the organization.

## Write as a last resort 

Use the best software that exists. If something the Gluu Server needs
doesn't exist, it may become an OX project. If some group comes along and
writes software better than an existing OX component, use it!

## Not just comprehensive, but easy to use

The Gluu Server should make it easy for domain system administrators
to control access to Web and network resources. Usability is more
important than features.

## Horizontal scalability

System administrators should be able to add more servers to make the 
Gluu Server scale as much as needed.

## Extreme flexibility

As Kent Beck says, "Embrace Change". The key to the Gluu Server's success
has been its ability to handle all sorts of crazy requirements--quickly.
Sometimes raw speed is needed, but equally important is the ability for
the access management framework to be really smart.

# Architecture

There are several key components that make Gluu Server a reality and 
while choosing, the open-source softwares were given preference. Most 
of the components of the Gluu Server are written in Java, and
deployed as a web application in a J2EE servlet container.
Following is a list of the technical components that comprise the Gluu Server.

## J2EE Servlet container
Most of the components of the Gluu Server are written in Java, and
deployed as a web application in a J2EE servlet container. Java was
chosen because there is a wide array of high quality libraries,
convenient container services, and tools for managing high performance
applications at run-time. In order to run the Gluu Server, you don't
have to be a Java expert. But it does help to have some knowledge of how
Java applications are deployed and managed in tomcat, or a similar
servlet container.

## Apache HTTP front end web server
Although there are pros and cons, we think its best to use the Apache
HTTP server as the Internet facing Web server. There are a number of
Apache HTTP denial of service plugins. It is easier to handle re-directs
for things like discovery. And its convenient to have a non-J2EE way to
publish static content. ![Gluu Web
Communication](https://raw.githubusercontent.com/GluuFederation/docs/master/sources/img/design/gluu_http-tomcat_overview.png)

## LDAP for Persistence
LDAP was chosen for persistence for a number of reasons: (1) we understood
how to scale an LDAP directory service horizontally to accommodate a data set
of any size; (2) LDAP servers offer cost-effective and reliable replication
services; (3) as LDAP is a standard, the Gluu server would not be locked into
the persistence solution of one vendor; (4) LDAP had built-in support for SAML
and OAuth2 components. In the future the OX project may develop additional
persistence backends. But this is not likely for the near-term.

## Web container plugins
Today, Web access management tools like CA Siteminder predominantly use
the web agent approach. Many large organizations have hundreds or
thousands of "web agents" running on Apache and IIS.

Web agents are a great approach. Programmers don't have to know much
about the protocols. System administrators can configure the web server
to use the central authorization server so we don't have to rely on the
programmers to get security right. The programmers can obtain the user
session information in the environment variables. In OAuth2 information
is serialized using JSON. For example, the entire id_token JWT is sent
in one environment variable.

If developers want even more control, they can use the Gluu Server's
API's directly: SAML, OpenID Connect, or UMA.

