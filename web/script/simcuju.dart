#!/usr/bin/env dart

import 'dart:math';

var RNG = new Random();

var PLAYMATRIX = {
  'red': ['tackled', 'dribble-black', 'pass-black', 'pass-green', 'ball-yellow', 'ball-green'],
  'black': ['tackled', 'dribble-blue', 'throwin', 'freekick', 'ball-green', 'shoot'],
  'blue': ['tackled', 'pass-red', 'shoot', 'shoot', 'header', 'yellowcard'],
  'yellow': ['tackled', 'offside', 'pass-black', 'shoot', 'shoot', 'penalty'],
  'green': ['wide', 'overbar', 'saved', 'corner', 'goal', 'goal']
};

var SB = {
  'biz': 'red',
  'goals': 0,
  'totPoss': 0,
  'totRolls': 0,
  'totShots': 0,
  'totPenaltyShots': 0,
  'totCorners': 0,
  'totSaves': 0
};

final isDebugMode = false;
final TRIALS = 12;

main() {
  for (var pn = 0; pn < TRIALS; pn += 1) {
    if (isDebugMode) print('----');
    SB['totPoss'] += 1;
    var isPoss = true;  
    SB['biz'] = 'red';
    while (isPoss) {
      var r = RNG.nextInt(6);
      var z = SB['biz'];
      SB['totRolls'] += 1;
      var playResult = PLAYMATRIX[z][r];
      if (isDebugMode) print(playResult);
      if (playResult == 'tackled' || playResult == 'offside') {
        isPoss = false;
      } else if (playResult == 'wide' || playResult == 'overbar') {
        isPoss = false;
        SB['totShots'] += 1;
      } else if (playResult == 'saved') {
        isPoss = false;
        SB['totSaves'] += 1;
        SB['totShots'] += 1;
      } else if (playResult.startsWith('dribble') || playResult.startsWith('pass') || 
                 playResult.startsWith('ball')) {
        SB['biz'] = playResult.split('-')[1];
      } else if (playResult == 'throwin') {
        SB['biz'] = 'blue';
      } else if (playResult == 'freekick') {
        SB['biz'] = 'yellow';
      } else if (playResult == 'shoot' || playResult == 'header') {
        SB['biz'] = 'green';
      } else if (playResult == 'penalty' || playResult == 'yellowcard') {
        SB['totPenaltyShots'] += 1;
        SB['biz'] = 'green';
      } else if (playResult == 'corner') {
        SB['biz'] = 'yellow';
        SB['totCorners'] += 1;
        SB['totShots'] += 1;
      } else if (playResult == 'goal') {
        SB['totShots'] += 1;
        SB['goals'] += 1;
        isPoss = false;
      } else {
        print('ERROR! UNKNOWN PLAY RESULT: ${playResult}');
      }
    }
  }
  if (isDebugMode) print('====');
  print(SB);
  var goalsPerRoll = SB['goals'] / SB['totRolls'];
  print('goalsPerRoll: ${goalsPerRoll}');
}


