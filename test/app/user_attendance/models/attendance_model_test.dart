import 'package:attendance_app/app/user_attendance/models/attendance_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AttendanceModel model;
  setUp(() {
    model = AttendanceModel(
      id: 1,
      checkInAt: DateTime.now(),
      checkOutAt: DateTime.now().add(Duration(hours: 8)),
      checkInLat: 7.98,
      checkInLong: 14.98,
      checkOutLat: 7.92,
      checkOutLong: 14.92,
      checkInLocaationName: "Jl. Merdeka",
      checkOutLocaationName: "Jl. Merdeka",
    );
  });
  test('Model attendance can parse to json', () async {
    var jsonMap = model.toMap();
    expect(jsonMap, isMap);
    expect(jsonMap['checkInAt'], model.checkInAt?.millisecondsSinceEpoch);
    var jsonEncode = model.toJson();
    expect(jsonEncode, isA<String>());
  });

  test('Model attendance can parse from json', () async {
    var jsonMap = model.toMap();
    var result = AttendanceModel.fromMap(jsonMap);
    expect(result, isA<AttendanceModel>());
    expect(result.checkInAt, isA<DateTime?>());
    expect(result.checkInLocaationName, model.checkInLocaationName);

    var jsonEncode = model.toJson();
    result = AttendanceModel.fromJson(jsonEncode);
    expect(result, isA<AttendanceModel>());
    expect(result.checkOutAt, isA<DateTime?>());
    expect(result.checkInLocaationName, model.checkInLocaationName);
  });
}
