import 'dart:io';

/// Simple function used to retrieve headers from [HttpRequest] objects.
String getHeader(HttpRequest request, String headerName) {
  String header;
  try {
    header = request.headers.value(headerName);
  } catch (e) {
    if (e is Error) {
      rethrow;
    } else if (e is Exception) {
      handleGetErr(headerName, e);
    }
  }
  return header;
}

/// Error handler utility for failed attempts at retrieval of header values.
void handleGetErr(String header, Exception e) {
  print('failed to retrieve $header, cause: $e');
}

/// Error handler utility for failed attempts to set header values.
void handleSetErr(String header, Exception e) {
  print('failed to set $header, cause: $e');
}

/// Simple method used to set headers [HttpRequest] objects.
void setHeader(HttpRequest request, String headerName, String value) {
  try {
    request.headers.set(headerName, value);
  } catch (e) {
    if (e is Error) {
      rethrow;
    } else if (e is Exception) {
      handleSetErr(headerName, e);
    }
  }
}
