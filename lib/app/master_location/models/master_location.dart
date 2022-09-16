// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:latlong2/latlong.dart';

class MasterLocationModel {
  double? lat;
  double? long;
  String? name;

  LatLng get position => LatLng(lat!, long!);

  MasterLocationModel({
    this.lat,
    this.long,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'long': long,
      'name': name,
    };
  }

  factory MasterLocationModel.fromMap(Map<String, dynamic> map) {
    return MasterLocationModel(
      lat: map['lat'] != null ? map['lat'] as double : null,
      long: map['long'] != null ? map['long'] as double : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MasterLocationModel.fromJson(String source) => MasterLocationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  MasterLocationModel copyWith({
    double? lat,
    double? long,
    String? name,
  }) {
    return MasterLocationModel(
      lat: lat ?? this.lat,
      long: long ?? this.long,
      name: name ?? this.name,
    );
  }
}
