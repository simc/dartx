import 'dart:io';

import 'util.dart';

const _contentDisposition = 'Content-Disposition';

/// Extension methods for access and setting Download headers.
extension DownloadsHeaders on HttpRequest {
  /// Gets the value for the Content-Disposition header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Disposition
  String get contentDispositionHeader => getHeader(this, _contentDisposition);

  /// Sets the value for the Content-Disposition header.
  ///
  /// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Disposition
  set contentDispositionHeader(String value) =>
      setHeader(this, _contentDisposition, value);
}
