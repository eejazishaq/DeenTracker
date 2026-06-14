// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_record_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPrayerRecordCollectionCollection on Isar {
  IsarCollection<PrayerRecordCollection> get prayerRecordCollections =>
      this.collection();
}

const PrayerRecordCollectionSchema = CollectionSchema(
  name: r'PrayerRecordCollection',
  id: 6590711495628988268,
  properties: {
    r'compoundKey': PropertySchema(
      id: 0,
      name: r'compoundKey',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.string,
    ),
    r'loggedAt': PropertySchema(
      id: 2,
      name: r'loggedAt',
      type: IsarType.dateTime,
    ),
    r'notes': PropertySchema(
      id: 3,
      name: r'notes',
      type: IsarType.string,
    ),
    r'prayerName': PropertySchema(
      id: 4,
      name: r'prayerName',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.string,
    )
  },
  estimateSize: _prayerRecordCollectionEstimateSize,
  serialize: _prayerRecordCollectionSerialize,
  deserialize: _prayerRecordCollectionDeserialize,
  deserializeProp: _prayerRecordCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'prayerName': IndexSchema(
      id: -4185803948461141550,
      name: r'prayerName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'prayerName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'compoundKey': IndexSchema(
      id: -2760914157167309631,
      name: r'compoundKey',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'compoundKey',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _prayerRecordCollectionGetId,
  getLinks: _prayerRecordCollectionGetLinks,
  attach: _prayerRecordCollectionAttach,
  version: '3.1.0+1',
);

int _prayerRecordCollectionEstimateSize(
  PrayerRecordCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.compoundKey.length * 3;
  bytesCount += 3 + object.date.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.prayerName.length * 3;
  bytesCount += 3 + object.status.length * 3;
  return bytesCount;
}

void _prayerRecordCollectionSerialize(
  PrayerRecordCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.compoundKey);
  writer.writeString(offsets[1], object.date);
  writer.writeDateTime(offsets[2], object.loggedAt);
  writer.writeString(offsets[3], object.notes);
  writer.writeString(offsets[4], object.prayerName);
  writer.writeString(offsets[5], object.status);
}

PrayerRecordCollection _prayerRecordCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PrayerRecordCollection();
  object.compoundKey = reader.readString(offsets[0]);
  object.date = reader.readString(offsets[1]);
  object.id = id;
  object.loggedAt = reader.readDateTime(offsets[2]);
  object.notes = reader.readStringOrNull(offsets[3]);
  object.prayerName = reader.readString(offsets[4]);
  object.status = reader.readString(offsets[5]);
  return object;
}

P _prayerRecordCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _prayerRecordCollectionGetId(PrayerRecordCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _prayerRecordCollectionGetLinks(
    PrayerRecordCollection object) {
  return [];
}

void _prayerRecordCollectionAttach(
    IsarCollection<dynamic> col, Id id, PrayerRecordCollection object) {
  object.id = id;
}

extension PrayerRecordCollectionByIndex
    on IsarCollection<PrayerRecordCollection> {
  Future<PrayerRecordCollection?> getByCompoundKey(String compoundKey) {
    return getByIndex(r'compoundKey', [compoundKey]);
  }

  PrayerRecordCollection? getByCompoundKeySync(String compoundKey) {
    return getByIndexSync(r'compoundKey', [compoundKey]);
  }

  Future<bool> deleteByCompoundKey(String compoundKey) {
    return deleteByIndex(r'compoundKey', [compoundKey]);
  }

  bool deleteByCompoundKeySync(String compoundKey) {
    return deleteByIndexSync(r'compoundKey', [compoundKey]);
  }

  Future<List<PrayerRecordCollection?>> getAllByCompoundKey(
      List<String> compoundKeyValues) {
    final values = compoundKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'compoundKey', values);
  }

  List<PrayerRecordCollection?> getAllByCompoundKeySync(
      List<String> compoundKeyValues) {
    final values = compoundKeyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'compoundKey', values);
  }

  Future<int> deleteAllByCompoundKey(List<String> compoundKeyValues) {
    final values = compoundKeyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'compoundKey', values);
  }

  int deleteAllByCompoundKeySync(List<String> compoundKeyValues) {
    final values = compoundKeyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'compoundKey', values);
  }

  Future<Id> putByCompoundKey(PrayerRecordCollection object) {
    return putByIndex(r'compoundKey', object);
  }

  Id putByCompoundKeySync(PrayerRecordCollection object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'compoundKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCompoundKey(List<PrayerRecordCollection> objects) {
    return putAllByIndex(r'compoundKey', objects);
  }

  List<Id> putAllByCompoundKeySync(List<PrayerRecordCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'compoundKey', objects, saveLinks: saveLinks);
  }
}

extension PrayerRecordCollectionQueryWhereSort
    on QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QWhere> {
  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PrayerRecordCollectionQueryWhere on QueryBuilder<
    PrayerRecordCollection, PrayerRecordCollection, QWhereClause> {
  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterWhereClause> idBetween(
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

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterWhereClause> dateEqualTo(String date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterWhereClause> dateNotEqualTo(String date) {
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

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterWhereClause> prayerNameEqualTo(String prayerName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'prayerName',
        value: [prayerName],
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterWhereClause> prayerNameNotEqualTo(String prayerName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prayerName',
              lower: [],
              upper: [prayerName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prayerName',
              lower: [prayerName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prayerName',
              lower: [prayerName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prayerName',
              lower: [],
              upper: [prayerName],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterWhereClause> compoundKeyEqualTo(String compoundKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'compoundKey',
        value: [compoundKey],
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterWhereClause> compoundKeyNotEqualTo(String compoundKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'compoundKey',
              lower: [],
              upper: [compoundKey],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'compoundKey',
              lower: [compoundKey],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'compoundKey',
              lower: [compoundKey],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'compoundKey',
              lower: [],
              upper: [compoundKey],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PrayerRecordCollectionQueryFilter on QueryBuilder<
    PrayerRecordCollection, PrayerRecordCollection, QFilterCondition> {
  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> compoundKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compoundKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> compoundKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compoundKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> compoundKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compoundKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> compoundKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compoundKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> compoundKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'compoundKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> compoundKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'compoundKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
          QAfterFilterCondition>
      compoundKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'compoundKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
          QAfterFilterCondition>
      compoundKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'compoundKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> compoundKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compoundKey',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> compoundKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'compoundKey',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
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

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
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

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
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

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
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

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
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

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
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

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
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

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
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

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
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

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
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

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
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

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> loggedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loggedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> loggedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'loggedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> loggedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'loggedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> loggedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'loggedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
          QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
          QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> prayerNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prayerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> prayerNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prayerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> prayerNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prayerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> prayerNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prayerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> prayerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'prayerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> prayerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'prayerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
          QAfterFilterCondition>
      prayerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'prayerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
          QAfterFilterCondition>
      prayerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'prayerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> prayerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prayerName',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> prayerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'prayerName',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
          QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
          QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection,
      QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }
}

extension PrayerRecordCollectionQueryObject on QueryBuilder<
    PrayerRecordCollection, PrayerRecordCollection, QFilterCondition> {}

extension PrayerRecordCollectionQueryLinks on QueryBuilder<
    PrayerRecordCollection, PrayerRecordCollection, QFilterCondition> {}

extension PrayerRecordCollectionQuerySortBy
    on QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QSortBy> {
  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      sortByCompoundKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compoundKey', Sort.asc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      sortByCompoundKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compoundKey', Sort.desc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      sortByLoggedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loggedAt', Sort.asc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      sortByLoggedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loggedAt', Sort.desc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      sortByPrayerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prayerName', Sort.asc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      sortByPrayerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prayerName', Sort.desc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension PrayerRecordCollectionQuerySortThenBy on QueryBuilder<
    PrayerRecordCollection, PrayerRecordCollection, QSortThenBy> {
  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      thenByCompoundKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compoundKey', Sort.asc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      thenByCompoundKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compoundKey', Sort.desc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      thenByLoggedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loggedAt', Sort.asc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      thenByLoggedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loggedAt', Sort.desc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      thenByPrayerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prayerName', Sort.asc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      thenByPrayerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prayerName', Sort.desc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension PrayerRecordCollectionQueryWhereDistinct
    on QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QDistinct> {
  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QDistinct>
      distinctByCompoundKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compoundKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QDistinct>
      distinctByDate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QDistinct>
      distinctByLoggedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'loggedAt');
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QDistinct>
      distinctByPrayerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prayerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrayerRecordCollection, PrayerRecordCollection, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension PrayerRecordCollectionQueryProperty on QueryBuilder<
    PrayerRecordCollection, PrayerRecordCollection, QQueryProperty> {
  QueryBuilder<PrayerRecordCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PrayerRecordCollection, String, QQueryOperations>
      compoundKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compoundKey');
    });
  }

  QueryBuilder<PrayerRecordCollection, String, QQueryOperations>
      dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<PrayerRecordCollection, DateTime, QQueryOperations>
      loggedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loggedAt');
    });
  }

  QueryBuilder<PrayerRecordCollection, String?, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<PrayerRecordCollection, String, QQueryOperations>
      prayerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prayerName');
    });
  }

  QueryBuilder<PrayerRecordCollection, String, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
