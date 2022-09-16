import 'dart:convert';

import 'package:isar/isar.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
part 'attendance_model.g.dart';

@Collection()
class AttendanceModel {
  @Id()
  int? id;
  DateTime? checkInAt;
  DateTime? checkOutAt;
  double? checkInLat;
  double? checkInLong;
  double? checkOutLat;
  double? checkOutLong;
  String? checkInLocaationName;
  String? checkOutLocaationName;

  bool get checkInStatus => checkInAt != null;
  bool get checkOutStatus => checkOutAt != null;

  AttendanceModel({
    this.id,
    this.checkInAt,
    this.checkOutAt,
    this.checkInLat,
    this.checkInLong,
    this.checkOutLat,
    this.checkOutLong,
    this.checkInLocaationName,
    this.checkOutLocaationName,
  });

  AttendanceModel copyWith({
    int? id,
    DateTime? checkInAt,
    DateTime? checkOutAt,
    double? checkInLat,
    double? checkInLong,
    double? checkOutLat,
    double? checkOutLong,
    String? checkInLocaationName,
    String? checkOutLocaationName,
  }) {
    return AttendanceModel(
      id: id ?? this.id,
      checkInAt: checkInAt ?? this.checkInAt,
      checkOutAt: checkOutAt ?? this.checkOutAt,
      checkInLat: checkInLat ?? this.checkInLat,
      checkInLong: checkInLong ?? this.checkInLong,
      checkOutLat: checkOutLat ?? this.checkOutLat,
      checkOutLong: checkOutLong ?? this.checkOutLong,
      checkInLocaationName: checkInLocaationName ?? this.checkInLocaationName,
      checkOutLocaationName: checkOutLocaationName ?? this.checkOutLocaationName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'checkInAt': checkInAt?.millisecondsSinceEpoch,
      'checkOutAt': checkOutAt?.millisecondsSinceEpoch,
      'checkInLat': checkInLat,
      'checkInLong': checkInLong,
      'checkOutLat': checkOutLat,
      'checkOutLong': checkOutLong,
      'checkInLocaationName': checkInLocaationName,
      'checkOutLocaationName': checkOutLocaationName,
    };
  }

  factory AttendanceModel.fromMap(Map<String, dynamic> map) {
    return AttendanceModel(
      id: map['id'] as int,
      checkInAt: map['checkInAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['checkInAt'] as int) : null,
      checkOutAt: map['checkOutAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['checkOutAt'] as int) : null,
      checkInLat: map['checkInLat'] != null ? map['checkInLat'] as double : null,
      checkInLong: map['checkInLong'] != null ? map['checkInLong'] as double : null,
      checkOutLat: map['checkOutLat'] != null ? map['checkOutLat'] as double : null,
      checkOutLong: map['checkOutLong'] != null ? map['checkOutLong'] as double : null,
      checkInLocaationName: map['checkInLocaationName'] != null ? map['checkInLocaationName'] as String : null,
      checkOutLocaationName: map['checkOutLocaationName'] != null ? map['checkOutLocaationName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendanceModel.fromJson(String source) => AttendanceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
