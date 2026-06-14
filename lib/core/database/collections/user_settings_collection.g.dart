// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserSettingsCollectionCollection on Isar {
  IsarCollection<UserSettingsCollection> get userSettingsCollections =>
      this.collection();
}

const UserSettingsCollectionSchema = CollectionSchema(
  name: r'UserSettingsCollection',
  id: 2198677565983065002,
  properties: {
    r'azanVolume': PropertySchema(
      id: 0,
      name: r'azanVolume',
      type: IsarType.long,
    ),
    r'calculationMethod': PropertySchema(
      id: 1,
      name: r'calculationMethod',
      type: IsarType.string,
    ),
    r'language': PropertySchema(
      id: 2,
      name: r'language',
      type: IsarType.string,
    ),
    r'latitude': PropertySchema(
      id: 3,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'locationName': PropertySchema(
      id: 4,
      name: r'locationName',
      type: IsarType.string,
    ),
    r'longitude': PropertySchema(
      id: 5,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'onboardingCompleted': PropertySchema(
      id: 6,
      name: r'onboardingCompleted',
      type: IsarType.bool,
    ),
    r'rtlEnabled': PropertySchema(
      id: 7,
      name: r'rtlEnabled',
      type: IsarType.bool,
    ),
    r'textSize': PropertySchema(
      id: 8,
      name: r'textSize',
      type: IsarType.string,
    ),
    r'themeMode': PropertySchema(
      id: 9,
      name: r'themeMode',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vibrationOnReminder': PropertySchema(
      id: 11,
      name: r'vibrationOnReminder',
      type: IsarType.bool,
    )
  },
  estimateSize: _userSettingsCollectionEstimateSize,
  serialize: _userSettingsCollectionSerialize,
  deserialize: _userSettingsCollectionDeserialize,
  deserializeProp: _userSettingsCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userSettingsCollectionGetId,
  getLinks: _userSettingsCollectionGetLinks,
  attach: _userSettingsCollectionAttach,
  version: '3.1.0+1',
);

int _userSettingsCollectionEstimateSize(
  UserSettingsCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.calculationMethod.length * 3;
  bytesCount += 3 + object.language.length * 3;
  {
    final value = object.locationName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.textSize.length * 3;
  bytesCount += 3 + object.themeMode.length * 3;
  return bytesCount;
}

void _userSettingsCollectionSerialize(
  UserSettingsCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.azanVolume);
  writer.writeString(offsets[1], object.calculationMethod);
  writer.writeString(offsets[2], object.language);
  writer.writeDouble(offsets[3], object.latitude);
  writer.writeString(offsets[4], object.locationName);
  writer.writeDouble(offsets[5], object.longitude);
  writer.writeBool(offsets[6], object.onboardingCompleted);
  writer.writeBool(offsets[7], object.rtlEnabled);
  writer.writeString(offsets[8], object.textSize);
  writer.writeString(offsets[9], object.themeMode);
  writer.writeDateTime(offsets[10], object.updatedAt);
  writer.writeBool(offsets[11], object.vibrationOnReminder);
}

UserSettingsCollection _userSettingsCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserSettingsCollection();
  object.azanVolume = reader.readLong(offsets[0]);
  object.calculationMethod = reader.readString(offsets[1]);
  object.id = id;
  object.language = reader.readString(offsets[2]);
  object.latitude = reader.readDoubleOrNull(offsets[3]);
  object.locationName = reader.readStringOrNull(offsets[4]);
  object.longitude = reader.readDoubleOrNull(offsets[5]);
  object.onboardingCompleted = reader.readBool(offsets[6]);
  object.rtlEnabled = reader.readBool(offsets[7]);
  object.textSize = reader.readString(offsets[8]);
  object.themeMode = reader.readString(offsets[9]);
  object.updatedAt = reader.readDateTime(offsets[10]);
  object.vibrationOnReminder = reader.readBool(offsets[11]);
  return object;
}

P _userSettingsCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userSettingsCollectionGetId(UserSettingsCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userSettingsCollectionGetLinks(
    UserSettingsCollection object) {
  return [];
}

void _userSettingsCollectionAttach(
    IsarCollection<dynamic> col, Id id, UserSettingsCollection object) {
  object.id = id;
}

extension UserSettingsCollectionQueryWhereSort
    on QueryBuilder<UserSettingsCollection, UserSettingsCollection, QWhere> {
  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserSettingsCollectionQueryWhere on QueryBuilder<
    UserSettingsCollection, UserSettingsCollection, QWhereClause> {
  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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
}

extension UserSettingsCollectionQueryFilter on QueryBuilder<
    UserSettingsCollection, UserSettingsCollection, QFilterCondition> {
  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> azanVolumeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'azanVolume',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> azanVolumeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'azanVolume',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> azanVolumeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'azanVolume',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> azanVolumeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'azanVolume',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> calculationMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calculationMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> calculationMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'calculationMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> languageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> languageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> languageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> languageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> languageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> languageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
          QAfterFilterCondition>
      languageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
          QAfterFilterCondition>
      languageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'language',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> latitudeEqualTo(
    double? value, {
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> latitudeGreaterThan(
    double? value, {
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> latitudeLessThan(
    double? value, {
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> latitudeBetween(
    double? lower,
    double? upper, {
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> locationNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationName',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> locationNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationName',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> locationNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> locationNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> locationNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> locationNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> locationNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> locationNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
          QAfterFilterCondition>
      locationNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
          QAfterFilterCondition>
      locationNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> locationNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> locationNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> longitudeEqualTo(
    double? value, {
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> longitudeGreaterThan(
    double? value, {
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> longitudeLessThan(
    double? value, {
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> longitudeBetween(
    double? lower,
    double? upper, {
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

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> onboardingCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'onboardingCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> rtlEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rtlEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> textSizeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> textSizeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'textSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> textSizeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'textSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> textSizeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'textSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> textSizeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'textSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> textSizeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'textSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
          QAfterFilterCondition>
      textSizeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'textSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
          QAfterFilterCondition>
      textSizeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'textSize',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> textSizeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textSize',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> textSizeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'textSize',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themeModeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themeModeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themeModeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themeModeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'themeMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themeModeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themeModeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
          QAfterFilterCondition>
      themeModeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
          QAfterFilterCondition>
      themeModeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'themeMode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themeModeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeMode',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> themeModeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'themeMode',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection,
      QAfterFilterCondition> vibrationOnReminderEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vibrationOnReminder',
        value: value,
      ));
    });
  }
}

extension UserSettingsCollectionQueryObject on QueryBuilder<
    UserSettingsCollection, UserSettingsCollection, QFilterCondition> {}

extension UserSettingsCollectionQueryLinks on QueryBuilder<
    UserSettingsCollection, UserSettingsCollection, QFilterCondition> {}

extension UserSettingsCollectionQuerySortBy
    on QueryBuilder<UserSettingsCollection, UserSettingsCollection, QSortBy> {
  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByAzanVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azanVolume', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByAzanVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azanVolume', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByCalculationMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculationMethod', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByCalculationMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculationMethod', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByLocationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByLocationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByOnboardingCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboardingCompleted', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByOnboardingCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboardingCompleted', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByRtlEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rtlEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByRtlEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rtlEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByTextSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textSize', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByTextSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textSize', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByVibrationOnReminder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationOnReminder', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      sortByVibrationOnReminderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationOnReminder', Sort.desc);
    });
  }
}

extension UserSettingsCollectionQuerySortThenBy on QueryBuilder<
    UserSettingsCollection, UserSettingsCollection, QSortThenBy> {
  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByAzanVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azanVolume', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByAzanVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azanVolume', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByCalculationMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculationMethod', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByCalculationMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculationMethod', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByLocationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByLocationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByOnboardingCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboardingCompleted', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByOnboardingCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboardingCompleted', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByRtlEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rtlEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByRtlEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rtlEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByTextSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textSize', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByTextSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textSize', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByVibrationOnReminder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationOnReminder', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QAfterSortBy>
      thenByVibrationOnReminderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationOnReminder', Sort.desc);
    });
  }
}

extension UserSettingsCollectionQueryWhereDistinct
    on QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct> {
  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByAzanVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'azanVolume');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByCalculationMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calculationMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByLanguage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByLocationName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByOnboardingCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onboardingCompleted');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByRtlEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rtlEnabled');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByTextSize({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textSize', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByThemeMode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themeMode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<UserSettingsCollection, UserSettingsCollection, QDistinct>
      distinctByVibrationOnReminder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vibrationOnReminder');
    });
  }
}

extension UserSettingsCollectionQueryProperty on QueryBuilder<
    UserSettingsCollection, UserSettingsCollection, QQueryProperty> {
  QueryBuilder<UserSettingsCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserSettingsCollection, int, QQueryOperations>
      azanVolumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'azanVolume');
    });
  }

  QueryBuilder<UserSettingsCollection, String, QQueryOperations>
      calculationMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calculationMethod');
    });
  }

  QueryBuilder<UserSettingsCollection, String, QQueryOperations>
      languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<UserSettingsCollection, double?, QQueryOperations>
      latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<UserSettingsCollection, String?, QQueryOperations>
      locationNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationName');
    });
  }

  QueryBuilder<UserSettingsCollection, double?, QQueryOperations>
      longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<UserSettingsCollection, bool, QQueryOperations>
      onboardingCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onboardingCompleted');
    });
  }

  QueryBuilder<UserSettingsCollection, bool, QQueryOperations>
      rtlEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rtlEnabled');
    });
  }

  QueryBuilder<UserSettingsCollection, String, QQueryOperations>
      textSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textSize');
    });
  }

  QueryBuilder<UserSettingsCollection, String, QQueryOperations>
      themeModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themeMode');
    });
  }

  QueryBuilder<UserSettingsCollection, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<UserSettingsCollection, bool, QQueryOperations>
      vibrationOnReminderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vibrationOnReminder');
    });
  }
}
