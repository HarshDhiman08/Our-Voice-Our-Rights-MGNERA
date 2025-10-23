import 'package:hive/hive.dart';

class CacheService {
  static const String boxName = 'districtCache';

  static Future<void> init() async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox(boxName);
    }
  }

  static Future<void> saveData(String key, dynamic value) async {
    final box = Hive.box(boxName);
    await box.put(key, value);
  }

  static dynamic getCachedData(String key) {
    final box = Hive.box(boxName);
    return box.get(key);
  }

  static Future<void> clearCache() async {
    final box = Hive.box(boxName);
    await box.clear();
  }
}
