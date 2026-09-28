import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Flattens a translation map into dot-separated key paths so nested
/// objects (e.g. `validation.phone.required`) are compared too.
Set<String> _keyPaths(Map<String, dynamic> map, [String prefix = '']) {
  final paths = <String>{};
  map.forEach((key, value) {
    final path = prefix.isEmpty ? key : '$prefix.$key';
    paths.add(path);
    if (value is Map<String, dynamic>) {
      paths.addAll(_keyPaths(value, path));
    }
  });
  return paths;
}

Map<String, dynamic> _loadLocale(String fileName) {
  final file = File('assets/languages/$fileName');
  expect(file.existsSync(), isTrue,
      reason: 'Expected locale file assets/languages/$fileName to exist');
  return json.decode(file.readAsStringSync()) as Map<String, dynamic>;
}

void main() {
  test('en-UK and ar-EG contain the same translation keys', () {
    final en = _loadLocale('en-UK.json');
    final ar = _loadLocale('ar-EG.json');

    final enKeys = _keyPaths(en);
    final arKeys = _keyPaths(ar);

    final missingInAr = enKeys.difference(arKeys);
    final missingInEn = arKeys.difference(enKeys);

    expect(missingInAr, isEmpty,
        reason: 'Keys in en-UK.json missing from ar-EG.json: $missingInAr');
    expect(missingInEn, isEmpty,
        reason: 'Keys in ar-EG.json missing from en-UK.json: $missingInEn');
  });
}
