#!/usr/bin/env dart

import 'package:serialization/serialization.dart';
import 'package:unittest/unittest.dart';
import 'dart:json';
import '../web/script/horatio.dart';
import '../web/script/usa.dart';

main() {
  test('horatio', () {
    expect(capitalize('god'), equals('God'));
  });
  test('USA genesis', () {
    var usa = new UsaLeague();
    expect(usa, isNotNull);
    usa.genesis();
    expect(usa.data['freeagents'].length, equals(48 * 11));
    reportUsaFreeagents(usa);
    var jostr = stringify(usa.data);
    print('usa.data.length: ${jostr.length}');
  });
}

reportUsaFreeagents(UsaLeague usa) {
  for (var fa in usa.data['freeagents']) {
    print('${fa['pos']} ${fa['name']} ${fa['attr']}');
  }
}
