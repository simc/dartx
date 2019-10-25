import 'dart:io';

import 'util.dart';

/// Extensions for accessing and setting standard Headers.
extension StandardHeaders on HttpRequest {
  /// Gets the value for the Accept-Charset header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Charset
  String get acceptCharsetHeader =>
      getHeader(this, HttpHeaders.acceptCharsetHeader);

  /// Sets the value for the Accept-Charset header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Charset
  set acceptCharsetHeader(String value) =>
      setHeader(this, HttpHeaders.acceptCharsetHeader, value);

  /// Gets the value for the Accept-Encoding header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Encoding
  String get acceptEncodingHeader =>
      getHeader(this, HttpHeaders.acceptEncodingHeader);

  /// Sets the value for the Accept-Encoding header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Encoding
  set acceptEncodingHeader(String value) =>
      setHeader(this, HttpHeaders.acceptEncodingHeader, value);

  /// Gets the value for the Accept header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept
  String get acceptHeader => getHeader(this, HttpHeaders.acceptHeader);

  /// Attempts to set the value set for the Accept header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept
  set acceptHeader(String value) =>
      setHeader(this, HttpHeaders.acceptHeader, value);

  /// Gets the value for the Accept-Language header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Language
  String get acceptLanguageHeader =>
      getHeader(this, HttpHeaders.acceptLanguageHeader);

  /// Sets the value for the Accept-Language header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Language
  set acceptLanguageHeader(String value) =>
      setHeader(this, HttpHeaders.acceptLanguageHeader, value);

  /// Gets the value for Accept-Ranges header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Ranges
  String get acceptRangesHeader =>
      getHeader(this, HttpHeaders.acceptRangesHeader);

  /// Attempts to set the value for Accept-Ranges header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Ranges
  set acceptRangesHeader(String value) =>
      setHeader(this, HttpHeaders.acceptRangesHeader, value);

  /// Gets the value for the Age header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Age
  String get ageHeader => getHeader(this, HttpHeaders.ageHeader);

  /// Sets the value for the Age header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Age
  set ageHeader(String value) => setHeader(this, HttpHeaders.ageHeader, value);

  /// Gets the value for the Allow header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Allow
  String get allowHeader => getHeader(this, HttpHeaders.allowHeader);

  /// Sets the value for the Allow header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Allow
  set allowHeader(String value) =>
      setHeader(this, HttpHeaders.allowHeader, value);

  /// Gets the value for the Authorization header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Authorization
  String get authorizationHeader =>
      getHeader(this, HttpHeaders.authorizationHeader);

  /// Sets the value for the Authorization header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Authorization
  set authorizationHeader(String value) =>
      setHeader(this, HttpHeaders.authorizationHeader, value);

  /// Gets the value for the Cache-Control Header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control
  String get cacheControlHeader =>
      getHeader(this, HttpHeaders.cacheControlHeader);

  /// Sets the value for the Cache-Control Header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control
  set cacheControlHeader(String value) =>
      setHeader(this, HttpHeaders.cacheControlHeader, value);

  /// Gets the value for the Connection header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Connection
  String get connectionHeader => getHeader(this, HttpHeaders.connectionHeader);

  /// Sets the value for the Connection header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Connection
  set connectionHeader(String value) =>
      setHeader(this, HttpHeaders.connectionHeader, value);

  /// Gets the value for the Content-Encoding header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Encoding
  String get contentEncodingHeader =>
      getHeader(this, HttpHeaders.contentEncodingHeader);

  /// Sets the value for the Content-Encoding header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Encoding
  set contentEncodingHeader(String value) =>
      setHeader(this, HttpHeaders.contentEncodingHeader, value);

  /// Gets the value for the Content-Language header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Language
  String get contentLanguageHeader =>
      getHeader(this, HttpHeaders.contentLanguageHeader);

  /// Sets the value for the Content-Language header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Language
  set contentLanguageHeader(String value) =>
      setHeader(this, HttpHeaders.contentLanguageHeader, value);

  /// Gets the value for the Content-Length Header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Length
  String get contentLengthHeader =>
      getHeader(this, HttpHeaders.contentLengthHeader);

  /// Sets the value for the Content-Length Header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Length
  set contentLengthHeader(String value) =>
      setHeader(this, HttpHeaders.contentLengthHeader, value);

  /// Gets the value for the Content-Location header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Location
  String get contentLocationHeader =>
      getHeader(this, HttpHeaders.contentLocationHeader);

  /// Sets the value for the Content-Location header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Location
  set contentLocationHeader(String value) =>
      setHeader(this, HttpHeaders.contentLocationHeader, value);

  /// Gets the value for the Content-MD5 header.
  String get contentMD5Header => getHeader(this, HttpHeaders.contentMD5Header);

  /// Sets the value for the Content-MD5 header.
  set contentMD5Header(String value) =>
      setHeader(this, HttpHeaders.contentMD5Header, value);

  /// Gets the value for the Content-Range header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Range
  String get contentRangeHeader =>
      getHeader(this, HttpHeaders.contentRangeHeader);

  /// Sets the value for the Content-Range header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Range
  set contentRangeHeader(String value) =>
      setHeader(this, HttpHeaders.contentRangeHeader, value);

  /// Gets the value for the Content-Type header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type
  String get contentTypeHeader =>
      getHeader(this, HttpHeaders.contentTypeHeader);

  /// Sets the value for the Content-Type header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type
  set contentTypeHeader(String value) =>
      setHeader(this, HttpHeaders.contentTypeHeader, value);

  /// Gets the value for the  Cookie header
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cookie
  String get cookieHeader => getHeader(this, HttpHeaders.cookieHeader);

  /// Attempts to set value for the  Cookie header
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cookie
  set cookieHeader(String value) =>
      setHeader(this, HttpHeaders.cookieHeader, value);

  /// Gets the value for the Date header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Date
  String get dateHeader => getHeader(this, HttpHeaders.dateHeader);

  /// Attempts to set the for the Date header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Date
  set dateHeader(String value) =>
      setHeader(this, HttpHeaders.dateHeader, value);

  /// Gets the value for the ETag header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag
  String get etagHeader => getHeader(this, HttpHeaders.etagHeader);

  /// Sets the value for the ETag header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag
  set etagHeader(String value) =>
      setHeader(this, HttpHeaders.etagHeader, value);

  /// Gets the value for the Expect header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Expect
  String get expectHeader => getHeader(this, HttpHeaders.expectHeader);

  /// Sets the value for the Expect header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Expect
  set expectHeader(String value) =>
      setHeader(this, HttpHeaders.expectHeader, value);

  /// Gets the value for the Expires header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Expires
  String get expiresHeader => getHeader(this, HttpHeaders.expiresHeader);

  /// Sets the value for the Expires header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Expires
  set expiresHeader(String value) =>
      setHeader(this, HttpHeaders.expiresHeader, value);

  /// Gets the value for the From header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/From
  String get fromHeader => getHeader(this, HttpHeaders.fromHeader);

  /// Sets the value for the From header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/From
  set fromHeader(String value) =>
      setHeader(this, HttpHeaders.fromHeader, value);

  /// Gets the value for the Host header field.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Host
  String get hostHeader => getHeader(this, HttpHeaders.hostHeader);

  /// Sets the value for the Host header field.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Host
  set hostHeader(String value) =>
      setHeader(this, HttpHeaders.hostHeader, value);

  /// Gets the value for the If-Match header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Match
  String get ifMatchHeader => getHeader(this, HttpHeaders.ifMatchHeader);

  /// Sets the value for the If-Match header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Match
  set ifMatchHeader(String value) =>
      setHeader(this, HttpHeaders.ifMatchHeader, value);

  /// Gets the value for the If-Modified-Since header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Modified-Since
  String get ifModifiedSinceHeader =>
      getHeader(this, HttpHeaders.ifModifiedSinceHeader);

  /// Sets the value for the If-Modified-Since header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Modified-Since
  set ifModifiedSinceHeader(String value) =>
      setHeader(this, HttpHeaders.ifModifiedSinceHeader, value);

  /// Gets the value for the If-None-Match header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-None-Match
  String get ifNoneMatchHeader =>
      getHeader(this, HttpHeaders.ifNoneMatchHeader);

  /// Sets the value for the If-None-Match header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-None-Match
  set ifNoneMatchHeader(String value) =>
      setHeader(this, HttpHeaders.ifNoneMatchHeader, value);

  /// Gets the value for the If-Range header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Range
  String get ifRangeHeader => getHeader(this, HttpHeaders.ifRangeHeader);

  /// Sets the value for the If-Range header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Range
  set ifRangeHeader(String value) =>
      setHeader(this, HttpHeaders.ifRangeHeader, value);

  /// Gets the value for the If-Unmodified-Since header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Unmodified-Since
  String get ifUnmodifiedSinceHeader =>
      getHeader(this, HttpHeaders.ifUnmodifiedSinceHeader);

  /// Sets the value for the If-Unmodified-Since header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Unmodified-Since
  set ifUnmodifiedSinceHeader(String value) =>
      setHeader(this, HttpHeaders.ifUnmodifiedSinceHeader, value);

  /// Gets the value for the Last-Modified header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Last-Modified
  String get lastModifiedHeader =>
      getHeader(this, HttpHeaders.lastModifiedHeader);

  /// Sets the value for the Last-Modified header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Last-Modified
  set lastModifiedHeader(String value) =>
      setHeader(this, HttpHeaders.lastModifiedHeader, value);

  /// Gets the value for the Location header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Location
  String get locationHeader => getHeader(this, HttpHeaders.locationHeader);

  /// Sets the value for the Location header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Location
  set locationHeader(String value) =>
      setHeader(this, HttpHeaders.locationHeader, value);

  /// Gets the value for the Max-Forwards header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Max-Forwards
  String get maxForwardsHeader =>
      getHeader(this, HttpHeaders.maxForwardsHeader);

  /// Sets the value for the Max-Forwards header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Max-Forwards
  set maxForwardsHeader(String value) =>
      setHeader(this, HttpHeaders.maxForwardsHeader, value);

  /// Gets the value of the Pragma header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Pragma
  String get pragmaHeader => getHeader(this, HttpHeaders.pragmaHeader);

  /// Gets the value of the Pragma header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Pragma
  set pragmaHeader(String value) =>
      setHeader(this, HttpHeaders.pragmaHeader, value);

  /// Gets the value for the Proxy-Authenticate header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Proxy-Authenticate
  String get proxyAuthenticateHeader =>
      getHeader(this, HttpHeaders.proxyAuthenticateHeader);

  /// Sets the value for the Proxy-Authenticate header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Proxy-Authenticate
  set proxyAuthenticateHeader(String value) =>
      setHeader(this, HttpHeaders.proxyAuthenticateHeader, value);

  /// Gets the value for the Proxy-Authorization header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Proxy-Authorization
  String get proxyAuthorizationHeader =>
      getHeader(this, HttpHeaders.proxyAuthorizationHeader);

  /// Sets the value for the Proxy-Authorization header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Proxy-Authorization
  set proxyAuthorizationHeader(String value) =>
      setHeader(this, HttpHeaders.proxyAuthorizationHeader, value);

  /// Gets the value for the Range header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Range
  String get rangeHeader => getHeader(this, HttpHeaders.rangeHeader);

  /// Sets the value for the Range header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Range
  set rangeHeader(String value) =>
      setHeader(this, HttpHeaders.rangeHeader, value);

  /// Gets the value for the Referer header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referer
  String get refererHeader => getHeader(this, HttpHeaders.refererHeader);

  /// Sets the value for the Referer header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referer
  set refererHeader(String value) =>
      setHeader(this, HttpHeaders.refererHeader, value);

  /// Gets the value for the Retry-After header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Retry-After
  String get retryAfterHeader => getHeader(this, HttpHeaders.retryAfterHeader);

  /// Sets the value for the Retry-After header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Retry-After
  set retryAfterHeader(String value) =>
      setHeader(this, HttpHeaders.retryAfterHeader, value);

  /// Gets the value for the Server header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Server
  String get serverHeader => getHeader(this, HttpHeaders.serverHeader);

  /// Sets the value for the Server header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Server
  set serverHeader(String value) =>
      setHeader(this, HttpHeaders.serverHeader, value);

  /// Gets the value for the Set-Cookie header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie
  String get setCookieHeader => getHeader(this, HttpHeaders.setCookieHeader);

  /// Sets the value for the Set-Cookie-Header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie
  set setCookieHeader(String value) =>
      setHeader(this, HttpHeaders.setCookieHeader, value);

  /// Gets the value for the TE header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/TE
  String get teHeader => getHeader(this, HttpHeaders.teHeader);

  /// Sets the value for the TE header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/TE
  set teHeader(String value) => setHeader(this, HttpHeaders.teHeader, value);

  /// Gets the value for the Trailer header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Trailer
  String get trailerHeader => getHeader(this, HttpHeaders.trailerHeader);

  /// Sets the value for the Trailer header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Trailer
  set trailerHeader(String value) =>
      setHeader(this, HttpHeaders.trailerHeader, value);

  /// Gets the value for the Transfer-Encoding header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Transfer-Encoding
  String get transferEncodingHeader =>
      getHeader(this, HttpHeaders.transferEncodingHeader);

  /// Sets the value for the Transfer-Encoding value.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Transfer-Encoding
  set transferEncodingHeader(String value) =>
      setHeader(this, HttpHeaders.transferEncodingHeader, value);

  /// Gets the value for the Upgrade header.
  String get upgradeHeader => getHeader(this, HttpHeaders.upgradeHeader);

  /// Sets the value for the Upgrade header.
  set upgradeHeader(String value) =>
      setHeader(this, HttpHeaders.upgradeHeader, value);

  /// Gets the value for the User-Agent header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/User-Agent
  String get userAgentHeader => getHeader(this, HttpHeaders.userAgentHeader);

  /// Sets the value for the User-Agent header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/User-Agent
  set userAgentHeader(String value) =>
      setHeader(this, HttpHeaders.userAgentHeader, value);

  /// Gets the value for the Vary header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Vary
  String get varyHeader => getHeader(this, HttpHeaders.varyHeader);

  /// Sets the value for the Vary header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Vary
  set varyHeader(String value) =>
      setHeader(this, HttpHeaders.varyHeader, value);

  /// Gets the value for the Via header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Via
  String get viaHeader => getHeader(this, HttpHeaders.viaHeader);

  /// Sets the value for the Via header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Via
  set viaHeader(String value) => setHeader(this, HttpHeaders.viaHeader, value);

  /// Gets the value for the Warning header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Warning
  String get warningHeader => getHeader(this, HttpHeaders.warningHeader);

  /// Sets the value for the Warning header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Warning
  set warningHeader(String value) =>
      setHeader(this, HttpHeaders.warningHeader, value);

  /// Gets the value for the WWW-Authenticate header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/WWW-Authenticate
  String get wwwAuthenticateHeader =>
      getHeader(this, HttpHeaders.wwwAuthenticateHeader);

  /// Sets the value for the WWW-Authenticate header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/WWW-Authenticate
  set wwwAuthenticateHeader(String value) =>
      setHeader(this, HttpHeaders.wwwAuthenticateHeader, value);
}
