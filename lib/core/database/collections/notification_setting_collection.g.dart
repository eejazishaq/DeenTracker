// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_setting_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNotificationSettingCollectionCollection on Isar {
  IsarCollection<NotificationSettingCollection>
      get notificationSettingCollections => this.collection();
}

const NotificationSettingCollectionSchema = CollectionSchema(
  name: r'NotificationSettingCollection',
  id: 1588284732418466082,
  properties: {
    r'azanAudio': PropertySchema(
      id: 0,
      name: r'azanAudio',
      type: IsarType.string,
    ),
    r'enabled': PropertySchema(
      id: 1,
      name: r'enabled',
      type: IsarType.bool,
    ),
    r'offsetMinutes': PropertySchema(
      id: 2,
      name: r'offsetMinutes',
      type: IsarType.long,
    ),
    r'prayerName': PropertySchema(
      id: 3,
      name: r'prayerName',
      type: IsarType.string,
    ),
    r'vibrationEnabled': PropertySchema(
      id: 4,
      name: r'vibrationEnabled',
      type: IsarType.bool,
    ),
    r'volume': PropertySchema(
      id: 5,
      name: r'volume',
      type: IsarType.long,
    )
  },
  estimateSize: _notificationSettingCollectionEstimateSize,
  serialize: _notificationSettingCollectionSerialize,
  deserialize: _notificationSettingCollectionDeserialize,
  deserializeProp: _notificationSettingCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'prayerName': IndexSchema(
      id: -4185803948461141550,
      name: r'prayerName',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'prayerName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _notificationSettingCollectionGetId,
  getLinks: _notificationSettingCollectionGetLinks,
  attach: _notificationSettingCollectionAttach,
  version: '3.1.0+1',
);

int _notificationSettingCollectionEstimateSize(
  NotificationSettingCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.azanAudio;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.prayerName.length * 3;
  return bytesCount;
}

void _notificationSettingCollectionSerialize(
  NotificationSettingCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.azanAudio);
  writer.writeBool(offsets[1], object.enabled);
  writer.writeLong(offsets[2], object.offsetMinutes);
  writer.writeString(offsets[3], object.prayerName);
  writer.writeBool(offsets[4], object.vibrationEnabled);
  writer.writeLong(offsets[5], object.volume);
}

NotificationSettingCollection _notificationSettingCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NotificationSettingCollection();
  object.azanAudio = reader.readStringOrNull(offsets[0]);
  object.enabled = reader.readBool(offsets[1]);
  object.id = id;
  object.offsetMinutes = reader.readLong(offsets[2]);
  object.prayerName = reader.readString(offsets[3]);
  object.vibrationEnabled = reader.readBool(offsets[4]);
  object.volume = reader.readLong(offsets[5]);
  return object;
}

P _notificationSettingCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _notificationSettingCollectionGetId(NotificationSettingCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _notificationSettingCollectionGetLinks(
    NotificationSettingCollection object) {
  return [];
}

void _notificationSettingCollectionAttach(
    IsarCollection<dynamic> col, Id id, NotificationSettingCollection object) {
  object.id = id;
}

extension NotificationSettingCollectionByIndex
    on IsarCollection<NotificationSettingCollection> {
  Future<NotificationSettingCollection?> getByPrayerName(String prayerName) {
    return getByIndex(r'prayerName', [prayerName]);
  }

  NotificationSettingCollection? getByPrayerNameSync(String prayerName) {
    return getByIndexSync(r'prayerName', [prayerName]);
  }

  Future<bool> deleteByPrayerName(String prayerName) {
    return deleteByIndex(r'prayerName', [prayerName]);
  }

  bool deleteByPrayerNameSync(String prayerName) {
    return deleteByIndexSync(r'prayerName', [prayerName]);
  }

  Future<List<NotificationSettingCollection?>> getAllByPrayerName(
      List<String> prayerNameValues) {
    final values = prayerNameValues.map((e) => [e]).toList();
    return getAllByIndex(r'prayerName', values);
  }

  List<NotificationSettingCollection?> getAllByPrayerNameSync(
      List<String> prayerNameValues) {
    final values = prayerNameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'prayerName', values);
  }

  Future<int> deleteAllByPrayerName(List<String> prayerNameValues) {
    final values = prayerNameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'prayerName', values);
  }

  int deleteAllByPrayerNameSync(List<String> prayerNameValues) {
    final values = prayerNameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'prayerName', values);
  }

  Future<Id> putByPrayerName(NotificationSettingCollection object) {
    return putByIndex(r'prayerName', object);
  }

  Id putByPrayerNameSync(NotificationSettingCollection object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'prayerName', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPrayerName(
      List<NotificationSettingCollection> objects) {
    return putAllByIndex(r'prayerName', objects);
  }

  List<Id> putAllByPrayerNameSync(List<NotificationSettingCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'prayerName', objects, saveLinks: saveLinks);
  }
}

extension NotificationSettingCollectionQueryWhereSort on QueryBuilder<
    NotificationSettingCollection, NotificationSettingCollection, QWhere> {
  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NotificationSettingCollectionQueryWhere on QueryBuilder<
    NotificationSettingCollection,
    NotificationSettingCollection,
    QWhereClause> {
  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
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

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
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

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterWhereClause> prayerNameEqualTo(String prayerName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'prayerName',
        value: [prayerName],
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
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
}

extension NotificationSettingCollectionQueryFilter on QueryBuilder<
    NotificationSettingCollection,
    NotificationSettingCollection,
    QFilterCondition> {
  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> azanAudioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'azanAudio',
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> azanAudioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'azanAudio',
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> azanAudioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'azanAudio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> azanAudioGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'azanAudio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> azanAudioLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'azanAudio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> azanAudioBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'azanAudio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> azanAudioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'azanAudio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> azanAudioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'azanAudio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
          QAfterFilterCondition>
      azanAudioContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'azanAudio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
          QAfterFilterCondition>
      azanAudioMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'azanAudio',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> azanAudioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'azanAudio',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> azanAudioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'azanAudio',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> enabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enabled',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
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

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
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

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
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

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> offsetMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'offsetMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> offsetMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'offsetMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> offsetMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'offsetMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> offsetMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'offsetMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
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

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
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

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
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

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
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

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
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

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
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

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
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

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
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

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> prayerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prayerName',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> prayerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'prayerName',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> vibrationEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vibrationEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> volumeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'volume',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> volumeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'volume',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> volumeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'volume',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterFilterCondition> volumeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'volume',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NotificationSettingCollectionQueryObject on QueryBuilder<
    NotificationSettingCollection,
    NotificationSettingCollection,
    QFilterCondition> {}

extension NotificationSettingCollectionQueryLinks on QueryBuilder<
    NotificationSettingCollection,
    NotificationSettingCollection,
    QFilterCondition> {}

extension NotificationSettingCollectionQuerySortBy on QueryBuilder<
    NotificationSettingCollection, NotificationSettingCollection, QSortBy> {
  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> sortByAzanAudio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azanAudio', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> sortByAzanAudioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azanAudio', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> sortByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> sortByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> sortByOffsetMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetMinutes', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> sortByOffsetMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetMinutes', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> sortByPrayerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prayerName', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> sortByPrayerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prayerName', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> sortByVibrationEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> sortByVibrationEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> sortByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> sortByVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.desc);
    });
  }
}

extension NotificationSettingCollectionQuerySortThenBy on QueryBuilder<
    NotificationSettingCollection, NotificationSettingCollection, QSortThenBy> {
  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> thenByAzanAudio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azanAudio', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> thenByAzanAudioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azanAudio', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> thenByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> thenByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> thenByOffsetMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetMinutes', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> thenByOffsetMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetMinutes', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> thenByPrayerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prayerName', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> thenByPrayerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prayerName', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> thenByVibrationEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationEnabled', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> thenByVibrationEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationEnabled', Sort.desc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> thenByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.asc);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QAfterSortBy> thenByVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.desc);
    });
  }
}

extension NotificationSettingCollectionQueryWhereDistinct on QueryBuilder<
    NotificationSettingCollection, NotificationSettingCollection, QDistinct> {
  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QDistinct> distinctByAzanAudio({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'azanAudio', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QDistinct> distinctByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enabled');
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QDistinct> distinctByOffsetMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'offsetMinutes');
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QDistinct> distinctByPrayerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prayerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QDistinct> distinctByVibrationEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vibrationEnabled');
    });
  }

  QueryBuilder<NotificationSettingCollection, NotificationSettingCollection,
      QDistinct> distinctByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'volume');
    });
  }
}

extension NotificationSettingCollectionQueryProperty on QueryBuilder<
    NotificationSettingCollection,
    NotificationSettingCollection,
    QQueryProperty> {
  QueryBuilder<NotificationSettingCollection, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NotificationSettingCollection, String?, QQueryOperations>
      azanAudioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'azanAudio');
    });
  }

  QueryBuilder<NotificationSettingCollection, bool, QQueryOperations>
      enabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enabled');
    });
  }

  QueryBuilder<NotificationSettingCollection, int, QQueryOperations>
      offsetMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'offsetMinutes');
    });
  }

  QueryBuilder<NotificationSettingCollection, String, QQueryOperations>
      prayerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prayerName');
    });
  }

  QueryBuilder<NotificationSettingCollection, bool, QQueryOperations>
      vibrationEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vibrationEnabled');
    });
  }

  QueryBuilder<NotificationSettingCollection, int, QQueryOperations>
      volumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'volume');
    });
  }
}
