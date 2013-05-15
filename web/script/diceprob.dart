#!/usr/bin/env dart

List normalDie = [1, 2, 3, 4, 5, 6];
List specialDie = [-2, 0, 0, 0, 0, 2];
List freqChart = new List.filled(11, 0);

main() {
  var d1, d2, d3, d4, roll;
  var totTrials = 0;
  for (d1 = 0; d1 < 6; d1 += 1) {
    for (d2 = 0; d2 < 6; d2 += 1) {
      for (d3 = 0; d3 < 6; d3 += 1) {
        for (d4 = 0; d4 < 6; d4 += 1) {
          roll = normalDie[d1] + normalDie[d2] + normalDie[d3] + specialDie[d4];
          var n = roll ~/ 2;
          freqChart[n] += 1;
          totTrials += 1;
        }
      }
    }
  }
  print(freqChart);
  print(freqChart.map((n) => (n / totTrials).toStringAsFixed(4)).toList());
}
