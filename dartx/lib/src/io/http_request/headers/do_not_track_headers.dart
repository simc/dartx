import 'dart:io';

import 'util.dart';

const _dnt = 'DNT';
const _tk = 'Tk';

/// Extension methods for accessing and setting  Do Not Track headers.
extension DoNotTrackHeaders on HttpRequest {
  /// Gets the value for the DNT header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/DNT
  String get dntHeader => getHeader(this, _dnt);

  /// Sets the value for the DNT header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/DNT
  set dntHeader(String value) => setHeader(this, _dnt, value);

  /// Gets the value for the Tk header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Tk
  String get tkHeader => getHeader(this, _tk);

  /// Sets the value for the Tk header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Tk
  set tkHeader(String value) => setHeader(this, _tk, value);
}
