library horatio;

import 'dart:io';
import 'dart:math';

var RNG = new Random();

String capitalize(String s) => '${s[0].toUpperCase()}${s.substring(1)}';

String fetchFileContent(String fp) {
  var f = new File(fp);
  return f.readAsStringSync();
}

shuffle(List l) {
  var n = l.length;
  while (n > 0) {
    var i = RNG.nextInt(n);
    n -= 1;
    var t = l[n];
    l[n] = l[i];
    l[i] = t;
  }
}
