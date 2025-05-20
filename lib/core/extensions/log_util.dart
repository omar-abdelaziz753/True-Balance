import 'package:flutter/material.dart';

void logError(String msg) => debugPrint(
  '\x1B[31m$msg\x1B[0m',
);

void logSuccess(String msg) => debugPrint(
  '\x1B[32m$msg\x1B[0m',
);

void logWarning(String msg) => debugPrint(
  '\x1B[33m$msg\x1B[0m',
);