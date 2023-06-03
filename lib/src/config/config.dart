import 'package:localstore/localstore.dart';

abstract class IConfig {
  Future<void> set(String data);
  Future<Map<String, dynamic>?> getByCollection(String collection);
}

class Config implements IConfig {
  final db = Localstore.instance;

  @override
  Future<void> set(String data) async {
    db.collection('config').doc('1');
    return await db.collection('config').doc('1').set({
      "path": data,
    });
  }

  @override
  Future<Map<String, dynamic>?> getByCollection(String collection) async {
    return await db.collection('config').doc('1').get();
  }
}
