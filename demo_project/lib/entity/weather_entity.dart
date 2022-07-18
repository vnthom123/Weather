import 'package:drift/drift.dart';

class Weather extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get position => text().named('position')();
  TextColumn get condition => text().named('place')();
  IntColumn get maxTemp => integer().named('maxTemp')();
  IntColumn get temp => integer().named('temp')();
  IntColumn get minTemp => integer().named('minemp')();
}
