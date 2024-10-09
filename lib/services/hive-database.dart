import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<Box> getInstance() async {
  var box = await Hive.openBox('demoBox');
  return box;
}

void createValue() async {
  var box = await getInstance();
  box.put('demoKey', 'Demo Value');
  box.put('demoList', [1, 2, 3]);
  box.put('demoInteger', 3);
}

void openLazyBox() async {
  var lazyBox = await Hive.openLazyBox('demoBox');
  var value = await lazyBox.get('demoLazyKey');
}

void useEncryptedBox() async {
  var encryptedKey = Hive.generateSecureKey();

  var encryptedBox = await Hive.openBox('demoEncryptedBox',
      encryptionCipher: HiveAesCipher(encryptedKey));

  encryptedBox.put('encryptedKey', 'Encrypted Value');
}

@HiveType(typeId: 1)
class Person extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int age;

  Person({
    required this.id,
    required this.name,
    required this.age,
  });
}
