#!/usr/bin/env dart

import 'dart:math';

const DIEFACES = 6;
final POWERX = pow(10, 0.1);

var entries = [];
var freqchart = new List.filled(16, 0);

main() {
  var trials = 0;
  for (var d1 = 0; d1 < DIEFACES; d1 += 1) {
    for (var d2 = 0; d2 < DIEFACES; d2 += 1) {
      for (var d3 = 0; d3 < DIEFACES; d3 += 1) {
        for (var d4 = 0; d4 < DIEFACES; d4 += 1) {
          trials += 1;
          var drl = [d1, d2, d3, d4];
          drl.sort();
          var r = drl[0] + drl[1] + drl[3];
          entries.add(r);
          freqchart[r] += 1;
        }
      }
    }
  }
  print(freqchart);
  print(freqchart.map((n) => (n / entries.length).toStringAsFixed(3)).toList());
  var cum = 0;
  for (var i = 0; i < freqchart.length; i += 1) {
    var prob = freqchart[i] / entries.length;
    cum += freqchart[i];
    var cumprob = cum / entries.length;
    var nlab = i.toStringAsFixed(0);
    print(
      '${nlab}: ${prob.toStringAsFixed(4)} ' + 
      '${skillPower(i).toStringAsFixed(3)} ' +
      '${cumprob.toStringAsFixed(4)} ' + 
      '${cum}'
    );
  }
  print('mean: ${mean(entries).toStringAsFixed(4)}');
  print('meanPower: ${meanPower(entries).toStringAsFixed(4)}');
}

num mean(List l) {
  var sum = 0.0;
  for (var e in l) {
    sum += e;
  }
  return sum / l.length;
}

num meanPower(List l) {
  var sum = 0.0;
  for (var e in l) {
    sum += skillPower(e);
  }
  return sum / l.length;
}

num skillPower(n) => 17.325 * pow(POWERX, n);

