// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class WeatherData extends DataClass implements Insertable<WeatherData> {
  final int id;
  final String position;
  final String condition;
  final int maxTemp;
  final int temp;
  final int minTemp;
  WeatherData(
      {required this.id,
      required this.position,
      required this.condition,
      required this.maxTemp,
      required this.temp,
      required this.minTemp});
  factory WeatherData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return WeatherData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      position: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position'])!,
      condition: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}place'])!,
      maxTemp: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}maxTemp'])!,
      temp: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}temp'])!,
      minTemp: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}minemp'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['position'] = Variable<String>(position);
    map['place'] = Variable<String>(condition);
    map['maxTemp'] = Variable<int>(maxTemp);
    map['temp'] = Variable<int>(temp);
    map['minemp'] = Variable<int>(minTemp);
    return map;
  }

  WeatherCompanion toCompanion(bool nullToAbsent) {
    return WeatherCompanion(
      id: Value(id),
      position: Value(position),
      condition: Value(condition),
      maxTemp: Value(maxTemp),
      temp: Value(temp),
      minTemp: Value(minTemp),
    );
  }

  factory WeatherData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeatherData(
      id: serializer.fromJson<int>(json['id']),
      position: serializer.fromJson<String>(json['position']),
      condition: serializer.fromJson<String>(json['condition']),
      maxTemp: serializer.fromJson<int>(json['maxTemp']),
      temp: serializer.fromJson<int>(json['temp']),
      minTemp: serializer.fromJson<int>(json['minTemp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'position': serializer.toJson<String>(position),
      'condition': serializer.toJson<String>(condition),
      'maxTemp': serializer.toJson<int>(maxTemp),
      'temp': serializer.toJson<int>(temp),
      'minTemp': serializer.toJson<int>(minTemp),
    };
  }

  WeatherData copyWith(
          {int? id,
          String? position,
          String? condition,
          int? maxTemp,
          int? temp,
          int? minTemp}) =>
      WeatherData(
        id: id ?? this.id,
        position: position ?? this.position,
        condition: condition ?? this.condition,
        maxTemp: maxTemp ?? this.maxTemp,
        temp: temp ?? this.temp,
        minTemp: minTemp ?? this.minTemp,
      );
  @override
  String toString() {
    return (StringBuffer('WeatherData(')
          ..write('id: $id, ')
          ..write('position: $position, ')
          ..write('condition: $condition, ')
          ..write('maxTemp: $maxTemp, ')
          ..write('temp: $temp, ')
          ..write('minTemp: $minTemp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, position, condition, maxTemp, temp, minTemp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherData &&
          other.id == this.id &&
          other.position == this.position &&
          other.condition == this.condition &&
          other.maxTemp == this.maxTemp &&
          other.temp == this.temp &&
          other.minTemp == this.minTemp);
}

class WeatherCompanion extends UpdateCompanion<WeatherData> {
  final Value<int> id;
  final Value<String> position;
  final Value<String> condition;
  final Value<int> maxTemp;
  final Value<int> temp;
  final Value<int> minTemp;
  const WeatherCompanion({
    this.id = const Value.absent(),
    this.position = const Value.absent(),
    this.condition = const Value.absent(),
    this.maxTemp = const Value.absent(),
    this.temp = const Value.absent(),
    this.minTemp = const Value.absent(),
  });
  WeatherCompanion.insert({
    this.id = const Value.absent(),
    required String position,
    required String condition,
    required int maxTemp,
    required int temp,
    required int minTemp,
  })  : position = Value(position),
        condition = Value(condition),
        maxTemp = Value(maxTemp),
        temp = Value(temp),
        minTemp = Value(minTemp);
  static Insertable<WeatherData> custom({
    Expression<int>? id,
    Expression<String>? position,
    Expression<String>? condition,
    Expression<int>? maxTemp,
    Expression<int>? temp,
    Expression<int>? minTemp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (position != null) 'position': position,
      if (condition != null) 'place': condition,
      if (maxTemp != null) 'maxTemp': maxTemp,
      if (temp != null) 'temp': temp,
      if (minTemp != null) 'minemp': minTemp,
    });
  }

  WeatherCompanion copyWith(
      {Value<int>? id,
      Value<String>? position,
      Value<String>? condition,
      Value<int>? maxTemp,
      Value<int>? temp,
      Value<int>? minTemp}) {
    return WeatherCompanion(
      id: id ?? this.id,
      position: position ?? this.position,
      condition: condition ?? this.condition,
      maxTemp: maxTemp ?? this.maxTemp,
      temp: temp ?? this.temp,
      minTemp: minTemp ?? this.minTemp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    if (condition.present) {
      map['place'] = Variable<String>(condition.value);
    }
    if (maxTemp.present) {
      map['maxTemp'] = Variable<int>(maxTemp.value);
    }
    if (temp.present) {
      map['temp'] = Variable<int>(temp.value);
    }
    if (minTemp.present) {
      map['minemp'] = Variable<int>(minTemp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeatherCompanion(')
          ..write('id: $id, ')
          ..write('position: $position, ')
          ..write('condition: $condition, ')
          ..write('maxTemp: $maxTemp, ')
          ..write('temp: $temp, ')
          ..write('minTemp: $minTemp')
          ..write(')'))
        .toString();
  }
}

class $WeatherTable extends Weather with TableInfo<$WeatherTable, WeatherData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeatherTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  @override
  late final GeneratedColumn<String?> position = GeneratedColumn<String?>(
      'position', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _conditionMeta = const VerificationMeta('condition');
  @override
  late final GeneratedColumn<String?> condition = GeneratedColumn<String?>(
      'place', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _maxTempMeta = const VerificationMeta('maxTemp');
  @override
  late final GeneratedColumn<int?> maxTemp = GeneratedColumn<int?>(
      'maxTemp', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _tempMeta = const VerificationMeta('temp');
  @override
  late final GeneratedColumn<int?> temp = GeneratedColumn<int?>(
      'temp', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _minTempMeta = const VerificationMeta('minTemp');
  @override
  late final GeneratedColumn<int?> minTemp = GeneratedColumn<int?>(
      'minemp', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, position, condition, maxTemp, temp, minTemp];
  @override
  String get aliasedName => _alias ?? 'weather';
  @override
  String get actualTableName => 'weather';
  @override
  VerificationContext validateIntegrity(Insertable<WeatherData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('place')) {
      context.handle(_conditionMeta,
          condition.isAcceptableOrUnknown(data['place']!, _conditionMeta));
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    if (data.containsKey('maxTemp')) {
      context.handle(_maxTempMeta,
          maxTemp.isAcceptableOrUnknown(data['maxTemp']!, _maxTempMeta));
    } else if (isInserting) {
      context.missing(_maxTempMeta);
    }
    if (data.containsKey('temp')) {
      context.handle(
          _tempMeta, temp.isAcceptableOrUnknown(data['temp']!, _tempMeta));
    } else if (isInserting) {
      context.missing(_tempMeta);
    }
    if (data.containsKey('minemp')) {
      context.handle(_minTempMeta,
          minTemp.isAcceptableOrUnknown(data['minemp']!, _minTempMeta));
    } else if (isInserting) {
      context.missing(_minTempMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeatherData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return WeatherData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $WeatherTable createAlias(String alias) {
    return $WeatherTable(attachedDatabase, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $WeatherTable weather = $WeatherTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [weather];
}
