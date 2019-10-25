import 'dart:io';

import 'util.dart';

const _acceptCH = 'Accept-CH';
const _acceptChLifeTime = 'Accept-CH-Lifetime';
const _clearSiteData = 'Clear-Site-Data';
const _deviceMemory = 'Device-Memory';
const _dpr = 'DPR';
const _earlyData = 'Early-Data';
const _saveData = 'Save-Data';

/// Extension methods for accessing and setting Client Hints headers.
///
/// https://developer.mozilla.org/en-US/docs/Glossary/Client_hints
extension ClientHintHeaders on HttpRequest {
  /// Gets the value for Clear-Site-Data header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Clear-Site-Data
  String get clearSiteDataHeader => getHeader(this, _clearSiteData);

  /// Attempts to set the value for Clear-Site-Data header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Clear-Site-Data
  set clearSiteDataHeader(String value) =>
      setHeader(this, _clearSiteData, value);

  /// Gets the value for Accept-CH header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-CH
  String get acceptChHeader => getHeader(this, _acceptCH);

  /// Attempts to set the value for Accept-CH header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-CH
  set acceptChHeader(String value) => setHeader(this, _acceptCH, value);

  /// Gets the value for the Accept-CH-Lifetime header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-CH-Lifetime
  String get acceptChLifeTimeHeader => getHeader(this, _acceptChLifeTime);

  /// Sets the value for the Accept-CH-Lifetime header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-CH-Lifetime
  set acceptChLifeTimeHeader(String value) =>
      setHeader(this, _acceptChLifeTime, value);

  /// Gets the value for the Early-Data header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Early-Data
  String get earlyDataHeader => getHeader(this, _earlyData);

  /// Sets the value for the Early-Data header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Early-Data
  set earlyDataHeader(String value) => setHeader(this, _earlyData, value);

  /// Gets the value for the DPR (Device Pixel Ratio) header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/DPR
  String get dprHeader => getHeader(this, _dpr);

  /// Sets the value for the DPR (Device Pixel Ratio) header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/DPR
  set dprHeader(String value) => setHeader(this, _dpr, value);

  /// Gets the value for the Device-Memory header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Device-Memory
  String get deviceMemoryHeader => getHeader(this, _deviceMemory);

  /// Sets the value for the Device-Memory header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Device-Memory
  set deviceMemoryHeader(String value) => setHeader(this, _deviceMemory, value);

  /// Gets the value for the Save-Data header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Save-Data
  String get saveDataHeader => getHeader(this, _saveData);

  /// Sets the value for the Save-Data header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Save-Data
  set saveDataHeader(String value) => setHeader(this, _saveData, value);
}
