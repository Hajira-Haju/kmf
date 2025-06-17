import 'package:get_storage/get_storage.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  final GetStorage _box = GetStorage();

  Future<void> write(String key, dynamic value) => _box.write(key, value);
  dynamic read(String key) => _box.read(key);
  Future<void> remove(String key) => _box.remove(key);
  Future<void> clearAll() => _box.erase();
  bool has(String key) => _box.hasData(key);
}
