import 'package:firedart/firedart.dart';
import 'package:hive/hive.dart';


class HiveStore extends TokenStore {
  static const keyToken = "auth_token";
  final Box _box;
  HiveStore._internal(this._box);

  static Future<HiveStore> create() async {

    var box = await Hive.openBox("auth_store",
        compactionStrategy: (entries, deletedEntries) => deletedEntries > 50);
    return HiveStore._internal(box);
  }

  @override
  void delete() {
    _box.delete(keyToken);
  }

  @override
  Token? read() {
    return _box.get(keyToken);
  }

  @override
  void write(Token? token) {
    _box.put(keyToken, token);
  }
}
