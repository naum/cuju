library usa;

import 'dart:json';
import 'dart:math';
import 'horatio.dart';
import 'namepool.dart';

var RNG = new Random();

class UsaLeague {

  static final rosterMatrix = {
    'F': [10, ['T', 'P', 'D', 'A', 'B', 'S', 'O', 'G']],
    'G': [1, ['T', 'P', 'C', 'V']]
  };

  Map data = {
    'passkey': null,
    'title': 'Universal Soccer Association',
    'seasonNum': 0,
    'teamTally': 48,
    'clubs': [],
    'freeagents': [],
    'schedule': [],
    'standings': {},
    'stats': {}
  };

  UsaLeague() {
  }

  genesis() {
    for (var t = 0; t < data['teamTally']; t += 1) {
      data['clubs'].add(spawnClub());
      for (var f = 0; f < rosterMatrix['F'][0]; f += 1) {
        data['freeagents'].add(spawnMan('F'));
      }
      for (var g = 0; g < rosterMatrix['G'][0]; g += 1) {
        data['freeagents'].add(spawnMan('G'));
      }
    }
  }

  int rollSkill() {
    var x = RNG.nextInt(1296);
    if (x < 1) return 0;
    else if (x < 11) return 1;
    else if (x < 37) return 2;
    else if (x < 96) return 3;
    else if (x < 204) return 4;
    else if (x < 384) return 5;
    else if (x < 591) return 6;
    else if (x < 795) return 7;
    else if (x < 969) return 8;
    else if (x < 1104) return 9;
    else if (x < 1194) return 10;
    else if (x < 1248) return 11;
    else if (x < 1277) return 12;
    else if (x < 1291) return 13;
    else if (x < 1295) return 14;
    else if (x < 1296) return 15;
  }

  Map spawnClub() {
    var name = rollTeam();
    return { 'name': name, 'roster': [] };
  }

  Map spawnMan(pos) {
    var name = rollName();
    var attr = {};
    for (var a in UsaLeague.rosterMatrix[pos][1]) {
      attr[a] = rollSkill();
    }
    return { 'pos': pos, 'name': name, 'attr': attr };
  }

}
