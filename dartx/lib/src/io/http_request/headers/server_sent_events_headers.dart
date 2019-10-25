import 'dart:io';

import 'util.dart';

const _lastEventId = 'Last-Event-ID';
const _nel = 'NEL';
const _pingFrom = 'Ping-From';
const _pingTo = 'Ping-To';
const _reportTo = 'Report-To';

/// Extension methods for accessing and setting Server-Sent-Events headers.
extension ServerSentEventsHeaders on HttpRequest {
  /// Gets the value for the Last-Event-ID header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Last-Event-ID
  String get lastEventIdHeader => getHeader(this, _lastEventId);

  /// Sets the value for the Last-Event-ID header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Last-Event-ID
  set lastEventIdHeader(String value) => setHeader(this, _lastEventId, value);

  /// Gets the value for  the NEL header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/NEL
  String get nelHeader => getHeader(this, _nel);

  /// Sets the value for the NEL header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/NEL
  set nelHeader(String value) => setHeader(this, _nel, value);

  /// Gets the value for the Ping-From header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Ping-From
  String get pingFromHeader => getHeader(this, _pingFrom);

  /// Sets the value for the Ping-From header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Ping-From
  set pingFromHeader(String value) => setHeader(this, _pingFrom, value);

  /// Gets the value for the Ping-To header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Ping-To
  String get pingToHeader => getHeader(this, _pingTo);

  /// Sets the value for the Ping-To header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Ping-To
  set pingToHeader(String value) => setHeader(this, _pingTo, value);

  /// Gets the value for the Report-To header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Report-To
  String get reportToHeader => getHeader(this, _reportTo);

  /// Sets the value for the  Report-To header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Report-To
  set reportToHeader(String value) => setHeader(this, _reportTo, value);
}
