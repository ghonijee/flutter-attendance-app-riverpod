import 'package:attendance_app/app/master_location/models/master_location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'master_location_state.freezed.dart';

@freezed
class MasterLocationState with _$MasterLocationState {
  factory MasterLocationState.inital() = MasterLocationInitial;
  factory MasterLocationState.loading() = MasterLocationLoading;
  factory MasterLocationState.loaded(MasterLocationModel model) = MasterLocationLoaded;
  factory MasterLocationState.error(String message) = MasterLocationError;
  factory MasterLocationState.succcess(String message) = MasterLocationSuccess;
}
