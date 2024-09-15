import 'package:flutter/foundation.dart';

Function customLogger = (String message) {
  if (kDebugMode) {
    print("customLogger: $message");
  }
};
