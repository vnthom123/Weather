import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../entity/weather_entity.dart';

part 'app_db.g.dart';

LazyDatabase _openDatabase() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'weather.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Weather])
class AppDb extends _$AppDb {
  AppDb() : super(_openDatabase());
  @override
  int get schemaVersion => 1;

  // get all weather
  Future<List<WeatherData>> getWeathers() async {
    return await select(weather).get();
  }

  // get weather by id
  Future<WeatherData> getWeatherById(int id) async {
    return await (select(weather)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  // update weather
  Future<bool> updateWeather(WeatherCompanion entity) async {
    return await update(weather).replace(entity);
  }

  // insert weather
  Future<int> insertWeather(WeatherCompanion entity) async {
    return await into(weather).insert(entity);
  }

  // delete weather
  Future<int> deleteWeather(int id) async {
    return await (delete(weather)..where((tbl) => tbl.id.equals(id))).go();
  }
}
