import 'dart:io';

import 'util.dart';

const _acceptPushPolicy = 'Accept-Push-Policy';
const _acceptSignature = 'Accept-Signature';
const _altSvc = 'Alt-Svc';
const _largeAllocation = 'Large-Allocation';
const _link = 'Link';
const _pushPolicy = 'Push-Policy';
const _retryAfter = 'Retry-After';
const _serverTiming = 'Server-Timing';
const _signature = 'Signature';
const _signedHeaders = 'Signed-Headers';
const _sourceMap = 'SourceMap';
const _upgrade = 'Upgrade';
const _xDnsPrefetchControl = 'X-DNS-Prefetch-Control';
const _xPingBack = 'X-Pingback';
const _xRequestedWith = 'X-Requested-With';
const _xRobotsTag = 'X-Robots-Tag';
const _xUACompatible = 'X-UA-Compatible';

/// Extension method for accessing and setting Non-Categorized headers.
extension OtherHeaders on HttpRequest {
  /// Gets the value for the Accept-Push-Policy header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Push-Policy
  String get acceptPushPolicyHeader => getHeader(this, _acceptPushPolicy);

  /// Sets the value for the Accept-Push-Policy header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Push-Policy
  set acceptPushPolicyHeader(String value) =>
      setHeader(this, _acceptPushPolicy, value);

  /// Gets the value for the Accept-Signature header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Signature
  String get acceptSignatureHeader => getHeader(this, _acceptSignature);

  /// Sets the value for the Accept-Signature header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Signature
  set acceptSignatureHeader(String value) =>
      setHeader(this, _acceptSignature, value);

  /// Gets the value for the Alt-Svc header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Alt-Svc
  String get altSvcHeader => getHeader(this, _altSvc);

  /// Sets the value for the Alt-Svc header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Alt-Svc
  set altSvcHeader(String value) => setHeader(this, _altSvc, value);

  /// Gets the value for the Large-Allocation header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Large-Allocation
  String get largeAllocationHeader => getHeader(this, _largeAllocation);

  /// Sets the value for the Large-Allocation header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Large-Allocation
  set largeAllocationHeader(String value) =>
      setHeader(this, _largeAllocation, value);

  /// Gets the value for the Link header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Link
  String get linkHeader => getHeader(this, _link);

  /// Sets the value for the Link header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Link
  set linkHeader(String value) => setHeader(this, _link, value);

  /// Gets the value for the Push-Policy header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Push-Policy
  String get pushPolicyHeader => getHeader(this, _pushPolicy);

  /// Sets the value for the Push-Policy header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Push-Policy
  set pushPolicyHeader(String value) => setHeader(this, _pushPolicy, value);

  /// Gets the value for the Retry-After header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Retry-After
  String get retryAfterHeader => getHeader(this, _retryAfter);

  /// Sets the value for the Retry-After header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Retry-After
  set retryAfterHeader(String value) => setHeader(this, _retryAfter, value);

  /// Gets the value for the Signature header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Signature
  String get signatureHeader => getHeader(this, _signature);

  /// Sets the value for the Signature header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Signature
  set signatureHeader(String value) => setHeader(this, _signature, value);

  /// Gets the value for the Signed-Headers header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Signed-Headers
  String get signedHeadersHeader => getHeader(this, _signedHeaders);

  /// Sets the value for the Signed-Headers header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Signed-Headers
  set signedHeadersHeader(String value) =>
      setHeader(this, _signedHeaders, value);

  /// Gets the value for the Server-Timing header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Server-Timing
  String get serverTimingHeader => getHeader(this, _serverTiming);

  /// Sets the value for the Server-Timing header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Server-Timing
  set serverTimingHeader(String value) => setHeader(this, _serverTiming, value);

  /// Gets the value for the SourceMap header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/SourceMap
  String get sourceMapHeader => getHeader(this, _sourceMap);

  /// Sets the value for the SourceMap header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/SourceMap
  set sourceMapHeader(String value) => setHeader(this, _sourceMap, value);

  /// Gets the value for the Upgrade header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Upgrade
  String get upgradeHeader => getHeader(this, _upgrade);

  /// Sets the value for the Upgrade header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Upgrade
  set upgradeHeader(String value) => setHeader(this, _upgrade, value);

  /// Gets the value for the X-DNS-Prefetch-Control header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-DNS-Prefetch-Control
  String get xDnsPrefetchControlHeader => getHeader(this, _xDnsPrefetchControl);

  /// Sets the value for the X-DNS-Prefetch-Control header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-DNS-Prefetch-Control
  set xDnsPrefetchControlHeader(String value) =>
      setHeader(this, _xDnsPrefetchControl, value);

  /// Gets the value for the X-Pingback header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Pingback
  String get xPingBackHeader => getHeader(this, _xPingBack);

  /// Sets the value for the X-Pingback header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Pingback
  set xPingBackHeader(String value) => setHeader(this, _xPingBack, value);

  /// Gets the value for the X-Requested-With header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Requested-With
  String get xRequestedWithHeader => getHeader(this, _xRequestedWith);

  /// Sets the value for the X-Requested-With header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Requested-With
  set xRequestedWithHeader(String value) =>
      setHeader(this, _xRequestedWith, value);

  /// Gets the value for the X-Robots-Tag header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Robots-Tag
  String get xRobotsTagHeader => getHeader(this, _xRobotsTag);

  /// Sets the value for the X-Robots-Tag header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Robots-Tag
  set xRobotsTagHeader(String value) => setHeader(this, _xRobotsTag, value);

  /// Gets the value for the X-UA-Compatible header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-UA-Compatible
  String get xUACompatibleHeader => getHeader(this, _xUACompatible);

  /// Sets the value for the X-UA-Compatible header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-UA-Compatible
  set xUACompatibleHeader(String value) =>
      setHeader(this, _xUACompatible, value);
}
