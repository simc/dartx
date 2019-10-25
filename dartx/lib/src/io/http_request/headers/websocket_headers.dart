import 'dart:io';

import 'util.dart';

const _sectWebSocketVersion = 'Sec-WebSocket-Version';
const _secWebSocketAccept = 'Sec-WebSocket-Extensions';
const _secWebSocketExtensions = 'Sec-WebSocket-Extensions';
const _secWebSocketKey = 'Sec-WebSocket-Key';
const _secWebSocketProtocol = 'Sec-WebSocket-Protocol';

/// Extension methods for accessing and setting WebSockets headers.
extension WebSocketsHeaders on HttpRequest {
  /// Gets the header value set for the header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Sec-WebSocket-Key
  String get secWebSocketKeyHeader => getHeader(this, _secWebSocketKey);

  /// Sets the value for the header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Sec-WebSocket-Key
  set secWebSocketKeyHeader(String value) =>
      setHeader(this, _secWebSocketKey, value);

  /// Gets the header value set for the header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Sec-WebSocket-Extensions
  String get secWebSocketExtensionsHeader =>
      getHeader(this, _secWebSocketExtensions);

  /// Sets the value for the header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Sec-WebSocket-Extensions
  set secWebSocketExtensionsHeader(String value) =>
      setHeader(this, _secWebSocketExtensions, value);

  /// Gets the header value set for the header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Sec-WebSocket-Accept
  String get secWebSocketAcceptHeader => getHeader(this, _secWebSocketAccept);

  /// Sets the value for the header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Sec-WebSocket-Accept
  set secWebSocketAcceptHeader(String value) =>
      setHeader(this, _secWebSocketAccept, value);

  /// Gets the header value set for the header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Sec-WebSocket-Protocol
  String get secWebSocketProtocolHeader =>
      getHeader(this, _secWebSocketProtocol);

  /// Sets the value for the header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Sec-WebSocket-Protocol
  set secWebSocketProtocolHeader(String value) =>
      setHeader(this, _secWebSocketProtocol, value);

  /// Gets the header value set for the header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Sec-WebSocket-Version
  String get secWebSocketVersionHeader =>
      getHeader(this, _sectWebSocketVersion);

  /// Sets the value for the header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Sec-WebSocket-Version
  set secWebSocketVersionHeader(String value) =>
      setHeader(this, _sectWebSocketVersion, value);
}
