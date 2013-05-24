library namepool;

import 'horatio.dart';

final CITIES = [
  'New York', 'Los Angeles', 'Chicago', 'Washington', 'San Francisco', 'Boston', 
  'Philadelphia', 'Dallas', 'Miami', 'Houston', 'Atlanta', 'Detroit',
  'Seattle', 'Phoenix', 'Minneapolis', 'Cleveland', 'Denver', 'San Diego', 
  'Portland', 'Orlando', 'St. Louis', 'Tampa', 'Pittsburgh', 'Sacramento',
  'Charlotte', 'Kansas City', 'Salt Lake City', 'Columbus', 'Indianapolis', 'Las Vegas',
  'San Antonio', 'Cincinnati', 'Milwaukee', 'Raleigh', 'Nashville', 'Austin',
  'Virginia Beach', 'Greensboro', 'Jacksonville', 'Hartford', 'Louisville', 'New Orleans',
  'Grand Rapids', 'Greenville', 'Memphis', 'Oklahoma City', 'Birmingham', 'Richmond'
];
const DICTPATH = '/usr/share/dict/words';
List namepool = [];
List teampool = [];

replenishNamepool() {
  var dw = fetchFileContent(DICTPATH);
  namepool = dw.split('\n').where((w) => w.length >= 2 && w.length <= 12).toList();
  shuffle(namepool);
}

replenishTeampool() {
  teampool = CITIES.sublist(0);
  shuffle(teampool);
}

String rollName() {
  if (namepool.isEmpty) {
    replenishNamepool();
  }
  return capitalize(namepool.removeLast());
}

String rollTeam() {
  if (teampool.isEmpty) {
    replenishTeampool();
  }
  return teampool.removeLast();
}
