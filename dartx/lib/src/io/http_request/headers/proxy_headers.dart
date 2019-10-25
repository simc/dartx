import 'dart:io';

import 'util.dart';

const _forwarded = 'Forwarded';
const _xClientIp = 'X-Client-IP';
const _xForwardedFor = 'X-Forwarded-For';
const _xForwardedHost = 'X-Forwarded-Host';
const _xForwardedProto = 'X-Forwarded-Proto';
const _xProxyId = 'X-PROXY-ID';
const _xRoxyConnection = 'Xroxy-Connection';

/// Extension for accessing and setting Proxy related headers.
extension ProxyHeaders on HttpRequest {
  /// Gets the value for the Forwarded header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Forwarded
  String get forwardedHeader => getHeader(this, _forwarded);

  /// Sets the value for the Forwarded header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Forwarded
  set forwardedHeader(String value) => setHeader(this, _forwarded, value);

  /// Gets the value for the X-Forwarded-For header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-For
  String get xForwardedForHeader => getHeader(this, _xForwardedFor);

  /// Sets the value for the X-Forwarded-For header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-For
  set xForwardedForHeader(String value) =>
      setHeader(this, _xForwardedFor, value);

  /// Gets the value for the X-Forwarded-Host header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-Host
  String get xForwardedHostHeader => getHeader(this, _xForwardedHost);

  /// Sets the value for the X-Forwarded-Host header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-Host
  set xForwardedHostHeader(String value) =>
      setHeader(this, _xForwardedHost, value);

  /// Gets the value for the X-Forwarded-Proto header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-Proto
  String get xForwardedProtoHeader => getHeader(this, _xForwardedProto);

  /// Sets the value for the X-Forwarded-Proto header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-Proto
  set xForwardedProtoHeader(String value) =>
      setHeader(this, _xForwardedProto, value);

  /// Gets the value for the X-Client-IP header.
  ///
  /// Non standard header used by different proxy vendors.
  /// See https://stackoverflow.com/questions/7445592/what-is-the-difference-between-http-client-ip-and-http-x-forwarded-for for more info.
  String get xClientIpHeader => getHeader(this, _xClientIp);

  /// Sets the value for the X-Client-IP header.
  ///
  /// Non standard header used by different proxy vendors.
  /// See https://stackoverflow.com/questions/7445592/what-is-the-difference-between-http-client-ip-and-http-x-forwarded-for for more info.
  set xClientIpHeader(String value) => setHeader(this, _xClientIp, value);

  /// Gets the value for the X-PROXY-ID header.
  ///
  /// Non standard header used by some proxies to reveal that they are proxy servers.
  /// See https://ntrepidcorp.com/cyber-security/theproxisright-how-to-measure-proxy-anonymity/ and https://mobiforge.com/design-development/useful-x-headers for more info.
  String get xProxyIdHeader => getHeader(this, _xProxyId);

  /// Sets the value for the X-PROXY-ID header.
  ///
  /// Non standard header used by some proxies to reveal that they are proxy servers.
  /// See https://ntrepidcorp.com/cyber-security/theproxisright-how-to-measure-proxy-anonymity/ and https://mobiforge.com/design-development/useful-x-headers for more info.
  set xProxyIdHeader(String value) => setHeader(this, _xProxyId, value);

  /// Gets the value for the Xroxy-Connection header.
  ///
  /// Non standard header used by various (sometimes malicious?) proxies.
  /// ee https://www.aqtronix.com/headers/?Action=ShowDetails&Name=Xroxy%2DConnection and https://stackoverflow.com/questions/1628593/http-headers-from-some-clients-have-characters-randomly-replaced for more info.
  String get xRoxyConnection => getHeader(this, _xRoxyConnection);

  /// Sets the value for the Xroxy-Connection header.
  ///
  /// Non standard header used by various (sometimes malicious?) proxies.
  /// ee https://www.aqtronix.com/headers/?Action=ShowDetails&Name=Xroxy%2DConnection and https://stackoverflow.com/questions/1628593/http-headers-from-some-clients-have-characters-randomly-replaced for more info.
  set xRoxyConnection(String value) => setHeader(this, _xRoxyConnection, value);
}
