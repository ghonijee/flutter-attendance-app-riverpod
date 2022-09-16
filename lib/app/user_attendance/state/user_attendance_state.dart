import 'package:attendance_app/app/user_attendance/models/attendance_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_attendance_state.freezed.dart';

@freezed
class UserAttendanceState with _$UserAttendanceState {
  factory UserAttendanceState.inital() = AttendanceInitial;
  factory UserAttendanceState.loading() = AttendanceLoading;
  factory UserAttendanceState.loaded(AttendanceModel model) = AttendanceLoaded;
  factory UserAttendanceState.failed(String message) = AttendanceFailed;
  factory UserAttendanceState.succcess(AttendanceModel model, String message) = AttendanceSuccess;
}
