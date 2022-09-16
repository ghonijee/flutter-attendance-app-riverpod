import 'package:attendance_app/app/master_location/models/master_location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MasterLocationModel model;
  setUp(() {
    model = MasterLocationModel(lat: 7.282828, long: 14.00999, name: "Jl. Merdeka Belajar");
  });
  test('Model master location can parse to json', () async {
    var jsonMap = model.toMap();
    expect(jsonMap, isMap);
    expect(jsonMap['lat'], model.lat);
    var jsonEncode = model.toJson();
    expect(jsonEncode, isA<String>());
  });

  test('Model master location can parse from json', () async {
    var jsonMap = model.toMap();
    var result = MasterLocationModel.fromMap(jsonMap);
    expect(result, isA<MasterLocationModel>());
    expect(result.lat, model.lat);

    var jsonEncode = model.toJson();
    result = MasterLocationModel.fromJson(jsonEncode);
    expect(result, isA<MasterLocationModel>());
    expect(result.lat, model.lat);
  });
}
