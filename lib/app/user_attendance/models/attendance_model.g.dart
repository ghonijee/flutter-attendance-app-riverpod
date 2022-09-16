// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetAttendanceModelCollection on Isar {
  IsarCollection<AttendanceModel> get attendanceModels => getCollection();
}

const AttendanceModelSchema = CollectionSchema(
  name: 'AttendanceModel',
  schema:
      '{"name":"AttendanceModel","idName":"id","properties":[{"name":"checkInAt","type":"Long"},{"name":"checkInLat","type":"Double"},{"name":"checkInLocaationName","type":"String"},{"name":"checkInLong","type":"Double"},{"name":"checkInStatus","type":"Bool"},{"name":"checkOutAt","type":"Long"},{"name":"checkOutLat","type":"Double"},{"name":"checkOutLocaationName","type":"String"},{"name":"checkOutLong","type":"Double"},{"name":"checkOutStatus","type":"Bool"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'checkInAt': 0,
    'checkInLat': 1,
    'checkInLocaationName': 2,
    'checkInLong': 3,
    'checkInStatus': 4,
    'checkOutAt': 5,
    'checkOutLat': 6,
    'checkOutLocaationName': 7,
    'checkOutLong': 8,
    'checkOutStatus': 9
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _attendanceModelGetId,
  setId: _attendanceModelSetId,
  getLinks: _attendanceModelGetLinks,
  attachLinks: _attendanceModelAttachLinks,
  serializeNative: _attendanceModelSerializeNative,
  deserializeNative: _attendanceModelDeserializeNative,
  deserializePropNative: _attendanceModelDeserializePropNative,
  serializeWeb: _attendanceModelSerializeWeb,
  deserializeWeb: _attendanceModelDeserializeWeb,
  deserializePropWeb: _attendanceModelDeserializePropWeb,
  version: 3,
);

int? _attendanceModelGetId(AttendanceModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _attendanceModelSetId(AttendanceModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _attendanceModelGetLinks(AttendanceModel object) {
  return [];
}

void _attendanceModelSerializeNative(
    IsarCollection<AttendanceModel> collection,
    IsarRawObject rawObj,
    AttendanceModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.checkInAt;
  final _checkInAt = value0;
  final value1 = object.checkInLat;
  final _checkInLat = value1;
  final value2 = object.checkInLocaationName;
  IsarUint8List? _checkInLocaationName;
  if (value2 != null) {
    _checkInLocaationName = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_checkInLocaationName?.length ?? 0) as int;
  final value3 = object.checkInLong;
  final _checkInLong = value3;
  final value4 = object.checkInStatus;
  final _checkInStatus = value4;
  final value5 = object.checkOutAt;
  final _checkOutAt = value5;
  final value6 = object.checkOutLat;
  final _checkOutLat = value6;
  final value7 = object.checkOutLocaationName;
  IsarUint8List? _checkOutLocaationName;
  if (value7 != null) {
    _checkOutLocaationName = IsarBinaryWriter.utf8Encoder.convert(value7);
  }
  dynamicSize += (_checkOutLocaationName?.length ?? 0) as int;
  final value8 = object.checkOutLong;
  final _checkOutLong = value8;
  final value9 = object.checkOutStatus;
  final _checkOutStatus = value9;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDateTime(offsets[0], _checkInAt);
  writer.writeDouble(offsets[1], _checkInLat);
  writer.writeBytes(offsets[2], _checkInLocaationName);
  writer.writeDouble(offsets[3], _checkInLong);
  writer.writeBool(offsets[4], _checkInStatus);
  writer.writeDateTime(offsets[5], _checkOutAt);
  writer.writeDouble(offsets[6], _checkOutLat);
  writer.writeBytes(offsets[7], _checkOutLocaationName);
  writer.writeDouble(offsets[8], _checkOutLong);
  writer.writeBool(offsets[9], _checkOutStatus);
}

AttendanceModel _attendanceModelDeserializeNative(
    IsarCollection<AttendanceModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = AttendanceModel(
    checkInAt: reader.readDateTimeOrNull(offsets[0]),
    checkInLat: reader.readDoubleOrNull(offsets[1]),
    checkInLocaationName: reader.readStringOrNull(offsets[2]),
    checkInLong: reader.readDoubleOrNull(offsets[3]),
    checkOutAt: reader.readDateTimeOrNull(offsets[5]),
    checkOutLat: reader.readDoubleOrNull(offsets[6]),
    checkOutLocaationName: reader.readStringOrNull(offsets[7]),
    checkOutLong: reader.readDoubleOrNull(offsets[8]),
    id: id,
  );
  return object;
}

P _attendanceModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _attendanceModelSerializeWeb(
    IsarCollection<AttendanceModel> collection, AttendanceModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'checkInAt', object.checkInAt?.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'checkInLat', object.checkInLat);
  IsarNative.jsObjectSet(
      jsObj, 'checkInLocaationName', object.checkInLocaationName);
  IsarNative.jsObjectSet(jsObj, 'checkInLong', object.checkInLong);
  IsarNative.jsObjectSet(jsObj, 'checkInStatus', object.checkInStatus);
  IsarNative.jsObjectSet(
      jsObj, 'checkOutAt', object.checkOutAt?.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'checkOutLat', object.checkOutLat);
  IsarNative.jsObjectSet(
      jsObj, 'checkOutLocaationName', object.checkOutLocaationName);
  IsarNative.jsObjectSet(jsObj, 'checkOutLong', object.checkOutLong);
  IsarNative.jsObjectSet(jsObj, 'checkOutStatus', object.checkOutStatus);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  return jsObj;
}

AttendanceModel _attendanceModelDeserializeWeb(
    IsarCollection<AttendanceModel> collection, dynamic jsObj) {
  final object = AttendanceModel(
    checkInAt: IsarNative.jsObjectGet(jsObj, 'checkInAt') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'checkInAt'),
                isUtc: true)
            .toLocal()
        : null,
    checkInLat: IsarNative.jsObjectGet(jsObj, 'checkInLat'),
    checkInLocaationName: IsarNative.jsObjectGet(jsObj, 'checkInLocaationName'),
    checkInLong: IsarNative.jsObjectGet(jsObj, 'checkInLong'),
    checkOutAt: IsarNative.jsObjectGet(jsObj, 'checkOutAt') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'checkOutAt'),
                isUtc: true)
            .toLocal()
        : null,
    checkOutLat: IsarNative.jsObjectGet(jsObj, 'checkOutLat'),
    checkOutLocaationName:
        IsarNative.jsObjectGet(jsObj, 'checkOutLocaationName'),
    checkOutLong: IsarNative.jsObjectGet(jsObj, 'checkOutLong'),
    id: IsarNative.jsObjectGet(jsObj, 'id'),
  );
  return object;
}

P _attendanceModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'checkInAt':
      return (IsarNative.jsObjectGet(jsObj, 'checkInAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'checkInAt'),
                  isUtc: true)
              .toLocal()
          : null) as P;
    case 'checkInLat':
      return (IsarNative.jsObjectGet(jsObj, 'checkInLat')) as P;
    case 'checkInLocaationName':
      return (IsarNative.jsObjectGet(jsObj, 'checkInLocaationName')) as P;
    case 'checkInLong':
      return (IsarNative.jsObjectGet(jsObj, 'checkInLong')) as P;
    case 'checkInStatus':
      return (IsarNative.jsObjectGet(jsObj, 'checkInStatus') ?? false) as P;
    case 'checkOutAt':
      return (IsarNative.jsObjectGet(jsObj, 'checkOutAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'checkOutAt'),
                  isUtc: true)
              .toLocal()
          : null) as P;
    case 'checkOutLat':
      return (IsarNative.jsObjectGet(jsObj, 'checkOutLat')) as P;
    case 'checkOutLocaationName':
      return (IsarNative.jsObjectGet(jsObj, 'checkOutLocaationName')) as P;
    case 'checkOutLong':
      return (IsarNative.jsObjectGet(jsObj, 'checkOutLong')) as P;
    case 'checkOutStatus':
      return (IsarNative.jsObjectGet(jsObj, 'checkOutStatus') ?? false) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _attendanceModelAttachLinks(
    IsarCollection col, int id, AttendanceModel object) {}

extension AttendanceModelQueryWhereSort
    on QueryBuilder<AttendanceModel, AttendanceModel, QWhere> {
  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension AttendanceModelQueryWhere
    on QueryBuilder<AttendanceModel, AttendanceModel, QWhereClause> {
  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhereClause>
      idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension AttendanceModelQueryFilter
    on QueryBuilder<AttendanceModel, AttendanceModel, QFilterCondition> {
  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInAtIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'checkInAt',
      value: null,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInAtEqualTo(DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'checkInAt',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'checkInAt',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'checkInAt',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'checkInAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLatIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'checkInLat',
      value: null,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLatGreaterThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'checkInLat',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLatLessThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'checkInLat',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLatBetween(double? lower, double? upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'checkInLat',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLocaationNameIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'checkInLocaationName',
      value: null,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLocaationNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'checkInLocaationName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLocaationNameGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'checkInLocaationName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLocaationNameLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'checkInLocaationName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLocaationNameBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'checkInLocaationName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLocaationNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'checkInLocaationName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLocaationNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'checkInLocaationName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLocaationNameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'checkInLocaationName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLocaationNameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'checkInLocaationName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLongIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'checkInLong',
      value: null,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLongGreaterThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'checkInLong',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLongLessThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'checkInLong',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInLongBetween(double? lower, double? upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'checkInLong',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkInStatusEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'checkInStatus',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutAtIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'checkOutAt',
      value: null,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutAtEqualTo(DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'checkOutAt',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'checkOutAt',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'checkOutAt',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'checkOutAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLatIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'checkOutLat',
      value: null,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLatGreaterThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'checkOutLat',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLatLessThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'checkOutLat',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLatBetween(double? lower, double? upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'checkOutLat',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLocaationNameIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'checkOutLocaationName',
      value: null,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLocaationNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'checkOutLocaationName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLocaationNameGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'checkOutLocaationName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLocaationNameLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'checkOutLocaationName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLocaationNameBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'checkOutLocaationName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLocaationNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'checkOutLocaationName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLocaationNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'checkOutLocaationName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLocaationNameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'checkOutLocaationName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLocaationNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'checkOutLocaationName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLongIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'checkOutLong',
      value: null,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLongGreaterThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'checkOutLong',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLongLessThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'checkOutLong',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutLongBetween(double? lower, double? upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'checkOutLong',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      checkOutStatusEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'checkOutStatus',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension AttendanceModelQueryLinks
    on QueryBuilder<AttendanceModel, AttendanceModel, QFilterCondition> {}

extension AttendanceModelQueryWhereSortBy
    on QueryBuilder<AttendanceModel, AttendanceModel, QSortBy> {
  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckInAt() {
    return addSortByInternal('checkInAt', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckInAtDesc() {
    return addSortByInternal('checkInAt', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckInLat() {
    return addSortByInternal('checkInLat', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckInLatDesc() {
    return addSortByInternal('checkInLat', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckInLocaationName() {
    return addSortByInternal('checkInLocaationName', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckInLocaationNameDesc() {
    return addSortByInternal('checkInLocaationName', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckInLong() {
    return addSortByInternal('checkInLong', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckInLongDesc() {
    return addSortByInternal('checkInLong', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckInStatus() {
    return addSortByInternal('checkInStatus', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckInStatusDesc() {
    return addSortByInternal('checkInStatus', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckOutAt() {
    return addSortByInternal('checkOutAt', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckOutAtDesc() {
    return addSortByInternal('checkOutAt', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckOutLat() {
    return addSortByInternal('checkOutLat', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckOutLatDesc() {
    return addSortByInternal('checkOutLat', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckOutLocaationName() {
    return addSortByInternal('checkOutLocaationName', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckOutLocaationNameDesc() {
    return addSortByInternal('checkOutLocaationName', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckOutLong() {
    return addSortByInternal('checkOutLong', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckOutLongDesc() {
    return addSortByInternal('checkOutLong', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckOutStatus() {
    return addSortByInternal('checkOutStatus', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByCheckOutStatusDesc() {
    return addSortByInternal('checkOutStatus', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }
}

extension AttendanceModelQueryWhereSortThenBy
    on QueryBuilder<AttendanceModel, AttendanceModel, QSortThenBy> {
  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckInAt() {
    return addSortByInternal('checkInAt', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckInAtDesc() {
    return addSortByInternal('checkInAt', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckInLat() {
    return addSortByInternal('checkInLat', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckInLatDesc() {
    return addSortByInternal('checkInLat', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckInLocaationName() {
    return addSortByInternal('checkInLocaationName', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckInLocaationNameDesc() {
    return addSortByInternal('checkInLocaationName', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckInLong() {
    return addSortByInternal('checkInLong', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckInLongDesc() {
    return addSortByInternal('checkInLong', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckInStatus() {
    return addSortByInternal('checkInStatus', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckInStatusDesc() {
    return addSortByInternal('checkInStatus', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckOutAt() {
    return addSortByInternal('checkOutAt', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckOutAtDesc() {
    return addSortByInternal('checkOutAt', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckOutLat() {
    return addSortByInternal('checkOutLat', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckOutLatDesc() {
    return addSortByInternal('checkOutLat', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckOutLocaationName() {
    return addSortByInternal('checkOutLocaationName', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckOutLocaationNameDesc() {
    return addSortByInternal('checkOutLocaationName', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckOutLong() {
    return addSortByInternal('checkOutLong', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckOutLongDesc() {
    return addSortByInternal('checkOutLong', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckOutStatus() {
    return addSortByInternal('checkOutStatus', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByCheckOutStatusDesc() {
    return addSortByInternal('checkOutStatus', Sort.desc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }
}

extension AttendanceModelQueryWhereDistinct
    on QueryBuilder<AttendanceModel, AttendanceModel, QDistinct> {
  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct>
      distinctByCheckInAt() {
    return addDistinctByInternal('checkInAt');
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct>
      distinctByCheckInLat() {
    return addDistinctByInternal('checkInLat');
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct>
      distinctByCheckInLocaationName({bool caseSensitive = true}) {
    return addDistinctByInternal('checkInLocaationName',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct>
      distinctByCheckInLong() {
    return addDistinctByInternal('checkInLong');
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct>
      distinctByCheckInStatus() {
    return addDistinctByInternal('checkInStatus');
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct>
      distinctByCheckOutAt() {
    return addDistinctByInternal('checkOutAt');
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct>
      distinctByCheckOutLat() {
    return addDistinctByInternal('checkOutLat');
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct>
      distinctByCheckOutLocaationName({bool caseSensitive = true}) {
    return addDistinctByInternal('checkOutLocaationName',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct>
      distinctByCheckOutLong() {
    return addDistinctByInternal('checkOutLong');
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct>
      distinctByCheckOutStatus() {
    return addDistinctByInternal('checkOutStatus');
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }
}

extension AttendanceModelQueryProperty
    on QueryBuilder<AttendanceModel, AttendanceModel, QQueryProperty> {
  QueryBuilder<AttendanceModel, DateTime?, QQueryOperations>
      checkInAtProperty() {
    return addPropertyNameInternal('checkInAt');
  }

  QueryBuilder<AttendanceModel, double?, QQueryOperations>
      checkInLatProperty() {
    return addPropertyNameInternal('checkInLat');
  }

  QueryBuilder<AttendanceModel, String?, QQueryOperations>
      checkInLocaationNameProperty() {
    return addPropertyNameInternal('checkInLocaationName');
  }

  QueryBuilder<AttendanceModel, double?, QQueryOperations>
      checkInLongProperty() {
    return addPropertyNameInternal('checkInLong');
  }

  QueryBuilder<AttendanceModel, bool, QQueryOperations>
      checkInStatusProperty() {
    return addPropertyNameInternal('checkInStatus');
  }

  QueryBuilder<AttendanceModel, DateTime?, QQueryOperations>
      checkOutAtProperty() {
    return addPropertyNameInternal('checkOutAt');
  }

  QueryBuilder<AttendanceModel, double?, QQueryOperations>
      checkOutLatProperty() {
    return addPropertyNameInternal('checkOutLat');
  }

  QueryBuilder<AttendanceModel, String?, QQueryOperations>
      checkOutLocaationNameProperty() {
    return addPropertyNameInternal('checkOutLocaationName');
  }

  QueryBuilder<AttendanceModel, double?, QQueryOperations>
      checkOutLongProperty() {
    return addPropertyNameInternal('checkOutLong');
  }

  QueryBuilder<AttendanceModel, bool, QQueryOperations>
      checkOutStatusProperty() {
    return addPropertyNameInternal('checkOutStatus');
  }

  QueryBuilder<AttendanceModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }
}
