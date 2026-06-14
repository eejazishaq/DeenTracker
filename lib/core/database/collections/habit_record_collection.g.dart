// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_record_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHabitRecordCollectionCollection on Isar {
  IsarCollection<HabitRecordCollection> get habitRecordCollections =>
      this.collection();
}

const HabitRecordCollectionSchema = CollectionSchema(
  name: r'HabitRecordCollection',
  id: -388518026549563860,
  properties: {
    r'completed': PropertySchema(
      id: 0,
      name: r'completed',
      type: IsarType.bool,
    ),
    r'compoundKey': PropertySchema(
      id: 1,
      name: r'compoundKey',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 2,
      name: r'date',
      type: IsarType.string,
    ),
    r'habitId': PropertySchema(
      id: 3,
      name: r'habitId',
      type: IsarType.long,
    ),
    r'loggedAt': PropertySchema(
      id: 4,
      name: r'loggedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _habitRecordCollectionEstimateSize,
  serialize: _habitRecordCollectionSerialize,
  deserialize: _habitRecordCollectionDeserialize,
  deserializeProp: _habitRecordCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'habitId': IndexSchema(
      id: 1000409552522198739,
      name: r'habitId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'habitId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
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
  getId: _habitRecordCollectionGetId,
  getLinks: _habitRecordCollectionGetLinks,
  attach: _habitRecordCollectionAttach,
  version: '3.1.0+1',
);

int _habitRecordCollectionEstimateSize(
  HabitRecordCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.compoundKey.length * 3;
  bytesCount += 3 + object.date.length * 3;
  return bytesCount;
}

void _habitRecordCollectionSerialize(
  HabitRecordCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.completed);
  writer.writeString(offsets[1], object.compoundKey);
  writer.writeString(offsets[2], object.date);
  writer.writeLong(offsets[3], object.habitId);
  writer.writeDateTime(offsets[4], object.loggedAt);
}

HabitRecordCollection _habitRecordCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HabitRecordCollection();
  object.completed = reader.readBool(offsets[0]);
  object.compoundKey = reader.readString(offsets[1]);
  object.date = reader.readString(offsets[2]);
  object.habitId = reader.readLong(offsets[3]);
  object.id = id;
  object.loggedAt = reader.readDateTime(offsets[4]);
  return object;
}

P _habitRecordCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _habitRecordCollectionGetId(HabitRecordCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _habitRecordCollectionGetLinks(
    HabitRecordCollection object) {
  return [];
}

void _habitRecordCollectionAttach(
    IsarCollection<dynamic> col, Id id, HabitRecordCollection object) {
  object.id = id;
}

extension HabitRecordCollectionByIndex
    on IsarCollection<HabitRecordCollection> {
  Future<HabitRecordCollection?> getByCompoundKey(String compoundKey) {
    return getByIndex(r'compoundKey', [compoundKey]);
  }

  HabitRecordCollection? getByCompoundKeySync(String compoundKey) {
    return getByIndexSync(r'compoundKey', [compoundKey]);
  }

  Future<bool> deleteByCompoundKey(String compoundKey) {
    return deleteByIndex(r'compoundKey', [compoundKey]);
  }

  bool deleteByCompoundKeySync(String compoundKey) {
    return deleteByIndexSync(r'compoundKey', [compoundKey]);
  }

  Future<List<HabitRecordCollection?>> getAllByCompoundKey(
      List<String> compoundKeyValues) {
    final values = compoundKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'compoundKey', values);
  }

  List<HabitRecordCollection?> getAllByCompoundKeySync(
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

  Future<Id> putByCompoundKey(HabitRecordCollection object) {
    return putByIndex(r'compoundKey', object);
  }

  Id putByCompoundKeySync(HabitRecordCollection object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'compoundKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCompoundKey(List<HabitRecordCollection> objects) {
    return putAllByIndex(r'compoundKey', objects);
  }

  List<Id> putAllByCompoundKeySync(List<HabitRecordCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'compoundKey', objects, saveLinks: saveLinks);
  }
}

extension HabitRecordCollectionQueryWhereSort
    on QueryBuilder<HabitRecordCollection, HabitRecordCollection, QWhere> {
  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhere>
      anyHabitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'habitId'),
      );
    });
  }
}

extension HabitRecordCollectionQueryWhere on QueryBuilder<HabitRecordCollection,
    HabitRecordCollection, QWhereClause> {
  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhereClause>
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhereClause>
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhereClause>
      habitIdEqualTo(int habitId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'habitId',
        value: [habitId],
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhereClause>
      habitIdNotEqualTo(int habitId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'habitId',
              lower: [],
              upper: [habitId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'habitId',
              lower: [habitId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'habitId',
              lower: [habitId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'habitId',
              lower: [],
              upper: [habitId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhereClause>
      habitIdGreaterThan(
    int habitId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'habitId',
        lower: [habitId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhereClause>
      habitIdLessThan(
    int habitId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'habitId',
        lower: [],
        upper: [habitId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhereClause>
      habitIdBetween(
    int lowerHabitId,
    int upperHabitId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'habitId',
        lower: [lowerHabitId],
        includeLower: includeLower,
        upper: [upperHabitId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhereClause>
      dateEqualTo(String date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhereClause>
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhereClause>
      compoundKeyEqualTo(String compoundKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'compoundKey',
        value: [compoundKey],
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterWhereClause>
      compoundKeyNotEqualTo(String compoundKey) {
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

extension HabitRecordCollectionQueryFilter on QueryBuilder<
    HabitRecordCollection, HabitRecordCollection, QFilterCondition> {
  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
      QAfterFilterCondition> completedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completed',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
      QAfterFilterCondition> compoundKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compoundKey',
        value: '',
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
      QAfterFilterCondition> compoundKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'compoundKey',
        value: '',
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
      QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
      QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
      QAfterFilterCondition> habitIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'habitId',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
      QAfterFilterCondition> habitIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'habitId',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
      QAfterFilterCondition> habitIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'habitId',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
      QAfterFilterCondition> habitIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'habitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
      QAfterFilterCondition> loggedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loggedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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

  QueryBuilder<HabitRecordCollection, HabitRecordCollection,
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
}

extension HabitRecordCollectionQueryObject on QueryBuilder<
    HabitRecordCollection, HabitRecordCollection, QFilterCondition> {}

extension HabitRecordCollectionQueryLinks on QueryBuilder<HabitRecordCollection,
    HabitRecordCollection, QFilterCondition> {}

extension HabitRecordCollectionQuerySortBy
    on QueryBuilder<HabitRecordCollection, HabitRecordCollection, QSortBy> {
  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      sortByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.asc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      sortByCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.desc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      sortByCompoundKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compoundKey', Sort.asc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      sortByCompoundKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compoundKey', Sort.desc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      sortByHabitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.asc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      sortByHabitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.desc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      sortByLoggedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loggedAt', Sort.asc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      sortByLoggedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loggedAt', Sort.desc);
    });
  }
}

extension HabitRecordCollectionQuerySortThenBy
    on QueryBuilder<HabitRecordCollection, HabitRecordCollection, QSortThenBy> {
  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      thenByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.asc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      thenByCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.desc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      thenByCompoundKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compoundKey', Sort.asc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      thenByCompoundKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compoundKey', Sort.desc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      thenByHabitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.asc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      thenByHabitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'habitId', Sort.desc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      thenByLoggedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loggedAt', Sort.asc);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QAfterSortBy>
      thenByLoggedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loggedAt', Sort.desc);
    });
  }
}

extension HabitRecordCollectionQueryWhereDistinct
    on QueryBuilder<HabitRecordCollection, HabitRecordCollection, QDistinct> {
  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QDistinct>
      distinctByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completed');
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QDistinct>
      distinctByCompoundKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compoundKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QDistinct>
      distinctByDate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QDistinct>
      distinctByHabitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'habitId');
    });
  }

  QueryBuilder<HabitRecordCollection, HabitRecordCollection, QDistinct>
      distinctByLoggedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'loggedAt');
    });
  }
}

extension HabitRecordCollectionQueryProperty on QueryBuilder<
    HabitRecordCollection, HabitRecordCollection, QQueryProperty> {
  QueryBuilder<HabitRecordCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HabitRecordCollection, bool, QQueryOperations>
      completedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completed');
    });
  }

  QueryBuilder<HabitRecordCollection, String, QQueryOperations>
      compoundKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compoundKey');
    });
  }

  QueryBuilder<HabitRecordCollection, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<HabitRecordCollection, int, QQueryOperations> habitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'habitId');
    });
  }

  QueryBuilder<HabitRecordCollection, DateTime, QQueryOperations>
      loggedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loggedAt');
    });
  }
}
