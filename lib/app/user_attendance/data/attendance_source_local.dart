import 'package:attendance_app/app/user_attendance/models/attendance_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class AttendanceSourceLocal {
  late Isar db;

  init() async {
    final dir = await getApplicationSupportDirectory();

    db = await Isar.open(
      schemas: [AttendanceModelSchema],
      directory: dir.path,
    );

    // Reset tabel for development !!!!
    // await db.writeTxn((isar) async {
    //   await isar.attendanceModels.clear();
    // });
  }

  whereDate(DateTime value) async {
    var lastMidnightTomorrow = DateTime(value.year, value.month, value.day);
    var lastMidnight = DateTime(value.year, value.month, value.day).add(Duration(days: 1));

    var item = await db.attendanceModels.filter().checkInAtGreaterThan(lastMidnightTomorrow).and().checkInAtLessThan(lastMidnight).findFirst();
    return item;
  }

  create(AttendanceModel model) async {
    await db.writeTxn((isar) async {
      await isar.attendanceModels.put(model);
    });
  }

  update(AttendanceModel model) async {
    await db.writeTxn((isar) async {
      await isar.attendanceModels.put(model);
    });
  }
}
