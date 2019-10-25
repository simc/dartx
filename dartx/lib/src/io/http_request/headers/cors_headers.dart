import 'dart:io';

import 'util.dart';

const _accessControlAllowCredentials = 'Access-Control-Allow-Credentials';
const _accessControlAllowHeaders = 'Access-Control-Allow-Headers';
const _accessControlAllowMethods = 'Access-Control-Allow-Methods';
const _accessControlAllowOrigin = 'Access-Control-Allow-Origin';
const _accessControlExposeHeaders = 'Access-Control-Expose-Headers';
const _accessControlMaxAge = 'Access-Control-Max-Age';
const _accessControlRequestHeaders = 'Access-Control-Request-Headers';
const _accessControlRequestMethod = 'Access-Control-Request-Method';
const _origin = 'Origin';
const _serviceWorkerAllowed = 'Service-Worker-Allowed';
const _timingAllowedOrigin = 'Timing-Allow-Origin';
const _xPermittedCrossDomainPolicies = 'X-Permitted-Cross-Domain-Policies';

/// Extension methods for accessing and setting Cors headers.
///
/// https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS
extension CorsHeaders on HttpRequest {
  /// Gets the value for the Access-Control-Allow-Origin header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Origin
  String get accessControlAllowOriginHeader =>
      getHeader(this, _accessControlAllowOrigin);

  /// Sets the value for the Access-Control-Allow-Origin header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Origin
  set accessControlAllowOriginHeader(String value) =>
      setHeader(this, _accessControlAllowOrigin, value);

  /// Gets the value for the Access-Control-Allow-Credentials header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Credentials
  String get accessControlAllowCredentialsHeader =>
      getHeader(this, _accessControlAllowCredentials);

  /// Sets the value for the Access-Control-Allow-Credentials header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Credentials
  set accessControlAllowCredentialsHeader(String value) =>
      setHeader(this, _accessControlAllowCredentials, value);

  /// Gets the value for the Access-Control-Allow-Headers header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Headers
  String get accessControlAllowHeadersHeader =>
      getHeader(this, _accessControlAllowHeaders);

  /// Sets the value for the Access-Control-Allow-Headers header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Headers
  set accessControlAllowHeadersHeader(String value) =>
      setHeader(this, _accessControlAllowHeaders, value);

  /// Gets the value for the Access-Control-Allow-Methods header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Methods
  String get accessControlAllowMethodsHeader =>
      getHeader(this, _accessControlAllowMethods);

  /// Sets the value for the Access-Control-Allow-Methods header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Methods
  set accessControlAllowMethodsHeader(String value) =>
      setHeader(this, _accessControlAllowMethods, value);

  /// Gets the value for the Access-Control-Expose-Headers header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Expose-Headers
  String get accessControlExposeHeadersHeader =>
      getHeader(this, _accessControlExposeHeaders);

  /// Sets the value for the Access-Control-Expose-Headers header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Expose-Headers
  set accessControlExposeHeadersHeader(String value) =>
      setHeader(this, _accessControlExposeHeaders, value);

  /// Gets the value for the Access-Control-Max-Age header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Max-Age
  String get accessControlMaxAgeHeader => getHeader(this, _accessControlMaxAge);

  /// sets the value for the Access-Control-Max-Age header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Max-Age
  set accessControlMaxAgeHeader(String value) =>
      setHeader(this, _accessControlMaxAge, value);

  /// Gets the value for the Access-Control-Request-Headers header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Request-Headers
  String get accessControlRequestHeadersHeader =>
      getHeader(this, _accessControlRequestHeaders);

  /// Sets the value for the Access-Control-Request-Headers header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Request-Headers
  set accessControlRequestHeadersHeader(String value) =>
      setHeader(this, _accessControlRequestHeaders, value);

  /// Gets the value for the Access-Control-Request-Method header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Request-Method
  String get accessControlRequestMethodHeader =>
      getHeader(this, _accessControlRequestMethod);

  /// Sets the value for the Access-Control-Request-Method header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Request-Method
  set accessControlRequestMethodHeader(String value) =>
      setHeader(this, _accessControlRequestMethod, value);

  /// Gets the value for the Origin header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Origin
  String get originHeader => getHeader(this, _origin);

  /// Sets the value for the Origin header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Origin
  set originHeader(String value) => setHeader(this, _origin, value);

  /// Gets the value for the Service-Worker-Allowed header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Service-Worker-Allowed
  String get serviceWorkerAllowedHeader =>
      getHeader(this, _serviceWorkerAllowed);

  /// Sets the value for the Service-Worker-Allowed header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Service-Worker-Allowed
  set serviceWorkerAllowedHeader(String value) =>
      setHeader(this, _serviceWorkerAllowed, value);

  /// Gets the value for the Timing-Allow-Origin header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Timing-Allow-Origin
  String get timingAllowedOriginHeader => getHeader(this, _timingAllowedOrigin);

  /// Sets the value for the Timing-Allow-Origin header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Timing-Allow-Origin
  set timingAllowedOriginHeader(String value) =>
      setHeader(this, _timingAllowedOrigin, value);

  /// Gets the value for the X-Permitted-Cross-Domain-Policies header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Permitted-Cross-Domain-Policies
  String get xPermittedCrossDomainPolicies =>
      getHeader(this, _xPermittedCrossDomainPolicies);

  /// Sets the value for the X-Permitted-Cross-Domain-Policies header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Permitted-Cross-Domain-Policies
  set xPermittedCrossDomainPolicies(String value) =>
      setHeader(this, _xPermittedCrossDomainPolicies, value);
}
