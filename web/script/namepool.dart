library namepool;

import 'horatio.dart';

const DICTPATH = '/usr/share/dict/words';
List namepool = [];

replenishNamepool() {
  var dw = fetchFileContent(DICTPATH);
  namepool = dw.split('\n').where((w) => w.length >= 2 && w.length <= 12).toList();
  shuffle(namepool);
}

String rollName() {
  if (namepool.isEmpty) {
    replenishNamepool();
  }
  return capitalize(namepool.removeLast());
}
