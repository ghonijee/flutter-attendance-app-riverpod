import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localStorageProvider = Provider((ref) {
  final box = GetStorage();
  return box;
});
