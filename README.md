# AdWords API Perl Client Library

Google's [AdWords API](https://developers.google.com/adwords/api/) service lets developers design computer programs that
interact directly with the [AdWords
platform](https://adwords.google.com/select/Login). With these applications,
advertisers and third parties can more efficiently -- and creatively -- manage
their large or complex [AdWords](https://adwords.google.com/select/Login) accounts and campaigns.

[AdWords API](https://developers.google.com/adwords/api/) Perl Client Library makes it easier to write Perl clients to
programmatically access [AdWords](https://adwords.google.com/select/Login) accounts.

## Features
 - Fully featured object oriented client library (all classes come generated from
 - the WSDLs)
 - Perl 5.14.0+ and based on SOAP::WSDL module
 - Outgoing and incoming SOAP message are monitored and logged on demand
 - Support for API calls to production system or sandbox
 - OAuth2 Support
 - Loading of credentials from local file or source code
 - Online
   [documentation](https://metacpan.org/release/Google-Ads-AdWords-Client)

## Getting started

- Download the newest version from [releases](https://github.com/googleads/googleads-perl-lib/releases) or from [CPAN Google::Ads::AdWords::Client](http://search.cpan.org/~sundquist/).

- Install dependencies.

  ```
  $ perl Build.PL
  $ perl Build installdeps
  ```

- Copy the sample **adwords.properties** for your product to your home directory
and fill out the required properties.

  * [AdWords adwords.properties](https://github.com/googleads/googleads-perl-lib/blob/master/adwords.properties)

- Setup your OAuth2 credentials.

  The AdWords API uses
[OAuth2](http://oauth.net/2/) as the authentication mechanism. Follow the appropriate guide below based on your use case.

  **If you're accessing an API using your own credentials...**

  * [Using AdWords](https://github.com/googleads/googleads-perl-lib/wiki/API-access-using-own-credentials-(installed-application-flow))

  **If you're accessing an API on behalf of clients...**

  * [Developing a web application](https://github.com/googleads/googleads-perl-lib/wiki/API-Access-on-behalf-of-your-clients-(web-flow))

## How do I use the library?
You can refer to the [README](https://github.com/googleads/googleads-perl-lib/blob/master/README) file to get more details on how to start using the library. We have code examples for most of the common use cases in the [repository](https://github.com/googleads/googleads-perl-lib/tree/master/examples). These code examples are also available as part of the [release distributions](https://github.com/googleads/googleads-perl-lib/releases). You can also refer to the [wiki articles](https://github.com/googleads/googleads-perl-lib/wiki/_pages) for additional documentation.

### How do I enable logging?

The client library uses a custom class for all logging. Check out our [logging guide on GitHub](https://github.com/googleads/googleads-perl-lib/wiki/Logging) for more details.

## How do I Contribute?
See the [guidelines for contributing](https://github.com/googleads/googleads-perl-lib/blob/master/CONTRIBUTING.md) for details.

## Where do I report issues?
Please report issues at <https://github.com/googleads/googleads-perl-lib/issues>

## Support forum
If you have questions about the client library or AdWords API, you can ask them at the [AdWords API Forum](https://groups.google.com/group/adwords-api?pli=1).

## Authors
  - Jeff Posnick
  - David Torres

## Maintainers
  - Josh Radcliff
  - Nadine Sundquist
