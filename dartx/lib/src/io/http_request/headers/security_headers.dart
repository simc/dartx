import 'dart:io';

import 'util.dart';

const _contentSecurityPolicy = 'Content-Security-Policy';
const _contentSecurityPolicyReportOnly = 'Content-Security-Policy-Report-Only';
const _crossOriginOpenerPolicy = 'Cross-Origin-Opener-Policy';
const _crossOriginResourcePolicy = 'Cross-Origin-Resource-Policy';
const _expectCT = 'Expect-CT';
const _featurePolicy = 'Feature-Policy';
const _publicKeyPins = 'Public-Key-Pins';
const _publicKeyPinsReportOnly = 'Public-Key-Pins-Report-Only';
const _strictTransportSecurity = 'Strict-Transport-Security';
const _upgradeInsecureRequests = 'Upgrade-Insecure-Requests';
const _xContentTypeOptions = 'X-Content-Type-Options';
const _xDownloadOptions = 'X-Download-Options';
const _xFrameOptions = 'X-Frame-Options';
const _xPoweredBy = 'X-Powered-By';
const _xXssProtection = 'X-XSS-Protection';

/// Extension methods for accessing and setting Security related headers.
extension SecurityHeaders on HttpRequest {
  /// Gets the value for the Cross-Origin-Opener-Policy header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cross-Origin-Opener-Policy
  String get crossOriginOpenerPolicyHeader =>
      getHeader(this, _crossOriginOpenerPolicy);

  /// Sets the value for the Cross-Origin-Opener-Policy header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cross-Origin-Opener-Policy
  set crossOriginOpenerPolicyHeader(String value) =>
      setHeader(this, _crossOriginOpenerPolicy, value);

  /// Gets the value for the Cross-Origin-Resource-Policy header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cross-Origin-Resource-Policy
  String get crossOriginResourcePolicyHeader =>
      getHeader(this, _crossOriginResourcePolicy);

  /// Sets the value for the Cross-Origin-Resource-Policy header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cross-Origin-Resource-Policy
  set crossOriginResourcePolicyHeader(String value) =>
      setHeader(this, _crossOriginResourcePolicy, value);

  /// Gets the value for the Content-Security-Policy header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy
  String get contentSecurityPolicyHeader =>
      getHeader(this, _contentSecurityPolicy);

  /// Sets the value for the Content-Security-Policy header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy
  set contentSecurityPolicyHeader(String value) =>
      setHeader(this, _contentSecurityPolicy, value);

  /// Gets the value for the Content-Security-Policy-Report-Only header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
  String get contentSecurityPolicyReportOnlyHeader =>
      getHeader(this, _contentSecurityPolicyReportOnly);

  /// Sets the value for the Content-Security-Policy-Report-Only header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
  set contentSecurityPolicyReportOnlyHeader(String value) =>
      setHeader(this, _contentSecurityPolicyReportOnly, value);

  /// Gets the value for the Expect-CT header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Expect-CT
  String get expectCTHeader => getHeader(this, _expectCT);

  /// Sets the value for the Expect-CT header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Expect-CT
  set expectCTHeader(String value) => setHeader(this, _expectCT, value);

  /// Gets the value for the Feature-Policy header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Feature-Policy
  String get featurePolicyHeader => getHeader(this, _featurePolicy);

  /// Sets the value for the Feature-Policy header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Feature-Policy
  set featurePolicyHeader(String value) =>
      setHeader(this, _featurePolicy, value);

  /// Gets the value for the Public-Key-Pins header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Public-Key-Pins
  String get publicKeyPinsHeader => getHeader(this, _publicKeyPins);

  /// Sets the value for the Public-Key-Pins header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Public-Key-Pins
  set publicKeyPinsHeader(String value) =>
      setHeader(this, _publicKeyPins, value);

  /// Gets the value for the Public-Key-Pins-Report-Only header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Public-Key-Pins-Report-Only
  String get publicKeyPinsReportOnlyHeader =>
      getHeader(this, _publicKeyPinsReportOnly);

  /// Sets the value for the Public-Key-Pins-Report-Only header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Public-Key-Pins-Report-Only
  set publicKeyPinsReportOnlyHeader(String value) =>
      setHeader(this, _publicKeyPinsReportOnly, value);

  /// Gets the value for the Strict-Transport-Security header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security
  String get strictTransportSecurityHeader =>
      getHeader(this, _strictTransportSecurity);

  /// Sets the value for the Strict-Transport-Security header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security
  set strictTransportSecurityHeader(String value) =>
      setHeader(this, _strictTransportSecurity, value);

  /// Gets the value for the Upgrade-Insecure-Requests header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Upgrade-Insecure-Requests
  String get upgradeInsecureRequestsHeader =>
      getHeader(this, _upgradeInsecureRequests);

  /// Sets the value for the Upgrade-Insecure-Requests header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Upgrade-Insecure-Requests
  set upgradeInsecureRequestsHeader(String value) =>
      setHeader(this, _upgradeInsecureRequests, value);

  /// Gets the value for the X-Content-Type-Options header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Content-Type-Options
  String get xContentTypeOptionsHeader => getHeader(this, _xContentTypeOptions);

  /// Sets the value for the X-Content-Type-Options header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Content-Type-Options
  set xContentTypeOptionsHeader(String value) =>
      setHeader(this, _xContentTypeOptions, value);

  /// Gets the value for the X-Download-Options header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Download-Options
  String get xDownloadOptionsHeader => getHeader(this, _xDownloadOptions);

  /// Sets the value for the X-Download-Options header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Download-Options
  set xDownloadOptionsHeader(String value) =>
      setHeader(this, _xDownloadOptions, value);

  /// Gets the value for the X-Frame-Options header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options
  String get xFrameOptionsHeader => getHeader(this, _xFrameOptions);

  /// Sets the value for the X-Frame-Options header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options
  set xFrameOptionsHeader(String value) =>
      setHeader(this, _xFrameOptions, value);

  /// Gets the value for the X-Powered-By header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Powered-By
  String get xPoweredByHeader => getHeader(this, _xPoweredBy);

  /// Sets the value for the X-Powered-By header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Powered-By
  set xPoweredByHeader(String value) => setHeader(this, _xPoweredBy, value);

  /// Gets the value for the X-XSS-Protection header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-XSS-Protection
  String get xXssProtectionHeader => getHeader(this, _xXssProtection);

  /// Sets the value for the X-XSS-Protection header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-XSS-Protection
  set xXssProtectionHeader(String value) =>
      setHeader(this, _xXssProtection, value);
}
