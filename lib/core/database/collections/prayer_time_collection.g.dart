// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_time_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPrayerTimeCollectionCollection on Isar {
  IsarCollection<PrayerTimeCollection> get prayerTimeCollections =>
      this.collection();
}

const PrayerTimeCollectionSchema = CollectionSchema(
  name: r'PrayerTimeCollection',
  id: 2854209236738951798,
  properties: {
    r'asr': PropertySchema(
      id: 0,
      name: r'asr',
      type: IsarType.dateTime,
    ),
    r'calculationMethod': PropertySchema(
      id: 1,
      name: r'calculationMethod',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'date': PropertySchema(
      id: 3,
      name: r'date',
      type: IsarType.string,
    ),
    r'dhuhr': PropertySchema(
      id: 4,
      name: r'dhuhr',
      type: IsarType.dateTime,
    ),
    r'fajr': PropertySchema(
      id: 5,
      name: r'fajr',
      type: IsarType.dateTime,
    ),
    r'isha': PropertySchema(
      id: 6,
      name: r'isha',
      type: IsarType.dateTime,
    ),
    r'latitude': PropertySchema(
      id: 7,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 8,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'maghrib': PropertySchema(
      id: 9,
      name: r'maghrib',
      type: IsarType.dateTime,
    ),
    r'sunrise': PropertySchema(
      id: 10,
      name: r'sunrise',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _prayerTimeCollectionEstimateSize,
  serialize: _prayerTimeCollectionSerialize,
  deserialize: _prayerTimeCollectionDeserialize,
  deserializeProp: _prayerTimeCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _prayerTimeCollectionGetId,
  getLinks: _prayerTimeCollectionGetLinks,
  attach: _prayerTimeCollectionAttach,
  version: '3.1.0+1',
);

int _prayerTimeCollectionEstimateSize(
  PrayerTimeCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.calculationMethod.length * 3;
  bytesCount += 3 + object.date.length * 3;
  return bytesCount;
}

void _prayerTimeCollectionSerialize(
  PrayerTimeCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.asr);
  writer.writeString(offsets[1], object.calculationMethod);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.date);
  writer.writeDateTime(offsets[4], object.dhuhr);
  writer.writeDateTime(offsets[5], object.fajr);
  writer.writeDateTime(offsets[6], object.isha);
  writer.writeDouble(offsets[7], object.latitude);
  writer.writeDouble(offsets[8], object.longitude);
  writer.writeDateTime(offsets[9], object.maghrib);
  writer.writeDateTime(offsets[10], object.sunrise);
}

PrayerTimeCollection _prayerTimeCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PrayerTimeCollection();
  object.asr = reader.readDateTime(offsets[0]);
  object.calculationMethod = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.date = reader.readString(offsets[3]);
  object.dhuhr = reader.readDateTime(offsets[4]);
  object.fajr = reader.readDateTime(offsets[5]);
  object.id = id;
  object.isha = reader.readDateTime(offsets[6]);
  object.latitude = reader.readDouble(offsets[7]);
  object.longitude = reader.readDouble(offsets[8]);
  object.maghrib = reader.readDateTime(offsets[9]);
  object.sunrise = reader.readDateTime(offsets[10]);
  return object;
}

P _prayerTimeCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _prayerTimeCollectionGetId(PrayerTimeCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _prayerTimeCollectionGetLinks(
    PrayerTimeCollection object) {
  return [];
}

void _prayerTimeCollectionAttach(
    IsarCollection<dynamic> col, Id id, PrayerTimeCollection object) {
  object.id = id;
}

extension PrayerTimeCollectionByIndex on IsarCollection<PrayerTimeCollection> {
  Future<PrayerTimeCollection?> getByDate(String date) {
    return getByIndex(r'date', [date]);
  }

  PrayerTimeCollection? getByDateSync(String date) {
    return getByIndexSync(r'date', [date]);
  }

  Future<bool> deleteByDate(String date) {
    return deleteByIndex(r'date', [date]);
  }

  bool deleteByDateSync(String date) {
    return deleteByIndexSync(r'date', [date]);
  }

  Future<List<PrayerTimeCollection?>> getAllByDate(List<String> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndex(r'date', values);
  }

  List<PrayerTimeCollection?> getAllByDateSync(List<String> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'date', values);
  }

  Future<int> deleteAllByDate(List<String> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'date', values);
  }

  int deleteAllByDateSync(List<String> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'date', values);
  }

  Future<Id> putByDate(PrayerTimeCollection object) {
    return putByIndex(r'date', object);
  }

  Id putByDateSync(PrayerTimeCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'date', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDate(List<PrayerTimeCollection> objects) {
    return putAllByIndex(r'date', objects);
  }

  List<Id> putAllByDateSync(List<PrayerTimeCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'date', objects, saveLinks: saveLinks);
  }
}

extension PrayerTimeCollectionQueryWhereSort
    on QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QWhere> {
  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PrayerTimeCollectionQueryWhere
    on QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QWhereClause> {
  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterWhereClause>
      dateEqualTo(String date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterWhereClause>
      dateNotEqualTo(String date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PrayerTimeCollectionQueryFilter on QueryBuilder<PrayerTimeCollection,
    PrayerTimeCollection, QFilterCondition> {
  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> asrEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'asr',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> asrGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'asr',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> asrLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'asr',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> asrBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'asr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> calculationMethodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calculationMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> calculationMethodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calculationMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> calculationMethodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calculationMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> calculationMethodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calculationMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> calculationMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'calculationMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> calculationMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'calculationMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
          QAfterFilterCondition>
      calculationMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'calculationMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
          QAfterFilterCondition>
      calculationMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'calculationMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> calculationMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calculationMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> calculationMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'calculationMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> dateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> dateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> dateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> dateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
          QAfterFilterCondition>
      dateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
          QAfterFilterCondition>
      dateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> dhuhrEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dhuhr',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> dhuhrGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dhuhr',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> dhuhrLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dhuhr',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> dhuhrBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dhuhr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> fajrEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fajr',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> fajrGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fajr',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> fajrLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fajr',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> fajrBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fajr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> ishaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isha',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> ishaGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isha',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> ishaLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isha',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> ishaBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isha',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> latitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> latitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> latitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> latitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> longitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> longitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> longitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> longitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> maghribEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maghrib',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> maghribGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maghrib',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> maghribLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maghrib',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> maghribBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maghrib',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> sunriseEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunrise',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> sunriseGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sunrise',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> sunriseLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sunrise',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection,
      QAfterFilterCondition> sunriseBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sunrise',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PrayerTimeCollectionQueryObject on QueryBuilder<PrayerTimeCollection,
    PrayerTimeCollection, QFilterCondition> {}

extension PrayerTimeCollectionQueryLinks on QueryBuilder<PrayerTimeCollection,
    PrayerTimeCollection, QFilterCondition> {}

extension PrayerTimeCollectionQuerySortBy
    on QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QSortBy> {
  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByAsr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asr', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByAsrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asr', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByCalculationMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculationMethod', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByCalculationMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculationMethod', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByDhuhr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dhuhr', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByDhuhrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dhuhr', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByFajr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fajr', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByFajrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fajr', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByIsha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isha', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByIshaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isha', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByMaghrib() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maghrib', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortByMaghribDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maghrib', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortBySunrise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sunrise', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      sortBySunriseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sunrise', Sort.desc);
    });
  }
}

extension PrayerTimeCollectionQuerySortThenBy
    on QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QSortThenBy> {
  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByAsr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asr', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByAsrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asr', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByCalculationMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculationMethod', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByCalculationMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculationMethod', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByDhuhr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dhuhr', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByDhuhrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dhuhr', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByFajr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fajr', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByFajrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fajr', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByIsha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isha', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByIshaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isha', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByMaghrib() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maghrib', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenByMaghribDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maghrib', Sort.desc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenBySunrise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sunrise', Sort.asc);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QAfterSortBy>
      thenBySunriseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sunrise', Sort.desc);
    });
  }
}

extension PrayerTimeCollectionQueryWhereDistinct
    on QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QDistinct> {
  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QDistinct>
      distinctByAsr() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'asr');
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QDistinct>
      distinctByCalculationMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calculationMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QDistinct>
      distinctByDate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QDistinct>
      distinctByDhuhr() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dhuhr');
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QDistinct>
      distinctByFajr() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fajr');
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QDistinct>
      distinctByIsha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isha');
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QDistinct>
      distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QDistinct>
      distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QDistinct>
      distinctByMaghrib() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maghrib');
    });
  }

  QueryBuilder<PrayerTimeCollection, PrayerTimeCollection, QDistinct>
      distinctBySunrise() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sunrise');
    });
  }
}

extension PrayerTimeCollectionQueryProperty on QueryBuilder<
    PrayerTimeCollection, PrayerTimeCollection, QQueryProperty> {
  QueryBuilder<PrayerTimeCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PrayerTimeCollection, DateTime, QQueryOperations> asrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'asr');
    });
  }

  QueryBuilder<PrayerTimeCollection, String, QQueryOperations>
      calculationMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calculationMethod');
    });
  }

  QueryBuilder<PrayerTimeCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<PrayerTimeCollection, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<PrayerTimeCollection, DateTime, QQueryOperations>
      dhuhrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dhuhr');
    });
  }

  QueryBuilder<PrayerTimeCollection, DateTime, QQueryOperations>
      fajrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fajr');
    });
  }

  QueryBuilder<PrayerTimeCollection, DateTime, QQueryOperations>
      ishaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isha');
    });
  }

  QueryBuilder<PrayerTimeCollection, double, QQueryOperations>
      latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<PrayerTimeCollection, double, QQueryOperations>
      longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<PrayerTimeCollection, DateTime, QQueryOperations>
      maghribProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maghrib');
    });
  }

  QueryBuilder<PrayerTimeCollection, DateTime, QQueryOperations>
      sunriseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sunrise');
    });
  }
}
